#include "hiddevice.h"
#include "zlog.h"
#include "zmutex.h"
#include "zlock.h"

#include "rawhid/hid.h"

struct HIDDeviceData {
    hid_t *hid;
};

HIDDevice::HIDDevice(){
    device = new HIDDeviceData;
    device->hid = NULL;
}

HIDDevice::~HIDDevice(){
    rawhid_close(device->hid);
    delete device;
}

bool HIDDevice::open(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage){
    device->hid = rawhid_open(vid, pid, usage_page, usage);
    return (device != NULL);
}

bool HIDDevice::send(const ZBinary &data){
    if(!device->hid)
        return false;
    int ret = rawhid_send(device->hid, data.raw(), data.size(), SEND_TIMEOUT);
    if(ret != data.size())
        return false;
    return true;
}

bool HIDDevice::recv(ZBinary &data){
    if(!device->hid)
        return false;
    int ret = rawhid_recv(device->hid, data.raw(), data.size(), RECV_TIMEOUT);
    data.resize(ret);
    if(ret < 0)
        return false;
    return true;
}
