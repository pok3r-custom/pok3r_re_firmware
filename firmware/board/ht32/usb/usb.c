#include "usb.h"
#include "descriptors.h"
#include "../ht32.h"

USB_Device usb_dev;

// Functions
u32 usb_get_int_flags();
void usb_clear_int_flags(u32 flags);
u32 usb_get_ep_int_flags(int ep);
void usb_clear_ep_int_flags(int ep, u32 flags);

void usb_reset();
void usb_suspend();
void usb_resume();

// SETUP methods
void usb_setup();
void standard_get_status(USB_Request *request);
void standard_set_feature(USB_Request *request, u8 set_clear);
void standard_set_address(USB_Request *request);
void standard_get_descriptor(USB_Request *request);
void standard_get_configuration(USB_Request *request);
void standard_set_configuration(USB_Request *request);
void standard_get_interface(USB_Request *request);
void standard_set_interface(USB_Request *request);
void standard_synch_frame(USB_Request *request);

void control_out();
void control_in();

void usb_init(){
    usb_dev.deviceFeature = FEAT_REMOTE_WAKEUP;

    // enable USB clock
    REG_CKCU->AHBCCR.USBEN = 1;
    // backup domain register access
    REG_CKCU->APBCCR1.BKPREN = 1;

//    ckcu_clocks_enable(1 << 10, 0, 1 << 6, 1);
//    REG(CKCU_APBCCR1) = (1 << 6);
//    REG(CKCU_AHBCCR) |= (1 << 10);

    // set usb prescaler
    REG_CKCU->GCFGR.USBPRE = 2;
//    REG(CKCU_GCFGR) = (REG(CKCU_GCFGR) & ~(0x3 << 22)) | (2 << 22);

    // ep 0
    // EPBUFA
    REG_USB->USBEP0CFGR.EPBUFA = 8;
//    REG(USB_USBEPnCFGR(EP_0)) = (REG(USB_USBEPnCFGR(EP_0)) & ~0x3ff) | 0x8;
    // EPLEN
    REG_USB->USBEP0CFGR.EPLEN = 64;
//    REG(USB_USBEPnCFGR(EP_0)) = (REG(USB_USBEPnCFGR(EP_0)) & ~(0x7f << 10)) | (64 << 10);
//    REG(USB_USBEPnIER(EP_0)) = 0x0212;
    REG_USB->USBEP0IER.word = EPnIER_ODRXIE | EPnIER_IDTXIE | EPnIER_SDRXIE;
//    REG(USB_USBEPnIER(EP_0)) =

    // ep 1
    // EPEN
    REG(USB_USBEPnCFGR(EP_1)) = 1 << 31;
    // EPBUFA
    REG(USB_USBEPnCFGR(EP_1)) = (REG(USB_USBEPnCFGR(EP_1)) & ~0x3ff) | 0x8;
    // EPLEN
    REG(USB_USBEPnCFGR(EP_1)) = (REG(USB_USBEPnCFGR(EP_1)) & ~(0x7f << 10)) | (64 << 10);
//    REG(USB_USBEPnIER(EP_1)) = 0x02;
    REG(USB_USBEPnIER(EP_1)) = EPnIER_ODRXIE;

    // ep 2
    // EPEN
    REG(USB_USBEPnCFGR(EP_2)) = 1 << 31;
    // EPBUFA
    REG(USB_USBEPnCFGR(EP_2)) = (REG(USB_USBEPnCFGR(EP_2)) & ~0x3ff) | 0x8;
    // EPLEN
    REG(USB_USBEPnCFGR(EP_2)) = (REG(USB_USBEPnCFGR(EP_2)) & ~(0x7f << 10)) | (64 << 10);
//    REG(USB_USBEPnIER(EP_2)) = 0x02;
    REG(USB_USBEPnIER(EP_2)) = EPnIER_ODRXIE;

    // enable usb interrupts
//    REG(USB_USBIER) = 0x071d;
    REG_USB->USBIER.word = USBIER_UGIE |
                           USBIER_EP0IE | USBIER_EP1IE | USBIER_EP2IE |
                           USBIER_URSTIE | USBIER_RSMIE | USBIER_SUSPIE;

    // enable usb interrupt
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
            control_out();
        }

        // IN Data Sent
        if(episr & EPnISR_IDTXIF){
            control_in();
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
        setup[i] = ((u8 *)USB_SRAM_BASE)[i];

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
                            standard_set_feature(&request, 0);
                            break;
                        case SET_FEATURE:
                            standard_set_feature(&request, 1);
                            break;
                        case SET_ADDRESS:
                            standard_set_address(&request);
                            break;
                        case GET_DESCRIPTOR:
                            standard_get_descriptor(&request);
                            break;
                        case SET_DESCRIPTOR:
                            // do i have to support this?
                            break;
                        case GET_CONFIGURATION:
                            standard_get_configuration(&request);
                            break;
                        case SET_CONFIGURATION:
                            standard_set_configuration(&request);
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
                            standard_set_feature(&request, 0);
                            break;
                        case SET_FEATURE:
                            standard_set_feature(&request, 1);
                            break;
                        case GET_INTERFACE:
                            standard_get_interface(&request);
                            break;
                        case SET_INTERFACE:
                            standard_set_interface(&request);
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
                            standard_set_feature(&request, 0);
                            break;
                        case SET_FEATURE:
                            standard_set_feature(&request, 1);
                            break;
                        case SYNCH_FRAME:
                            standard_synch_frame(&request);
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
            REG_USB->USBEP0CSR.STLTX = 1;
//            REG(USB_USBEPnCSR(EP_0)) = EPnCSR_STLTX;
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
            u8 ep = request->wIndex & 0xF;
            u32 dir = REG(USB_USBEPnCFGR(ep)) & EPnCFGR_EPDIR;
            u32 halt = REG(USB_USBEPnCSR(ep)) & (dir ? EPnCSR_STLTX : EPnCSR_STLRX);
            request->controlBuffer[0] = halt ? 1 : 0;
            request->controlBuffer[1] = 0;
            break;
        }

        default:
            return;
    }

    request->controlData = request->controlBuffer;
    request->controlLength = 2;
    request->action = DATA_IN;
}

void standard_set_feature(USB_Request *request, u8 set_clear){
    switch(request->recipient){
        case DEVICE:
            if(request->wValue == DEVICE_REMOTE_WAKEUP){
                if(set_clear)
                    usb_dev.deviceFeature |= FEAT_REMOTE_WAKEUP;
                request->action = DATA_IN;
            }
            break;

        case ENDPOINT: {
            u8 ep = request->wIndex & 0xF;
            if(ep){
                if(set_clear){
                    // Set Halt
                    REG(USB_USBEPnISR(ep)) = EPnISR_STLIF;
                    u32 epcsr = ~REG(USB_USBEPnCSR(ep));
                    epcsr &= (EPnCSR_STLTX | EPnCSR_STLRX);
                    REG(USB_USBEPnCSR(ep)) = epcsr;

                } else {
                    // Clear Halt
                    REG(USB_USBEPnCSR(ep)) &= (EPnCSR_STLTX | EPnCSR_STLRX);
                    // Clear Data Toggle
                    REG(USB_USBEPnCSR(ep)) &= (EPnCSR_DTGTX | EPnCSR_DTGRX);
                }
            }
            break;
        }

        default:
            return;
    }
}

void standard_set_address(USB_Request *request){
    REG_USB->USBCSR.ADRSET = 1;
    REG_USB->USBDEVAR.DEVA = request->wValue & 0x7F;
//    REG(USB_USBCSR) |= USBCSR_ADRSET;
//    REG(USB_USBDEVA) = request->wValue & 0x7F;
}

void standard_get_descriptor(USB_Request *request){
    switch(request->wValue >> 8){
        case DESC_TYPE_DEVICE:
            request->controlData = usb_dev.descriptors.deviceDesc;
            request->controlLength = request->controlData[0];
            request->action = DATA_IN;
            break;

        case DESC_TYPE_CONFIG:
            request->controlData = usb_dev.descriptors.configDesc;
            request->controlLength = request->controlData[0];
            request->action = DATA_IN;
            break;

        case DESC_TYPE_STRING: {
            u8 index = request->wValue & 0xFF;
            if(index < usb_dev.descriptors.numStringDescs){
                request->controlData = usb_dev.descriptors.stringDescs[index];
                request->controlLength = request->controlData[0];
                request->action = DATA_IN;
            }
            break;
        }

        default:
            return;
    }
}

void standard_get_configuration(USB_Request *request){

}

void standard_set_configuration(USB_Request *request){

}

void standard_get_interface(USB_Request *request){

}

void standard_set_interface(USB_Request *request){

}

void standard_synch_frame(USB_Request *request){

}

void control_out(){

}

void control_in(){

}
