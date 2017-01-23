#ifndef HT32F165X_H
#define HT32F165X_H

#include "../../types.h"

#define REG(A) (*(u32*)(A))

// General Purpose Timers
#define GPTM0_BASE      0x4006E000
#define GPTM1_BASE      0x4006F000

// Basic Function Timers
#define BFTM0_BASE      0x40076000
#define BFTM1_BASE      0x40077000

// Motor Control Timers
#define MCTM0_BASE      0x4002C000
#define MCTM1_BASE      0x4002D000

// Operational Amplifier
// Comparator
#define OPA_BASE        0x40018000
#define CMP_BASE        0x40018000

// Alternate Function I/O Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define AFIO_BASE       0x40022000

#define AFIO_ESSR0      AFIO_BASE + 0x0
#define AFIO_ESSR1      AFIO_BASE + 0x4

#define AFIO_GPnCFGLR(n)    AFIO_BASE + 0x20 + (n * 0x8)    // GPIO Port n Configuration 0
#define AFIO_GPnCFGHR(n)    AFIO_BASE + 0x24 + (n * 0x8)    // GPIO Port n Configuration 1

// External Interrupt/Event Controller
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define EXTI_BASE       0x40024000

// Watchdog Timer
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define WDT_BASE        0x40068000

#define WDT_WDTCR       WDT_BASE + 0x0      // Watchdog Timer Control
#define WDT_WDTMR0      WDT_BASE + 0x4      // Watchdog Timer Mode 0
#define WDT_WDTMR1      WDT_BASE + 0x8      // Watchdog Timer Mode 1
#define WDT_WDTSR       WDT_BASE + 0xC      // Watchdog Timer Status
#define WDT_WDTPR       WDT_BASE + 0x10     // Watchdog Timer Protection
#define WDT_WDTCNTR     WDT_BASE + 0x14     // Watchdog Timer Counter
#define WDT_WDTCSR      WDT_BASE + 0x18     // Watchdog Timer Clock Selection

// Real Time Clock
// Power Control Unit
#define RTC_BASE        0x4006A000
#define PWRCU_BASE      0x4006A000

// Flash Memory Controller
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define FMC_BASE        0x40080000

#define FMC_TADR        FMC_BASE + 0x0      // Flash Target Address
#define FMC_WRDR        FMC_BASE + 0x4      // Flash Write Data
#define FMC_OCMR        FMC_BASE + 0xC      // Flash Operation Command
#define FMC_OPCR        FMC_BASE + 0x10     // Flash Operation Control
#define FMC_OIER        FMC_BASE + 0x14     // Flash Operation Interrupt Enable
#define FMC_OISE        FMC_BASE + 0x18     // Flash Operation Interrupt Status

#define FMC_PPSR_0      FMC_BASE + 0x20     // Flash Pages Erase / Program Protection Status
#define FMC_PPSR_1      FMC_BASE + 0x24
#define FMC_PPSR_2      FMC_BASE + 0x28
#define FMC_PPSR_3      FMC_BASE + 0x2C

#define FMC_CPSR        FMC_BASE + 0x30     // Flash Security Protection Status
#define FMC_VMCR        FMC_BASE + 0x100    // Flash Vector Mapping Control
#define FMC_CFCR        FMC_BASE + 0x200    // Flash Cache and Pre-fetch Control

#define FMC_SBVT0       FMC_BASE + 0x300    // SRAM Booting Vector 0 (Stack Point)
#define FMC_SBVT1       FMC_BASE + 0x304    // SRAM Booting Vector 1 (Program Counter)
#define FMC_SBVT2       FMC_BASE + 0x308    // SRAM Booting Vector 2 (NMI Handler)
#define FMC_SBVT3       FMC_BASE + 0x30C    // SRAM Booting Vector 3 (Hard Fault Handler)

// Clock Control Unit
// Reset Control Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define CKCU_BASE       0x40088000
#define RSTCU_BASE      0x40088000

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

// CRC
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define CRC_BASE        0x4008A000

// Peripheral Direct Memory Access
#define PDMA_BASE       0x40090000

// General Purpose I/O
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPIO_A_BASE     0x400B0000

#define GPIO_A          0
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

// USART
#define UART0_BASE      0x40001000
#define UART1_BASE      0x40041000

// UART
#define USART0_BASE     0x40000000
#define USART1_BASE     0x40040000

// SPI
#define SPI0_BASE       0x40004000
#define SPI1_BASE       0x40044000

// I2C
#define I2C0_BASE       0x40048000
#define I2C1_BASE       0x40049000

// Inter-IC Sound
#define I2S_BASE        0x40026000

// Smart Card Interface
#define SCI_BASE        0x40043000

// Extend Bus Interface
#define EBI_BASE        0x40098000

// USB
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define USB_BASE        0x400A8000
#define USB_SRAM_BASE   0x400AA000

#define EP_0            0
#define EP_1            1
#define EP_2            2
#define EP_3            3
#define EP_4            4
#define EP_5            5
#define EP_6            6
#define EP_7            7
#define EPn_BASE(n)     USB_BASE + (n * 0x14)

#define USB_USBCSR      USB_BASE + 0x0      // USB Control and Status
#define USB_USBIER      USB_BASE + 0x4      // USB Interrupt Enable
#define USB_USBISR      USB_BASE + 0x8      // USB Interrupt Status
#define USB_USBFCR      USB_BASE + 0xC      // USB Frame Count
#define USB_USBDEVAR    USB_BASE + 0x10     // USB Device Address

#define USB_USBEPnCSR(n)    EPn_BASE(n) + 0x14  // USB Endpoint n Control and Status
#define USB_USBEPnIER(n)    EPn_BASE(n) + 0x18  // USB Endpoint n Interrupt Enable
#define USB_USBEPnISR(n)    EPn_BASE(n) + 0x1C  // USB Endpoint n Interrupt Status
#define USB_USBEPnTCR(n)    EPn_BASE(n) + 0x20  // USB Endpoint n Transfer Count
#define USB_USBEPnCFGR(n)   EPn_BASE(n) + 0x24  // USB Endpoint n Configuration


// Analog To Digital Converter
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define ADC_BASE        0x40010000


// Nested Vectored Interrupt Controller
#define NVIC_BASE       0xE000E000


void wdt_reload();
void gpio_set_input_enable(int port, int pin, int en);
void gpio_set_pin_pull_up_down(int port, int pin, int mode);
void afio_pin_config(int port, int pin, int function);


#endif // HT32F165X_H
