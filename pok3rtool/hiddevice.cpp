#include "hiddevice.h"
#include "zlog.h"
#include "zmutex.h"
#include "zlock.h"

#include "rawhid/hid.h"

#if PLATFORM == LINUX
    #include <usb.h>
#endif

struct HIDDeviceData {
    hid_t *hid;
};

HIDDevice::HIDDevice() : vid(0), pid(0), upage(0), usage(0){
    device = new HIDDeviceData;
    device->hid = NULL;
}

HIDDevice::~HIDDevice(){
    close();
    delete device;
}

bool HIDDevice::open(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage){
    this->vid = vid;
    this->pid = pid;
    this->upage = upage;
    this->usage = usage;
    device->hid = rawhid_open(vid, pid, usage_page, usage);
    return (device->hid != NULL);
}

void HIDDevice::close(){
    rawhid_close(device->hid);
    device->hid = NULL;
}

bool HIDDevice::isOpen(){
    return !!(device->hid);
}

bool HIDDevice::send(const ZBinary &data){
    if(!isOpen())
        return false;
    int ret = rawhid_send(device->hid, data.raw(), data.size(), SEND_TIMEOUT);
    if(ret < 0){
#if PLATFORM == LINUX
        ELOG("hid send error: " << ret << ": " << usb_strerror());
#else
        ELOG("hid send error: " << ret);
#endif
        return false;
    }
    if((zu64)ret != data.size())
        return false;
    return true;
}

bool HIDDevice::recv(ZBinary &data){
    if(!isOpen())
        return false;
    if(data.size() == 0)
        return false;
    int ret = rawhid_recv(device->hid, data.raw(), data.size(), RECV_TIMEOUT);
    if(ret < 0){
#if PLATFORM == LINUX
        ELOG("hid recv error: " << ret << ": " << usb_strerror());
#else
        ELOG("hid recv error: " << ret);
#endif
        return false;
    }
    data.resize((zu64)ret);
    return true;
}
