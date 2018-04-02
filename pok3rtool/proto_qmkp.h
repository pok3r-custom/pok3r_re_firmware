#ifndef PROTO_QMKP_H
#define PROTO_QMKP_H

#include "updateinterface.h"
#include "rawhid/hiddevice.h"

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define POK3R_PID           0x0141
#define POK3R_BOOT_PID      0x1141

class ProtoQMKP : public UpdateInterface {
public:
    enum qmkp_cmd {
        ECHO = 0,    //!
    };

public:
    //! Construct unopened device.
    ProtoQMKP(zu16 vid, zu16 pid, zu16 boot_pid);
    //! Construct open device from open HIDDevice.
    ProtoQMKP(zu16 vid, zu16 pid, zu16 boot_pid, bool builtin, HIDDevice *dev);

    ProtoQMKP(const ProtoQMKP &) = delete;
    ~ProtoQMKP();

    //! Find and open POK3R device.
    bool open();
    void close();
    bool isOpen() const;

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

private:
    bool builtin;
    bool debug;
    bool nop;
    zu16 vid;
    zu16 pid;
    zu16 boot_pid;

    HIDDevice *dev;
};

#endif // PROTO_QMKP_H
