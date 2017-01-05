#ifndef HT32F1654_CPU_H
#define HT32F1654_CPU_H

#include "ht32f165x_cpu.h"

#define FLASH_SIZE      0x10000 // 64k
#define SRAM_SIZE       0x4000  // 16k

// General Purpose I/O
#define GPIO_A_BASE     0x400B0000
#define GPIO_B_BASE     0x400B2000
#define GPIO_C_BASE     0x400B4000
#define GPIO_D_BASE     0x400B6000

#endif // HT32F1654_CPU_H
