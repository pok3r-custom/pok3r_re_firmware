#include "pok3r.h"
#include "zlog.h"

void setword(unsigned char *b, int i){
    b[0]=(i>>0)&0xff;
    b[1]=(i>>8)&0xff;
}

// From http://mdfs.net/Info/Comp/Comms/CRC16.htm
// CRC-CCITT
#define poly 0x1021
zu16 crc16(unsigned char *addr, zu64 size) {
    zu32 crc = 0;
    for(zu64 i = 0; i < size; ++i){             /* Step through bytes in memory */
        crc ^= (zu16)(addr[i] << 8);                  /* Fetch byte from memory, XOR into CRC top byte*/
        for(int j = 0; j < 8; j++){             /* Prepare to rotate 8 bits */
            crc = crc << 1;                     /* rotate */
            if(crc & 0x10000)                   /* bit 15 was set (now bit 16)... */
                crc = (crc ^ poly) & 0xFFFF;    /* XOR with XMODEM polynomic and ensure CRC remains 16-bit value */
        }
    }
    return (zu16)crc;
}

Pok3r::Pok3r() : context(nullptr), device(nullptr), handle(nullptr), claimed{0}, kernel{0}{
    int status = libusb_init(&context);
    if(status != 0){
        ELOG("Failed to init libusb: " << libusb_error_name(status));
        context = nullptr;
    }
}

Pok3r::~Pok3r(){
    close();
    if(context)
        libusb_exit(context);
}

bool Pok3r::findPok3r(){
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
            if(desc.idVendor == HOLTEK_VID && desc.idProduct == VORTEX_POK3R_PID){
                //LOG("Matched ID " << ZString::ItoS((zu64)desc.idVendor, 16, 4) << ":" << ZString::ItoS((zu64)desc.idProduct, 16, 4));
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

bool Pok3r::open(){
    if(!device)
        return false;

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
    //claimInterface(0);
    claimInterface(1);
    //claimInterface(2);

    return true;
}

void Pok3r::close(){
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

zu32 Pok3r::read(zu32 addr, ZBinary &bin){
    int status;
    const zu8 cmd = 1;
    const zu8 scmd = 2;
    const zu16 len = 64;
    const zu32 eaddr = addr + len;
    int olen;

    ZBinary data(len);
    data.fill(0, len);
    data.writeu8(cmd); // Command
    data.writeu8(scmd); // Subcommand
    data.writeleu16(0); // CRC
    data.writeleu32(addr); // Address
    data.writeleu32(eaddr); // End address
    data.seek(2);
    data.writeleu16(crc16(data.raw(), len)); // CRC

    // Send command
    status = libusb_interrupt_transfer(handle, LIBUSB_ENDPOINT_OUT | SEND_EP, data.raw(), len, &olen, TIMEOUT);
    if(status != 0){
        ELOG("Failed to send: " << libusb_error_name(status) << " " << olen);
        return 0;
    }

    // Recv data
    status = libusb_interrupt_transfer(handle, LIBUSB_ENDPOINT_IN | RECV_EP, data.raw(), len, &olen, TIMEOUT);
    if(status != 0){
        ELOG("Failed to recv: " << libusb_error_name(status) << " " << olen);
        return 0;
    }

    bin.write(data.raw(), data.size());

    return data.size();
}

zu32 Pok3r::write(zu32 addr, ZBinary bin){

    return 0;
}

ZString Pok3r::getVersion(){
    ZBinary bin;
    zu32 len = read(0x2800, bin);
    if(len == 64 && bin[0] == 0x05){
        return ZString(bin.raw() + 4);
    }
    return "NONE";
}

bool Pok3r::claimInterface(int interface){
    int status = libusb_claim_interface(handle, interface);
    if(status != 0){
        ELOG("Failed to claim interface: " << libusb_error_name(status));
        claimed[interface] = false;
        return false;
    }
    claimed[interface] = true;
    return true;
}

bool Pok3r::releaseInterface(int interface){
    if(claimed[interface]){
        // Release interface
        int status = libusb_release_interface(handle, interface);
        if(status != 0){
            ELOG("Failed to release interface: " << libusb_error_name(status));
            return false;
        }
        claimed[interface] = false;
    }
    return true;
}

bool Pok3r::detachKernel(int interface){
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

bool Pok3r::attachKernel(int interface){
    int status = libusb_attach_kernel_driver(handle, interface);
    if(status != 0){
        ELOG("Failed to attach kernel on interface " << interface << ": " << libusb_error_name(status));
        return false;
    } else {
        LOG("Attached kernel on interface " << interface);
    }
    return true;
}
