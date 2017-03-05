#ifndef HIDDEVICE_H
#define HIDDEVICE_H

#include "zbinary.h"
using namespace LibChaos;

#define SEND_TIMEOUT    1000
#define RECV_TIMEOUT    1000

struct HIDDeviceData;

class HIDDevice {
public:
    HIDDevice();
    ~HIDDevice();

    bool open(zu16 vid, zu16 pid, zu16 upage, zu16 usage);
    void close();
    bool isOpen();

    bool send(const ZBinary &data);
    bool recv(ZBinary &data);

public:
    zu16 vid;
    zu16 pid;
    zu16 upage;
    zu16 usage;

private:
    HIDDeviceData *device;
};

#endif // HIDDEVICE_H
