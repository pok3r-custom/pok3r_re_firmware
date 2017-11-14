#include "hiddevice.h"
#include "zlog.h"
#include "zmutex.h"
#include "zlock.h"

#include "hid.h"

#if PLATFORM == WINDOWS
    #include <windows.h>
#elif PLATFORM == LINUX
    #include <usb.h>
#endif

struct HIDDeviceData {
    hid_t *hid;
};

HIDDevice::HIDDevice() : vid(0), pid(0), usage_page(0), usage(0){
    device = new HIDDeviceData;
    device->hid = NULL;
}

HIDDevice::HIDDevice(zu16 vid_, zu16 pid_, zu16 usage_page_, zu16 usage_, void *hidt) :
        vid(vid_), pid(pid_), usage_page(usage_page_), usage(usage_){
    device = new HIDDeviceData;
    device->hid = (hid_t *)hidt;
}

HIDDevice::~HIDDevice(){
    close();
    delete device;
}

bool HIDDevice::open(zu16 vid_, zu16 pid_, zu16 usage_page_, zu16 usage_){
    vid = vid_;
    pid = pid_;
    usage_page = usage_page_;
    usage = usage_;

    device->hid = rawhid_open(vid, pid, usage_page, usage);
    return (device->hid != NULL);
}

void HIDDevice::close(){
    rawhid_close(device->hid);
    device->hid = NULL;
}

bool HIDDevice::isOpen() const {
    return !!(device->hid);
}

bool HIDDevice::send(const ZBinary &data, bool tolerate_dc){
    if(!isOpen())
        return false;
    int ret = rawhid_send(device->hid, data.raw(), data.size(), SEND_TIMEOUT);
    if(ret < 0){
#if PLATFORM == WINDOWS
        zu32 err = ZError::getSystemErrorCode();
        if(tolerate_dc && (
            err == ERROR_GEN_FAILURE ||
            err == ERROR_DEVICE_NOT_CONNECTED
        )){
            // ignore some errors when devices may disconnect
            return true;
        }
        ELOG("hid send win32 error: " << err);
#elif PLATFORM == LINUX
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

ZArray<ZPointer<HIDDevice> > HIDDevice::openAll(zu16 vid, zu16 pid, zu16 usage_page, zu16 usage){
    ZArray<ZPointer<HIDDevice>> devs;
    hid_t *hid[128];
    int count = rawhid_openall(hid, 128, vid, pid, usage_page, usage);

    for(int i = 0; i < count; ++i){
        devs.push(new HIDDevice(vid, pid, usage_page, usage, hid[i]));
    }
    return devs;
}
