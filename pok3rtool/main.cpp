#include "rawhid/hiddevice.h"
#include "proto_pok3r.h"
#include "proto_cykb.h"
#include "updatepackage.h"

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

#include <iostream>

// Enums
// ////////////////////////////////

enum Device {
    DEV_NONE = 0,
    POK3R,          //!< Vortex POK3R
    POK3R_RGB,      //!< Vortex POK3R RGB
    VORTEX_CORE,    //!< Vortex Core
    VORTEX_RACE3,   //!< Vortex Race 3
    VORTEX_TESTER,  //!< Vortex 22-Key Switch Tester
    VORTEX_VIBE,    //!< Vortex ViBE
    KBP_V60,        //!< KBParadise v60 Mini
    KBP_V80,        //!< KBParadise v80
};

enum DevType {
    PROTO_POK3R,    //!< Used exclusively in the POK3R.
    PROTO_CYKB,     //!< Used in new Vortex keyboards, marked with CYKB on the PCB.
                    //!< POK3R RGB, Vortex CORE, Vortex 22-Key Switch Tester.
};

// Types
// ////////////////////////////////

struct VortexDevice {
    ZString name;
    zu16 vid;
    zu16 pid;
    zu16 boot_pid;
    DevType type;
};

struct Param {
    bool ok;
    ZArray<ZString> args;
    Device device;
};

struct ListDevice {
    VortexDevice dev;
    ZPointer<HIDDevice> hid;
    bool boot;
};

// Constants
// ////////////////////////////////

const ZMap<ZString, Device> devnames = {
    { "pok3r",          POK3R },

    { "pok3r-rgb",      POK3R_RGB },
    { "pok3r_rgb",      POK3R_RGB },

    { "core",           VORTEX_CORE },
    { "vortex-core",    VORTEX_CORE },
    { "vortex_core",    VORTEX_CORE },
    
    { "race3",          VORTEX_RACE3 },
    { "vortex-race3",   VORTEX_RACE3 },
    { "vortex_race3",   VORTEX_RACE3 },

    { "tester",         VORTEX_TESTER },
    { "vortex-tester",  VORTEX_TESTER },
    { "vortex_tester",  VORTEX_TESTER },

    { "vibe",           VORTEX_VIBE },
    { "vortex-vibe",    VORTEX_VIBE },
    { "vortex_vibe",    VORTEX_VIBE },

    { "kbpv60",         KBP_V60 },
    { "kbp-v60",        KBP_V60 },
    { "kbp_v60",        KBP_V60 },

    { "kbpv80",         KBP_V80 },
    { "kbp-v80",        KBP_V80 },
    { "kbp_v80",        KBP_V80 },
};

const ZMap<Device, VortexDevice> devices = {
    { POK3R,            { "POK3R",          HOLTEK_VID, POK3R_PID,          POK3R_BOOT_PID,         PROTO_POK3R } },
    { POK3R_RGB,        { "POK3R RGB",      HOLTEK_VID, POK3R_RGB_PID,      POK3R_RGB_BOOT_PID,     PROTO_CYKB } },
    { VORTEX_CORE,      { "Vortex Core",    HOLTEK_VID, VORTEX_CORE_PID,    VORTEX_CORE_BOOT_PID,   PROTO_CYKB } },
    { VORTEX_TESTER,    { "Vortex Tester",  HOLTEK_VID, VORTEX_TESTER_PID,  VORTEX_TESTER_BOOT_PID, PROTO_CYKB } },
    { VORTEX_RACE3,     { "Vortex Race 3",  HOLTEK_VID, VORTEX_RACE3_PID,   VORTEX_RACE3_BOOT_PID,  PROTO_CYKB } },
    { VORTEX_VIBE,      { "Vortex ViBE",    HOLTEK_VID, VORTEX_VIBE_PID,    VORTEX_VIBE_BOOT_PID,   PROTO_CYKB } },
    { KBP_V60,          { "KBP V60",        HOLTEK_VID, KBP_V60_PID,        KBP_V60_BOOT_PID,       PROTO_POK3R } },
    { KBP_V80,          { "KBP V80",        HOLTEK_VID, KBP_V80_PID,        KBP_V80_BOOT_PID,       PROTO_POK3R } },
};

// Functions
// ////////////////////////////////

ZPointer<UpdateInterface> openDevice(Device dev){
    ZPointer<UpdateInterface> kb;
    if(devices.contains(dev)){
        VortexDevice device = devices[dev];
        // Select protocol
        if(device.type == PROTO_POK3R){
            kb = new ProtoPOK3R(device.vid, device.pid, device.boot_pid);
        } else if(device.type == PROTO_CYKB){
            kb = new ProtoCYKB(device.vid, device.pid, device.boot_pid);
        } else {
            return nullptr;
        }

        // Try to open
        if(kb->open()){
            if(kb->isBuiltin())
                LOG("Opened " << device.name << " (bootloader)");
            else
                LOG("Opened " << device.name);
            return kb;
        }

        ELOG("Failed to Open Device: " << device.name);

    } else {
        ELOG("Unknown Device");
    }
    return nullptr;
}

void warning(){
    ELOG("WARNING: THIS TOOL IS RELATIVELY UNTESTED, AND HAS A VERY REAL "
         "RISK OF CORRUPTING YOUR KEYBOARD, MAKING IT UNUSABLE WITHOUT "
         "EXPENSIVE DEVELOPMENT TOOLS. PROCEED AT YOUR OWN RISK.");
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

// Commands
// ////////////////////////////////

int cmd_list(Param *param){
    LOG("List Devices...");
    ZArray<ListDevice> devs;

    // Get all connected devices from list
    for(auto it = devices.begin(); it.more(); ++it){
        VortexDevice dev = devices[it.get()];

        auto hdev = HIDDevice::openAll(dev.vid, dev.pid, UPDATE_USAGE_PAGE, UPDATE_USAGE);
        for(zu64 j = 0; j < hdev.size(); ++j)
            devs.push({ dev, hdev[j], false });

        auto hbdev = HIDDevice::openAll(dev.vid, dev.boot_pid, UPDATE_USAGE_PAGE, UPDATE_USAGE);
        for(zu64 j = 0; j < hbdev.size(); ++j)
            devs.push({ dev, hbdev[j], true });
    }

    DLOG("Devices: " << devs.size());

    // Read version from each device
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
    if(!param->ok)
        warning();

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
    if(!param->ok)
        warning();

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
    if(!param->ok)
        warning();

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
    if(!param->ok)
        warning();

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
        ZFile file;
        if(!file.open(firmware)){
            ELOG("Failed to open file");
            return -3;
        }
        if(file.read(fwbin, file.fileSize()) != file.fileSize()){
            ELOG("Failed to read file");
            return -4;
        }
        LOG(kb->update(version, fwbin));
        return 0;
    }
    return -1;
}

int cmd_wipe(Param *param){
    if(!param->ok)
        warning();

    // Erase Firmware
    if(param->device == 0){
        LOG("Please specifiy a device");
        return 2;
    }
    ZPointer<UpdateInterface> kb = openDevice(param->device);
    if(kb.get()){
        LOG("Erase Firmware");
        bool ret = kb->eraseAndCheck();
        LOG(ret);
        return 0;
    }
    return -1;
}

int cmd_decode(Param *param){
    UpdatePackage package;
    if(!package.loadFromExe(param->args[1], 0)){
        ELOG("Load Error");
        return 1;
    }
    ZPath out = param->args[2];
    LOG("Write " << out);
    ZBinary fw = package.getFirmware();
    if(!ZFile::writeBinary(out, fw)){
        ELOG("Write Error");
        return 2;
    }
    LOG("Done");
    return 0;
}

// Main
// ////////////////////////////////

#define OPT_OK      "ok"
#define OPT_TYPE    "device"

const ZArray<ZOptions::OptDef> optdef = {
    { OPT_OK,   0,   ZOptions::NONE },
    { OPT_TYPE, 't', ZOptions::STRING },
};

typedef int (*cmd_func)(Param *);
struct CmdEntry {
    cmd_func func;
    unsigned argn;
    ZString usage;
};

const ZMap<ZString, CmdEntry> cmds = {
    { "list",       { cmd_list,         0, "list" } },
    { "version",    { cmd_version,      0, "version" } },
    { "setversion", { cmd_setversion,   1, "setversion <version>" } },
    { "info",       { cmd_info,         0, "info" } },
    { "reboot",     { cmd_reboot,       0, "reboot" } },
    { "bootloader", { cmd_bootloader,   0, "bootloader" } },
    { "dump",       { cmd_dump,         1, "dump <output file>" } },
    { "flash",      { cmd_flash,        2, "flash <version> <firmware>" } },
    { "wipe",       { cmd_wipe,        	0, "wipe" } },
    { "decode",     { cmd_decode,       2, "decode <path to updater> <output file>" } },
};

void printUsage(){
    LOG("Pok3rTool Usage:");
    for(auto it = cmds.begin(); it.more(); ++it){
        LOG("    pok3rtool " << cmds[it.get()].usage);
    }
}

int main(int argc, char **argv){
    ZLog::logLevelStdOut(ZLog::INFO, "[%clock%] N %log%");
    //ZLog::logLevelStdOut(ZLog::DEBUG, "\x1b[35m[%clock%] D %log%\x1b[m");
    ZLog::logLevelStdErr(ZLog::ERRORS, "\x1b[31m[%clock%] E %log%\x1b[m");
    ZPath lgf = ZPath("logs") + ZLog::genLogFileName("pok3rtool_");
    ZLog::logLevelFile(ZLog::INFO, lgf, "[%clock%] N %log%");
    ZLog::logLevelFile(ZLog::DEBUG, lgf, "[%clock%] %thread% D [%function%|%file%:%line%] %log%");
    ZLog::logLevelFile(ZLog::ERRORS, lgf, "[%clock%] E [%function%|%file%:%line%] %log%");

    ZString optbuf;
    for(int i = 0; i < argc; ++i){
        optbuf += argv[i];
        optbuf += " ";
    }
    DLOG("Command Line: " << optbuf);

    ZOptions options(optdef);
    if(!options.parse(argc, argv))
        return -2;

    Param param;
    param.device = DEV_NONE;
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
            if(param.args.size() == cmd.argn + 1){
                return cmd.func(&param);
            } else {
                LOG("Usage: pok3rtool " << cmd.usage);
                return -1;
            }
        } else {
            LOG("Unknown Command \"" << cmstr << "\"");
            printUsage();
            return -1;
        }
    } else {
        LOG("No Command");
        printUsage();
        return -1;
    }
}
