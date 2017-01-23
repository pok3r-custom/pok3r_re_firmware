#include "ht32.h"

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
        REG(AFIO_GPnCFGHR(port)) &= (0xf << ((pin & 0x7) * 4));
        REG(AFIO_GPnCFGHR(port)) |= (function << ((pin & 0x7) * 4));
    } else {
        REG(AFIO_GPnCFGLR(port)) &= (0xf << (pin * 4));
        REG(AFIO_GPnCFGLR(port)) |= (function << (pin * 4));
    }
}
