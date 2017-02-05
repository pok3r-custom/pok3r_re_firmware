#ifndef HT32F1655_H
#define HT32F1655_H

#include "ht32f165x.h"

#define FLASH_SIZE      0x20000 // 128k
#define SRAM_SIZE       0x8000  // 32k

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

#define CKCU_LPCR       CKCU_BASE + 0x300   // Low Power Control
#define CKCU_MCUDBGCR   CKCU_BASE + 0x304   // MCU Debug Control

// GCFGR
STRUCT_REGISTER_START {
    u32 CKOUTSRC    : 3;    //!< CKOUT Clock Source Selection
    u32             : 5;
    u32 PLLSRC      : 1;    //!< PLL Clock Source Selection
    u32             : 2;
    u32 CKREFPRE    : 5;    //!< CK_REF Clock Prescaler Selection
    u32             : 4;
    u32 URPRE       : 2;    //!< USART Clock Prescaler Selection
    u32 USBPRE      : 2;    //!< USB Clock Prescaler Selection
    u32             : 5;
    u32 LPMOD       : 3;    //!< Lower Power Mode Status
} STRUCT_REGISTER_END GCFGR_reg;
STRUCT_SIZE_ASSERT(GCFGR_reg, 4);

// PLLCFGR
STRUCT_REGISTER_START {
    u32             : 21;
    u32 POTD        : 2;    //! PLL Output Clock Divider
    u32 PFBD        : 6;    //! PLL VCO Output Clock Feedback Divider
    u32             : 3;
} STRUCT_REGISTER_END PLLCFGR_reg;
STRUCT_SIZE_ASSERT(PLLCFGR_reg, 4);

// AHBCCR
STRUCT_REGISTER_START {
    u32 FMCEN   : 1;    //!< Flash Memory Controller Clock Enable
    u32         : 1;
    u32 SRAMEN  : 1;    //!< SRAM Clock Enable Clock Enable
    u32         : 1;
    u32 PDMAEN  : 1;    //!< Peripheral DMA Clock Enable
    u32 BMEN    : 1;    //!< Bus Matrix Clock Enable
    u32 APB0EN  : 1;    //!< APB0 Bridge Clock Enable
    u32 APB1EN  : 1;    //!< APB1 Bridge Clock Enable
    u32         : 2;
    u32 USBEN   : 1;    //!< USB Clock Enable
    u32 CKREFEN : 1;    //!< CK_REF Clock Enable
    u32 EBIEN   : 1;    //!< EBI Clock Enable
    u32 CRCEN   : 1;    //!< CRC Clock Enable
    u32         : 2;
    u32 PAEN    : 1;    //!< GPIO Port A Clock Enable
    u32 PBEN    : 1;    //!< GPIO Port B Clock Enable
    u32 PCEN    : 1;    //!< GPIO Port C Clock Enable
    u32 PDEN    : 1;    //!< GPIO Port D Clock Enable
    u32 PEEN    : 1;    //!< GPIO Port E Clock Enable
    u32         : 11;
} STRUCT_REGISTER_END AHBCCR_reg;
STRUCT_SIZE_ASSERT(AHBCCR_reg, 4);

// APBCCR0
STRUCT_REGISTER_START {
    u32 I2C0EN  : 1;    //!< I2C 0 Clock Enable
    u32 I2C1EN  : 1;    //!< I2C 1 Clock Enable
    u32         : 2;
    u32 SPI0EN  : 1;    //!< SPI 0 Clock Enable
    u32 SPI1EN  : 1;    //!< SPI 1 Clock Enable
    u32         : 2;
    u32 USR0EN  : 1;    //!< USART 0 Clock Enable
    u32 USR1EN  : 1;    //!< USART 1 Clock Enable
    u32 UR0EN   : 1;    //!< UART 0 Clock Enable
    u32 UR1EN   : 1;    //!< UART 1 Clock Enable
    u32         : 2;
    u32 AFIOEN  : 1;    //!< Alternate Function I/O Clock Enable
    u32 EXTIEN  : 1;    //!< External Interrupt Clock Enable
    u32         : 8;
    u32 SCIEN   : 1;    //!< Smart Card Interface Clock Enable
    u32 I2SEN   : 1;    //!< I2S Clock Enable
    u32         : 6;
} STRUCT_REGISTER_END APBCCR0_reg;
STRUCT_SIZE_ASSERT(APBCCR0_reg, 4);

// APBCCR1
STRUCT_REGISTER_START {
    u32 MCTM0EN : 1;    //!< MCTM 0 Clock Enable
    u32 MCTM1EN : 1;    //!< MCTM 1 Clock Enable
    u32         : 2;
    u32 WDTREN  : 1;    //!< Watchdog Timer Registers Access Enable
    u32         : 1;
    u32 BKPREN  : 1;    //!< Backup Domain Registers Access Enable
    u32         : 1;
    u32 GPTM0EN : 1;    //!< GPTM 0 Clock Enable
    u32 GPTM1EN : 1;    //!< GPTM 1 Clock Enable
    u32         : 6;
    u32 BFTM0EN : 1;    //!< BFTM 0 Clock Enable
    u32 BFTM1EN : 1;    //!< BFTM 1 Clock Enable
    u32         : 4;
    u32 OPA0EN  : 1;    //!< OPA/CMP 0 Clock Enable
    u32 OPA1EN  : 1;    //!< OPA/CMP 1 Clock Enable
    u32 ADCEN   : 1;    //!< ADC Clock Enable
    u32         : 7;
} STRUCT_REGISTER_END APBCCR1_reg;
STRUCT_SIZE_ASSERT(APBCCR1_reg, 4);

// CKCU
typedef struct {
    GCFGR_reg GCFGR;        //!< Global Clock Configuration
    u32 GCCR;               //!< Global Clock Control
    u32 GCSR;               //!< Global Clock Status
    u32 GCIR;               //!< Global Clock Interrupt
    u8 _pad1[0x8];

    // 0x018
    PLLCFGR_reg PLLCFGR;    //!< PLL Configuration
    u32 PLLCR;              //!< PLL Control
    u32 AHBCFGR;            //!< AHB Configuration
    AHBCCR_reg AHBCCR;      //!< AHB Clock Control
    u32 APBCFGR;            //!< APB Configuration
    APBCCR0_reg APBCCR0;    //!< APB Clock Control 0
    APBCCR1_reg APBCCR1;    //!< APB Clock Control 1
    u32 CKST;               //!< Clock Source Status
    u8 _pad2[0x2c8];

    // 0x300
    u32 LPCR;               //!< Low Power Control
    u32 MCUDBGCR;           //!< MCU Debug Control
} CKCU_map;
STRUCT_SIZE_ASSERT(CKCU_map, 0x308);

#define REG_CKCU ((volatile CKCU_map *)CKCU_BASE)

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
