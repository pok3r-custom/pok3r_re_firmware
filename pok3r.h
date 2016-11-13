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

#define A_CMD               0
#define A_SUBCMD            8

#define DATA_CMD            1
#define DATA_CHECK_SUBCMD   0
#define DATA_WRITE_SUBCMD   1
#define DATA_READ_SUBCMD    2

#define BUMP_CMD            3
#define BUMP_SUBCMD         0

#define FLASH_CMD           4
#define FLASH_ENTER_SUBCMD  0
#define FLASH_LEAVE_SUBCMD  1

// Pok3r Update Protocol

// Read:
// Out: 64 bytes
//    8  bits: DATA_CMD
//    8  bits: DATA_READ_SUBCMD
//   16  bits: CRC
//   32  bits: Start Address
//   32  bits: End Address
//   52 bytes: Zero
// In: 64 bytes
//   64 bytes: Data

// Write:
// Out: 64 bytes
//    8  bits: DATA_CMD
//    8  bits: DATA_WRITE_SUBCMD
//   16  bits: CRC
//   32  bits: Start Address
//   32  bits: End Address
//   52 bytes: Data
// In: none

// 0008:
// Out: 64 bytes
//    8  bits: A_CMD
//    8  bits: A_SUBCMD
//   16  bits: CRC
//   32  bits: Address (0x2800)
//   32  bits: Address (0x2808) (0xA108)?
//   52 bytes: Zero
// In: none

// Bump:
// Out: 64 bytes
//    8  bits: BUMP_CMD
//    8  bits: BUMP_SUBCMD
//   16  bits: CRC
//   60 bytes: Zero
// In: 64 bytes
//   0x55
//   0x16
//   0x00
//   0x11
//   0x00
//   0x2c
//   0x00
//   0x04
//   0x76
//   0x00
//   0x76
//   0x00
//   0x00
//   0x28
//   0x00
//   0x00
//   0x03
//   Zero Padding

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
