#ifndef POK3R_H
#define POK3R_H

#include "libusb.h"

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define HOLTEK_VID          0x04d9
#define VORTEX_POK3R_PID    0x0141

#define SEND_EP             4
#define RECV_EP             3
#define PKT_LEN             64
#define SEND_TIMEOUT        1000
#define RECV_TIMEOUT        100

#define VER_ADDR            0x2800
#define FW_ADDR             0x2c00
#define FW_LEN              0xcc00

#define ERASE_CMD               0   // Erase pages of flash
#define ERASE_NOP_SUBCMD        10  // Cancel erase

#define FLASH_CMD               1   // Read/write flash
#define FLASH_CHECK_SUBCMD      0   // Compare bytes in flash with sent bytes
#define FLASH_WRITE_SUBCMD      1   // Write 52 bytes to flash
#define FLASH_READ_SUBCMD       2   // Read 64 bytes from flash
#define FLASH_3_SUBCMD          3   // ?

#define CRC_CMD                 2   // CRC part of flash

#define UPDATE_START_CMD        3   // Start update

#define RESET_CMD               4   // Reset processor
#define RESET_BUILTIN_SUBCMD    1   // Reset to builtin firmware
#define RESET_BOOT_SUBCMD       0   // Reset to opposite firmware (main -> builtin, builtin -> main)

#define DISCONNECT_CMD          5   // Only in builtin firmware, disconnect USB and force reset

#define DEBUG_CMD               6   // Collection of debug commands
#define DEBUG_0_SUBCMD          0   // ?
#define DEBUG_1_SUBCMD          1   // ?
#define DEBUG_2_SUBCMD          2   // ?
#define DEBUG_3_SUBCMD          3   // ?
#define DEBUG_4_SUBCMD          4   // ?
#define DEBUG_5_SUBCMD          5   // ?

// Pok3r Update Protocol

// Read:
// Out: 64 bytes
//    8  bits: FLASH_CMD
//    8  bits: FLASH_READ_SUBCMD
//   16  bits: CRC
//   32  bits: Start Address
//   32  bits: End Address
//   52 bytes: 0
// In: 64 bytes
//   64 bytes: Data

// Write:
// Out: 64 bytes
//    8  bits: FLASH_CMD
//    8  bits: FLASH_WRITE_SUBCMD
//   16  bits: CRC
//   32  bits: Start Address
//   32  bits: End Address
//   52 bytes: Data
// In: none

// Erase:
// Out: 64 bytes
//    8  bits: ERASE_CMD
//    8  bits: 0
//   16  bits: CRC
//   32  bits: Start Address (0x2800)
//   32  bits: End Address (0x2808) (0xA108)
//   52 bytes: 0
// In: none

// Update Start:
// Out: 64 bytes
//    8  bits: UPDATE_START_CMD
//    8  bits: 0
//   16  bits: CRC
//   60 bytes: 0
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
    bool readFlash(zu32 addr, ZBinary &bin);
    //! Write 52 bytes at address to the keyboard.
    bool writeFlash(zu32 addr, ZBinary bin);

    zu16 crcFlash(zu32 addr, zu32 len);

    bool updateStart(ZBinary &bin);

    bool reset(zu8 subcmd);

    //! Read the firmware version from the keyboard.
    ZString getVersion();

private:
    //! Send command
    bool sendCmd(zu8 cmd, zu8 subcmd, zu32 a1, zu32 a2, const zbyte *data, zu8 len);
    //! Receive data (64 bytes)
    bool recvDat(zbyte *data);

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
