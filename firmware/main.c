#include "main.h"


void nvic_init(){
    // Set vector table address
    nvic_set_vtor(FIRMWARE_ADDR);
}

void ckcu_init(){
    REG_CKCU->LPCR.BKISO = 1;       // Backup domain
    REG_CKCU->APBCCR1.BKPREN = 1;   // Backup domain register access

    REG_CKCU->AHBCFGR.AHBPRE = 1;   // Set AHB prescaler (CK_AHB = CK_SYS / 2)

    // PLL
    REG_CKCU->GCCR.HSEEN = 1;       // HSE enable
    REG_CKCU->GCFGR.PLLSRC = 0;     // PLL source HSE
//    REG_CKCU->GCFGR.PLLSRC = 1;     // PLL source HSI

//    REG_CKCU->PLLCFGR.PFBD = 36;    // PLL feedback divider = 36
//    REG_CKCU->PLLCFGR.POTD = 1;     // PLL output divider = 2
    REG_CKCU->PLLCFGR.PFBD = 18;    // PLL feedback divider = 18
    REG_CKCU->PLLCFGR.POTD = 0;     // PLL output divider = 1

    REG_CKCU->GCCR.PLLEN = 1;       // PLL enable

    while(REG_CKCU->GCSR.PLLRDY == 0);  // wait for PLL

    // system clock
    REG_CKCU->GCCR.SW = 1;              // set clock source to PLL
    while(REG_CKCU->CKST.CKSWST != 1);  // wait for clock switch

//    while((REG_CKCU->CKST.HSEST & 2) == 0); // check HSE in use
//    while((REG_CKCU->CKST.PLLST & 1) == 0); // check PLL in use

//    while(REG_CKCU->CKST.HSIST != 0);   // check HSI not in use
//    REG_CKCU->GCCR.HSIEN = 0;           // HSI disable

//    REG_CKCU->AHBCCR.FMCEN = 1;
    REG_FMC->CFCR.WAIT = 3;         // Flash wait status 2 (48MHz <= HCLK <= 72MHz)
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

void flash_version_clear(){
    REG_FMC->TADR.TADB = VERSION_ADDR;
    REG_FMC->OCMR.CMD = OCMR_PAGE_ERASE;
    REG_FMC->OPCR.OPM = OPCR_COMMIT;

    while(REG_FMC->OPCR.OPM != OPCR_FINISHED);
}

u32 strlen(const char *str){
    u32 i = 0;
    while(*str++)
        ++i;
    return i;
}

void usart_log(const char *str){
    usart_write((const u8 *)str, strlen(str));
    usart_write((const u8 *)"\r\n", 2);
}

u8 utox(u32 num, char *str){
    char tmp[8];
    int i = 0;
    while(num){
        tmp[i++] = "0123456789abcdef"[num & 0xf];
        num >>= 4;
    }
    for(int j = i-1; j >= 0; --j){
        *(str++) = tmp[j];
    }
    *str = 0;
    return i;
}

void flash_write(u32 target, const u8 *begin, const u8 *end){
    while(begin < end){
        REG_FMC->TADR.TADB = target;
        u32 data = *(const u32 *)begin;
        REG_FMC->WRDR.WRDB = data;
        
        REG_FMC->OCMR.CMD = OCMR_WORD_PROGRAM;
        REG_FMC->OPCR.OPM = OPCR_COMMIT;
        
        while(REG_FMC->OPCR.OPM != OPCR_FINISHED);
        
        target += 4;
        begin += 4;
    }
}

u8 flash_id[16];
u8 flash_mid[16];
u8 flash_data[0x400];

void spi_read(){
//    pinmux_spi();

    u8 cmd[4];

    cmd[0] = GD25Q_RDID;
    spi_flash_command(cmd, 1, flash_id, 3);

    cmd[0] = GD25Q_REMS;
    cmd[1] = 0;
    cmd[2] = 0;
    cmd[3] = 0;
    spi_flash_command(cmd, 4, flash_mid, 2);

    u32 addr = 0;
//    u32 addr = 0xff0;
    cmd[0] = GD25Q_READ;
    cmd[1] = (addr >> 16) & 0xFF;
    cmd[2] = (addr >> 8) & 0xFF;
    cmd[3] = addr & 0xFF;
    spi_flash_command(cmd, 4, flash_data, 0x400);
}

void on_suspend(){

}

void on_configuration(u8 config){
    if(config == 1){
        usb_ep_init(EP_1, 64, EPnIER_ODRXIE);
        usb_ep_init(EP_2, 64, EPnIER_ODRXIE);
    }
}

const u8 test_data[] = {
    0x01, 0x02, 0x03, 0x04,
    0x11, 0x12, 0x13, 0x14,
    0x21, 0x22, 0x23, 0x24,
    0x31, 0x32, 0x33, 0x34,
};

char tst_str[] = "test string";

int main(){
    // Basic init
    nvic_init();
    ckcu_init();

    // Watchdog
//    wdt_init();

    // Clear the version so the board resets to the bootloader
//    flash_version_clear();

    // I/O init
    afio_init();

//    spi_init();
//    spi_read();

    usart_init();
    
    usart_log("POK3R Custom App");

    // Flash
//    usart_log("Write flash at 0x4000");
//    ht32_flash_write(0x4000, test_data, test_data + sizeof(test_data));
//    flash_write(0x4000, test_data, test_data + sizeof(test_data));
    
    usart_log("Done");

    // USB
//    usb_init();
//    usb_init_descriptors();
//    usb_callback_suspend(on_suspend);
//    usb_callback_configuration(on_configuration);

    // Enable D+ pull-up
//    usb_pull_up(1);

    u32 count = 0;
    while(1){
        count = count + 1;
//        wdt_reload();
    }

    return 0;
}
