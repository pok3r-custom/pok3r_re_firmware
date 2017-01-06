#ifndef HT32F1655_CPU_H
#define HT32F1655_CPU_H

#include "ht32f165x_cpu.h"

#define FLASH_SIZE      0x20000 // 128k
#define SRAM_SIZE       0x8000  // 32k

// Alternate Function I/O Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define AFIO_ESSR0      AFIO_BASE + 0x0
#define AFIO_ESSR1      AFIO_BASE + 0x4

#define AFIO_GPnCFGLR(n)    AFIO_BASE + 0x20 + (n * 0x8)    // GPIO Port n Configuration 0
#define AFIO_GPnCFGHR(n)    AFIO_BASE + 0x24 + (n * 0x8)    // GPIO Port n Configuration 1

// General Purpose I/O
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_A_BASE     0x400B0000
#define GPIO_B_BASE     0x400B2000
#define GPIO_C_BASE     0x400B4000
#define GPIO_D_BASE     0x400B6000
#define GPIO_E_BASE     0x400B8000

#define GPIO_A          0
#define GPIO_B          1
#define GPIO_C          2
#define GPIO_D          3
#define GPIO_E          4
#define GPIOn_BASE(n)   GPIO_A_BASE + (n * 0x2000)

#define GPIOn_PnDIRCR(n)    GPIOn_BASE(n) + 0x0     // Port n Data Direction Control
#define GPIOn_PnINER(n)     GPIOn_BASE(n) + 0x4     // Port n Input Function Enable Control
#define GPIOn_PnPUR(n)      GPIOn_BASE(n) + 0x8     // Port n Pull-Up Selection
#define GPIOn_PnPDR(n)      GPIOn_BASE(n) + 0xC     // Port n Pull-Down Selection
#define GPIOn_PnODR(n)      GPIOn_BASE(n) + 0x10    // Port n Open Drain Selection
#define GPIOn_PnDRVR(n)     GPIOn_BASE(n) + 0x14    // Port n Drive Current Selection
#define GPIOn_PnLOCKR(n)    GPIOn_BASE(n) + 0x18    // Port n Lock
#define GPIOn_PnDINR(n)     GPIOn_BASE(n) + 0x1C    // Port n Data Input
#define GPIOn_PnDOUTR(n)    GPIOn_BASE(n) + 0x20    // Port n Data Output
#define GPIOn_PnSRR(n)      GPIOn_BASE(n) + 0x24    // Port n Output Set and Reset Control
#define GPIOn_PnRR(n)       GPIOn_BASE(n) + 0x28    // Port n Output Reset Control

#endif // HT32F1655_CPU_H
