#ifndef HT32F1654_H
#define HT32F1654_H

#include "ht32f165x.h"

#define FLASH_SIZE      0x10000 // 64k
#define SRAM_SIZE       0x4000  // 16k

// Peripherals
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_A          0
#define GPIO_B          1
#define GPIO_C          2
#define GPIO_D          3

#define GPIO_A_BASE     0x400B0000
#define GPIO_B_BASE     0x400B2000
#define GPIO_C_BASE     0x400B4000
#define GPIO_D_BASE     0x400B6000

// Clock Control Unit
// Reset Control Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define CKCU_GCFGR      CKCU_BASE + 0x0     // Global Clock Configuration
#define CKCU_GCCR       CKCU_BASE + 0x4     // Global Clock Control
#define CKCU_GCSR       CKCU_BASE + 0x8     // Global Clock Status
#define CKCU_GCIR       CKCU_BASE + 0xC     // Global Clock Interrupt

#define CKCU_PLLCFCR    CKCU_BASE + 0x18    // PLL Configuration
#define CKCU_PLLCR      CKCU_BASE + 0x1C    // PLL Control
#define CKCU_AHBCFGR    CKCU_BASE + 0x20    // AHB Configuration
#define CKCU_AHBCCR     CKCU_BASE + 0x24    // AHB Clock Control
#define CKCU_APBCFGR    CKCU_BASE + 0x28    // APB Configuration
#define CKCU_APBCCR0    CKCU_BASE + 0x2C    // APB Clock Control 0
#define CKCU_APBCCR1    CKCU_BASE + 0x30    // APB Clock Control 1
#define CKCU_CKST       CKCU_BASE + 0x34    // Clock Source Status
#define CKCU_APBPCSR0   CKCU_BASE + 0x38    // APB Peripheral Clock Selection 0
#define CKCU_APBPCSR1   CKCU_BASE + 0x3C    // APB Peripheral Clock Selection 1
#define CKCU_HSICR      CKCU_BASE + 0x40    // HSI Control
#define CKCU_HSIATCR    CKCU_BASE + 0x44    // HSI Auto Trimming Counter

#define CKCU_LPCR       CKCU_BASE + 0x300   // Low Power Control
#define CKCU_MCUDBGCR   CKCU_BASE + 0x304   // MCU Debug Control

// GCFGR
typedef struct {
    u32 CKOUTSRC    : 3;    // CKOUT Clock Source Selection
    u32             : 5;
    u32 PLLSRC      : 1;    // PLL Clock Source Selection
    u32             : 2;
    u32 CKREFPRE    : 5;    // CK_REF Clock Prescaler Selection
    u32             : 6;
    u32 USBPRE      : 2;    // USB Clock Prescaler Selection
    u32             : 5;
    u32 LPMOD       : 3;    // Lower Power Mode Status
} __attribute__((__packed__)) GCFGR_reg;
STRUCT_SIZE_ASSERT(GCFGR_reg, 4);

// AHBCCR
typedef struct {
    u32 FMCEN       : 1;    // Flash Memory Controller Clock Enable
    u32             : 1;
    u32 SRAMEN      : 1;    // SRAM Clock Enable Clock Enable
    u32             : 1;
    u32 PDMAEN      : 1;    // Peripheral DMA Clock Enable
    u32 BMEN        : 1;    // Bus Matrix Clock Enable
    u32 APB0EN      : 1;    // APB0 Bridge Clock Enable
    u32 APB1EN      : 1;    // APB1 Bridge Clock Enable
    u32             : 2;
    u32 USBEN       : 1;    // USB Clock Enable
    u32 CKREFEN     : 1;    // CK_REF Clock Enable
    u32 EBIEN       : 1;    // EBI Clock Enable
    u32 CRCEN       : 1;    // CRC Clock Enable
    u32             : 2;
    u32 PAEN        : 1;    // GPIO Port A Clock Enable
    u32 PBEN        : 1;    // GPIO Port B Clock Enable
    u32 PCEN        : 1;    // GPIO Port C Clock Enable
    u32 PDEN        : 1;    // GPIO Port D Clock Enable
    u32             : 12;
} __attribute__((__packed__)) AHBCCR_reg;
STRUCT_SIZE_ASSERT(AHBCCR_reg, 4);

// APBCCR0
typedef struct {
    u32 I2C0EN      : 1;    // I2C 0 Clock Enable
    u32 I2C1EN      : 1;    // I2C 1 Clock Enable
    u32             : 2;
    u32 SPI0EN      : 1;    // SPI 0 Clock Enable
    u32 SPI1EN      : 1;    // SPI 1 Clock Enable
    u32             : 2;
    u32 USR0EN      : 1;    // USART 0 Clock Enable
    u32 USR1EN      : 1;    // USART 1 Clock Enable
    u32 UR0EN       : 1;    // UART 0 Clock Enable
    u32 UR1EN       : 1;    // UART 1 Clock Enable
    u32             : 2;
    u32 AFIOEN      : 1;    // Alternate Function I/O Clock Enable
    u32 EXTIEN      : 1;    // External Interrupt Clock Enable
    u32             : 8;
    u32 SCIEN       : 1;    // Smart Card Interface Clock Enable
    u32 I2SEN       : 1;    // I2S Clock Enable
    u32             : 6;
} __attribute__((__packed__)) APBCCR0_reg;
STRUCT_SIZE_ASSERT(APBCCR0_reg, 4);

// APBCCR1
typedef struct {
    u32 MCTM0EN     : 1;    // MCTM 0 Clock Enable
    u32 MCTM1EN     : 1;    // MCTM 1 Clock Enable
    u32             : 2;
    u32 WDTREN      : 1;    // Watchdog Timer Registers Access Enable
    u32             : 1;
    u32 BKPREN      : 1;    // Backup Domain Registers Access Enable
    u32             : 1;
    u32 GPTM0EN     : 1;    // GPTM 0 Clock Enable
    u32 GPTM1EN     : 1;    // GPTM 1 Clock Enable
    u32             : 6;
    u32 BFTM0EN     : 1;    // BFTM 0 Clock Enable
    u32 BFTM1EN     : 1;    // BFTM 1 Clock Enable
    u32             : 4;
    u32 CMPEN       : 1;    // CMP Clock Enable
    u32             : 1;
    u32 ADCCEN      : 1;    // ADC Controller Clock Enable
    u32             : 7;
} __attribute__((__packed__)) APBCCR1_reg;
STRUCT_SIZE_ASSERT(APBCCR1_reg, 4);

// CKCU
typedef struct {
    // 0x000
    GCFGR_reg GCFGR;        // Global Clock Configuration
    u32 GCCR;               // Global Clock Control
    u32 GCSR;               // Global Clock Status
    u32 GCIR;               // Global Clock Interrupt

    u8 _pad1[0x8];

    // 0x018
    u32 PLLCFGR;            // PLL Configuration
    u32 PLLCR;              // PLL Control
    u32 AHBCFGR;            // AHB Configuration
    AHBCCR_reg AHBCCR;      // AHB Clock Control
    u32 APBCFGR;            // APB Configuration
    APBCCR0_reg APBCCR0;    // APB Clock Control 0
    APBCCR1_reg APBCCR1;    // APB Clock Control 1
    u32 CKST;               // Clock Source Status
    u32 APBPCSR0;           // APB Peripheral Clock Selection 0
    u32 APBPCSR1;           // APB Peripheral Clock Selection 1
    u32 HSICR;              // HSI Control
    u32 HSIATCR;            // HSI Auto Trimming Counter

    u8 _pad2[0x2b8];

    // 0x300
    u32 LPCR;               // Low Power Control
    u32 MCUDBGCR;           // MCU Debug Control
} __attribute__((__packed__)) CKCU_map;
STRUCT_SIZE_ASSERT(CKCU_map, 0x308);

#define REG_CKCU ((volatile CKCU_map *)CKCU_BASE)

// General Purpose I/O
// ////////////////////////////////////////////////////////////////////////////////////////////////
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

// Alternate Function I/O Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define AFIO_ESSR0      AFIO_BASE + 0x0
#define AFIO_ESSR1      AFIO_BASE + 0x4

#define AFIO_GPxCFGLR(n)    AFIO_BASE + 0x20 + (n * 0x8)    // GPIO Port n Configuration 0
#define AFIO_GPxCFGHR(n)    AFIO_BASE + 0x24 + (n * 0x8)    // GPIO Port n Configuration 1

#define AFIO_GPACFGLR   AFIO_GPxCFGLR(GPIO_A)
#define AFIO_GPACFGHR   AFIO_GPxCFGHR(GPIO_A)

#define AFIO_GPBCFGLR   AFIO_GPxCFGLR(GPIO_B)
#define AFIO_GPBCFGHR   AFIO_GPxCFGHR(GPIO_B)

#define AFIO_GPCCFGLR   AFIO_GPxCFGLR(GPIO_C)
#define AFIO_GPCCFGHR   AFIO_GPxCFGHR(GPIO_C)

#define AFIO_GPDCFGLR   AFIO_GPxCFGLR(GPIO_D)
#define AFIO_GPDCFGHR   AFIO_GPxCFGHR(GPIO_D)

// ESSR0
STRUCT_REGISTER_START {
    u32 EXTI0PIN    : 4;    //!< EXTI0 Pin Selection
    u32 EXTI1PIN    : 4;    //!< EXTI1 Pin Selection
    u32 EXTI2PIN    : 4;    //!< EXTI2 Pin Selection
    u32 EXTI3PIN    : 4;    //!< EXTI3 Pin Selection
    u32 EXTI4PIN    : 4;    //!< EXTI4 Pin Selection
    u32 EXTI5PIN    : 4;    //!< EXTI5 Pin Selection
    u32 EXTI6PIN    : 4;    //!< EXTI6 Pin Selection
    u32 EXTI7PIN    : 4;    //!< EXTI7 Pin Selection
} STRUCT_REGISTER_END ESSR0_reg;
STRUCT_SIZE_ASSERT(ESSR0_reg, 4);

// ESSR1
STRUCT_REGISTER_START {
    u32 EXTI8PIN    : 4;    //!< EXTI8 Pin Selection
    u32 EXTI9PIN    : 4;    //!< EXTI9 Pin Selection
    u32 EXTI10PIN   : 4;    //!< EXTI10 Pin Selection
    u32 EXTI11PIN   : 4;    //!< EXTI11 Pin Selection
    u32 EXTI12PIN   : 4;    //!< EXTI12 Pin Selection
    u32 EXTI13PIN   : 4;    //!< EXTI13 Pin Selection
    u32 EXTI14PIN   : 4;    //!< EXTI14 Pin Selection
    u32 EXTI15PIN   : 4;    //!< EXTI15 Pin Selection
} STRUCT_REGISTER_END ESSR1_reg;
STRUCT_SIZE_ASSERT(ESSR1_reg, 4);

// GPxCFGLR
STRUCT_REGISTER_START {
    u32 PxCFG0      : 4;    //!< Alternate Function Select for Port x Pin 0
    u32 PxCFG1      : 4;    //!< Alternate Function Select for Port x Pin 1
    u32 PxCFG2      : 4;    //!< Alternate Function Select for Port x Pin 2
    u32 PxCFG3      : 4;    //!< Alternate Function Select for Port x Pin 3
    u32 PxCFG4      : 4;    //!< Alternate Function Select for Port x Pin 4
    u32 PxCFG5      : 4;    //!< Alternate Function Select for Port x Pin 5
    u32 PxCFG6      : 4;    //!< Alternate Function Select for Port x Pin 6
    u32 PxCFG7      : 4;    //!< Alternate Function Select for Port x Pin 7
} STRUCT_REGISTER_END GPxCFGLR_reg;
STRUCT_SIZE_ASSERT(GPxCFGLR_reg, 4);

// GPxCFGHR
STRUCT_REGISTER_START {
    u32 PxCFG8      : 4;    //!< Alternate Function Select for Port x Pin 8
    u32 PxCFG9      : 4;    //!< Alternate Function Select for Port x Pin 9
    u32 PxCFG10     : 4;    //!< Alternate Function Select for Port x Pin 10
    u32 PxCFG11     : 4;    //!< Alternate Function Select for Port x Pin 11
    u32 PxCFG12     : 4;    //!< Alternate Function Select for Port x Pin 12
    u32 PxCFG13     : 4;    //!< Alternate Function Select for Port x Pin 13
    u32 PxCFG14     : 4;    //!< Alternate Function Select for Port x Pin 14
    u32 PxCFG15     : 4;    //!< Alternate Function Select for Port x Pin 15
} STRUCT_REGISTER_END GPxCFGHR_reg;
STRUCT_SIZE_ASSERT(GPxCFGHR_reg, 4);

typedef struct {
    ESSR0_reg ESSR0;
    ESSR1_reg ESSR1;
    u8 _pad1[0x18];

    GPxCFGLR_reg GPACFGLR;
    GPxCFGHR_reg GPACFGHR;

    GPxCFGLR_reg GPBCFGLR;
    GPxCFGHR_reg GPBCFGHR;

    GPxCFGLR_reg GPCCFGLR;
    GPxCFGHR_reg GPCCFGHR;

    GPxCFGLR_reg GPDCFGLR;
    GPxCFGHR_reg GPDCFGHR;
} AFIO_map;
STRUCT_SIZE_ASSERT(AFIO_map, 0x40);

#define REG_AFIO ((volatile AFIO_map *)AFIO_BASE)

STRUCT_REG_CHECK(AFIO, ESSR0);
STRUCT_REG_CHECK(AFIO, ESSR1);
STRUCT_REG_CHECK(AFIO, GPACFGLR);
STRUCT_REG_CHECK(AFIO, GPACFGHR);
STRUCT_REG_CHECK(AFIO, GPBCFGLR);
STRUCT_REG_CHECK(AFIO, GPBCFGHR);
STRUCT_REG_CHECK(AFIO, GPCCFGLR);
STRUCT_REG_CHECK(AFIO, GPCCFGHR);
STRUCT_REG_CHECK(AFIO, GPDCFGLR);
STRUCT_REG_CHECK(AFIO, GPDCFGHR);

// SPI
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define SPI_SPICR0      SPI0_BASE + 0x0     // SPI Control Register 0
#define SPI_SPICR1      SPI0_BASE + 0x4     // SPI Control Register 1
#define SPI_SPIIER      SPI0_BASE + 0x8     // SPI Interrupt Enable Register
#define SPI_SPICPR      SPI0_BASE + 0xC     // SPI Clock Prescaler Register
#define SPI_SPIDR       SPI0_BASE + 0x10    // SPI Data Register
#define SPI_SPISR       SPI0_BASE + 0x14    // SPI Status Register
#define SPI_SPIFCR      SPI0_BASE + 0x18    // SPI FIFI Control Register
#define SPI_SPIFSR      SPI0_BASE + 0x1C    // SPI FIFO Status Register
#define SPI_SPIFTOCR    SPI0_BASE + 0x20    // SPI FIFO Time Out Register

// SPICR0
STRUCT_REGISTER_START {
    u32 SPIEN   : 1;    //!< SPI Enable
    u32 TXDMAE  : 1;    //!< TX PDMA Request Enable
    u32 RXDMAE  : 1;    //!< RX PDMA Request Enable
    u32 SELOEN  : 1;    //!< Slave Select Output Enable
    u32 SSELC   : 1;    //!< Software Slave Select Control
    u32         : 1;
    u32 DUALEN  : 1;    //!< Dual Port Enable
    u32 GUADTEN : 1;    //!< Guard Time Enable
    u32 GUADT   : 4;    //!< Guard Time
    u32 SELHT   : 4;    //!< Chip Select Hold Time
    u32         : 16;
} STRUCT_REGISTER_END SPICR0_reg;
STRUCT_SIZE_ASSERT(SPICR0_reg, 4);

// SPICR1
STRUCT_REGISTER_START {
    u32 DFL         : 4;    //!< Data Frame Length
    u32             : 4;
    u32 FORMAT      : 3;    //!< SPI Data Transfer Format
    u32 SELAP       : 1;    //!< Slave Select Active Priority
    u32 FIRSTBIT    : 1;    //!< LSB or MSB Transmitted First
    u32 SELM        : 1;    //!< Slave Select Mode
    u32 MODE        : 1;    //!< Master or Slave Mode
    u32             : 17;
} STRUCT_REGISTER_END SPICR1_reg;
STRUCT_SIZE_ASSERT(SPICR1_reg, 4);

// SPIIER
STRUCT_REGISTER_START {
    u32 TXBEIEN     : 1;    //!< TX Buffer Empty Interrupt Enable
    u32 TXEIEN      : 1;    //!< TX Empty Interrupt Enable
    u32 RXBNEIEN    : 1;    //!< RX Buffer Not Empty Interrupt Enable
    u32 WCIEN       : 1;    //!< Write Collison Interrupt Enable
    u32 ROIEN       : 1;    //!< Read Overrun Interrupt Enable
    u32 MFIEN       : 1;    //!< Mode Fault Interrupt Enable
    u32 SAIEN       : 1;    //!< Slave Abort Interrupt Enable
    u32 TOIEN       : 1;    //!< Time Out Interrupt Enable
    u32             : 24;
} STRUCT_REGISTER_END SPIIER_reg;
STRUCT_SIZE_ASSERT(SPIIER_reg, 4);

// SPICPR
STRUCT_REGISTER_START {
    u32 CP  : 16;    //!< SPI Clock Prescaler
    u32     : 16;
} STRUCT_REGISTER_END SPICPR_reg;
STRUCT_SIZE_ASSERT(SPICPR_reg, 4);

// SPIDR
STRUCT_REGISTER_START {
    u32 DR  : 16;    //!< Data Register
    u32     : 16;
} STRUCT_REGISTER_END SPIDR_reg;
STRUCT_SIZE_ASSERT(SPIDR_reg, 4);

// SPISR
STRUCT_REGISTER_START {
    const u32 TXBE  : 1;    //!< Transmit Buffer Empty Flag
    const u32 TXE   : 1;    //!< Transmission Register Empty Flag
    const u32 RXBNE : 1;    //!< Receive Buffer Not Empty Flag
    u32 WC          : 1;    //!< Write Collision Flag
    u32 RO          : 1;    //!< Read Overrun Flag
    u32 MF          : 1;    //!< Mode Fault Flag
    u32 SA          : 1;    //!< Slave Abort Flag
    u32 TO          : 1;    //!< Time Out Flag
    const u32 BUSY  : 1;    //!< SPI Busy Flag
    u32             : 23;
} STRUCT_REGISTER_END SPISR_reg;
STRUCT_SIZE_ASSERT(SPISR_reg, 4);

// SPIFCR
STRUCT_REGISTER_START {
    u32 TXFTLS  : 4;    //!< TX FIFO Trigger Level Select
    u32 RXFTLS  : 4;    //!< RX FIFO Trigger Level Select
    u32         : 2;
    u32 FIFOEN  : 1;    //!< FIFO Enable
    u32         : 21;
} STRUCT_REGISTER_END SPIFCR_reg;
STRUCT_SIZE_ASSERT(SPIFCR_reg, 4);

// SPIFSR
STRUCT_REGISTER_START {
    u32 TXFS    : 4;    //!< TX FIFO Status
    u32 RXFS    : 4;    //!< RX FIFO Status
    u32         : 24;
} STRUCT_REGISTER_END SPIFSR_reg;
STRUCT_SIZE_ASSERT(SPIFSR_reg, 4);

// SPIFTOCR
STRUCT_REGISTER_START {
    u32 TOC     : 16;    //!< Time Out Counter
    u32         : 16;
} STRUCT_REGISTER_END SPIFTOCR_reg;
STRUCT_SIZE_ASSERT(SPIFTOCR_reg, 4);

typedef struct {
    SPICR0_reg SPICR0;
    SPICR1_reg SPICR1;
    SPIIER_reg SPIIER;
    SPICPR_reg SPICPR;
    SPIDR_reg SPIDR;
    SPISR_reg SPISR;
    SPIFCR_reg SPIFCR;
    SPIFSR_reg SPIFSR;
    SPIFTOCR_reg SPIFTOCR;
} SPI_map;
STRUCT_SIZE_ASSERT(SPI_map, 0x24);

#define REG_SPI1 ((volatile SPI_map *)SPI0_BASE)
#define REG_SPI0 ((volatile SPI_map *)SPI0_BASE)

STRUCT_ADDR_ASSERT(REG_SPI0->SPICR0, SPI_SPICR0);
STRUCT_ADDR_ASSERT(REG_SPI0->SPICR1, SPI_SPICR1);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIIER, SPI_SPIIER);
STRUCT_ADDR_ASSERT(REG_SPI0->SPICPR, SPI_SPICPR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIDR, SPI_SPIDR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPISR, SPI_SPISR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIFCR, SPI_SPIFCR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIFSR, SPI_SPIFSR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIFTOCR, SPI_SPIFTOCR);

#endif // HT32F1654_H
