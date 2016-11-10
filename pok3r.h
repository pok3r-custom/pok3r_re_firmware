#ifndef POK3R_H
#define POK3R_H

#include "libusb.h"

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define HOLTEK_VID          0x04d9
#define VORTEX_POK3R_PID    0x0141

#define SEND_EP             0x04
#define RECV_EP             0x03
#define TIMEOUT             1000

#define VER_ADDR            0x2800
#define FW_ADDR             0x2c00
#define FW_LEN              0xcc00

class Pok3r {
public:
    Pok3r();
    ~Pok3r();

    //! Find a Pok3r keyboard.
    bool findPok3r();
    //! Open USB device.
    bool open();
    //! Close USB device.
    void close();

    //! Read 64 bytes at address from the keyboard, and write into bin.
    zu32 read(zu32 addr, ZBinary &bin);
    //! Write 64 bytes at address from the keyboard.
    zu32 write(zu32 addr, ZBinary bin);

    //! Read the firmware version from the keyboard.
    ZString getVersion();

private:
    bool claimInterface(int interface);
    bool releaseInterface(int interface);
    bool detachKernel(int interface);
    bool attachKernel(int interface);

private:
    libusb_context *context;
    libusb_device *device;
    libusb_device_handle *handle;
    bool claimed[3];
    bool kernel[3];
};

#endif // POK3R_H
