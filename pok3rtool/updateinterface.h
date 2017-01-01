#ifndef UPDATEINTERFACE_H
#define UPDATEINTERFACE_H

#include "zstring.h"
#include "zbinary.h"
using namespace LibChaos;

class UpdateInterface {
public:
    virtual ~UpdateInterface(){}

    virtual bool open() = 0;

    virtual bool reboot() = 0;
    virtual bool bootloader() = 0;

    virtual ZString getVersion() = 0;
};

#endif // UPDATEINTERFACE_H
