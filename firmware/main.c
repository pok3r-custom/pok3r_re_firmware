#include "main.h"

#define REG_SPI_FLASH REG_SPI1

void ckcu_init(){
    REG_CKCU->LPCR.BKISO = 1;       // Backup domain
    REG_CKCU->APBCCR1.BKPREN = 1;   // Backup domain register access

    REG_CKCU->AHBCFGR.AHBPRE = 1;   // Set AHB prescaler (CK_AHB = CK_SYS / 2)

    // PLL
//    REG_CKCU->GCCR.HSEEN = 1;       // HSE enable
//    REG_CKCU->GCFGR.PLLSRC = 0;     // PLL source HSE
//    REG_CKCU->PLLCFGR.PFBD = 18;    // PLL VCO output clock feedback divider to 18
//    REG_CKCU->GCCR.PLLEN = 1;       // PLL enable

//    while(REG_CKCU->GCSR.PLLRDY == 0);  // wait for PLL

    // system clock
//    REG_CKCU->GCCR.SW = 1;              // set clock source to PLL
//    while(REG_CKCU->CKST.CKSWST != 1);  // wait for clock switch

//    while((REG_CKCU->CKST.HSEST & 2) == 0); // check HSE in use
//    while((REG_CKCU->CKST.PLLST & 1) == 0); // check PLL in use

//    while(REG_CKCU->CKST.HSIST != 0);   // check HSI not in use
//    REG_CKCU->GCCR.HSIEN = 0;           // HSI disable

//    REG_CKCU->AHBCCR.FMCEN = 1;
//    REG_FMC->CFCR.WAIT = 3;         // Flash wait status 2 (48MHz <= HCLK <= 72MHz)
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
    ckcu_clock_enable(CLOCK_AFIO, 1);
    // enable GPIO A clock
    ckcu_clock_enable(CLOCK_PA, 1);
    ckcu_clock_enable(CLOCK_PB, 1);
    ckcu_clock_enable(CLOCK_PC, 1);

    gpio_pin_input_enable(GPIO_A, 14, 0);
    gpio_pin_pull(GPIO_A, 14, PULL_DISABLE);
    gpio_pin_input_enable(GPIO_A, 15, 0);
    gpio_pin_pull(GPIO_A, 15, PULL_DISABLE);

    gpio_pin_input_enable(GPIO_A, 11, 0);
    gpio_pin_pull(GPIO_A, 11, PULL_DISABLE);

    afio_pin_config(GPIO_A, 11, 1);
    afio_pin_config(GPIO_C, 13, 1);

    afio_pin_config(GPIO_C, 14, 1);
    afio_pin_config(GPIO_C, 15, 1);

    // check HSEEN
    if(REG_CKCU->GCCR.HSEEN == 0){
        afio_pin_config(GPIO_B, 14, 1);
        afio_pin_config(GPIO_B, 15, 1);
    }

    // disable GPIO A clock
//    ckcu_clock_enable(CLOCK_PA, 0);
}

void flash_version_clear(){
    REG_FMC->TADR.TADB = VERSION_ADDR;
    REG_FMC->OCMR.CMD = OCMR_PAGE_ERASE;
    REG_FMC->OPCR.OPM = OPCR_COMMIT;

    while(REG_FMC->OPCR.OPM != OPCR_FINISHED);
}

void pinmux_spi(){
    gpio_pin_direction(GPIO_B, 10, PIN_OUTPUT);
    gpio_pin_pull(GPIO_B, 10, PULL_DISABLE);
    // Select AF5 (SPI) for GPIO B pins 7,8,9 (LQFP-64 pins 58,59,60)
    afio_pin_config(GPIO_B, 7, 5);
    afio_pin_config(GPIO_B, 8, 5);
    afio_pin_config(GPIO_B, 9, 5);
}

void spi_init(){
    ckcu_clock_enable(CLOCK_PB, 1);
    ckcu_clock_enable(CLOCK_AFIO, 1);
    // enable SPI1 clock
    ckcu_clock_enable(CLOCK_SPI1, 1);

    // chip select high
    gpio_pin_set_reset(GPIO_B, 10, 1);
    gpio_pin_direction(GPIO_B, 10, PIN_OUTPUT);

//    gpio_pin_pull(GPIO_B, 10, PULL_DISABLE);
//    gpio_pin_pull(GPIO_B, 10, PULL_UP);
//    gpio_pin_drive(GPIO_B, 10, DRIVE_8mA);

//    gpio_pin_drive(GPIO_B, 7, DRIVE_8mA);
//    gpio_pin_drive(GPIO_B, 8, DRIVE_8mA);
//    gpio_pin_drive(GPIO_B, 9, DRIVE_8mA);

    // pinmux spi pins
    afio_pin_config(GPIO_B, 7, 5);
    afio_pin_config(GPIO_B, 8, 5);
    afio_pin_config(GPIO_B, 9, 5);

    REG_SPI_FLASH->SPICR1.SELM = 0;     // software chip select
    REG_SPI_FLASH->SPICR1.SELAP = 0;    // active low

    REG_SPI_FLASH->SPICR1.DFL = 8;      // 8 bits
    REG_SPI_FLASH->SPICR1.FORMAT = 1;   // clock low, first edge
    REG_SPI_FLASH->SPICR1.FIRSTBIT = 0; // msb first
    REG_SPI_FLASH->SPICR1.MODE = 1;     // master mode

    REG_SPI_FLASH->SPICPR.CP = 1;       // prescaler

    REG_SPI_FLASH->SPIFCR.FIFOEN = 1;   // fifo enable
    REG_SPI_FLASH->SPIFCR.RXFTLS = 4;
    REG_SPI_FLASH->SPIFCR.TXFTLS = 4;

    REG_SPI_FLASH->SPICR0.SELOEN = 1;   // chip select output
    REG_SPI_FLASH->SPICR0.SPIEN = 1;    // enable
}

u8 spi_txrx(u8 byte){
    // wait for tx empty
    while(REG_SPI_FLASH->SPISR.TXBE == 0);
    // send byte
    REG_SPI_FLASH->SPIDR.DR = byte;
    // wait for rx data
    while(REG_SPI_FLASH->SPISR.RXBNE == 0);
    // recv byte
    u32 data = REG_SPI_FLASH->SPIDR.DR;
    return data & 0xFF;
}

void spi_flash_command(const u8 *cmd, int writelen, u8 *out, int readlen){
    // chip select low
    gpio_pin_set_reset(GPIO_B, 10, 0);

//    // Send command bytes
//    for(int i = 0; i < writelen; ++i){
//        spi_txrx(cmd[i]);
//    }

//    // Recv bytes
//    for(int i = 0; i < readlen; ++i){
//        out[i] = spi_txrx(0);
//    }

    int wlen = 0;
    while(wlen < writelen){
        int len = MIN(writelen - wlen, 8);
        // Send command bytes
        for(int i = 0; i < len; ++i){
            REG_SPI_FLASH->SPIDR.word = cmd[wlen++];
        }
        // Read dummy data
        for(int i = 0; i < len; ++i){
            // wait for recv data
            while(REG_SPI_FLASH->SPIFSR.RXFS == 0);
            // read/discard data
            REG_SPI_FLASH->SPIDR.word;  // this only works in C
        }
    }

    int rlen = 0;
    while(rlen < readlen){
        int len = MIN(readlen - rlen, 8);
        // Send dummy bytes
        for(int i = 0; i < len; ++i){
            REG_SPI_FLASH->SPIDR.word = 0;
        }
        // Read data
        for(int i = 0; i < len; ++i){
            // wait for recv data
            while(REG_SPI_FLASH->SPIFSR.RXFS == 0);
            // read data
            u32 data = REG_SPI_FLASH->SPIDR.word;
            out[rlen++] = data & 0xFF;
        }
    }

    // chip select high
    gpio_pin_set_reset(GPIO_B, 10, 1);
}

#define GD25Q40_SECTORS         128
#define GD25Q40_SECTOR_BYTES    4096

#define GD24Q40_PAGES           2048
#define GD25Q40_PAGE_BYTES      256

#define GD24Q40_BYTES   (GD25Q40_SECTORS * GD25Q40_SECTOR_BYTES)

#define GD25Q_WREN      0x06    // Write Enable
#define GD25Q_WRDI      0x04    // Write Disable
#define GD25Q_RDSR_L    0x05    // Read Status Register S7~S0
#define GD25Q_RDSR_H    0x35    // Read Status Register S15~S8
#define GD25Q_WRSR      0x01    // Write Status Register
#define GD25Q_READ      0x03    // Read Data Bytes
#define GD25Q_FAST_READ 0x0B    // Read Data Bytes At Higher Speed
#define GD25Q_PP        0x02    // Page Program
#define GD25Q_SE        0x20    // Sector Erase
#define GD25Q_BE_32K    0x52    // 32KB Block Erase
#define GD25Q_BE_64K    0xD8    // 64KB Block Erase
#define GD25Q_CE        0xC7    // Chip Erase
#define GD25Q_DP        0xB9    // Deep Power-Down
#define GD25Q_RDI       0xAB    // Release From Deep Power-Down
#define GD25Q_REMS      0x90    // Read Maufacturer/Device ID
#define GD25Q_RDID      0x9F    // Read Identification

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

int main(){
    // Basic init
    ckcu_init();
    nvic_init();

    // Watchdog
//    wdt_init();

    // Clear the version so the board resets to the bootloader
//    flash_version_clear();

    // I/O init
//    afio_init();
    spi_init();

//    spi_read();

    // USB
    usb_init();
    usb_init_descriptors();
    usb_callback_suspend(on_suspend);
    usb_callback_configuration(on_configuration);

    // Enable D+ pull-up
    usb_pull_up(1);

    u32 count = 0;
    while(1){
        count = count + 1;
//        wdt_reload();
    }

    return 0;
}
