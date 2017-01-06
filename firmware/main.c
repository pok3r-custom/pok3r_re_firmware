#include "board/pok3r_board.h"
#include "usb/usb.h"
#include "usb/descriptors.h"

void wdt_reload(){
    // Reload unlock and set
    REG(WDT_WDTCR) = 0x5fa00001;
}

void wdt_init(){
    // Enable watchdog register access
    REG(CKCU_APBCCR1) |= 0x10;

    // Enable watchdog timer
    unsigned long en = (REG(WDT_WDTMR0) & 0xfff) | 0x1a000;
    for(unsigned i = 0; i < 7200000; ++i){
        REG(WDT_WDTMR0) = en;
        if(REG(WDT_WDTMR0) == 0x10000)
            break;
    }

    // Set watchdog timer prescaler to 1/32
    REG(WDT_WDTMR1) = (REG(WDT_WDTMR1) & 0xfff) | 0x5000;

    // Set watchdog timer to 2000
    REG(WDT_WDTMR0) = (REG(WDT_WDTMR0) & 0x1f000) | 0x7d0;

    wdt_reload();

    // Disable watchdog timer register protection
    REG(WDT_WDTPR) = 0x35ca;
}

void ckcu_init(){
    // Backup domain
    REG(CKCU_LPCR) = 1;
    // Backup domain register access
//    REG(CKCU_APBCCR1) = (1 << 6);

    // USB
//    REG(CKCU_AHBCCR) |= (1 << 10);
    // AFIO
//    REG(CKCU_APBCCR0) |= (1 << 14);
    // EXTI
//    REG(CKCU_APBCCR0) |= (1 << 15);

    // PLL VCO output clock feedback divider to 9
    REG(CKCU_PLLCFCR) = (REG(CKCU_PLLCFCR) & ~(0x3f << 23)) | (9 << 23);

    // Flash wait-state 2
    REG(FMC_CFCR) = (REG(FMC_CFCR) & ~7) | 3;

    // Set AHB prescaler (CK_AHB = CK_SYS / 2)
    REG(CKCU_AHBCFGR) = 1;

    // Set clock source to PLL
    REG(CKCU_GCCR) = (REG(CKCU_GCCR) & ~3) | 1;
    while(REG(CKCU_CKST) >> 30 != 1);
}

void nvic_init(){

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

void afio_init(){
    // enable AFIO clock
    REG(CKCU_APBCCR0) |= (1 << 14);
    // enable GPIO A clock
    REG(CKCU_AHBCCR) |= (1 << 16);

    gpio_set_input_enable(GPIO_A, 14, 0);
    gpio_set_input_enable(GPIO_A, 15, 0);
    gpio_set_pin_pull_up_down(GPIO_A, 14, 2);
    gpio_set_pin_pull_up_down(GPIO_A, 15, 2);

    gpio_set_input_enable(GPIO_A, 11, 0);
    gpio_set_pin_pull_up_down(GPIO_A, 11, 2);

    afio_pin_config(GPIO_A, 11, 1);
    afio_pin_config(GPIO_C, 13, 1);
    afio_pin_config(GPIO_C, 14, 1);
    afio_pin_config(GPIO_C, 15, 1);

    // check HSEEN
    if((REG(CKCU_GCCR) & 0x400) == 0){
        afio_pin_config(GPIO_B, 14, 1);
        afio_pin_config(GPIO_B, 15, 1);
    }

    // disable GPIO A clock
    REG(CKCU_AHBCCR) &= ~(1 << 16);
}

int main(){
    //wdt_init();
    ckcu_init();

    //nvic_init();
    afio_init();

    USB_Device usbdev;
    usb_init_descriptors(&usbdev);
    usb_init(&usbdev);

    while(1){

    }

    return 0;
}
