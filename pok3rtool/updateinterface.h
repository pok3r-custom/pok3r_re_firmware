#ifndef UPDATEINTERFACE_H
#define UPDATEINTERFACE_H

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

class UpdateInterface {
public:
    virtual ~UpdateInterface(){}

    //! Find and open device.
    virtual bool open() = 0;

    //! Reset to firmware and re-open device if needed.
    virtual bool enterFirmware() = 0;
    //! Reset to bootloader and re-open device if needed.
    virtual bool enterBootloader() = 0;

    virtual bool getInfo(){ return false; }

    //! Read the firmware version from the device.
    virtual ZString getVersion() = 0;

    virtual bool clearVersion(){ return false; }
    virtual bool setVersion(ZString version){ return false; }

    //! Dump the contents of flash.
    virtual ZBinary dumpFlash() = 0;
    //! Update the firmware.
    virtual bool updateFirmware(ZString version, const ZBinary &fwbin) = 0;
};

#endif // UPDATEINTERFACE_H
