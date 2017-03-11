#ifndef POK3R_H
#define POK3R_H

#include "updateinterface.h"
#include "hiddevice.h"

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define POK3R_PID           0x0141
#define POK3R_BOOT_PID      0x1141

class ProtoPOK3R : public HIDDevice, public UpdateInterface {
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
    ProtoPOK3R();
    ~ProtoPOK3R();

    //! Find and open POK3R device.
    bool open(zu16 vid, zu16 pid, zu16 boot_pid);

    bool isBuiltin() const;

    //! Reset and re-open device.
    bool enterFirmware();
    //! Reset to loader and re-open device.
    bool enterBootloader();

    bool getInfo();

    //! Read the firmware version from the keyboard.
    ZString getVersion();

    bool clearVersion();

    bool setVersion(ZString version);

    //! Dump the contents of flash.
    ZBinary dumpFlash();
    //! Update the firmware.
    bool writeFirmware(const ZBinary &fwbin);

    bool update(ZString version, const ZBinary &fwbin);

    //! Erase flash pages starting at \a start, ending on the page of \a end.
    bool eraseFlash(zu32 start, zu32 end);
    //! Read 64 bytes at \a addr.
    bool readFlash(zu32 addr, ZBinary &bin);
    //! Write 52 bytes at \a addr.
    bool writeFlash(zu32 addr, ZBinary bin);
    //! Check 52 bytes at \a addr.
    bool checkFlash(zu32 addr, ZBinary bin);

    //! Send CRC command.
    zu16 crcFlash(zu32 addr, zu32 len);

private:
    //! Send command
    bool sendCmd(zu8 cmd, zu8 subcmd, zu32 a1, zu32 a2, const zbyte *data = 0, zu8 len = 0);

public:
    static void decode_firmware(ZBinary &bin);
    static void encode_firmware(ZBinary &bin);

private:
    bool builtin;
    bool debug;
    bool nop;
    zu16 vid;
    zu16 pid;
    zu16 boot_pid;
};

#endif // POK3R_H
