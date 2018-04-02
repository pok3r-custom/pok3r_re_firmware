#ifndef UPDATEINTERFACE_H
#define UPDATEINTERFACE_H

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

#define HOLTEK_VID          0x04d9
#define UPDATE_USAGE_PAGE   0xff00
#define UPDATE_USAGE        0x01

#define QMK_VID             0xFEED
#define QMK_USAGE_PAGE      0xff60
#define QMK_USAGE           0x61

class UpdateInterface {
public:
    virtual ~UpdateInterface(){}

    //! Open device.
    virtual bool open() = 0;
    virtual void close() = 0;
    virtual bool isOpen() const = 0;

    virtual bool isBuiltin() const { return false; }

    //! Reset to firmware and re-open device if needed.
    virtual bool enterFirmware() = 0;
    //! Reset to bootloader and re-open device if needed.
    virtual bool enterBootloader() = 0;

    //! Read the firmware version from the device.
    virtual ZString getVersion() = 0;

    virtual bool clearVersion(){ return false; }
    virtual bool setVersion(ZString version){ return false; }

    virtual bool getInfo(){ return false; }

    //! Dump the contents of flash.
    virtual ZBinary dumpFlash(){ return ZBinary(); }
    //! Write the firmware.
    virtual bool writeFirmware(const ZBinary &fwbin) = 0;

    //! Complete update wrapper.
    virtual bool update(ZString version, const ZBinary &fwbin) = 0;

    virtual bool eraseAndCheck(){ return false; }
};

#endif // UPDATEINTERFACE_H
