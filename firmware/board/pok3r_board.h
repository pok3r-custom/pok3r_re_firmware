#ifndef POK3R_BOARD_H
#define POK3R_BOARD_H

#include "ht32/ht32.h"
#include "gd25q_flash.h"

#define VERSION_ADDR    0x2800
#define FIRMWARE_ADDR   0x2c00

#define REG_SPI_FLASH REG_SPI1

void afio_init();

void pinmux_spi();

void spi_init();
u8 spi_txrx(u8 byte);
void spi_flash_command(const u8 *cmd, int writelen, u8 *out, int readlen);

#endif // POK3R_BOARD_H
