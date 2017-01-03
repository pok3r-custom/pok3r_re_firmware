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

class Pok3rRGB : public UpdateInterface, public HIDDevice {
public:
    enum pok3r_rgb_cmd {
        CMD_16      = 0x10,
        CMD_16_ARG  = 2,

        RESET       = 0x11, //!< Reset command.
        RESET_BL    = 0,    //!< Reset to bootloader.
        RESET_FW    = 1,    //!< Reset to firmware.
        RESET_DIS   = 2,    //!< Disconnect USB.

        READ        = 0x12,
        READ_400    = 0,
        READ_3c00   = 1,
        READ_2      = 2,

        CMD_29      = 0x1d,

        CMD_30      = 0x1e,
        CMD_30_0    = 0,
        CMD_30_1    = 1,

        WRITE       = 0x1f,
    };

public:
    Pok3rRGB();
    ~Pok3rRGB();

    //! Find and open POK3R RGB device.
    bool open();

    //! Reset and re-open device.
    bool reboot();
    //! Reset to bootloader and re-open device.
    bool bootloader();

    //! Read the firmware version from the keyboard.
    ZString getVersion();

    //! Dump the contents of flash.
    ZBinary dumpFlash();

    void test();

private:
    //! Send command
    bool sendCmd(zu8 cmd, zu8 a1, zu16 a2, const zbyte *data, zu8 len);

public:
    static void decode_firmware(ZBinary &bin);
    static void encode_firmware(ZBinary &bin);
};

#endif // POK3R_RGB_H
