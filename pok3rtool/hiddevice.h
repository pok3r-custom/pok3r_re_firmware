#ifndef HIDDEVICE_H
#define HIDDEVICE_H

#include "zbinary.h"
using namespace LibChaos;

class HIDDevice {
public:
    HIDDevice();
    ~HIDDevice();

    bool open(zu16 vid, zu16 pid, zu16 upage, zu16 usage);
};

#endif // HIDDEVICE_H
