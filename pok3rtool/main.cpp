#include "hiddevice.h"
#include "proto_pok3r.h"
#include "proto_cykb.h"
//#include "vortex_core.h"
//#include "vortex_tester.h"

#include "rawhid/hid.h"

#include "zlog.h"
#include "zfile.h"
#include "zhash.h"
#include "zpointer.h"
#include "zmap.h"
#include "zoptions.h"
using namespace LibChaos;

#define UPDATE_USAGE_PAGE   0xff00
#define UPDATE_USAGE        0x01

#include <stdio.h>
#include <iostream>

/*  Decode the encryption scheme used by the updater program.
 *  Produced from IDA disassembly in sub_401000 of v117 updater.
 *  First, swap the 1st and 4th bytes, every 5 bytes
 *  Second, reverse each pair of bytes
 *  Third, shift the bits in each byte, sub 7 from MSBs
 */
void decode_package_data(ZBinary &bin){
    // Swap bytes 4 apart, skip 5
    for(zu64 i = 4; i < bin.size(); i+=5){
        zbyte a = bin[i-4];
        zbyte b = bin[i];
        bin[i-4] = b;
        bin[i] = a;
    }

    // Swap bytes in each set of two bytes
    for(zu64 i = 1; i < bin.size(); i+=2){
        zbyte d = bin[i-1];
        zbyte b = bin[i];
        bin[i-1] = b;
        bin[i] = d;
    }

    // y = ((x - 7) << 4) + (x >> 4)
    for(zu64 i = 0; i < bin.size(); ++i){
        bin[i] = ((bin[i] - 7) << 4) + (bin[i] >> 4);
    }
}

// Encrypt using the encryption scheme used by the updater program
// Reverse engineered from the above
void encode_package_data(ZBinary &bin){
    // x = (y >> 4 + 7 & 0xF) | (x << 4)
    for(zu64 i = 0; i < bin.size(); ++i){
        bin[i] = (((bin[i] >> 4) + 7) & 0xF) | (bin[i] << 4);
    }

    // Swap bytes in each set of two bytes
    for(zu64 i = 1; i < bin.size(); i+=2){
        zbyte d = bin[i-1];
        zbyte b = bin[i];
        bin[i-1] = b;
        bin[i] = d;
    }

    // Swap bytes 4 apart, skip 5
    for(zu64 i = 4; i < bin.size(); i+=5){
        zbyte a = bin[i-4];
        zbyte b = bin[i];
        bin[i-4] = b;
        bin[i] = a;
    }
}

// POK3R
#define V113_HASH   0x62FCF913A689C9AE
#define V114_HASH   0xFE37430DB1FFCF5F
#define V115_HASH   0x8986F7893143E9F7
#define V116_HASH   0xA28E5EFB3F796181
#define V117_HASH   0xEA55CB190C35505F

// POK3R RGB
#define V124_HASH   0x882CB0E4ECE25454
#define V130_HASH   0x6CFF0BB4F4086C2F

// CORE
#define V104_HASH   0x51BFA86A7FAF4EEA

int decode_updater(ZPath exe, ZPath out){
    LOG("Extract from " << exe);
    ZFile file;
    if(!file.open(exe, ZFile::READ)){
        ELOG("Failed to open file");
        return -1;
    }

    zu64 exelen = file.fileSize();
    zu64 exehash = ZFile::fileHash(exe);

    char type = 0;

    zu64 strings_len;
    zu64 strings_start;
    zu64 fw_len;

    zu64 offset_company;
    zu64 offset_product;
    zu64 offset_version;
    zu64 offset_sig;


    switch(exehash){
        case V113_HASH:
        case V114_HASH:
        case V115_HASH:
        case V116_HASH:
        case V117_HASH:
            type = 1;
            strings_len = 0x4B8;

            offset_company = 0x10;
            offset_product = 0x218;
            offset_version = 0x460;
            offset_sig     = 0x4AE;
            break;

        case V124_HASH:
        case V130_HASH:
        case V104_HASH:
            type = 2;
            strings_len = 0xB24; // from IDA disassembly in sub_403830 of v130 updater
                                 // same size in v104

            offset_company = 0x22E;
            offset_product = 0x436;
            offset_version = 0;
            offset_sig     = 0xB19;
            break;

        default:
            ELOG("Unknown updater executable: " << ZString::ItoS(exehash, 16));
            return -2;
    }

    strings_start = exelen - strings_len;

    // Read strings
    ZBinary strs;
    if(file.seek(strings_start) != strings_start){
        LOG("File too short - seek");
        return -4;
    }
    if(file.read(strs, strings_len) != strings_len){
        LOG("File too short - read");
        return -5;
    }
    // Decrypt strings
    decode_package_data(strs);

    ZString company;
    ZString product;
    ZString version;

    // Company name
    company.parseUTF16((const zu16 *)(strs.raw() + offset_company), 0x200);
    // Product name
    product.parseUTF16((const zu16 *)(strs.raw() + offset_product), 0x200);
    // Version
    version = ZString(strs.raw() + offset_version, 12);

    LOG("Company:     " << company);
    LOG("Product:     " << product);
    LOG("Version:     " << version);

    LOG("Signature:   " << ZString(strs.raw() + offset_sig, strings_len - offset_sig));

//    LOG("String Dump:");
    RLOG(strs.dumpBytes(4, 8));

    // Decode other encrypted sections

    zu64 total = strings_len;
    ZArray<zu64> sections;

    switch(type){
        case 1: {
            fw_len = ZBinary::decle32(strs.raw() + 0x420); // Firmware length

            ZString layout;
            layout.parseUTF16((const zu16 *)(strs.raw() + 0x424), 0x20);
            LOG("Layout: " << layout);

            total += fw_len;
            sections.push(fw_len);
            break;
        }

        case 2: {
            zu64 start = 0xAC8 - (0x50 * 8);
            for(zu8 i = 0; i < 8; ++i){
                zu32 fwl = ZBinary::decle32(strs.raw() + start); // Firmware length
                zu32 strl = ZBinary::decle32(strs.raw() + start + 4); // Info length

                if(fwl){
                    ZString layout;
                    layout.parseUTF16((const zu16 *)(strs.raw() + start + 8), 0x20);
                    LOG("Layout " << i << ": " << layout);

                    total += fwl;
                    total += strl;
                    sections.push(fwl);
                    sections.push(strl);
                }
                start += 0x50;
            }
            break;
        }

        default:
            return -4;
            break;
    }

    zu64 sec_start = exelen - total;
    LOG("Section Count: " << sections.size());

    for(zu64 i = 0; i < sections.size(); ++i){
        zu64 sec_len = sections[i];
        if(sec_len == 0)
            continue;

        LOG("Section " << i << ":");
        LOG("  Offset: 0x" << ZString::ItoS(sec_start, 16));
        LOG("  Length: 0x" << ZString::ItoS(sec_len, 16));

        // Read section
        ZBinary sec;
        if(file.seek(sec_start) != sec_start){
            LOG("File too short - seek");
            return -2;
        }
        if(file.read(sec, sec_len) != sec_len){
            LOG("File too short - read");
            return -3;
        }

        sec_start += sec_len;

        // Decode section
        decode_package_data(sec);

        switch(type){
            case 1:
                // Decrypt firmware
                ProtoPOK3R::decode_firmware(sec);
                break;
            case 2:
                // Decrypt RGB firmwares only
                if(sec.size() > 180){
                    ProtoCYKB::decode_firmware(sec);
                }
                break;
            default:
                break;
        }

//        LOG("Section Dump:");
//        RLOG(sec.dumpBytes(4, 8, 0));

        ZPath secout = out;
        if(type == 2)
            secout.last() = out.getName() + "-" + i + out.getExtension();
        LOG("  Output: " << secout);

        // Write firmware
        ZFile fwout(secout, ZFile::WRITE);
        fwout.write(sec);
    }

    return 0;
}

int encode_image(ZPath fwin, ZPath fwout){
    LOG("Input: " << fwin);

    // Read firmware
    ZBinary fwbin;
    if(!ZFile::readBinary(fwin, fwbin)){
        LOG("Failed to read file");
        return -1;
    }

//    Pok3r::encode_firmware(fwbin);
    ProtoCYKB::encode_firmware(fwbin);
    encode_package_data(fwbin);

    LOG("Output: " << fwout);

    // Write encoded image
    if(!ZFile::writeBinary(fwout, fwbin)){
        ELOG("Failed to write file");
        return -2;
    }

    return 0;
}

int encode_patch_updater(ZPath exein, ZPath fwin, ZPath exeout){
    LOG("In Updater: " << exein);
    LOG("In Firmware: " << fwin);

    // Read updater
    ZBinary exebin;
    if(!ZFile::readBinary(exein, exebin)){
        ELOG("Failed to read file");
        return -1;
    }

    // Read firmware
    ZBinary fwbin;
    if(!ZFile::readBinary(fwin, fwbin)){
        LOG("Failed to read file");
        return -2;
    }

    // Encode firmware
//    Pok3r::encode_firmware(fwbin);
    ProtoCYKB::encode_firmware(fwbin);
    encode_package_data(fwbin);

    // Write encoded firmware onto exe
//    exebin.seek(0x1A3800);
    exebin.seek(0x2BE000);
    exebin.write(fwbin);

    ZFile exefile;
    if(!exefile.open(exeout, ZFile::WRITE)){
        ELOG("Failed to open file");
        return -3;
    }
    // Write updated exe
    if(!exefile.write(exebin)){
        LOG("Write error");
        return -4;
    }

    LOG("Out Updater: " << exeout);

    return 0;
}

void warning(){
    ELOG("WARNING: THIS TOOL IS RELATIVELY UNTESTED, AND HAS A VERY REAL RISK OF "
         "CORRUPTING YOUR POK3R OR POK3R RGB, MAKING IT UNUSABLE WITHOUT EXPENSIVE "
         "DEVELOPMENT TOOLS. PROCEED AT YOUR OWN RISK.");
    ELOG("Type \"OK\" to continue:");
    std::string str;
    std::getline(std::cin, str);
    if(str != "OK"){
        LOG("Exiting...");
        exit(EXIT_FAILURE);
    } else {
        LOG("Proceeding...");
    }
}

enum DevType {
    PROTO_POK3R,    //!< Used exclusively in the POK3R.
    PROTO_CYKB,     //!< Used in new Vortex keyboards, marked with CYKB on the PCB.
                    //!< POK3R RGB, Vortex CORE, Vortex Switch Tester.
};

struct VortexDevice {
    int mask;
    ZString name;
    zu16 vid;
    zu16 pid;
    zu16 boot_pid;
    DevType type;
};

const ZArray<VortexDevice> devices = {
    { 1, "POK3R",          HOLTEK_VID, POK3R_PID,          POK3R_BOOT_PID,         PROTO_POK3R },
    { 2, "POK3R RGB",      HOLTEK_VID, POK3R_RGB_PID,      POK3R_RGB_BOOT_PID,     PROTO_CYKB },
    { 4, "Vortex Core",    HOLTEK_VID, VORTEX_CORE_PID,    VORTEX_CORE_BOOT_PID,   PROTO_CYKB },
    { 8, "Vortex Tester",  HOLTEK_VID, VORTEX_TESTER_PID,  VORTEX_TESTER_BOOT_PID, PROTO_CYKB },
};

ZPointer<UpdateInterface> openDevice(int device){
    ZPointer<UpdateInterface> kb;

    for(zu64 i = 0; i < devices.size(); ++i){
        VortexDevice dev = devices[i];
        if(device & dev.mask){
            // Select protocol
            if(dev.type == PROTO_POK3R){
                kb = new ProtoPOK3R(dev.vid, dev.pid, dev.boot_pid);
            } else if(dev.type == PROTO_CYKB){
                kb = new ProtoCYKB(dev.vid, dev.pid, dev.boot_pid);
            } else {
                return nullptr;
            }

            // Try to open
            if(kb->open(dev.vid, dev.pid, dev.boot_pid)){
                if(kb->isBuiltin())
                    LOG("Opened " << dev.name << " (builtin)");
                else
                    LOG("Opened " << dev.name);
                return kb;
            }
        }
    }

    ELOG("Failed to open device");
    return nullptr;
}

struct Param {
    bool ok;
    ZArray<ZString> args;
    int device;
};

struct ListDevice {
    VortexDevice dev;
    ZPointer<HIDDevice> hid;
    bool boot;
};

int cmd_list(Param *param){
    LOG("List Devices...");
    ZArray<ListDevice> devs;

    for(zu64 i = 0; i < devices.size(); ++i){
        VortexDevice devi = devices[i];

        auto hdev = HIDDevice::openAll(devi.vid, devi.pid, UPDATE_USAGE_PAGE, UPDATE_USAGE);
        for(zu64 j = 0; j < hdev.size(); ++j)
            devs.push({ devi, hdev[j], false });

        auto hbdev = HIDDevice::openAll(devi.vid, devi.boot_pid, UPDATE_USAGE_PAGE, UPDATE_USAGE);
        for(zu64 j = 0; j < hbdev.size(); ++j)
            devs.push({ devi, hbdev[j], true });
    }

    for(zu64 i = 0; i < devs.size(); ++i){
        ListDevice ldev = devs[i];
        // Check device
        if(ldev.hid.get() && ldev.hid->isOpen()){
            ZPointer<UpdateInterface> iface;
            // Select protocol
            if(ldev.dev.type == PROTO_POK3R){
                iface = new ProtoPOK3R(ldev.dev.vid, ldev.dev.pid, ldev.dev.boot_pid, ldev.boot, ldev.hid.get());
            } else if(ldev.dev.type == PROTO_CYKB){
                iface = new ProtoCYKB(ldev.dev.vid, ldev.dev.pid, ldev.dev.boot_pid, ldev.boot, ldev.hid.get());
            }

            ldev.hid.divorce();
            LOG(ldev.dev.name << ": " << iface->getVersion());
        } else {
            LOG(ldev.dev.name << " not open");
        }
    }

    return 0;
}

int cmd_version(Param *param){
    // Read Version
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG("Version: " << kb->getVersion());
        return 0;
    }
    return -1;
}

int cmd_setversion(Param *param){
    ZString version = param->args[1];
    // Set Version
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG("Old Version: " << kb->getVersion());
        LOG(kb->setVersion(version));
        LOG(kb->enterFirmware());
        return 0;
    }
    return -1;
}

int cmd_info(Param *param){
    // Get Info
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG(kb->getInfo());
        return 0;
    }
    return -1;
}

int cmd_reboot(Param *param){
    // Reset to Firmware
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG(kb->enterFirmware());
        // Read version
        LOG("Version: " << kb->getVersion());
        return 0;
    }
    return -1;
}

int cmd_bootloader(Param *param){
    // Reset to Bootloader
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG(kb->enterBootloader());
        // Read version
        LOG("Version: " << kb->getVersion());
        return 0;
    }
    return -1;
}

int cmd_dump(Param *param){
    ZPath out = param->args[1];
    // Dump Flash
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG("Dump Flash");
        ZBinary bin = kb->dumpFlash();
        RLOG(bin.dumpBytes(4, 8));
        LOG("Out: " << out);
        ZFile::writeBinary(out, bin);
        return 0;
    }
    return -1;
}

int cmd_flash(Param *param){
    ZString version = param->args[1];
    ZPath firmware = param->args[2];
    // Update Firmware
    if(param->device == 0){
        LOG("Please specifiy a device");
        return 2;
    }
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG("Update Firmware: " << firmware);
        ZBinary fwbin;
        if(!ZFile::readBinary(firmware, fwbin))
            return -3;
        LOG(kb->update(version, fwbin));
        return 0;
    }
    return -1;
}

int cmd_decode(Param *param){
    return decode_updater(param->args[1], param->args[2]);
}

#define OPT_OK      "ok"
#define OPT_TYPE    "device"

const ZArray<ZOptions::OptDef> optdef = {
    { OPT_OK,       0, ZOptions::NONE },
    { OPT_TYPE,     't', ZOptions::STRING },
};

typedef int (*cmd_func)(Param *);
struct CmdEntry {
    cmd_func func;
    int argn;
    ZString usage;
};

const ZMap<ZString, CmdEntry> cmds = {
    { "list",       { cmd_list,         0, "pok3rtool list" } },
    { "version",    { cmd_version,      0, "pok3rtool version" } },
    { "setversion", { cmd_setversion,   1, "pok3rtool setversion <version>" } },
    { "info",       { cmd_info,         0, "pok3rtool info" } },
    { "reboot",     { cmd_reboot,       0, "pok3rtool reboot" } },
    { "bootloader", { cmd_bootloader,   0, "pok3rtool bootloader" } },
    { "dump",       { cmd_dump,         1, "pok3rtool dump <output file>" } },
    { "flash",      { cmd_flash,        2, "pok3rtool flash <version> <firmware>" } },
    { "decode",     { cmd_decode,       2, "pok3rtool decode <path to updater> <output file>" } },
};

const ZMap<ZString, int> devnames = {
    { "pok3r",          1 },

    { "pok3r-rgb",      2 },
    { "pok3r_rgb",      2 },

    { "core",           4 },
    { "vortex-core",    4 },
    { "vortex_core",    4 },

    { "tester",         8 },
    { "vortex-tester",  8 },
    { "vortex_tester",  8 },
};

int main(int argc, char **argv){
    ZLog::logLevelStdOut(ZLog::INFO, "[%clock%] N %log%");
//    ZLog::logLevelStdOut(ZLog::DEBUG, "\x1b[35m[%clock%] %thread% N %log%\x1b[m");
    ZLog::logLevelStdErr(ZLog::ERRORS, "\x1b[31m[%clock%] E %log%\x1b[m");
    ZPath lgf = ZPath("logs") + ZLog::genLogFileName("pok3rtool_");
    ZLog::logLevelFile(ZLog::INFO, lgf, "[%clock%] N %log%");
    ZLog::logLevelFile(ZLog::DEBUG, lgf, "[%clock%] D [%function%|%file%:%line%] %log%");
    ZLog::logLevelFile(ZLog::ERRORS, lgf, "[%clock%] E [%function%|%file%:%line%] %log%");

    ZOptions options(optdef);
    if(!options.parse(argc, argv))
        return 1;

    Param param;
    param.device = 0;
    param.ok = options.getOpts().contains(OPT_OK);
    param.args = options.getArgs();

    if(options.getOpts().contains(OPT_TYPE)){
        ZString type = options.getOpts()[OPT_TYPE];
        if(devnames.contains(type))
            param.device = devnames[type];
    }

    if(param.args.size()){
        ZString cmstr = param.args[0];
        if(cmds.contains(cmstr)){
            CmdEntry cmd = cmds[cmstr];
            if(param.args.size() - 1 == cmd.argn){
                cmd.func(&param);
            } else {
                LOG("Usage: " << cmd.usage);
            }
        } else {
            LOG("Unknown Command \"" << cmstr << "\"");
            return 1;
        }
    } else {
        LOG("No Command");
        return 1;
    }
}
