#include "usb.h"
#include "../board/ht32f1655_cpu.h"

void usb_init(USB_Device *dev){
    // backup domain register access
    REG(CKCU_APBCCR1) = (1 << 6);
    // enable USB clock
    REG(CKCU_AHBCCR) |= (1 << 10);
    // set SUB prescaler
    REG(CKCU_GCFGR) = (REG(CKCU_GCFGR) & ~(0x3 << 22)) | (2 << 22);

    // enable usb interrupts
    REG(USB_USBIER) = 0x071d;

    // ep 0
    REG(USB_USBEPnCFGR(EP_0)) = (REG(USB_USBEPnCFGR(0)) & ~0x3ff) | 0x8;                  // EPBUFA
    REG(USB_USBEPnCFGR(EP_0)) = (REG(USB_USBEPnCFGR(0)) & ~(0x7f << 10)) | (64 << 10);    // EPLEN
    REG(USB_USBEPnIER(EP_0)) = 0x0212;

    // ep 1
    REG(USB_USBEPnCFGR(EP_1)) = 1 << 31;                                                  // EPEN
    REG(USB_USBEPnCFGR(EP_1)) = (REG(USB_USBEPnCFGR(EP_1)) & ~0x3ff) | 0x8;               // EPBUFA
    REG(USB_USBEPnCFGR(EP_1)) = (REG(USB_USBEPnCFGR(EP_1)) & ~(0x7f << 10)) | (64 << 10); // EPLEN
    REG(USB_USBEPnIER(EP_1)) = 0x02;

    // ep 2
    REG(USB_USBEPnCFGR(EP_2)) = 1 << 31;                                                  // EPEN
    REG(USB_USBEPnCFGR(EP_2)) = (REG(USB_USBEPnCFGR(EP_2)) & ~0x3ff) | 0x8;               // EPBUFA
    REG(USB_USBEPnCFGR(EP_2)) = (REG(USB_USBEPnCFGR(EP_2)) & ~(0x7f << 10)) | (64 << 10); // EPLEN
    REG(USB_USBEPnIER(EP_2)) = 0x02;
}
