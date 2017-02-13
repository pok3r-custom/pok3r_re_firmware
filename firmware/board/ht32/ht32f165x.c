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

void gpio_set_input_enable(int port, int pin, int en){
    if(en)
        REG(GPIOn_PnINER(port)) |= (1 << pin);
    else
        REG(GPIOn_PnINER(port)) &= ~(1 << pin);
}

void gpio_set_pin_pull_up_down(int port, int pin, int mode){
    if(mode == 0){
        REG(GPIOn_PnPUR(port)) |= (1 << pin);
    } else if(mode == 1){
        REG(GPIOn_PnPDR(port)) |= (1 << pin);
    } else {
        REG(GPIOn_PnPUR(port)) &= ~(1 << pin);
        REG(GPIOn_PnPDR(port)) &= ~(1 << pin);
    }
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
