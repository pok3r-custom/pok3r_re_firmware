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

    // USB
    REG(CKCU_AHBCCR) |= 0x400;
    // AFIO
    REG(CKCU_APBCCR0) |= 0x4000;
    // EXTI
    REG(CKCU_APBCCR0) |= 0x8000;

    // PLL VCO output clock feedback divider to 9
    REG(CKCU_PLLCFCR) = (REG(CKCU_PLLCFCR) & ~(0x3f << 23)) | (9 << 23);

    // Flash wait-state 2
    REG(FMC_CFCR) = (REG(FMC_CFCR) & ~7) | 3;

    REG(CKCU_AHBCFGR) = 1;

    // Set clock source to PLL
    REG(CKCU_GCCR) = (REG(CKCU_GCCR) & ~3) | 1;
    while(REG(CKCU_CKST) >> 30 != 1);
}

int main(){
    wdt_init();
    ckcu_init();

    USB_Device usbdev;
    usb_init_descriptors(&usbdev);

    return 0;
}
