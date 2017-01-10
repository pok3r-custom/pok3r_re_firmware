#ifndef POK3R_RGB_H
#define POK3R_RGB_H

#include "updateinterface.h"
#include "hiddevice.h"

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define HOLTEK_VID          0x04d9
#define POK3R_RGB_PID       0x0167
#define POK3R_RGB_BOOT_PID  0x1167

class Pok3rRGB : public HIDDevice, public UpdateInterface {
public:
    enum pok3r_rgb_cmd {
        CMD_16      = 0x10,
        CMD_16_ARG  = 2,

        RESET       = 0x11, //!< Reset command.
        RESET_BL    = 0,    //!< Reset to bootloader.
        RESET_FW    = 1,    //!< Reset to firmware.
        RESET_DIS   = 2,    //!< Disconnect USB.

        READ        = 0x12, //!< Read command.
        READ_400    = 0,
        READ_3C00   = 1,
        READ_2      = 2,
        READ_VER1   = 0x20, //!< Read version string.
        READ_VER2   = 0x22, //!< Read version data.
        READ_ADDR   = 0xff, //!< Patched command, read arbitrary address.

        CMD_29          = 0x1d,
        CMD_29_ERASE    = 0,
        CMD_29_SUM      = 1,
        CMD_29_CRC      = 2,

        CMD_30      = 0x1e,
        CMD_30_0    = 0,
        CMD_30_1    = 1,

        WRITE       = 0x1f, //!< Write command.
    };

public:
    Pok3rRGB();
    ~Pok3rRGB();

    //! Find and open POK3R RGB device.
    bool open();

    //! Reset and re-open device.
    bool enterFirmware();
    //! Reset to bootloader and re-open device.
    bool enterBootloader();

    //! Read the firmware version from the keyboard.
    ZString getVersion();

    //! Dump the contents of flash.
    ZBinary dumpFlash();
    //! Update the firmware.
    bool updateFirmware(ZString version, const ZBinary &fwbin);

    void test();

    //! Erase flash pages starting at \a start, ending on the page of \a end.
    bool eraseFlash(zu32 start, zu32 end);
    //! Read 64 bytes at \a addr.
    bool readFlash(zu32 addr, ZBinary &bin);
    //! Write 52 bytes at \a addr.
    bool writeFlash(zu32 addr, ZBinary bin);

private:
    //! Send command
    bool sendCmd(zu8 cmd, zu8 a1, zu16 a2 = 0, ZBinary data = ZBinary());

public:
    static void decode_firmware(ZBinary &bin);
    static void encode_firmware(ZBinary &bin);

private:
    bool builtin;
    bool debug;
    bool nop;
};

#endif // POK3R_RGB_H
