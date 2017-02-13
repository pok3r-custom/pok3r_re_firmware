#include "main.h"
#include "board/ht32/usb/usb.h"
#include "board/ht32/usb/descriptors.h"

#define REG_SPI_FLASH REG_SPI1

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

u8 flash_data[1024];

void spi_read(){
    // enable SPI 1 clock
    REG_CKCU->APBCCR0.SPI1EN = 1;

    REG_SPI_FLASH->SPICR0.SPIEN = 1;    // enable
    REG_SPI_FLASH->SPICR0.SELOEN = 1;   // chip select output

    REG_SPI_FLASH->SPICR1.DFL = 8;      // 8 bits
    REG_SPI_FLASH->SPICR1.FORMAT = 1;   // clock low, first edge
    REG_SPI_FLASH->SPICR1.FIRSTBIT = 0; // msb first
    REG_SPI_FLASH->SPICR1.MODE = 1;     // master mode

    REG_SPI_FLASH->SPICPR.CP = 1;       // prescaler

    REG_SPI_FLASH->SPIFCR.FIFOEN = 1;   // fifo enable
    REG_SPI_FLASH->SPIFCR.RXFTLS = 4;
    REG_SPI_FLASH->SPIFCR.TXFTLS = 4;

    u8 cmd[8] = {0};
    u32 len = 8;

    for(int i = 0; i < len; ++i){
        REG_SPI_FLASH->SPIDR.DR = cmd[i];
    }

    for(int i = 0; i < len; ++i){
        while(REG_SPI_FLASH->SPIFSR.RXFS == 0);
        u32 data = REG_SPI_FLASH->SPIDR.DR;
        flash_data[i] = data & 0xFF;
    }

}

void on_suspend(){

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

    spi_read();

    // USB
//    usb_init_descriptors();
//    usb_init();
    // Enable D+ pull-up
//    usb_pull_up(1);

    u32 count = 0;
    while(1){
        count = count + 1;
        wdt_reload();
    }

    return 0;
}
