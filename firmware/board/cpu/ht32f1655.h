#ifndef HT32F1655_H
#define HT32F1655_H

#include "ht32f165x.h"

#define FLASH_SIZE      0x20000 // 128k
#define SRAM_SIZE       0x8000  // 32k

// General Purpose I/O
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_B_BASE     0x400B2000
#define GPIO_C_BASE     0x400B4000
#define GPIO_D_BASE     0x400B6000
#define GPIO_E_BASE     0x400B8000

#define GPIO_B          1
#define GPIO_C          2
#define GPIO_D          3
#define GPIO_E          4

#endif // HT32F1655_H
