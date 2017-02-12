#include "main.h"
#include "board/ht32/usb/usb.h"
#include "board/ht32/usb/descriptors.h"

void ckcu_init(){
    // Backup domain
    REG_CKCU->LPCR.BKISO = 1;
    // Backup domain register access
    REG_CKCU->APBCCR1.BKPREN = 1;

    // PLL VCO output clock feedback divider to 9
    REG_CKCU->PLLCFGR.PFBD = 9;

    // Flash wait status 2 (48MHz <= HCLK <= 72MHz)
    REG_FMC->CFCR.WAIT = 3;

    // Set AHB prescaler (CK_AHB = CK_SYS / 2)
    REG_CKCU->AHBCFGR.AHBPRE = 1;

    // Set clock source to PLL
    REG_CKCU->GCCR.SW = 1;

    // Wait for clock switch
    while(REG_CKCU->CKST.CKSWST != 1);
}

void nvic_init(){
    // Set vector table address
    nvic_set_vtor(FIRMWARE_ADDR);
}

void wdt_init(){
    // Enable watchdog register access
    ckcu_clocks_enable(0, 0, 0x10, 1);
//    REG(CKCU_APBCCR1) |= 0x10;

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

    // Enable watchdog debug mode
    REG_CKCU->MCUDBGCR.DBWDT = 1;
}

void afio_init(){
    // enable AFIO clock
    // enable GPIO A clock
    ckcu_clocks_enable(1 << 16, 1 << 14, 0, 1);
//    REG(CKCU_APBCCR0) |= (1 << 14);
//    REG(CKCU_AHBCCR) |= (1 << 16);

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
    ckcu_clocks_enable(1 << 16, 0, 0, 0);
//    REG(CKCU_AHBCCR) &= ~(1 << 16);
}

void flash_version_clear(){
    REG_FMC->TADR.TADB = VERSION_ADDR;
    REG_FMC->OCMR.CMD = OCMR_PAGE_ERASE;
    REG_FMC->OPCR.OPM = OPCR_COMMIT;

    while(REG_FMC->OPCR.OPM != OPCR_FINISHED);
}

void onSuspend(){

}

int main(){
    // Basic init
    ckcu_init();
    nvic_init();

    // Watchdog
    wdt_init();

//    afio_init();

    // Clear the version so the board resets to the bootloader
    flash_version_clear();

    // USB
    usb_init_descriptors();
    usb_init();
    // Enable D+ pull-up
    usb_pull_up(1);

    u32 count = 0;
    while(1){
        count = count + 1;
        wdt_reload();
    }

    return 0;
}
