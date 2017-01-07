#include "hiddevice.h"
#include "zlog.h"
#include "zmutex.h"
#include "zlock.h"

#include "rawhid/hid.h"

#include <usb.h>

struct HIDDeviceData {
    hid_t *hid;
};

HIDDevice::HIDDevice(){
    device = new HIDDeviceData;
    device->hid = NULL;
}

HIDDevice::~HIDDevice(){
    close();
    delete device;
}

bool HIDDevice::open(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage){
    device->hid = rawhid_open(vid, pid, usage_page, usage);
    return (device->hid != NULL);
}

void HIDDevice::close(){
    rawhid_close(device->hid);
    device->hid = NULL;
}

bool HIDDevice::send(const ZBinary &data){
    if(!device->hid)
        return false;
    int ret = rawhid_send(device->hid, data.raw(), data.size(), SEND_TIMEOUT);
    if(ret < 0){
#if PLATFORM == MACOSX
        ELOG("error: " << ret);
#else
        ELOG("error: " << ret << ": " << usb_strerror());
#endif
        return false;
    }
    if(ret != data.size())
        return false;
    return true;
}

bool HIDDevice::recv(ZBinary &data){
    if(!device->hid)
        return false;
    int ret = rawhid_recv(device->hid, data.raw(), data.size(), RECV_TIMEOUT);
    if(ret < 0){
        ELOG("error: " << ret);
        return false;
    }
    data.resize(ret);
    if(ret < 0)
        return false;
    return true;
}
