#include "usbdevice.h"
#include "zlog.h"

USBDevice::USBDevice() : context(nullptr), device(nullptr), handle(nullptr), claimed{0}, kernel{0}{
    int status = libusb_init(&context);
    if(status != 0){
        ELOG("Failed to init libusb: " << libusb_error_name(status));
        context = nullptr;
    }
}

USBDevice::~USBDevice(){
    close();
    if(context)
        libusb_exit(context);
}

bool USBDevice::open(){
    if(!device){
        ELOG("No device");
        return false;
    }

    // Open device handle
    int status = libusb_open(device, &handle);
    if(status != 0){
        ELOG("Failed to open device: " << libusb_error_name(status));
        handle = nullptr;
        return false;
    }

    // Set auto detach (if supported, otherwise silently ignore)
    libusb_set_auto_detach_kernel_driver(handle, 1);

    //detachKernel(0);
    //detachKernel(1);
    //detachKernel(2);

    // Set configuration
    status = libusb_set_configuration(handle, 1);
    if(status == LIBUSB_ERROR_BUSY){
        // Ignore busy error
    } else if(status != 0){
        ELOG("Failed to set configuration: " << libusb_error_name(status));
        close();
        return false;
    }

    // Claim interface
    claimInterface(0);
    claimInterface(1);
    claimInterface(2);

    return true;
}

void USBDevice::close(){
    if(handle){
        releaseInterface(0);
        releaseInterface(1);
        releaseInterface(2);

        if(kernel[0]) attachKernel(0);
        if(kernel[1]) attachKernel(1);
        if(kernel[2]) attachKernel(2);

        // Close handle
        libusb_close(handle);
        handle = nullptr;
    }

    if(device){
        // Unref device so libusb frees it
        libusb_unref_device(device);
        device = nullptr;
    }
}

zu16 USBDevice::interrupt_send(int ep, const zbyte *data, zu16 len){
    int olen;
    int status = libusb_interrupt_transfer(handle,
                                           LIBUSB_ENDPOINT_OUT | ep,
                                           (zbyte *)data,
                                           len,
                                           &olen,
                                           SEND_TIMEOUT);
    if(status != 0){
        ELOG("Failed to send: error " << libusb_error_name(status) << " length " << olen);
        return 0;
    }
    return olen;
}

zu16 USBDevice::interrupt_recv(int ep, zbyte *data, zu16 maxlen){
    int olen;
    int status = libusb_interrupt_transfer(handle,
                                           LIBUSB_ENDPOINT_IN | ep,
                                           data,
                                           maxlen,
                                           &olen,
                                           RECV_TIMEOUT);
    if(status != 0){
        ELOG("Failed to recv: error " << libusb_error_name(status) << " length " << olen);
        return 0;
    }
    return olen;
}

bool USBDevice::findUSBVidPid(zu16 vid, zu16 pid){
    if(!context)
        return false;

    // List devices
    libusb_device **devices;
    int status = libusb_get_device_list(context, &devices);
    if(status < 0){
        ELOG("Failed to get device list: " << libusb_error_name(status));
    } else {
        for(int i = 0; devices[i] != NULL; ++i){
            // Get device descriptor (can't fail)
            struct libusb_device_descriptor desc;
            libusb_get_device_descriptor(devices[i], &desc);
            // Check vid and pid
            if(desc.idVendor == vid && desc.idProduct == pid){
                LOG("Found ID " << ZString::ItoS((zu64)desc.idVendor, 16, 4) << ":" << ZString::ItoS((zu64)desc.idProduct, 16, 4));
                device = devices[i];
                // Reference device so it is not freed by libusb
                libusb_ref_device(device);
                break;
            }
        }
    }
    libusb_free_device_list(devices, 1);
    return (device ? true : false);
}

bool USBDevice::claimInterface(int interface){
    int status = libusb_claim_interface(handle, interface);
    if(status != 0){
        ELOG("Failed to claim interface: " << libusb_error_name(status));
        claimed[interface] = false;
        return false;
    }
    claimed[interface] = true;
    return true;
}

bool USBDevice::releaseInterface(int interface){
    if(claimed[interface]){
        // Release interface
        int status = libusb_release_interface(handle, interface);
        claimed[interface] = false;
        if(status != 0){
            //ELOG("Failed to release interface: " << libusb_error_name(status));
            return false;
        }
    }
    return true;
}

bool USBDevice::detachKernel(int interface){
    int status = libusb_kernel_driver_active(handle, interface);
    if(status < 0){
        ELOG("Failed to query kernel driver on interface " << interface << ": " << libusb_error_name(status));
        return false;
    } else if(status){
        kernel[interface] = true;
        status = libusb_detach_kernel_driver(handle, interface);
        if(status != 0){
            ELOG("Failed to detach kernel on interface " << interface << ": " << libusb_error_name(status));
            return false;
        } else {
            LOG("Detached kernel on interface " << interface);
        }
    } else {
        kernel[interface] = false;
    }
    return true;
}

bool USBDevice::attachKernel(int interface){
    int status = libusb_attach_kernel_driver(handle, interface);
    if(status != 0){
        ELOG("Failed to attach kernel on interface " << interface << ": " << libusb_error_name(status));
        return false;
    } else {
        LOG("Attached kernel on interface " << interface);
    }
    return true;
}
