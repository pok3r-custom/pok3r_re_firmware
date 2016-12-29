#include "pok3r_rgb.h"

bool Pok3rRGB::findPok3rRGB(){
    // Try firmware vid and pid
    if(findUSBVidPid(HOLTEK_VID, POK3R_RGB_PID))
        return true;
    return false;
}
