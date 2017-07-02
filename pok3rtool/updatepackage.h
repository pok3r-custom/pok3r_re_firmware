#ifndef UPDATEPACKAGE_H
#define UPDATEPACKAGE_H

#include "zbinary.h"
#include "zpath.h"
#include "zfile.h"

using namespace LibChaos;

class UpdatePackage {
public:
    UpdatePackage();

    bool loadFromExe(ZPath exe, int index);

    const ZBinary &getFirmware() const;

private:
    ZBinary firmware;
};

#endif // UPDATEPACKAGE_H
