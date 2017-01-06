#ifndef USB_H
#define USB_H

#include "../types.h"

typedef struct {
    // Device descriptors
    const u8 *deviceDesc;

    // Configuration descriptors
    const u8 *configDesc;

    // Interface descriptors
    const u8 **interfaceDescs;
    u8 numInterfaceDescs;

    // Endpoint descriptors
    const u8 **endpointDescs;
    u8 numEndpointDescs;

    // String descriptors
    const u8 **stringDescs;
    u8 numStringDescs;
} USB_Device;

void usb_init(USB_Device *dev);

#endif // USB_H
