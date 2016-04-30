#include "zlog.h"
#include "libusb-1.0/libusb.h"

#define HOLTEK_VID          0x04d9
#define VORTEX_POK3R_PID    0x0141

using namespace LibChaos;

int usb_detach(libusb_device_handle *handle, int interface){
    int status = libusb_kernel_driver_active(handle, interface);
    if(status < 0){
        ELOG("Failed to query kernel status on interface " << interface << ": " << libusb_error_name(status));
        return -1;
    } else if(status){
        status = libusb_detach_kernel_driver(handle, interface);
        if(status != 0){
            ELOG("Failed to detach kernel on interface " << interface << ": " << libusb_error_name(status));
            return -2;
        } else {
            LOG("Detached kernel on interface " << interface);
            return 0;
        }
    }
    return 0;
}

int main(){
    ZLog::logLevelStdOut(ZLog::INFO, "%time% %thread% N %log%");
    ZLog::logLevelStdErr(ZLog::ERROR, "\x1b[31m%time% %thread% E [%function%|%file%:%line%] %log%\x1b[m");

    LOG("Looking for Vortex Pok3r...");

    int status = libusb_init(NULL);
    if(status != 0){
        ELOG("Failed to init libusb: " << libusb_error_name(status));
        return -1;
    }

//    libusb_device_handle *handle = libusb_open_device_with_vid_pid(NULL, HOLTEK_VID, VORTEX_POK3R_PID);
//    if(handle){
//        ELOG("Opened");
//        libusb_device *device = libusb_get_device(handle);

//        libusb_close(handle);
//    } else {
//        ELOG("Failed to open");
//    }

    libusb_device *device, **devices;
    status = libusb_get_device_list(NULL, &devices);
    if(status < 0){
        LOG("Failed to get device list: " << libusb_error_name(status));
    } else {
        for(int i = 0; (device = devices[i]) != NULL; ++i){
            struct libusb_device_descriptor desc;
            libusb_get_device_descriptor(device, &desc);
            if(desc.idVendor == HOLTEK_VID && desc.idProduct == VORTEX_POK3R_PID){
                LOG("Matched ID " << ZString::ItoS((zu64)desc.idVendor, 16, 4) << ":" << ZString::ItoS((zu64)desc.idProduct, 16, 4));
                libusb_device_handle *handle;
                status = libusb_open(device, &handle);
                if(status != 0){
                    ELOG("Failed to open device: " << libusb_error_name(status));
                } else {
                    status = libusb_set_auto_detach_kernel_driver(handle, 1);
                    if(status == LIBUSB_SUCCESS){
                        LOG("Enabled auto kernel detach");
                    } else {
                        usb_detach(handle, 0);
                        usb_detach(handle, 1);
                        usb_detach(handle, 2);
                    }

                    status = libusb_claim_interface(handle, 0);
                    if(status != 0){
                        ELOG("Failed to claim interface: " << libusb_error_name(status));
                    } else {
                        zu8 opcode = 0;
                        zu32 addr = 0x2800;
                        zu16 len = 64;
                        ZBinary data(len);
                        status = libusb_control_transfer(handle,
                                                         LIBUSB_ENDPOINT_IN,
                                                         opcode,
                                                         addr & 0xFF,
                                                         addr >> 16,
                                                         data.raw(),
                                                         len,
                                                         1000);

                        status = libusb_bulk_transfer(handle,
                                                      LIBUSB_ENDPOINT_IN,
                                                      addr,
                                                      data.raw(),
                                                      len,
                                                      1000);
                        if(status != len){
                            ELOG("Failed to read: " << libusb_error_name(status));
                        }
                    }

                    status = libusb_release_interface(handle, 0);
                    if(status != 0){
                        ELOG("Failed to release interface: " << libusb_error_name(status));
                    }

                    libusb_close(handle);
                }
                break;
            }
        }
    }
    libusb_free_device_list(devices, 1);

    LOG("Done");

    libusb_exit(NULL);
    return 0;
}

