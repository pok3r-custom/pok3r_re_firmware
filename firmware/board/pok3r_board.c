#include "pok3r_board.h"

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

void usart_init(){
    // USART0 clock
    ckcu_clock_enable(CLOCK_USR0, 1);

    // pinmux PA8 for AF6
    afio_pin_config(GPIO_A, 8, 6);

    REG_USART0->MDR.MODE = 0;
    REG_USART0->DLR.BRD = 625; // 115200 baud
}
