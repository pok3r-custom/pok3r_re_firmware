#include "usb.h"
#include "../board/cpu/ht32.h"

USB_Device usb_dev;

void usb_init(){
    // backup domain register access
    // enable USB clock
    ckcu_clocks_enable(1 << 10, 0, 1 << 6, 1);
//    REG(CKCU_APBCCR1) = (1 << 6);
//    REG(CKCU_AHBCCR) |= (1 << 10);

    // set SUB prescaler
    REG(CKCU_GCFGR) = (REG(CKCU_GCFGR) & ~(0x3 << 22)) | (2 << 22);

    // enable usb interrupts
//    REG(USB_USBIER) = 0x071d;
    REG(USB_USBIER) = USBIER_UGIE |
                      USBIER_EP0IE | USBIER_EP1IE | USBIER_EP2IE |
                      USBIER_URSTIE | USBIER_RSMIE | USBIER_SUSPIE;

    // ep 0
    REG(USB_USBEPnCFGR(EP_0)) = (REG(USB_USBEPnCFGR(EP_0)) & ~0x3ff) | 0x8;                  // EPBUFA
    REG(USB_USBEPnCFGR(EP_0)) = (REG(USB_USBEPnCFGR(EP_0)) & ~(0x7f << 10)) | (64 << 10);    // EPLEN
//    REG(USB_USBEPnIER(EP_0)) = 0x0212;
    REG(USB_USBEPnIER(EP_0)) = EPnIER_ODRXIE | EPnIER_IDTXIE | EPnIER_SDRXIE;

    // ep 1
    REG(USB_USBEPnCFGR(EP_1)) = 1 << 31;                                                  // EPEN
    REG(USB_USBEPnCFGR(EP_1)) = (REG(USB_USBEPnCFGR(EP_1)) & ~0x3ff) | 0x8;               // EPBUFA
    REG(USB_USBEPnCFGR(EP_1)) = (REG(USB_USBEPnCFGR(EP_1)) & ~(0x7f << 10)) | (64 << 10); // EPLEN
//    REG(USB_USBEPnIER(EP_1)) = 0x02;
    REG(USB_USBEPnIER(EP_1)) = EPnIER_ODRXIE;

    // ep 2
    REG(USB_USBEPnCFGR(EP_2)) = 1 << 31;                                                  // EPEN
    REG(USB_USBEPnCFGR(EP_2)) = (REG(USB_USBEPnCFGR(EP_2)) & ~0x3ff) | 0x8;               // EPBUFA
    REG(USB_USBEPnCFGR(EP_2)) = (REG(USB_USBEPnCFGR(EP_2)) & ~(0x7f << 10)) | (64 << 10); // EPLEN
//    REG(USB_USBEPnIER(EP_2)) = 0x02;
    REG(USB_USBEPnIER(EP_2)) = EPnIER_ODRXIE;
}

void usb_isr(){
    u32 usbisr = usb_get_int_flags();

    // Start of Frame Interrupt
    if(usbisr & USBISR_SOFIF){
        usb_clear_int_flags(USBISR_SOFIF);
    }

    // Suspend Interrupt
    if(usbisr & USBISR_SUSPIF){
        usb_clear_int_flags(USBISR_SUSPIF);
        usb_suspend();
    }

    // Reset Interrupt
    if(usbisr & USBISR_URSTIF){
        usb_reset();
        usb_clear_int_flags(USBISR_URSTIF);
    }

    // Resume Interrupt
    if(usbisr & USBISR_RSMIF){
        usb_resume();
        usb_clear_int_flags(USBISR_RSMIF);
    }

    // EP0 Interrupt
    if(usbisr & USBISR_EP0IF){
        u32 episr = usb_get_ep_int_flags(EP_0);

        // SETUP Data Received
        if(episr & EPnISR_SDRXIF){
            usb_setup();
            usb_clear_ep_int_flags(EP_0, EPnISR_SDRXIF);
        }

        // OUT Data Received
        if(episr & EPnISR_ODRXIF){
            // Clear ISR bit first
            usb_clear_ep_int_flags(EP_0, EPnISR_ODRXIF);
        }

        // IN Data Sent
        if(episr & EPnISR_IDTXIF){

            usb_clear_ep_int_flags(EP_0, EPnISR_IDTXIF);
        }

        usb_clear_int_flags(USBISR_EP0IF);
    }

    // EP1 Interrupt
    if(usbisr & USBISR_EP1IF){

    }

    // EP2 Interrupt
    if(usbisr & USBISR_EP2IF){

    }
}

u32 usb_get_int_flags(){
    return REG(USB_USBIER) & REG(USB_USBISR);
}
void usb_clear_int_flags(u32 flags){
    REG(USB_USBISR) &= ~(flags);
}

u32 usb_get_ep_int_flags(int ep){
    return REG(USB_USBEPnIER(ep)) & REG(USB_USBEPnISR(ep));
}
void usb_clear_ep_int_flags(int ep, u32 flags){
    REG(USB_USBEPnISR(ep)) &= ~(flags);
}

void usb_reset(){
    // TODO
}

void usb_suspend(){
    // TODO
}

void usb_resume(){
    // TODO
}

void usb_setup(){
    USB_Request request;
    u8 setup[8];

    // Read SETUP Data
    for(int i = 0; i < 8; ++i)
        setup[i] = ((u8*)USB_SRAM_BASE)[i];

    request.bmRequestType = setup[0];
    request.bRequest = setup[1];
    request.wValue = setup[2] | ((u16)setup[3]) << 8;
    request.wIndex = setup[4] | ((u16)setup[5]) << 8;
    request.wLength = setup[6] | ((u16)setup[7]) << 8;

    request.direction = (Request_Direction)((request.bmRequestType & REQUEST_DIR_MASK) >> 7);
    request.type = (Request_Type)((request.bmRequestType & REQUEST_TYPE_MASK) >> 5);
    request.recipient = (Request_Recipient)(request.bmRequestType & REQUEST_RECIPIENT_MASK);

    // Request Type
    switch(request.type){
        case STANDARD:
            // Standard Request
            switch(request.recipient){
                case DEVICE:
                    // Device Request
                    switch(request.bRequest){
                        case GET_STATUS:
                            standard_get_status(&request);
                            break;
                        case CLEAR_FEATURE:
                            break;
                        case SET_FEATURE:
                            break;
                        case SET_ADDRESS:
                            break;
                        case GET_DESCRIPTOR:
                            break;
                        case SET_DESCRIPTOR:
                            break;
                        case GET_CONFIGURATION:
                            break;
                        case SET_CONFIGURATION:
                            break;
                        default:
                            break;
                    }
                    break;

                case INTERFACE:
                    // Interface Request
                    switch(request.bRequest){
                        case GET_STATUS:
                            standard_get_status(&request);
                            break;
                        case CLEAR_FEATURE:
                            break;
                        case SET_FEATURE:
                            break;
                        case GET_INTERFACE:
                            break;
                        case SET_INTERFACE:
                            break;
                        default:
                            break;
                    }
                    break;

                case ENDPOINT:
                    // Endpoint Request
                    switch(request.bRequest){
                        case GET_STATUS:
                            standard_get_status(&request);
                            break;
                        case CLEAR_FEATURE:
                            break;
                        case SET_FEATURE:
                            break;
                        case SYNCH_FRAME:
                            break;
                        default:
                            break;
                    }
                    break;
                default:
                    // Reserved Recipient
                    break;
            }

            break;

        case CLASS:
            // Class Request
            break;

        case VENDOR:
            // Vendor Request
            break;

        default:
            // Reserved Device
            break;
    }

    // Request Action
    switch(request.action){
        case DATA_IN:
            break;

        case DATA_OUT:
            break;

        case STALL:
        default:
            // Send Control STALL
            REG(USB_USBEPnCSR(EP_0)) = EPnCSR_STLTX;
            break;
    }
}

void standard_get_status(USB_Request *request){
    switch(request->recipient){
        case DEVICE:
            request->controlBuffer[0] = usb_dev.deviceFeature;
            request->controlBuffer[1] = 0;
            break;

        case INTERFACE:
            request->controlBuffer[0] = 0;
            request->controlBuffer[1] = 0;
            break;

        case ENDPOINT: {
            u32 dir = REG(USB_USBEPnCFGR(request->wIndex)) & EPnCFGR_EPDIR;
            u32 halt = REG(USB_USBEPnCSR(request->wIndex)) & (dir ? EPnCSR_STLTX : EPnCSR_STLRX);
            request->controlBuffer[0] = halt ? 1 : 0;
            request->controlBuffer[1] = 0;
            break;
        }

        default:
            return;
    }

    request->controlLength = 2;
    request->action = DATA_IN;
}
