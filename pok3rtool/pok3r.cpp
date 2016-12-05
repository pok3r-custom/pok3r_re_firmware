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
        crc ^= (zu16)(addr[i] << 8);            /* Fetch byte from memory, XOR into CRC top byte*/
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
    // Open device with known vid and pid
    return findUSBVidPid(HOLTEK_VID, POK3R_PID);
}

bool Pok3r::open(){
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

bool Pok3r::resetToLoader(){
    // Reset
    LOG("Reset...");
    if(!reset(RESET_BUILTIN_SUBCMD)){
        ELOG("Reset send error");
        return false;
    }

    LOG("Wait...");
    ZThread::sleep(3);

    // Close old handle
    close();

    // Find device with new loader vid and pid
    LOG("Find...");
    if(!findUSBVidPid(HOLTEK_VID, POK3R_BOOT_PID)){
        ELOG("Couldn't open device");
        return false;
    }

    // Open new handle
    LOG("Open...");
    if(!open()){
        ELOG("Open error");
        return false;
    }

    return true;
}

ZString Pok3r::getVersion(){
    ZBinary bin;
    if(readFlash(VER_ADDR, bin)){
        return ZString(bin.raw() + 4);
    }
    return "NONE";
}

bool Pok3r::eraseFlash(zu32 start, zu32 end){
    // Send command
    if(!sendCmd(ERASE_CMD, 0, start, end, nullptr, 0))
        return false;
    return true;
}

bool Pok3r::readFlash(zu32 addr, ZBinary &bin){
    // Send command
    if(!sendCmd(FLASH_CMD, FLASH_READ_SUBCMD, addr, addr + 64, nullptr, 0))
        return false;

    // Get response
    zu64 pos = bin.size();
    bin.resize(bin.size() + 64);
    if(!recvDat(bin.raw() + pos))
        return false;

    return true;
}

bool Pok3r::writeFlash(zu32 addr, ZBinary bin){
    if(!bin.size())
        return false;
    // Send command
    if(!sendCmd(FLASH_CMD, FLASH_WRITE_SUBCMD, addr, addr + bin.size() - 1, bin.raw(), bin.size()))
        return false;
    return true;
}

bool Pok3r::updateStart(ZBinary &bin){
    // Send command
    if(!sendCmd(UPDATE_START_CMD, 0, 0, 0, nullptr, 0))
        return false;

    // Get response
    bin.resize(64);
    if(!recvDat(bin.raw()))
        return false;

    return true;
}

bool Pok3r::reset(zu8 subcmd){
    // Send command
    if(!sendCmd(RESET_CMD, subcmd, 0, 0, nullptr, 0))
        return false;
    return true;
}

zu16 Pok3r::crcFlash(zu32 addr, zu32 len){
    // Send command
    sendCmd(CRC_CMD, 0, addr, len, nullptr, 0);
    return 0;
}

bool Pok3r::sendCmd(zu8 cmd, zu8 subcmd, zu32 a1, zu32 a2, const zbyte *data, zu8 len){
    if(len > 52)
        return false;

    ZBinary packet;
    packet.fill(0, PKT_LEN);
    packet.writeu8(cmd);      // command
    packet.writeu8(subcmd);   // subcommand
    packet.seek(4);
    packet.writeleu32(a1);    // arg1
    packet.writeleu32(a2);    // arg2

    if(data){
        packet.write(data, len);  // data
    }

    packet.seek(2);
    packet.writeleu16(crc16(packet.raw(), PKT_LEN)); // CRC

    // debug
    RLOG(packet.dumpBytes(4, 8));

    // Send command (interrupt write)
    int olen;
    int status = libusb_interrupt_transfer(handle,
                                           LIBUSB_ENDPOINT_OUT | SEND_EP,
                                           packet.raw(),
                                           PKT_LEN,
                                           &olen,
                                           SEND_TIMEOUT);
    if(status != 0){
        ELOG("Failed to send: error " << libusb_error_name(status) << " length " << olen);
        return false;
    }
    if(olen != PKT_LEN){
        ELOG("Failed to send: length " << olen);
        return false;
    }
    return true;
}

bool Pok3r::recvDat(zbyte *data){
    if(!data)
        return false;

    // Recv data (interrupt read)
    int olen;
    int status = libusb_interrupt_transfer(handle,
                                           LIBUSB_ENDPOINT_IN | RECV_EP,
                                           data,
                                           PKT_LEN,
                                           &olen,
                                           RECV_TIMEOUT);
    if(status != 0){
        ELOG("Failed to recv: error " << libusb_error_name(status) << " length " << olen);
        return false;
    }
    if(olen != PKT_LEN){
        ELOG("Failed to recv: length " << olen);
        return false;
    }

    // debug
    RLOG(ZBinary(data, PKT_LEN).dumpBytes(4, 8));

    return true;
}

bool Pok3r::findUSBVidPid(zu16 vid, zu16 pid){
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
        claimed[interface] = false;
        if(status != 0){
            //ELOG("Failed to release interface: " << libusb_error_name(status));
            return false;
        }
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
