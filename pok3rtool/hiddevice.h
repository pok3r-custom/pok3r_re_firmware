#ifndef HIDDEVICE_H
#define HIDDEVICE_H

#include "zbinary.h"
using namespace LibChaos;

struct HIDDeviceData;

class HIDDevice {
public:
    HIDDevice();
    ~HIDDevice();

    bool open(zu16 vid, zu16 pid, zu16 upage, zu16 usage);

    bool send(const ZBinary &data);
    bool recv(ZBinary &data);

private:
    HIDDeviceData *device;
};

#endif // HIDDEVICE_H
