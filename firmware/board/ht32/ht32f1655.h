#ifndef HT32F1655_H
#define HT32F1655_H

#include "ht32f165x.h"

#define FLASH_SIZE      0x20000 // 128k
#define SRAM_SIZE       0x8000  // 32k

// Peripherals
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_A_BASE     0x400B0000
#define GPIO_B_BASE     0x400B2000
#define GPIO_C_BASE     0x400B4000
#define GPIO_D_BASE     0x400B6000
#define GPIO_E_BASE     0x400B8000

// Constants
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_A          0
#define GPIO_B          1
#define GPIO_C          2
#define GPIO_D          3
#define GPIO_E          4

#define CLOCK_PA        TYPE_AHB | (1 << 16)
#define CLOCK_PB        TYPE_AHB | (1 << 17)
#define CLOCK_PC        TYPE_AHB | (1 << 18)
#define CLOCK_PD        TYPE_AHB | (1 << 19)
#define CLOCK_PE        TYPE_AHB | (1 << 20)

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

#define AFIO_GPECFGLR   AFIO_GPxCFGLR(GPIO_E)
#define AFIO_GPECFGHR   AFIO_GPxCFGHR(GPIO_E)

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

    GPxCFGLR_reg GPECFGLR;
    GPxCFGHR_reg GPECFGHR;
} AFIO_map;
STRUCT_SIZE_ASSERT(AFIO_map, 0x48);

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
STRUCT_REG_CHECK(AFIO, GPECFGLR);
STRUCT_REG_CHECK(AFIO, GPECFGHR);

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
    u32 TOC     : 32;    //!< Time Out Counter
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

#define REG_SPI0 ((volatile SPI_map *)SPI0_BASE)
#define REG_SPI1 ((volatile SPI_map *)SPI1_BASE)

STRUCT_ADDR_ASSERT(REG_SPI0->SPICR0, SPI_SPICR0);
STRUCT_ADDR_ASSERT(REG_SPI0->SPICR1, SPI_SPICR1);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIIER, SPI_SPIIER);
STRUCT_ADDR_ASSERT(REG_SPI0->SPICPR, SPI_SPICPR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIDR, SPI_SPIDR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPISR, SPI_SPISR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIFCR, SPI_SPIFCR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIFSR, SPI_SPIFSR);
STRUCT_ADDR_ASSERT(REG_SPI0->SPIFTOCR, SPI_SPIFTOCR);

#endif // HT32F1655_H
