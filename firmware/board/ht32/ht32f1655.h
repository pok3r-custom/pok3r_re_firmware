#ifndef HT32F1655_H
#define HT32F1655_H

#include "ht32f165x.h"

#define FLASH_SIZE      0x20000 // 128k
#define SRAM_SIZE       0x8000  // 32k

// Clock Control Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define CKCU_GCFGR      CKCU_BASE + 0x0     // Global Clock Configuration
#define CKCU_GCCR       CKCU_BASE + 0x4     // Global Clock Control
#define CKCU_GCSR       CKCU_BASE + 0x8     // Global Clock Status
#define CKCU_GCIR       CKCU_BASE + 0xC     // Global Clock Interrupt

#define CKCU_PLLCFGR    CKCU_BASE + 0x18    // PLL Configuration
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

// GCCR
STRUCT_REGISTER_START {
    u32 SW          : 2;    //!< System Clock Switch
    u32             : 7;
    u32 PLLEN       : 1;    //!< PLL Enable
    u32 HSEEN       : 1;    //!< External High Speed Oscillator Enable
    u32 HSIEN       : 1;    //!< Internal High Speed Oscillator Enable
    u32             : 4;
    u32 CKMEN       : 1;    //!< HSE Clock Monitor Enable
    u32 PSRCEN      : 1;    //!< Power Saving Wakeup RC Clock Enable
    u32             : 14;
} STRUCT_REGISTER_END GCCR_reg;
STRUCT_SIZE_ASSERT(GCCR_reg, 4);

// GCSR
STRUCT_REGISTER_START {
    u32             : 1;
    u32 PLLRDY      : 1;    //!< PLL Clock Ready Flag
    u32 HSERDY      : 1;    //!< HSE High Speed External Oscillator Ready Flag
    u32 HSIRDY      : 1;    //!< HSI High Speed Internal Oscillator Ready Flag
    u32 LSERDY      : 1;    //!< LSE External Low Speed Oscillator Ready Flag
    u32 LSIRDY      : 1;    //!< LSI Internal Low Speed Oscillator Ready Flag
    u32             : 26;
} STRUCT_REGISTER_END GCSR_reg;
STRUCT_SIZE_ASSERT(GCSR_reg, 4);

// GCIR
STRUCT_REGISTER_START {
    u32 CKSF        : 1;    //!< HSE Clock Stuck Interrup Flag
    u32             : 1;
    u32 PLLRDYF     : 1;    //!< PLL Ready Interrupt Flag
    u32 HSERDYF     : 1;    //!< HSE Ready Interrupt Flag
    u32 HSIRDYF     : 1;    //!< HSI Ready Interrupt Flag
    u32 LSERDYF     : 1;    //!< LSE Ready Interrupt Flag
    u32 LSIRDYF     : 1;    //!< LSI Ready Interrupt Flag
    u32             : 9;
    u32 CKSIE       : 1;    //!< Clock Stuck Interrupt Enable
    u32             : 1;
    u32 PLLRDYIE    : 1;    //!< PLL Ready Interrupt Enable
    u32 HSERDYIE    : 1;    //!< HSE Ready Interrupt Enable
    u32 HSIRDYIE    : 1;    //!< HSI Ready Interrupt Enable
    u32 LSERDYIE    : 1;    //!< LSE Ready Interrupt Enable
    u32 LSIRDYIE    : 1;    //!< LSI Ready Interrupt Enable
    u32             : 9;
} STRUCT_REGISTER_END GCIR_reg;
STRUCT_SIZE_ASSERT(GCIR_reg, 4);

// PLLCFGR
STRUCT_REGISTER_START {
    u32             : 21;
    u32 POTD        : 2;    //! PLL Output Clock Divider
    u32 PFBD        : 6;    //! PLL VCO Output Clock Feedback Divider
    u32             : 3;
} STRUCT_REGISTER_END PLLCFGR_reg;
STRUCT_SIZE_ASSERT(PLLCFGR_reg, 4);

// PLLCR
STRUCT_REGISTER_START {
    u32             : 31;
    u32 PLLBPS      : 1;    //!< PLL Bypass Mode Enable
} STRUCT_REGISTER_END PLLCR_reg;
STRUCT_SIZE_ASSERT(PLLCR_reg, 4);

// AHBCFGR
STRUCT_REGISTER_START {
    u32 AHBPRE      : 2;    //!< AHB Pre-Scaler
    u32             : 30;
} STRUCT_REGISTER_END AHBCFGR_reg;
STRUCT_SIZE_ASSERT(AHBCFGR_reg, 4);

// AHBCCR
STRUCT_REGISTER_START {
    u32 FMCEN       : 1;    //!< Flash Memory Controller Clock Enable
    u32             : 1;
    u32 SRAMEN      : 1;    //!< SRAM Clock Enable Clock Enable
    u32             : 1;
    u32 PDMAEN      : 1;    //!< Peripheral DMA Clock Enable
    u32 BMEN        : 1;    //!< Bus Matrix Clock Enable
    u32 APB0EN      : 1;    //!< APB0 Bridge Clock Enable
    u32 APB1EN      : 1;    //!< APB1 Bridge Clock Enable
    u32             : 2;
    u32 USBEN       : 1;    //!< USB Clock Enable
    u32 CKREFEN     : 1;    //!< CK_REF Clock Enable
    u32 EBIEN       : 1;    //!< EBI Clock Enable
    u32 CRCEN       : 1;    //!< CRC Clock Enable
    u32             : 2;
    u32 PAEN        : 1;    //!< GPIO Port A Clock Enable
    u32 PBEN        : 1;    //!< GPIO Port B Clock Enable
    u32 PCEN        : 1;    //!< GPIO Port C Clock Enable
    u32 PDEN        : 1;    //!< GPIO Port D Clock Enable
    u32 PEEN        : 1;    //!< GPIO Port E Clock Enable
    u32             : 11;
} STRUCT_REGISTER_END AHBCCR_reg;
STRUCT_SIZE_ASSERT(AHBCCR_reg, 4);

// APBCFGR
STRUCT_REGISTER_START {
    u32             : 16;
    u32 ADCDIV      : 3;    //!< A/D Converter Clock Frequency Division Selection
    u32             : 13;
} STRUCT_REGISTER_END APBCFGR_reg;
STRUCT_SIZE_ASSERT(APBCFGR_reg, 4);

// APBCCR0
STRUCT_REGISTER_START {
    u32 I2C0EN      : 1;    //!< I2C 0 Clock Enable
    u32 I2C1EN      : 1;    //!< I2C 1 Clock Enable
    u32             : 2;
    u32 SPI0EN      : 1;    //!< SPI 0 Clock Enable
    u32 SPI1EN      : 1;    //!< SPI 1 Clock Enable
    u32             : 2;
    u32 USR0EN      : 1;    //!< USART 0 Clock Enable
    u32 USR1EN      : 1;    //!< USART 1 Clock Enable
    u32 UR0EN       : 1;    //!< UART 0 Clock Enable
    u32 UR1EN       : 1;    //!< UART 1 Clock Enable
    u32             : 2;
    u32 AFIOEN      : 1;    //!< Alternate Function I/O Clock Enable
    u32 EXTIEN      : 1;    //!< External Interrupt Clock Enable
    u32             : 8;
    u32 SCIEN       : 1;    //!< Smart Card Interface Clock Enable
    u32 I2SEN       : 1;    //!< I2S Clock Enable
    u32             : 6;
} STRUCT_REGISTER_END APBCCR0_reg;
STRUCT_SIZE_ASSERT(APBCCR0_reg, 4);

// APBCCR1
STRUCT_REGISTER_START {
    u32 MCTM0EN     : 1;    //!< MCTM 0 Clock Enable
    u32 MCTM1EN     : 1;    //!< MCTM 1 Clock Enable
    u32             : 2;
    u32 WDTREN      : 1;    //!< Watchdog Timer Registers Access Enable
    u32             : 1;
    u32 BKPREN      : 1;    //!< Backup Domain Registers Access Enable
    u32             : 1;
    u32 GPTM0EN     : 1;    //!< GPTM 0 Clock Enable
    u32 GPTM1EN     : 1;    //!< GPTM 1 Clock Enable
    u32             : 6;
    u32 BFTM0EN     : 1;    //!< BFTM 0 Clock Enable
    u32 BFTM1EN     : 1;    //!< BFTM 1 Clock Enable
    u32             : 4;
    u32 OPA0EN      : 1;    //!< OPA/CMP 0 Clock Enable
    u32 OPA1EN      : 1;    //!< OPA/CMP 1 Clock Enable
    u32 ADCEN       : 1;    //!< ADC Clock Enable
    u32             : 7;
} STRUCT_REGISTER_END APBCCR1_reg;
STRUCT_SIZE_ASSERT(APBCCR1_reg, 4);

// CKST
STRUCT_REGISTER_START {
    u32             : 8;
    u32 PLLST       : 4;    //!< PLL Clock Occupation Status
    u32             : 4;
    u32 HSEST       : 2;    //!< High Speed External Clock Occupation Status
    u32             : 6;
    u32 HSIST       : 3;    //!< High Speed Internal Clock Occupation Status
    u32             : 3;
    u32 CKSWST      : 2;    //!< Clock Switch Status
} STRUCT_REGISTER_END CKST_reg;
STRUCT_SIZE_ASSERT(CKST_reg, 4);

// LPCR
STRUCT_REGISTER_START {
    u32 BKISO       : 1;    //!< Backup Domain Isolation Control
    u32             : 7;
    u32 USBSLEEP    : 1;    //!< USB Sleep Software Control Enable
    u32             : 23;
} STRUCT_REGISTER_END LPCR_reg;
STRUCT_SIZE_ASSERT(LPCR_reg, 4);

// MCUDBGCR
STRUCT_REGISTER_START {
    u32 DBSLP       : 1;    //!< Debug Sleep Mode
    u32 DBDSLP1     : 1;    //!< Debug Deep-Sleep1
    u32 DBPD        : 1;    //!< Debug Power-Down Mode
    u32 DBWDT       : 1;    //!< Watchdog Timer Debug Mode Enable
    u32 DBMCTM0     : 1;    //!< MCTM 0 Debug Mode Enable
    u32 DBMCTM1     : 1;    //!< MCTM 1 Debug Mode Enable
    u32 DBGPTM0     : 1;    //!< GPTM 0 Debug Mode Enable
    u32 DBGPTM1     : 1;    //!< GPTM 1 Debug Mode Enable
    u32 DBUSR0      : 1;    //!< USART 0 Debug Mode Enable
    u32 DBUSR1      : 1;    //!< USART 1 Debug Mode Enable
    u32 DBSPI0      : 1;    //!< SPI 0 Debug Mode Enable
    u32 DBSPI1      : 1;    //!< SPI 1 Debug Mode Enable
    u32 DBI2C0      : 1;    //!< I2C 0 Debug Mode Enable
    u32 DBI2C1      : 1;    //!< I2C 1 Debug Mode Enable
    u32 DBDSLP2     : 1;    //!< Debug Deep-Sleep2
    u32 DBSCI       : 1;    //!< SCI Debug Mode Enable
    u32 DBBFTM0     : 1;    //!< BFTM 0 Debug Mode Enable
    u32 DBBFTM1     : 1;    //!< BFTM 1 Debug Mode Enable
    u32 DBUR0       : 1;    //!< UART 0 Debug Mode Enable
    u32 DBUR1       : 1;    //!< UART 1 Debug Mode Enable
    u32 DBTRACE     : 1;    //!< TRACESWO Debug Mode Enable
    u32             : 11;
} STRUCT_REGISTER_END MCUDBGCR_reg;
STRUCT_SIZE_ASSERT(MCUDBGCR_reg, 4);

// CKCU
typedef struct {
    GCFGR_reg GCFGR;        //!< Global Clock Configuration
    GCCR_reg GCCR;          //!< Global Clock Control
    GCSR_reg GCSR;          //!< Global Clock Status
    GCIR_reg GCIR;          //!< Global Clock Interrupt
    u8 _pad1[0x8];

    // 0x018
    PLLCFGR_reg PLLCFGR;    //!< PLL Configuration
    PLLCR_reg PLLCR;        //!< PLL Control
    AHBCFGR_reg AHBCFGR;    //!< AHB Configuration
    AHBCCR_reg AHBCCR;      //!< AHB Clock Control
    APBCFGR_reg APBCFGR;    //!< APB Configuration
    APBCCR0_reg APBCCR0;    //!< APB Clock Control 0
    APBCCR1_reg APBCCR1;    //!< APB Clock Control 1
    CKST_reg CKST;          //!< Clock Source Status
    u8 _pad2[0x2c8];

    // 0x300
    LPCR_reg LPCR;          //!< Low Power Control
    MCUDBGCR_reg MCUDBGCR;  //!< MCU Debug Control
} CKCU_map;
STRUCT_SIZE_ASSERT(CKCU_map, 0x308);

#define REG_CKCU ((volatile CKCU_map *)CKCU_BASE)

STRUCT_REG_CHECK(CKCU, GCFGR);
STRUCT_REG_CHECK(CKCU, GCCR);
STRUCT_REG_CHECK(CKCU, GCSR);
STRUCT_REG_CHECK(CKCU, GCIR);
STRUCT_REG_CHECK(CKCU, PLLCFGR);
STRUCT_REG_CHECK(CKCU, PLLCR);
STRUCT_REG_CHECK(CKCU, AHBCFGR);
STRUCT_REG_CHECK(CKCU, AHBCCR);
STRUCT_REG_CHECK(CKCU, APBCFGR);
STRUCT_REG_CHECK(CKCU, APBCCR0);
STRUCT_REG_CHECK(CKCU, APBCCR1);
STRUCT_REG_CHECK(CKCU, CKST);
STRUCT_REG_CHECK(CKCU, LPCR);
STRUCT_REG_CHECK(CKCU, MCUDBGCR);

// Reset Control Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define RSTCU_GPSR          RSTCU_BASE + 0x100  // Global Reset Status
#define RSTCU_AHBPRSTR      RSTCU_BASE + 0x104  // AHB Peripheral Reset
#define RSTCU_APBPRSTR0     RSTCU_BASE + 0x108  // APB Peripheral Reset 0
#define RSTCU_APBPRSTR1     RSTCU_BASE + 0x10C  // APB Peripheral Reset 1

STRUCT_REGISTER_START {
    u32 SYSRSTF : 1;    //!< System Reset Flag
    u32 EXTRSTF : 1;    //!< External Pin Reset Flag
    u32 WDTRSTF : 1;    //!< Watchdog Timer Reset Flag
    u32 PORSTF  : 1;    //!< Core 1.8V Power On Reset Flag
    u32         : 28;
} STRUCT_REGISTER_END GPSR_reg;
STRUCT_SIZE_ASSERT(GPSR_reg, 4);

STRUCT_REGISTER_START {
    u32 DMARST  : 1;    //!< PDMA Reset Control
    u32         : 4;
    u32 USBRST  : 1;    //!< USB Reset Control
    u32 EBIRST  : 1;    //!< EBI Reset Control
    u32 CRCRST  : 1;    //!< CRC Reset Control
    u32 PARST   : 1;    //!< GPIO Port A Reset Control
    u32 PBRST   : 1;    //!< GPIO Port B Reset Control
    u32 PCRST   : 1;    //!< GPIO Port C Reset Control
    u32 PDRST   : 1;    //!< GPIO Port D Reset Control
    u32 PERST   : 1;    //!< GPIO Port E Reset Control
    u32         : 19;
} STRUCT_REGISTER_END AHBPRSTR_reg;
STRUCT_SIZE_ASSERT(AHBPRSTR_reg, 4);

STRUCT_REGISTER_START {
    u32 I2C0RST : 1;    //!< I2C 0 Reset Control
    u32 I2C1RST : 1;    //!< I2C 1 Reset Control
    u32         : 2;
    u32 SPI0RST : 1;    //!< SPI 0 Reset Control
    u32 SPI1RST : 1;    //!< SPI 1 Reset Control
    u32         : 2;
    u32 USR0RST : 1;    //!< USART 0 Reset Control
    u32 USR1RST : 1;    //!< USART 1 Reset Control
    u32 UR0RST  : 1;    //!< UART 0 Reset Control
    u32 UR1RST  : 1;    //!< UART 1 Reset Control
    u32         : 2;
    u32 AFIORST : 1;    //!< Alternate Function Reset Control
    u32 EXTIRST : 1;    //!< External Interface Reset Control
    u32         : 8;
    u32 SCIRST  : 1;    //!< SCI Reset Control
    u32 I2SRST  : 1;    //!< I2S Reset Control
    u32         : 6;
} STRUCT_REGISTER_END APBPRSTR0_reg;
STRUCT_SIZE_ASSERT(APBPRSTR0_reg, 4);

STRUCT_REGISTER_START {
    u32 MCTM0RST    : 1;    //!< MCTM 0 Reset Control
    u32 MCTM1RST    : 1;    //!< MCTM 1 Reset Control
    u32             : 2;
    u32 WDTRST      : 1;    //!< Watchdog Reset Control
    u32             : 3;
    u32 GPTM0RST    : 1;    //!< GPTM 0 Reset Control
    u32 GPTM1RST    : 1;    //!< GPTM 1 Reset Control
    u32             : 6;
    u32 BFTM0RST    : 1;    //!< BFTM 0 Reset Control
    u32 BFTM1RST    : 1;    //!< BFTM 1 Reset Control
    u32             : 4;
    u32 OPA0RST     : 1;    //!< Comparator and OPA 0 Controller Reset Control
    u32 OPA1RST     : 1;    //!< Comparator and OPA 1 Controller Reset Control
    u32 ADCRST      : 1;    //!< A/D Converter Reset Control
    u32             : 7;
} STRUCT_REGISTER_END APBPRSTR1_reg;
STRUCT_SIZE_ASSERT(APBPRSTR1_reg, 4);

typedef struct {
    u8 _pad1[0x100];
    GPSR_reg GPSR;              //!< Global Reset Status
    AHBPRSTR_reg AHBPRSTR;      //!< AHB Peripheral Reset
    APBPRSTR0_reg APBPRSTR0;    //!< APB Peripheral Reset 0
    APBPRSTR1_reg APBPRSTR1;    //!< APB Peripheral Reset 1
} RSTCU_map;
STRUCT_SIZE_ASSERT(RSTCU_map, 0x110);

#define REG_RSTCU ((volatile RSTCU_map *)RSTCU_BASE)

STRUCT_REG_CHECK(RSTCU, GPSR);
STRUCT_REG_CHECK(RSTCU, AHBPRSTR);
STRUCT_REG_CHECK(RSTCU, APBPRSTR0);
STRUCT_REG_CHECK(RSTCU, APBPRSTR1);

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
