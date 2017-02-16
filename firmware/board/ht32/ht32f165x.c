#include "ht32.h"

#define DEFAULT_ISR(N) void __attribute__((weak)) N(){ _generic_intr(); }

// Default ISRs

DEFAULT_ISR(gptm0_isr)
DEFAULT_ISR(gptm1_isr)

DEFAULT_ISR(bftm0_isr)
DEFAULT_ISR(bftm1_isr)

DEFAULT_ISR(spi0_isr)
DEFAULT_ISR(spi1_isr)

DEFAULT_ISR(usb_isr)

// Functions

void ckcu_clock_enable(u32 clock, int en){
    u32 reg;
    switch(clock >> 28){
        case 1:
            reg = CKCU_AHBCCR;
            break;
        case 2:
            reg = CKCU_APBCCR0;
            break;
        case 3:
            reg = CKCU_APBCCR1;
            break;
        default:
            return;
    }

    u32 mask = clock & 0x0FFFFFFFU;
    u32 bits = REG(reg);
    if(en)
        bits |= mask;
    else
        bits &= ~mask;
    REG(reg) = bits;
}

void ckcu_clocks_enable(int ahb_mask, int apb0_mask, int apb1_mask, int en){
    u32 ahb = REG(CKCU_AHBCCR);
    u32 apb0 = REG(CKCU_APBCCR0);
    u32 apb1 = REG(CKCU_APBCCR1);

    ahb &= ~ahb_mask;
    apb0 &= ~apb0_mask;
    apb1 &= ~apb1_mask;

    if(en){
        ahb |= ahb_mask;
        apb0 |= apb0_mask;
        apb1 |= apb1_mask;
    }

    REG(CKCU_AHBCCR) = ahb;
    REG(CKCU_APBCCR0) = apb0;
    REG(CKCU_APBCCR1) = apb1;
}

void wdt_reload(){
    // Reload unlock and set
    REG(WDT_WDTCR) = 0x5fa00001;
}

void gpio_pin_direction(int port, int pin, PinDir dir){
    if(dir == PIN_OUTPUT)
        REG(GPIOn_PnDIRCR(port)) |= (1 << pin);
    else
        REG(GPIOn_PnDIRCR(port)) &= ~(1 << pin);
}

void gpio_pin_input_enable(int port, int pin, int en){
    if(en)
        REG(GPIOn_PnINER(port)) |= (1 << pin);
    else
        REG(GPIOn_PnINER(port)) &= ~(1 << pin);
}

void gpio_pin_drive(int port, int pin, DriveMode mode){
    if(mode == DRIVE_8mA)
        REG(GPIOn_PnDRVR(port)) |= (1 << pin);
    else
        REG(GPIOn_PnDRVR(port)) &= ~(1 << pin);
}

void gpio_pin_open_drain(int port, int pin, int en){
    if(en)
        REG(GPIOn_PnODR(port)) |= (1 << pin);
    else
        REG(GPIOn_PnODR(port)) &= ~(1 << pin);
}

void gpio_pin_pull(int port, int pin, PullMode mode){
    switch(mode){
        case PULL_UP:
            REG(GPIOn_PnPUR(port)) |= (1 << pin);
            break;
        case PULL_DOWN:
            REG(GPIOn_PnPDR(port)) |= (1 << pin);
            break;
        case PULL_DISABLE:
        default:
            REG(GPIOn_PnPUR(port)) &= ~(1 << pin);
            REG(GPIOn_PnPDR(port)) &= ~(1 << pin);
            break;
    }
}

void gpio_pin_set_reset(int port, int pin, int set){
    if(set)
        REG(GPIOn_PnSRR(port)) = (1 << pin);
    else
        REG(GPIOn_PnRR(port)) = (1 << pin);
}

void afio_pin_config(int port, int pin, int function){
    if(pin & 0x8){
        REG(AFIO_GPxCFGHR(port)) &= (0xf << ((pin & 0x7) * 4));
        REG(AFIO_GPxCFGHR(port)) |= (function << ((pin & 0x7) * 4));
    } else {
        REG(AFIO_GPxCFGLR(port)) &= (0xf << (pin * 4));
        REG(AFIO_GPxCFGLR(port)) |= (function << (pin * 4));
    }
}
