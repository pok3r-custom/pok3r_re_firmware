#include "zlog.h"
#include "pok3r.h"

int main(){
    ZLog::logLevelStdOut(ZLog::INFO, "%time% %thread% N %log%");
    ZLog::logLevelStdErr(ZLog::ERROR, "\x1b[31m%time% %thread% E [%file%:%line%] %log%\x1b[m");

    LOG("Looking for Vortex Pok3r...");

    Pok3r pok3r;
    if(pok3r.findPok3r()){
        if(pok3r.open()){
            LOG("Found: " << pok3r.getVersion());

            LOG("Done");
        } else {
            LOG("Failed to Open");
        }
    } else {
        LOG("Not Found");
    }

    return 0;
}

