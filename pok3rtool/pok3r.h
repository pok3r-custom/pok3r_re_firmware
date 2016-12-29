#ifndef POK3R_H
#define POK3R_H

#include "libusb.h"

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define HOLTEK_VID          0x04d9
#define POK3R_PID           0x0141
#define POK3R_BOOT_PID      0x1141
#define POK3R_RGB_PID       0x0167

#define RECV_EP             3
#define SEND_EP             4
#define PKT_LEN             64
#define SEND_TIMEOUT        1000
#define RECV_TIMEOUT        100

#define POK3R_VER_ADDR      0x2800
#define POK3R_FW_ADDR       0x2c00
#define POK3R_RGB_FW_ADDR   0x3400

enum pok3r_rgb_cmd {
    CMD_16      = 0x10,
    RESET_CMD   = 0x11,
    CMD_18      = 0x12,
};

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
    enum pok3r_cmd {
        ERASE_CMD               = 0,    // Erase pages of flash
        ERASE_NOP               = 10,   // Cancel erase

        FLASH_CMD               = 1,    // Read/write flash
        FLASH_CHECK_SUBCMD      = 0,    // Compare bytes in flash with sent bytes
        FLASH_WRITE_SUBCMD      = 1,    // Write 52 bytes to flash
        FLASH_READ_SUBCMD       = 2,    // Read 64 bytes from flash
        FLASH_3_SUBCMD          = 3,    // ?

        CRC_CMD                 = 2,    // CRC part of flash

        UPDATE_START_CMD        = 3,    // Start update

        RESET_CMD               = 4,    // Reset processor
        RESET_BOOT_SUBCMD       = 0,    // Reset to opposite firmware (main -> builtin, builtin -> main)
        RESET_BUILTIN_SUBCMD    = 1,    // Reset to builtin firmware

        DISCONNECT_CMD          = 5,    // Only in builtin firmware, disconnect USB and force reset

        DEBUG_CMD               = 6,    // Collection of debug commands
        DEBUG_0_SUBCMD          = 0,    // ?
        DEBUG_1_SUBCMD          = 1,    // ?
        DEBUG_2_SUBCMD          = 2,    // ?
        DEBUG_3_SUBCMD          = 3,    // ?
        DEBUG_4_SUBCMD          = 4,    // ?
        DEBUG_5_SUBCMD          = 5,    // ?
    };

public:
    Pok3r();
    ~Pok3r();

    //! Find a Pok3r keyboard.
    bool findPok3r();
    //! Open USB device.
    bool open();
    //! Close USB device.
    void close();

    //! Reset to loader and re-open device.
    bool resetToLoader();

    //! Read the firmware version from the keyboard.
    ZString getVersion();

    //! Erase flash pages starting at \a start, ending on the page of \a end.
    bool eraseFlash(zu32 start, zu32 end);

    //! Read 64 bytes at \a addr.
    bool readFlash(zu32 addr, ZBinary &bin);
    //! Write 52 bytes at \a addr.
    bool writeFlash(zu32 addr, ZBinary bin);

    //! Send CRC command.
    zu16 crcFlash(zu32 addr, zu32 len);

    //! Send update start command, get response.
    bool updateStart(ZBinary &bin);

    //! Send reset command.
    bool reset(zu8 subcmd);

private:
    //! Send command
    bool sendCmd(zu8 cmd, zu8 subcmd, zu32 a1, zu32 a2, const zbyte *data, zu8 len);
    //! Receive data (64 bytes)
    bool recvDat(zbyte *data);

    //! Find a usb device with \a vid and \a pid.
    bool findUSBVidPid(zu16 vid, zu16 pid);

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
