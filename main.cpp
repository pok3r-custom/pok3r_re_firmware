#include "zlog.h"
#include "pok3r.h"

int main(){
    ZLog::logLevelStdOut(ZLog::INFO, "%time% %thread% N %log%");
    ZLog::logLevelStdErr(ZLog::ERROR, "\x1b[31m%time% %thread% E [%function%|%file%:%line%] %log%\x1b[m");

    LOG("Looking for Vortex Pok3r...");

    Pok3r pok3r;
    if(pok3r.findPok3r() && pok3r.open()){
        //ZBinary bin;
        //pok3r.read(0x2800, bin);
        //LOG(bin.strWords());
        LOG(pok3r.getVersion());
    }

    LOG("Done");
    return 0;
}

