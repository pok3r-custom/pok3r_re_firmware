#include "pok3r.h"
#include "zlog.h"
#include "zfile.h"
#include "zhash.h"

int readver(){
    LOG("Looking for Vortex Pok3r...");
    Pok3r pok3r;
    if(pok3r.findPok3r()){
        if(pok3r.open()){
            LOG("Found: " << pok3r.getVersion());
            return 0;
        } else {
            LOG("Failed to Open");
            return -2;
        }
    } else {
        LOG("Not Found");
        return -1;
    }
}

int readfw(ZPath out){
    LOG("Looking for Vortex Pok3r...");
    Pok3r pok3r;
    if(pok3r.findPok3r()){
        if(pok3r.open()){
            LOG("Reading...");
            ZBinary data;
            // Flash
            zu64 start = 0x0;
            zu64 len =   0x20000;
            // Boot loader
//            zu64 start = 0x1F000000;
//            zu64 len =       0x2000;
            // SRAM
//            zu64 start = 0x20000000;
//            zu64 len =       0x8000;
            // GPIO registers
//            zu64 start = 0x400B0000;
//            zu64 len =       0xA000;
            // VTOR
//            zu64 start = 0xE0000000;
//            zu64 len =     0x100000;
            for(zu64 o = 0; o < len; o += 64){
                if(pok3r.read(start + o, data) != 64){
                    LOG("Failed to read: 0x" << ZString::ItoS(start + o, 16));
                    return -3;
                }
            }
            LOG("Size: " << data.size());
            RLOG(data.dumpBytes(4, 8, start));
            ZFile::writeBinary(out, data);
            return 0;
        } else {
            LOG("Failed to Open");
            return -2;
        }
    } else {
        LOG("Not Found");
        return -1;
    }
}

void fwDecode(ZBinary &bin){
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

    // y = (x - 7 << 4) + (x >> 4)
    for(zu64 i = 0; i < bin.size(); ++i){
        bin[i] = ((bin[i] - 7) << 4) + (bin[i] >> 4);
    }
}

void fwEncode(ZBinary &bin){
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

#define V113_HASH       0x62FCF913A689C9AE
#define V114_HASH       0xFE37430DB1FFCF5F
#define V115_HASH       0x8986F7893143E9F7
#define V116_HASH       0xA28E5EFB3F796181
#define V117_HASH       0xEA55CB190C35505F

#define FWU_START       0x1A3800
#define STRINGS_LEN     0x4B8

int decfw(ZPath exe){
    LOG("Extract from " << exe);
    ZFile file;
    if(!file.open(exe, ZFile::READ)){
        ELOG("Failed to open file");
        return -1;
    }

    zu64 exehash = ZFile::fileHash(exe);

    zu64 fw_len;
    zu64 strings_start;

    switch(exehash){
        case V113_HASH:
            fw_len = 0x5E03;
            strings_start = 0x1A9604;
            break;
        case V114_HASH:
            fw_len = 0x624F;
            strings_start = 0x1A9A50;
            break;
        case V115_HASH:
            fw_len = 0x645C;
            strings_start = 0x1A9C5C;
            break;
        case V116_HASH:
            fw_len = 0x648C;
            strings_start = 0x1A9C8C;
            break;
        case V117_HASH:
            fw_len = 0x64D4;
            strings_start = 0x1A9CD4;
            break;
        default:
            ELOG("Unknown updater executable");
            return -2;
    }

    // Read strings
    ZBinary strs;
    if(file.seek(strings_start) != strings_start){
        LOG("File too short - seek");
        return -4;
    }
    if(file.read(strs, STRINGS_LEN) != STRINGS_LEN){
        LOG("File too short - read");
        return -5;
    }
    // Decrypt strings
    fwDecode(strs);

    ZString company;
    ZString product;
    ZString description;
    ZString version;

    // Company name
    company.parseUTF16((const zu16 *)(strs.raw() + 0x10), 0x200);
    // Product name
    product.parseUTF16((const zu16 *)(strs.raw() + 0x218), 0x200);
    // Description
    description.parseUTF16((const zu16 *)(strs.raw() + 0x424), 0x20);
    // Version
    version = ZString(strs.raw() + 0x460, 12);

    LOG("Company: " << company);
    LOG("Product: " << product);
    LOG("Description: " << description);
    LOG("Version: " << version);

    LOG("String Dump:");
    RLOG(strs.dumpBytes(4, 8));

    // Read firmware
    ZBinary fw;
    if(file.seek(FWU_START) != FWU_START){
        LOG("File too short - seek");
        return -2;
    }
    if(file.read(fw, fw_len) != fw_len){
        LOG("File too short - read");
        return -3;
    }

    // Decrypt firmware
    fwDecode(fw);
    // Write firmware
    ZFile fwout("dump_" + version + ".bin", ZFile::WRITE);
    fwout.write(fw);

    LOG("Firmware Dump:");
    RLOG(fw.dumpBytes(4, 8, 0));

    return 0;
}

int encfw(ZPath exe, ZPath fw){
    LOG("Updater: " << exe);
    LOG("Decoded Firmware: " << fw);

    // Read updater
    ZBinary exebin;
    if(!ZFile::readBinary(exe, exebin)){
        ELOG("Failed to read file");
        return -1;
    }

    // Read firmware
    ZBinary fwbin;
    if(!ZFile::readBinary(fw, fwbin)){
        LOG("Failed to read file");
        return -2;
    }

    // Encode firmware
    fwEncode(fwbin);

    // Write encoded firmware onto exe
    exebin.seek(FWU_START);
    exebin.write(fwbin);

    ZPath exeout = "patched.exe";
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

    LOG("Updated Updater: " << exeout);

    return 0;
}

int main(int argc, char **argv){
    ZLog::logLevelStdOut(ZLog::INFO, "%time% %thread% N %log%");
    ZLog::logLevelStdErr(ZLog::ERRORS, "\x1b[31m%time% %thread% E [%file%:%line%] %log%\x1b[m");

    if(argc > 1){
        ZString cmd = argv[1];
        if(cmd == "version"){
            // Read version from Pok3r
            return readver();
        } else if(cmd == "read"){
            // Read bytes from Pok3r
            if(argc > 1){
                return readfw(ZString(argv[2]));
            } else {
                return 2;
            }
        } else if(cmd == "decode"){
            // Decode firmware from updater executable
            if(argc > 2){
                return decfw(ZString(argv[2]));
            } else {
                LOG("Usage: pok3rtest decfw <path to updater>");
                return 2;
            }
        } else if(cmd == "encode"){
            // Encode firmware into updater executable
            if(argc > 3){
                return encfw(ZString(argv[2]), ZString(argv[3]));
            } else {
                LOG("Usage: pok3rtest encfw <path to updater> <path to firmware>");
                return 2;
            }
        } else {
            LOG("Unknown Command \"" << cmd << "\"");
            return 1;
        }
    } else {
        LOG("No Command");
        return 1;
    }
}
