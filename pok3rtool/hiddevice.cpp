#include "hiddevice.h"

#include "zlog.h"

#include <hidapi/hidapi.h>

HIDDevice::HIDDevice(){
    int ret = hid_init();
    if(ret != 0){
        ELOG("Error");
    }
}

HIDDevice::~HIDDevice(){
    hid_exit();
}

bool HIDDevice::open(zu16 vid, zu16 pid, zu16 upage, zu16 usage){
    hid_device_info *list = hid_enumerate(vid, pid);
    hid_device_info *next = list;
    while(next){
        LOG(next->interface_number);
        LOG(ZString(next->product_string));
        next = next->next;
    }
    hid_free_enumeration(list);
    return true;
}
