#include "pok3r.h"
#include "zlog.h"
#include "zfile.h"

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

#define FW_START    0x1A3800
#define FW_LEN      0x5E28

int decfw(ZPath exe){
    LOG("Extract from " << exe);
    ZFile file(exe, ZFile::READ);
    if(file.seek(FW_START) != FW_START){
        LOG("File too short");
        return -1;
    }
    ZBinary bin;
    if(file.read(bin, FW_LEN) != FW_LEN){
        LOG("File too short");
        return -1;
    }
    for(zu64 i = 0; i < bin.size(); ++i){
        bin[i] = ((bin[i] - 7) << 4) + (bin[i] >> 4);
    }
    for(zu64 i = 0; i < bin.size(); i+=2){
        zbyte b = bin[i];
        bin[i] = bin[i+1];
        bin[i+1] = b;
    }
//    zs8 s = 1;
//    for(zu64 i = 0; i < bin.size() - 4; i+=4){
//        zbyte b = bin[i+s];
//        bin[i+s] = bin[i+s+4];
//        bin[i+s+4] = b;
//        s = s - 1 % 2;
//    }
    RLOG(bin.strWords(4) << ZLog::NEWLN);

    return 0;
}

int main(int argc, char **argv){
    ZLog::logLevelStdOut(ZLog::INFO, "%time% %thread% N %log%");
    ZLog::logLevelStdErr(ZLog::ERROR, "\x1b[31m%time% %thread% E [%file%:%line%] %log%\x1b[m");

    if(argc > 1){
        ZString cmd = argv[1];
        if(cmd == "readver"){
            return readver();
        } else if(cmd == "decfw"){
            if(argc > 2){
                ZPath fw = ZString(argv[2]);
                return decfw(fw);
            } else {
                LOG("Usage: pok3rtest decfw <path to updater>");
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
