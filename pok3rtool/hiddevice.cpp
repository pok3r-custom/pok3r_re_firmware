#include "hiddevice.h"
#include "zlog.h"

#if PLATFORM == WINDOWS
    #include <windows.h>
    #include <setupapi.h>
    #include <hidclass.h>
    extern "C" {
        #include <hidsdi.h>
    }
#else
    #include <hidapi/hidapi.h>
#endif

HIDDevice::HIDDevice(){
#if PLATFORM == WINDOWS

#else
    int ret = hid_init();
    if(ret != 0){
        ELOG("Error");
    }
#endif
}

HIDDevice::~HIDDevice(){
#if PLATFORM == WINDOWS

#else
    hid_exit();
#endif
}

bool HIDDevice::open(zu16 vid, zu16 pid, zu16 upage, zu16 usage){
#if PLATFORM == WINDOWS
    GUID guid;
    HidD_GetHidGuid(&guid);
    HDEVINFO info = SetupDiGetClassDevs(&guid, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
    if(info == INVALID_HANDLE_VALUE)
        return 0;

    for(int i = 0; true; ++i){
        SP_DEVICE_INTERFACE_DATA iface;
        iface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
        BOOL ret = SetupDiEnumDeviceInterfaces(info, NULL, &guid, i, &iface);
        if(!ret)
            return false;

        // Get details
        DWORD reqsize;
        SetupDiGetInterfaceDeviceDetail(info, &iface, NULL, 0, &reqsize, NULL);
        SP_DEVICE_INTERFACE_DETAIL_DATA *details = (SP_DEVICE_INTERFACE_DETAIL_DATA *)malloc(reqsize);
        if(details == NULL)
            continue;
        memset(details, 0, reqsize);
        details->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);
        ret = SetupDiGetDeviceInterfaceDetail(info, &iface, details, reqsize, NULL, NULL);
        if(!ret){
            free(details);
            continue;
        }

        // Open handle
        HANDLE handle = CreateFile(details->DevicePath,
                                   GENERIC_READ | GENERIC_WRITE,
                                   FILE_SHARE_READ | FILE_SHARE_WRITE,
                                   NULL,
                                   OPEN_EXISTING,
                                   FILE_FLAG_OVERLAPPED,
                                   NULL);
        free(details);
        if(handle == INVALID_HANDLE_VALUE)
            continue;

        HIDD_ATTRIBUTES attrib;
        attrib.Size = sizeof(HIDD_ATTRIBUTES);
        ret = HidD_GetAttributes(handle, &attrib);
        LOG("vid " << ZString::ItoS((zu64)attrib.VendorID, 16));
        LOG("pid " << ZString::ItoS((zu64)attrib.ProductID, 16));

        PHIDP_PREPARSED_DATA hid_data;
        NTSTATUS status = HidD_GetPreparsedData(handle, &hid_data);
        if(!status){
            HidD_FreePreparsedData(hid_data);
            continue;
        }

        HIDP_CAPS capabilities;
        status = HidP_GetCaps(hid_data, &capabilities);
        if(!status){
            HidD_FreePreparsedData(hid_data);
            continue;
        }
        LOG("usage page " << ZString::ItoS((zu64)capabilities.UsagePage, 16));
        LOG("usage " << ZString::ItoS((zu64)capabilities.Usage, 16));
        HidD_FreePreparsedData(hid_data);

        CloseHandle(handle);
    }

#else
    hid_device_info *list = hid_enumerate(vid, pid);
    hid_device_info *next = list;
    while(next){
        LOG(next->interface_number);
        LOG(ZString(next->product_string));
        next = next->next;
    }
    hid_free_enumeration(list);
    return true;
#endif
}
