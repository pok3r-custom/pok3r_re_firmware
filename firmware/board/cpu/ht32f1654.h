#ifndef HT32F1654_H
#define HT32F1654_H

#include "ht32f165x.h"

#define FLASH_SIZE      0x10000 // 64k
#define SRAM_SIZE       0x4000  // 16k

// General Purpose I/O
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_B_BASE     0x400B2000
#define GPIO_C_BASE     0x400B4000
#define GPIO_D_BASE     0x400B6000

#define GPIO_B          1
#define GPIO_C          2
#define GPIO_D          3

#endif // HT32F1654_H
