#ifndef HIDDEVICE_H
#define HIDDEVICE_H

#include "zbinary.h"
#include "zpointer.h"
using namespace LibChaos;

#define SEND_TIMEOUT    1000
#define RECV_TIMEOUT    1000

struct HIDDeviceData;

class HIDDevice {
public:
    HIDDevice();
private:
    HIDDevice(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage, void *hidt);
public:
    ~HIDDevice();

    bool open(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage);
    void close();
    bool isOpen() const;

    bool send(const ZBinary &data, bool tolerate_dc = false);
    bool recv(ZBinary &data);

    static ZArray<ZPointer<HIDDevice>> openAll(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage);

public:
    zu16 vid;
    zu16 pid;
    zu16 usage_page;
    zu16 usage;

private:
    HIDDeviceData *device;
};

#endif // HIDDEVICE_H
