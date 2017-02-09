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
    usb_dev.currStatus = POWERED;
    usb_dev.prevStatus = POWERED;

    // enable USB clock
    REG_CKCU->AHBCCR.USBEN = 1;
    // backup domain register access
    REG_CKCU->APBCCR1.BKPREN = 1;

//    ckcu_clocks_enable(1 << 10, 0, 1 << 6, 1);
//    REG(CKCU_APBCCR1) = (1 << 6);
//    REG(CKCU_AHBCCR) |= (1 << 10);

    // set usb prescaler
    REG_CKCU->GCFGR.USBPRE = 2;

    // ep 0
    usb_dev.ep0cfgr = REG_USB->USBEP0CFGR;
    usb_dev.ep0cfgr.EPBUFA = 0x8;
    usb_dev.ep0cfgr.EPLEN = 64;
    REG_USB->USBEP0CFGR = usb_dev.ep0cfgr;
//    REG_USB->USBEP0CFGR.EPBUFA = 0x8;
//    REG_USB->USBEP0CFGR.EPLEN = 64;
    REG_USB->USBEP0ISR.word = 0xFFFFFFFF;
    usb_dev.ep0ier = REG_USB->USBEP0IER;
    usb_dev.ep0ier.ODRXIE = 1;
    usb_dev.ep0ier.IDTXIE = 1;
    usb_dev.ep0ier.SDRXIE = 1;
    REG_USB->USBEP0IER = usb_dev.ep0ier;
//    REG_USB->USBEP0IER.word = EPnIER_ODRXIE | EPnIER_IDTXIE | EPnIER_SDRXIE;

    // ep 1
    usb_dev.ep1cfgr = REG_USB->USBEP1CFGR;
    usb_dev.ep1cfgr.EPEN = 1;
    usb_dev.ep1cfgr.EPBUFA = 0x88;
    usb_dev.ep1cfgr.EPLEN = 64;
    REG_USB->USBEP1CFGR = usb_dev.ep1cfgr;
//    REG_USB->USBEP1CFGR.EPEN = 1;
//    REG_USB->USBEP1CFGR.EPBUFA = 0x88;
//    REG_USB->USBEP1CFGR.EPLEN = 64;
    REG_USB->USBEP1ISR.word = 0xFFFFFFFF;
    usb_dev.ep1ier = REG_USB->USBEP1IER;
    usb_dev.ep1ier.ODRXIE = 1;
    REG_USB->USBEP1IER = usb_dev.ep1ier;
//    REG_USB->USBEP1IER.word = EPnIER_ODRXIE;

    // ep 2
    usb_dev.ep2cfgr = REG_USB->USBEP2CFGR;
    usb_dev.ep2cfgr.EPEN = 1;
    usb_dev.ep2cfgr.EPBUFA = 0xc8;
    usb_dev.ep2cfgr.EPLEN = 64;
    REG_USB->USBEP2CFGR = usb_dev.ep2cfgr;
//    REG_USB->USBEP2CFGR.EPEN = 1;
//    REG_USB->USBEP2CFGR.EPBUFA = 0xc8;
//    REG_USB->USBEP2CFGR.EPLEN = 64;
    REG_USB->USBEP2ISR.word = 0xFFFFFFFF;
    usb_dev.ep2ier = REG_USB->USBEP2IER;
    usb_dev.ep2ier.ODRXIE = 1;
    REG_USB->USBEP2IER = usb_dev.ep2ier;
//    REG_USB->USBEP2IER.word = EPnIER_ODRXIE;

    // enable usb interrupts
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
    return REG_USB->USBIER.word & REG_USB->USBISR.word;
}
void usb_clear_int_flags(u32 flags){
    // flags are cleared by writing 1
    // except ESOFIF, which is written normally
    REG_USB->USBISR.word = (REG_USB->USBISR.word & USBISR_ESOFIF) | flags;
}

u32 usb_get_ep_int_flags(int ep){
    return REG(USB_USBEPnIER(ep)) & REG(USB_USBEPnISR(ep));
}
void usb_clear_ep_int_flags(int ep, u32 flags){
    // flags are cleared by writing 1
    REG(USB_USBEPnISR(ep)) = flags;
}

void usb_power_off(){
    // Enter low power mode, power down
    REG_USB->USBCSR.LPMODE = 1;
    REG_USB->USBCSR.PDWN = 1;
}

void usb_power_on(){
    // Clear CSR, except for DP pull up
    REG_USB->USBCSR.word &= USBCSR_DPPUEN;
}

void usb_reset(){
    // Reset USB
    REG_RSTCU->AHBPRSTR.USBRST = 1;
    usb_power_on();

}

void usb_suspend(){
    // Will not suspend before configuration starts
    if(usb_dev.currStatus != POWERED){
        usb_power_off();
        usb_dev.prevStatus = usb_dev.currStatus;
        usb_dev.currStatus = SUSPENDED;
    }
}

void usb_resume(){
    usb_power_on();
    usb_dev.currStatus = usb_dev.prevStatus;
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
