#include "usb.h"
#include "../ht32.h"

USB_Device usb_dev;
u16 ep_next_addr;

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
void standard_request(USB_Request *request);
void standard_get_status(USB_Request *request);
void standard_clear_feature(USB_Request *request);
void standard_set_feature(USB_Request *request);
void standard_set_address(USB_Request *request);
void standard_get_descriptor(USB_Request *request);
void standard_set_descriptor(USB_Request *request);
void standard_get_configuration(USB_Request *request);
void standard_set_configuration(USB_Request *request);
void standard_get_interface(USB_Request *request);
void standard_set_interface(USB_Request *request);
void standard_synch_frame(USB_Request *request);

void control_in(const u8 *src, u16 len);
void control_out();

u16 endpoint_write(u8 ep, const u8 *src, u16 len);
u16 endpoint_read(u8 ep, u8 *dest, u16 len);

void usb_ep_init(u8 ep, u16 eplen, u32 ier){
    if(ep < EP_1 || ep > EP_7)
        return;

    u32 wcfgr;
    u16 epaddr = ep_next_addr;

    if(ep < EP_4){
        USBEPnCFGR_1_3_reg cfgr = {0};
        cfgr.EPEN = 1;
        cfgr.EPBUFA = epaddr;
        cfgr.EPLEN = eplen;
        wcfgr = cfgr.word;
    } else {
        USBEPnCFGR_4_7_reg cfgr = {0};
        cfgr.EPEN = 1;
        cfgr.EPBUFA = epaddr;
        cfgr.EPLEN = eplen;
        wcfgr = cfgr.word;
    }

    ep_next_addr += eplen;

    usb_dev.ep[ep].enable = 1;
    usb_dev.ep[ep].length = eplen;
    usb_dev.ep[ep].buffer = (volatile u8 *)(USB_SRAM_BASE + epaddr);

    // backup ep config
    usb_dev.ep[ep].cfgr = wcfgr;
    usb_dev.ep[ep].ier = ier;

    // set ep config
    REG(USB_USBEPnCFGR(ep)) = wcfgr;
    REG(USB_USBEPnIER(ep)) = ier;
    REG(USB_USBEPnISR(ep)) = 0xFFFFFFFF;
}

void usb_init(){
    // init global struct
    usb_dev.deviceFeature = OPT_REMOTE_WAKEUP;
    usb_dev.currStatus = POWERED;

    for(int i = 0; i < 8; ++i)
        usb_dev.ep[i].enable = 0;

    usb_dev.suspend_callback = NULL;
    usb_dev.configuration_callback = NULL;

    // enable USB clock
    REG_CKCU->AHBCCR.USBEN = 1;
    // set usb prescaler
    REG_CKCU->GCFGR.USBPRE = 2;

    // init endpoint 0
    REG_USB->USBEP0CFGR.EPBUFA = 0x8;
    REG_USB->USBEP0CFGR.EPLEN = 64;
    REG_USB->USBEP0IER.word = EPnIER_ODRXIE | EPnIER_IDTXIE | EPnIER_SDRXIE;
    REG_USB->USBEP0ISR.word = 0xFFFFFFFF;

    ep_next_addr = 0x8 + 64 + 64;

    // enable usb interrupts
    usb_dev.ier.word = USBIER_UGIE |
                       USBIER_EP0IE | USBIER_EP1IE | USBIER_EP2IE |
                       USBIER_URSTIE | USBIER_RSMIE | USBIER_SUSPIE;
    REG_USB->USBIER = usb_dev.ier;

    // enable usb IRQ
    nvic_enable_intr(USB_IRQ);
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
//            control_out();
        }

        // IN Data Sent
        if(episr & EPnISR_IDTXIF){
//            control_in();
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

void usb_pull_up(char en){
    REG_USB->USBCSR.DPPUEN = en;
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
    usb_dev.currStatus = POWERED;

    // Reset USB
    REG_RSTCU->AHBPRSTR.USBRST = 1;
    usb_power_on();

    // Reset EP0 config
    REG_USB->USBEP0CFGR.word = usb_dev.ep[0].cfgr;
    REG_USB->USBEP0IER.word = usb_dev.ep[0].ier;
    REG_USB->USBEP0ISR.word = 0xFFFFFFFF;
    REG_USB->USBEP0CSR.word &= EPnCSR_DTGTX | EPnCSR_DTGRX | EPnCSR_NAKRX;

    // Set IER
    REG_USB->USBIER = usb_dev.ier;
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

    // Default action is Request Error (STALL)
    request.action = STALL;
    request.controlLength = 0;

    // Request Type
    switch(request.type){
        case STANDARD:
            standard_request(&request);
            break;
        case CLASS:
            // Class Request
            break;
        case VENDOR:
            // Vendor Request
            break;
        default:
            break;
    }

    // Request Action
    switch(request.action){
        case DATA_IN:
            control_in(request.controlData, request.controlLength);
            break;
        case DATA_OUT:
            break;
        case STALL:
        default:
            // Send Control STALL
            REG_USB->USBEP0CSR.STLTX = 1;
            break;
    }
}

void standard_request(USB_Request *request){
    // Standard Request
    switch(request->bRequest){
        case GET_STATUS:
            standard_get_status(request);
            break;

        case CLEAR_FEATURE:
            standard_clear_feature(request);
            break;
        case SET_FEATURE:
            standard_set_feature(request);
            break;

        case SET_ADDRESS:
            standard_set_address(request);
            break;

        case GET_DESCRIPTOR:
            standard_get_descriptor(request);
            break;
        case SET_DESCRIPTOR:
            standard_set_descriptor(request);
            break;

        case GET_CONFIGURATION:
            standard_get_configuration(request);
            break;
        case SET_CONFIGURATION:
            standard_set_configuration(request);
            break;

        case GET_INTERFACE:
            standard_get_interface(request);
            break;
        case SET_INTERFACE:
            standard_set_interface(request);
            break;

        case SYNCH_FRAME:
            standard_synch_frame(request);
            break;
        default:
            break;
    }
}

void standard_get_status(USB_Request *request){
    if(usb_dev.currStatus == ADDRESS || usb_dev.currStatus == CONFIGURED){
        switch(request->recipient){
            case DEVICE:
                request->controlBuffer[0] = usb_dev.deviceFeature & 0x3;
                request->controlBuffer[1] = 0;
                break;
            case INTERFACE: {
//                u8 iface = request->wIndex & 0xFF;
                request->controlBuffer[0] = 0;
                request->controlBuffer[1] = 0;
                break;
            }
            case ENDPOINT: {
                u8 ep = request->wIndex & 0xF;
                u32 dir = REG(USB_USBEPnCFGR(ep)) & EPnCFGR_EPDIR;  // endpoint direction
                u32 halt = REG(USB_USBEPnCSR(ep)) & (dir ? EPnCSR_STLTX : EPnCSR_STLRX); // stall
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
}

void standard_clear_feature(USB_Request *request){
    if(usb_dev.currStatus == ADDRESS || usb_dev.currStatus == CONFIGURED){
        u16 feature = request->wValue;
        switch(request->recipient){
            case DEVICE:
                switch(feature){
                    case FEATURE_DEVICE_REMOTE_WAKEUP:
                        usb_dev.deviceFeature &= ~OPT_REMOTE_WAKEUP;
                        request->action = DATA_IN;
                        break;
                    default:
                        break;
                }
                break;
            case INTERFACE:
                break;
            case ENDPOINT: {
                u8 ep = request->wIndex & 0xF;
                switch(feature){
                    case FEATURE_ENDPOINT_HALT:
                        // Toggle off STALL status and Data toggle status
                        REG(USB_USBEPnCSR(ep)) &= (EPnCSR_STLTX | EPnCSR_STLRX |
                                                   EPnCSR_DTGTX | EPnCSR_DTGRX);
                        request->action = DATA_IN;
                        break;
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }
    }
}

void standard_set_feature(USB_Request *request){
    if(usb_dev.currStatus == ADDRESS || usb_dev.currStatus == CONFIGURED){
        u16 feature = request->wValue;
        switch(request->recipient){
            case DEVICE:
                switch(feature){
                    case FEATURE_DEVICE_REMOTE_WAKEUP:
                        usb_dev.deviceFeature |= OPT_REMOTE_WAKEUP;
                        request->action = DATA_IN;
                        break;
                    case FEATURE_TEST_MODE:
                        // not supported
                        break;
                    default:
                        break;
                }
                break;
            case INTERFACE:
                break;
            case ENDPOINT: {
                u8 ep = request->wIndex & 0xF;
                switch(feature){
                    case FEATURE_ENDPOINT_HALT:
                        // Clear STALL TX flag
                        REG(USB_USBEPnISR(ep)) = EPnISR_STLIF;
                        // Set Halt (toggle STALL bits if they were unset)
                        REG(USB_USBEPnCSR(ep)) = (~REG(USB_USBEPnCSR(ep))) & (EPnCSR_STLTX | EPnCSR_STLRX);
                        request->action = DATA_IN;
                        break;
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }
    }
}

void standard_set_address(USB_Request *request){
    if(usb_dev.currStatus == DEFAULT || usb_dev.currStatus == ADDRESS){
        u8 address = request->wValue & 0x7F;
        if(address){
            REG_USB->USBCSR.ADRSET = 1;
            REG_USB->USBDEVAR.DEVA = address;
            usb_dev.currStatus = ADDRESS;
        } else {
            REG_USB->USBCSR.ADRSET = 1;
            REG_USB->USBDEVAR.DEVA = 0;
            usb_dev.currStatus = DEFAULT;
        }
        request->action = DATA_IN;
    }
}

void standard_get_descriptor(USB_Request *request){
    u8 type = request->wValue >> 8;
    u8 index = request->wValue & 0xFF;
//    u16 lang = request->wIndex;
    u16 length = request->wLength;

    switch(type){
        case DESC_TYPE_DEVICE:
            request->controlData = usb_dev.descriptors.device->desc;
            request->controlLength = MIN(usb_dev.descriptors.device->size, length);
            request->action = DATA_IN;
            break;
        case DESC_TYPE_CONFIGURATION:
            if(index < usb_dev.descriptors.numConfig){
                request->controlData = usb_dev.descriptors.config[index].desc;
                request->controlLength = MIN(usb_dev.descriptors.config[index].size, length);
                request->action = DATA_IN;
            }
            break;
        case DESC_TYPE_STRING: {
            if(index < usb_dev.descriptors.numString){
                request->controlData = usb_dev.descriptors.string[index].desc;
                request->controlLength = MIN(usb_dev.descriptors.string[index].size, length);
                request->action = DATA_IN;
            }
            break;
        }
        default:
            return;
    }
}

void standard_set_descriptor(USB_Request *request){
    // not supported
}

void standard_get_configuration(USB_Request *request){
    if(usb_dev.currStatus == ADDRESS){
        // Return 0
        request->controlBuffer[0] = 0;
        request->controlData = request->controlBuffer;
        request->controlLength = 1;
        request->action = DATA_IN;
    } else if(usb_dev.currStatus == CONFIGURED){
        switch (request->recipient) {
            case DEVICE:
                // Return bConfigurationValue
                request->controlBuffer[0] = usb_dev.bConfigurationValue;
                request->controlData = request->controlBuffer;
                request->controlLength = 1;
                request->action = DATA_IN;
                break;
            default:
                break;
        }
    }
}

void standard_set_configuration(USB_Request *request){
    if(usb_dev.currStatus == ADDRESS || usb_dev.currStatus == CONFIGURED){
        u8 config = request->wValue & 0xFF;
        if(config){
            usb_dev.bConfigurationValue = config;

            // User callback
            if(usb_dev.configuration_callback)
                usb_dev.configuration_callback(config);

            usb_dev.currStatus = CONFIGURED;
        } else {
            usb_dev.currStatus = ADDRESS;
        }
        request->action = DATA_IN;
    }
}

void standard_get_interface(USB_Request *request){
    if(usb_dev.currStatus == CONFIGURED){
//        u16 iface = request->wIndex & 0xFF;
        // TODO: get interface
        request->controlBuffer[0] = 0;
        request->controlData = request->controlBuffer;
        request->controlLength = 1;
        request->action = DATA_IN;
    }
}

void standard_set_interface(USB_Request *request){
    if(usb_dev.currStatus == CONFIGURED){
//        u8 iface = request->wIndex & 0xFF;
//        u16 alt = request->wValue;
        // TODO: set interface
//        request->action = DATA_IN;
    }
}

void standard_synch_frame(USB_Request *request){
    if(usb_dev.currStatus == CONFIGURED){
//        u8 ep = request->wIndex & 0xF;
        // not supported
//        u16 frnum = 0;
//        request->controlBuffer[0] = frnum & 0xFF;
//        request->controlBuffer[1] = frnum >> 8;
//        request->controlData = request->controlBuffer;
//        request->controlLength = 2;
//        request->action = DATA_IN;
    }
}

void control_in(const u8 *src, u16 len){
    endpoint_write(EP_0, src, len);
}

void control_out(){

}

/*! Write endpoint buffer, set TXCNT and toggle NAKTX.
 * Will not write if write would overwrite existing data.
 * \param ep    Endpoint.
 * \param src   Src pointer.
 * \param len   Bytes to write.
 * \return Number of bytes written.
 */
u16 endpoint_write(u8 ep, const u8 *src, u16 len){
    // get tx count
    int eptx = REG(USB_USBEPnTCR(ep)) & 0x1FF;

    if(eptx == 0 && len <= usb_dev.ep[ep].length){
        // Copy to endpoint IN buffer
        for(u8 i = 0; i < len; ++i){
            usb_dev.ep[ep].buffer[i] = src[i];
        }

        // Set TX transfer count
        REG(USB_USBEPnTCR(ep)) = len;
        // Toggle NAKTX on
        REG(USB_USBEPnCSR(ep)) = EPnCSR_NAKTX;

        return len;
    }
    return 0;
}

/*! Read endpoint buffer and toggle NAKRX if data was read, or len was 0.
 * \param ep    Endpoint.
 * \param dest  Dest pointer.
 * \param len   Bytes to read.
 * \return Number of bytes read.
 */
u16 endpoint_read(u8 ep, u8 *dest, u16 len){
    // get rx count
    u16 eprx = (ep == EP_0) ? (REG(USB_USBEPnTCR(ep)) >> 16) : (REG(USB_USBEPnTCR(ep)) & 0x1FF);
    u16 rlen = MIN(len, eprx);

    // Copy from endpoint OUT buffer
    for(u16 i = 0; i < rlen; ++i){
        if(ep == EP_0){
            dest[i] = (usb_dev.ep[ep].buffer + usb_dev.ep[ep].length)[i];
        } else {
            dest[i] = usb_dev.ep[ep].buffer[i];
        }
    }

    if(eprx || len == 0){
        // Toggle NAKRX off
        REG(USB_USBEPnCSR(ep)) &= EPnCSR_NAKRX;
    }

    return rlen;
}

void usb_set_device_desc(const USB_Descriptor *desc){
    usb_dev.descriptors.device = desc;
}

void usb_set_config_descs(const USB_Descriptor *descs, u8 num){
    usb_dev.descriptors.config = descs;
    usb_dev.descriptors.numConfig = num;
}

void usb_set_string_descs(const USB_Descriptor *descs, u8 num){
    usb_dev.descriptors.string = descs;
    usb_dev.descriptors.numString = num;
}

void usb_callback_suspend(usb_suspend_func call){
    usb_dev.suspend_callback = call;
}

void usb_callback_configuration(usb_configuration_func call){
    usb_dev.configuration_callback = call;
}
