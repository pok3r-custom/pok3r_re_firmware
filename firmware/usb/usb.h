#ifndef USB_H
#define USB_H

#include "../types.h"

typedef struct {
    const u8 *deviceDesc;
    const u8 *configDesc;
    const u8 **interfaceDescs;
    const u8 **endpointDescs;
} USB_Device ;

#endif // USB_H
