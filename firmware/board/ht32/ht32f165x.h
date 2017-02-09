#ifndef HT32F165X_H
#define HT32F165X_H

#include "../types.h"

#define REG(A) (*(volatile u32*)(A))

#define STRUCT_ASSERT_MSG(N) "incorrect packed struct " #N " size"
#define STRUCT_SIZE_ASSERT(N, S) _Static_assert(sizeof(N) == S, STRUCT_ASSERT_MSG(N))

#define STRUCT_REGISTER_START typedef union { struct
#define STRUCT_REGISTER_END __attribute__((__packed__)); u32 word; }

// General Purpose Timers
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define GPTM0_BASE      0x4006E000
#define GPTM1_BASE      0x4006F000

// Basic Function Timers
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define BFTM0_BASE      0x40076000
#define BFTM1_BASE      0x40077000

// Motor Control Timers
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define MCTM0_BASE      0x4002C000
#define MCTM1_BASE      0x4002D000

// Operational Amplifier
// Comparator
// ////////////////////////////////////////////////////////////////////////////////////////////////
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
// ////////////////////////////////////////////////////////////////////////////////////////////////
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

// OCMR
#define FMCOCMR_IDLE            0
#define FMCOCMR_WORD_PROGRAM    0x4
#define FMCOCMR_PAGE_ERASE      0x8
#define FMCOCMR_MASS_ERASE      0xA

// OPCR
#define FMCOPCR_IDLE        (0x6 << 1)
#define FMCOPCR_COMMIT      (0xA << 1)
#define FMCOPCR_FINISHED    (0xE << 1)

STRUCT_REGISTER_START {

} STRUCT_REGISTER_END TADR_reg;
STRUCT_SIZE_ASSERT(TADR_reg, 4);

typedef struct {
    u32 TADR;
    u32 WRDR;
    u8 _pad1[4];

    // 0x00C
    u32 OCMR;
    u32 OPCR;
    u32 OIER;
    u32 OISR;
    u8 _pad2[4];

    // 0x020
    u32 PPSR[4];
    u32 CPSR;
    u8 _pad3[0xCC];

    // 0x100
    u32 VMCR;
    u8 _pad4[0xFC];

    // 0x200
    u32 CFCR;
    u8 _pad5[0xFC];

    // 0x300
    u32 SBVT0;
    u32 SBVT1;
    u32 SBVT2;
    u32 SBVT3;
} FMC_map;
STRUCT_SIZE_ASSERT(FMC_map, 0x310);

// Clock Control Unit
// Reset Control Unit
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define CKCU_BASE       0x40088000
#define RSTCU_BASE      0x40088000

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
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define UART0_BASE      0x40001000
#define UART1_BASE      0x40041000

// UART
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define USART0_BASE     0x40000000
#define USART1_BASE     0x40040000

// SPI
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define SPI0_BASE       0x40004000
#define SPI1_BASE       0x40044000

// I2C
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define I2C0_BASE       0x40048000
#define I2C1_BASE       0x40049000

// Inter-IC Sound
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define I2S_BASE        0x40026000

// Smart Card Interface
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define SCI_BASE        0x40043000

// Extend Bus Interface
// ////////////////////////////////////////////////////////////////////////////////////////////////
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
#define USB_USBDEVA     USB_BASE + 0x10     // USB Device Address

#define USB_USBEPnCSR(n)    EPn_BASE(n) + 0x14  // USB Endpoint n Control and Status
#define USB_USBEPnIER(n)    EPn_BASE(n) + 0x18  // USB Endpoint n Interrupt Enable
#define USB_USBEPnISR(n)    EPn_BASE(n) + 0x1C  // USB Endpoint n Interrupt Status
#define USB_USBEPnTCR(n)    EPn_BASE(n) + 0x20  // USB Endpoint n Transfer Count
#define USB_USBEPnCFGR(n)   EPn_BASE(n) + 0x24  // USB Endpoint n Configuration

// USBCSR
#define USBCSR_FRES     ((u32)0x002)        // Force USB Reset Control
#define USBCSR_PDWN     ((u32)0x004)        // Power Down Mode Control
#define USBCSR_LPMODE   ((u32)0x008)        // Low-Power Mode Control
#define USBCSR_GENRSM   ((u32)0x020)        // Resume Request Generation Control
#define USBCSR_RXDP     ((u32)0x040)        // Received DP Line Status
#define USBCSR_RXDM     ((u32)0x080)        // Received DM Line Status
#define USBCSR_ADRSET   ((u32)0x100)        // Device Address Setting Control
#define USBCSR_SRAMRSTC ((u32)0x200)        // USB SRAM Reset Condition
#define USBCSR_DPPUEN   ((u32)0x400)        // DP Pull Up Enable
#define USBCSR_DPWKEN   ((u32)0x800)        // DP Wake Up Enable

// USBIER
#define USBIER_UGIE     ((u32)0x0001)       // USB global Interrupt Enable
#define USBIER_SOFIE    ((u32)0x0002)       // Start Of Frame Interrupt Enable
#define USBIER_URSTIE   ((u32)0x0004)       // USB Reset Interrupt Enable
#define USBIER_RSMIE    ((u32)0x0008)       // Resume Interrupt Enable
#define USBIER_SUSPIE   ((u32)0x0010)       // Suspend Interrupt Enable
#define USBIER_ESOFIE   ((u32)0x0020)       // Expected Start Of Frame Enable
#define USBIER_EP0IE    ((u32)0x0100)       // Endpoint 0 Interrupt Enable
#define USBIER_EP1IE    ((u32)0x0200)       // Endpoint 1 Interrupt Enable
#define USBIER_EP2IE    ((u32)0x0400)       // Endpoint 2 Interrupt Enable
#define USBIER_EP3IE    ((u32)0x0800)       // Endpoint 3 Interrupt Enable
#define USBIER_EP4IE    ((u32)0x1000)       // Endpoint 4 Interrupt Enable
#define USBIER_EP5IE    ((u32)0x2000)       // Endpoint 5 Interrupt Enable
#define USBIER_EP6IE    ((u32)0x4000)       // Endpoint 6 Interrupt Enable
#define USBIER_EP7IE    ((u32)0x8000)       // Endpoint 7 Interrupt Enable

// USBISR
#define USBISR_SOFIF    ((u32)0x0002)       // Start Of Frame Interrupt Flag
#define USBISR_URSTIF   ((u32)0x0004)       // USB Reset Interrupt Flag
#define USBISR_RSMIF    ((u32)0x0008)       // Resume Interrupt Flag
#define USBISR_SUSPIF   ((u32)0x0010)       // Suspend Interrupt Flag
#define USBISR_ESOFIF   ((u32)0x0020)       // Expected Start Of Frame Interrupt
#define USBISR_EP0IF    ((u32)0x0100)       // Endpoint 0 Interrupt Flag
#define USBISR_EP1IF    ((u32)0x0200)       // Endpoint 1 Interrupt Flag
#define USBISR_EP2IF    ((u32)0x0400)       // Endpoint 2 Interrupt Flag
#define USBISR_EP3IF    ((u32)0x0800)       // Endpoint 3 Interrupt Flag
#define USBISR_EP4IF    ((u32)0x1000)       // Endpoint 4 Interrupt Flag
#define USBISR_EP5IF    ((u32)0x2000)       // Endpoint 5 Interrupt Flag
#define USBISR_EP6IF    ((u32)0x4000)       // Endpoint 6 Interrupt Flag
#define USBISR_EP7IF    ((u32)0x8000)       // Endpoint 7 Interrupt Flag
#define USBISR_EPnIF    ((u32)0xFF00)       // Endpoint Interrupt Mask

// USBCFGR
#define USBCFGR_FRNUM   ((u32)0x3FF)        // Frame Number
#define USBCFGR_SOFLCK  ((u32)1 << 16)      // Start-of-Frame Lock Flag
#define USBCFGR_LSOF    ((u32)0x3 << 17)    // Lost Start-of-Frame Number

// USBEPnCSR
#define EPnCSR_DTGTX    ((u32)0x01)         // Data Toggle Status, for IN transfer
#define EPnCSR_NAKTX    ((u32)0x02)         // NAK Status, for IN transfer
#define EPnCSR_STLTX    ((u32)0x04)         // STALL Status, for IN transfer
#define EPnCSR_DTGRX    ((u32)0x08)         // Data Toggle Status, for OUT transfer
#define EPnCSR_NAKRX    ((u32)0x10)         // NAK Status, for OUT transfer
#define EPnCSR_STLRX    ((u32)0x20)         // STALL Status, for OUT transfer

// USBEPnIER
#define EPnIER_OTRXIE   ((u32)0x001)        // OUT Token Received Interrupt Enable
#define EPnIER_ODRXIE   ((u32)0x002)        // OUT Data Received Interrupt Enable
#define EPnIER_ODOVIE   ((u32)0x004)        // OUT Data Buffer Overrun Interrupt Enable
#define EPnIER_ITRXIE   ((u32)0x008)        // IN Token Received Interrupt Enable
#define EPnIER_IDTXIE   ((u32)0x010)        // IN Data Transmitted Interrupt Enable
#define EPnIER_NAKIE    ((u32)0x020)        // NAK Transmitted Interrupt Enable
#define EPnIER_STLIE    ((u32)0x040)        // STALL Transmitted Interrupt Enable
#define EPnIER_UERIE    ((u32)0x080)        // USB Error Interrupt Enable
#define EPnIER_STRXIE   ((u32)0x100)        // SETUP Token Received Interrupt Enable
#define EPnIER_SDRXIE   ((u32)0x200)        // SETUP Data Received Interrupt Enable
#define EPnIER_SDERIE   ((u32)0x400)        // SETUP Data Error Interrupt Enable
#define EPnIER_ZLRXIE   ((u32)0x800)        // Zero Length Data Received Interrupt Enable

// USBEPnISR
#define EPnISR_OTRXIF   ((u32)0x001)        // OUT Token Received Interrupt Flag
#define EPnISR_ODRXIF   ((u32)0x002)        // OUT Data Received Interrupt Flag
#define EPnISR_ODOVIF   ((u32)0x004)        // OUT Data Buffer Overrun Interrupt Flag
#define EPnISR_ITRXIF   ((u32)0x008)        // IN Token Received Interrupt Flag
#define EPnISR_IDTXIF   ((u32)0x010)        // IN Data Transmitted Interrupt Flag
#define EPnISR_NAKIF    ((u32)0x020)        // NAK Transmitted Interrupt Flag
#define EPnISR_STLIF    ((u32)0x040)        // STALL Transmitted Interrupt Flag
#define EPnISR_UERIF    ((u32)0x080)        // USB Error Interrupt Flag
#define EPnISR_STRXIF   ((u32)0x100)        // SETUP Token Received Interrupt Flag
#define EPnISR_SDRXIF   ((u32)0x200)        // SETUP Data Received Interrupt Flag
#define EPnISR_SDERIF   ((u32)0x400)        // SETUP Data Error Interrupt Flag
#define EPnISR_ZLRXIF   ((u32)0x800)        // Zero Length Data Received Interrupt Flag

// USBEPnTCR
#define EPnTCR_TCNT     ((u32)0x1FF)        // Transfer Byte Count

// USBEPnCFGR
#define EPnCFGR_EPEN    ((u32)(1 << 31))    // Endpoint Enable
#define EPnCFGR_EPTYPE  ((u32)(1 << 29))    // Transfer Type
#define EPnCFGR_EPDIR   ((u32)(1 << 28))    // Transfer Direction
#define EPnCFGR_EPADR   ((u32)(0xF << 24))  // Endpoint Address
#define EPnCFGR_EPLEN   ((u32)(0x7F << 10)) // Buffer Length
#define EPnCFGR_EPBUFA  ((u32)(0x3FF))      // Endpoint Buffer Address

// USBCSR
STRUCT_REGISTER_START {
    u32             : 1;
    u32 FRES        : 1;    //!< Force USB Reset Control
    u32 PDWN        : 1;    //!< Power Down Mode Control
    u32 LPMODE      : 1;    //!< Low-Power Mode Control
    u32             : 1;
    u32 GENRSM      : 1;    //!< Resume Request Generation Control
    u32 RXDP        : 1;    //!< Received DP Line Status
    u32 RXDM        : 1;    //!< Received DM Line Status
    u32 ADRSET      : 1;    //!< Device Address Setting Control
    u32 SRAMRSTC    : 1;    //!< USB SRAM Reset Condition
    u32 DPPUEN      : 1;    //!< DP Pull Up Enable
    u32 DPWKEN      : 1;    //!< DP Wake Up Enable
    u32             : 20;
} STRUCT_REGISTER_END USBCSR_reg;
STRUCT_SIZE_ASSERT(USBCSR_reg, 4);

// USBIER
STRUCT_REGISTER_START {
    u32 UGIE        : 1;    //!< USB global Interrupt Enable
    u32 SOFIE       : 1;    //!< Start Of Frame Interrupt Enable
    u32 URSTIE      : 1;    //!< USB Reset Interrupt Enable
    u32 RSMIE       : 1;    //!< Resume Interrupt Enable
    u32 SUSPIE      : 1;    //!< Suspend Interrupt Enable
    u32 ESOFIE      : 1;    //!< Expected Start Of Frame Enable
    u32             : 1;
    u32 EP0IE       : 1;    //!< Endpoint 0 Interrupt Enable
    u32 EP1IE       : 1;    //!< Endpoint 1 Interrupt Enable
    u32 EP2IE       : 1;    //!< Endpoint 2 Interrupt Enable
    u32 EP3IE       : 1;    //!< Endpoint 3 Interrupt Enable
    u32 EP4IE       : 1;    //!< Endpoint 4 Interrupt Enable
    u32 EP5IE       : 1;    //!< Endpoint 5 Interrupt Enable
    u32 EP6IE       : 1;    //!< Endpoint 6 Interrupt Enable
    u32 EP7IE       : 1;    //!< Endpoint 7 Interrupt Enable
    u32             : 16;
} STRUCT_REGISTER_END USBIER_reg;
STRUCT_SIZE_ASSERT(USBIER_reg, 4);

// USBISR
STRUCT_REGISTER_START {
    u32             : 1;
    u32 SOFIF       : 1;    //!< Start Of Frame Interrupt Flag
    u32 URSTIF      : 1;    //!< USB Reset Interrupt Flag
    u32 RSMIF       : 1;    //!< Resume Interrupt Flag
    u32 SUSPIF      : 1;    //!< Suspend Interrupt Flag
    u32 ESOFIF      : 1;    //!< Expected Start Of Frame Interrupt
    u32             : 1;
    u32 EP0IF       : 1;    //!< Endpoint 0 Interrupt Flag
    u32 EP1IF       : 1;    //!< Endpoint 1 Interrupt Flag
    u32 EP2IF       : 1;    //!< Endpoint 2 Interrupt Flag
    u32 EP3IF       : 1;    //!< Endpoint 3 Interrupt Flag
    u32 EP4IF       : 1;    //!< Endpoint 4 Interrupt Flag
    u32 EP5IF       : 1;    //!< Endpoint 5 Interrupt Flag
    u32 EP6IF       : 1;    //!< Endpoint 6 Interrupt Flag
    u32 EP7IF       : 1;    //!< Endpoint 7 Interrupt Flag
    u32             : 16;
} STRUCT_REGISTER_END USBISR_reg;
STRUCT_SIZE_ASSERT(USBISR_reg, 4);

// USBFCR
STRUCT_REGISTER_START {
    u32 FRNUM       : 11;   //!< Frame Number
    u32             : 5;
    u32 SOFLCK      : 1;    //!< Start-of-Frame Lock Flag
    u32 LSOF        : 2;    //!< Lost Start-of-Frame Number
    u32             : 13;
} STRUCT_REGISTER_END USBFCR_reg;
STRUCT_SIZE_ASSERT(USBFCR_reg, 4);

// USBDEVAR
STRUCT_REGISTER_START {
    u32 DEVA        : 7;    //!< Device Address
    u32             : 25;
} STRUCT_REGISTER_END USBDEVAR_reg;
STRUCT_SIZE_ASSERT(USBDEVAR_reg, 4);

// USBEP0CSR
STRUCT_REGISTER_START {
    u32 DTGTX       : 1;    //!< Data Toggle Status, for IN transfer
    u32 NAKTX       : 1;    //!< NAK Status, for IN transfer
    u32 STLTX       : 1;    //!< STALL Status, for IN transfer
    u32 DTGRX       : 1;    //!< Data Toggle Status, for OUT transfer
    u32 NAKRX       : 1;    //!< NAK Status, for OUT transfer
    u32 STLRX       : 1;    //!< STALL Status, for OUT transfer
    u32             : 26;
} STRUCT_REGISTER_END USBEP0CSR_reg;
STRUCT_SIZE_ASSERT(USBEP0CSR_reg, 4);

// USBEP0IER
STRUCT_REGISTER_START {
    u32 OTRXIE      : 1;    //!< OUT Token Received Interrupt Enable
    u32 ODRXIE      : 1;    //!< OUT Data Received Interrupt Enable
    u32 ODOVIE      : 1;    //!< OUT Data Buffer Overrun Interrupt Enable
    u32 ITRXIE      : 1;    //!< IN Token Received Interrupt Enable
    u32 IDTXIE      : 1;    //!< IN Data Transmitted Interrupt Enable
    u32 NAKIE       : 1;    //!< NAK Transmitted Interrupt Enable
    u32 STLIE       : 1;    //!< STALL Transmitted Interrupt Enable
    u32 UERIE       : 1;    //!< USB Error Interrupt Enable
    u32 STRXIE      : 1;    //!< SETUP Token Received Interrupt Enable
    u32 SDRXIE      : 1;    //!< SETUP Data Received Interrupt Enable
    u32 SDERIE      : 1;    //!< SETUP Data Error Interrupt Enable
    u32 ZLRXIE      : 1;    //!< Zero Length Data Received Interrupt Enable
    u32             : 20;
} STRUCT_REGISTER_END USBEP0IER_reg;
STRUCT_SIZE_ASSERT(USBEP0IER_reg, 4);

// USBEP0ISR
STRUCT_REGISTER_START {
    u32 OTRXIF      : 1;    //!< OUT Token Received Interrupt Flag
    u32 ODRXIF      : 1;    //!< OUT Data Received Interrupt Flag
    u32 ODOVIF      : 1;    //!< OUT Data Buffer Overrun Interrupt Flag
    u32 ITRXIF      : 1;    //!< IN Token Received Interrupt Flag
    u32 IDTXIF      : 1;    //!< IN Data Transmitted Interrupt Flag
    u32 NAKIF       : 1;    //!< NAK Transmitted Interrupt Flag
    u32 STLIF       : 1;    //!< STALL Transmitted Interrupt Flag
    u32 UERIF       : 1;    //!< USB Error Interrupt Flag
    u32 STRXIF      : 1;    //!< SETUP Token Received Interrupt Flag
    u32 SDRXIF      : 1;    //!< SETUP Data Received Interrupt Flag
    u32 SDERIF      : 1;    //!< SETUP Data Error Interrupt Flag
    u32 ZLRXIF      : 1;    //!< Zero Length Data Received Interrupt Flag
    u32             : 20;
} STRUCT_REGISTER_END USBEP0ISR_reg;
STRUCT_SIZE_ASSERT(USBEP0ISR_reg, 4);

// USBEP0TCR
STRUCT_REGISTER_START {
    u32 TXCNT       : 7;    //!< Transmission Byte Count
    u32             : 9;
    u32 RXCNT       : 7;    //!< Reception Byte Count
    u32             : 9;
} STRUCT_REGISTER_END USBEP0TCR_reg;
STRUCT_SIZE_ASSERT(USBEP0TCR_reg, 4);

// USBEP0CFGR
STRUCT_REGISTER_START {
    u32 EPBUFA      : 10;   //!< Endpoint Buffer Address
    u32 EPLEN       : 7;    //!< Endpoint Buffer Length
    u32             : 7;
    u32 EPADR       : 4;    //!< Endpoint Address
    u32             : 3;
    u32 EPEN        : 1;    //!< Endpoint Enable Control
} STRUCT_REGISTER_END USBEP0CFGR_reg;

STRUCT_SIZE_ASSERT(USBEP0CFGR_reg, 4);

// USBEPnCSR_1_3
STRUCT_REGISTER_START {
    u32 DTGTX       : 1;    //!< Data Toggle Status, for IN transfer
    u32 NAKTX       : 1;    //!< NAK Status, for IN transfer
    u32 STLTX       : 1;    //!< STALL Status, for IN transfer
    u32 DTGRX       : 1;    //!< Data Toggle Status, for OUT transfer
    u32 NAKRX       : 1;    //!< NAK Status, for OUT transfer
    u32 STLRX       : 1;    //!< STALL Status, for OUT transfer
    u32             : 26;
} STRUCT_REGISTER_END USBEPnCSR_1_3_reg;

STRUCT_SIZE_ASSERT(USBEPnCSR_1_3_reg, 4);

// USBEPnIER_1_3
STRUCT_REGISTER_START {
    u32 OTRXIE      : 1;    //!< OUT Token Received Interrupt Enable
    u32 ODRXIE      : 1;    //!< OUT Data Received Interrupt Enable
    u32 ODOVIE      : 1;    //!< OUT Data Buffer Overrun Interrupt Enable
    u32 ITRXIE      : 1;    //!< IN Token Received Interrupt Enable
    u32 IDTXIE      : 1;    //!< IN Data Transmitted Interrupt Enable
    u32 NAKIE       : 1;    //!< NAK Transmitted Interrupt Enable
    u32 STLIE       : 1;    //!< STALL Transmitted Interrupt Enable
    u32 UERIE       : 1;    //!< USB Error Interrupt Enable
    u32             : 24;
} STRUCT_REGISTER_END USBEPnIER_1_3_reg;

STRUCT_SIZE_ASSERT(USBEPnIER_1_3_reg, 4);

// USBEPnISR_1_3
STRUCT_REGISTER_START {
    u32 OTRXIF      : 1;    //!< OUT Token Received Interrupt Flag
    u32 ODRXIF      : 1;    //!< OUT Data Received Interrupt Flag
    u32 ODOVIF      : 1;    //!< OUT Data Buffer Overrun Interrupt Flag
    u32 ITRXIF      : 1;    //!< IN Token Received Interrupt Flag
    u32 IDTXIF      : 1;    //!< IN Data Transmitted Interrupt Flag
    u32 NAKIF       : 1;    //!< NAK Transmitted Interrupt Flag
    u32 STLIF       : 1;    //!< STALL Transmitted Interrupt Flag
    u32 UERIF       : 1;    //!< USB Error Interrupt Flag
    u32             : 24;
} STRUCT_REGISTER_END USBEPnISR_1_3_reg;

STRUCT_SIZE_ASSERT(USBEPnISR_1_3_reg, 4);

// USBEPnTCR_1_3
STRUCT_REGISTER_START {
    u32 TCNT        : 9;    //!< Transfer Byte Count
    u32             : 23;
} STRUCT_REGISTER_END USBEPnTCR_1_3_reg;

STRUCT_SIZE_ASSERT(USBEPnTCR_1_3_reg, 4);

// USBEPnCFGR_1_3
STRUCT_REGISTER_START {
    u32 EPBUFA      : 10;   //!< Endpoint Buffer Address
    u32 EPLEN       : 7;    //!< Endpoint Buffer Length
    u32             : 7;
    u32 EPADR       : 4;    //!< Endpoint Address
    u32 EPDIR       : 1;    //!< Transfer Direction
    u32 EPTYPE      : 1;    //!< Transfer Type
    u32             : 1;
    u32 EPEN        : 1;    //!< Enable Control
} STRUCT_REGISTER_END USBEPnCFGR_1_3_reg;

STRUCT_SIZE_ASSERT(USBEPnCFGR_1_3_reg, 4);

// USBEPnCSR_4_7
STRUCT_REGISTER_START {
    u32 DTGTX       : 1;    //!< Data Toggle Status, for IN transfer
    u32 NAKTX       : 1;    //!< NAK Status, for IN transfer
    u32 STLTX       : 1;    //!< STALL Status, for IN transfer
    u32 DTGRX       : 1;    //!< Data Toggle Status, for OUT transfer
    u32 NAKRX       : 1;    //!< NAK Status, for OUT transfer
    u32 STLRX       : 1;    //!< STALL Status, for OUT transfer
    u32 MDBTG       : 1;    //!< MCU Double Buffer Toggle
    u32 UDBTG       : 1;    //!< USB Double Buffer Toggle
    u32             : 24;
} STRUCT_REGISTER_END USBEPnCSR_4_7_reg;

STRUCT_SIZE_ASSERT(USBEPnCSR_4_7_reg, 4);

// USBEPnIER_4_7
STRUCT_REGISTER_START {
    u32 OTRXIE      : 1;    //!< OUT Token Received Interrupt Enable
    u32 ODRXIE      : 1;    //!< OUT Data Received Interrupt Enable
    u32 ODOVIE      : 1;    //!< OUT Data Buffer Overrun Interrupt Enable
    u32 ITRXIE      : 1;    //!< IN Token Received Interrupt Enable
    u32 IDTXIE      : 1;    //!< IN Data Transmitted Interrupt Enable
    u32 NAKIE       : 1;    //!< NAK Transmitted Interrupt Enable
    u32 STLIE       : 1;    //!< STALL Transmitted Interrupt Enable
    u32 UERIE       : 1;    //!< USB Error Interrupt Enable
    u32             : 24;
} STRUCT_REGISTER_END USBEPnIER_4_7_reg;

STRUCT_SIZE_ASSERT(USBEPnIER_4_7_reg, 4);

// USBEPnISR_4_7
STRUCT_REGISTER_START {
    u32 OTRXIF      : 1;    //!< OUT Token Received Interrupt Flag
    u32 ODRXIF      : 1;    //!< OUT Data Received Interrupt Flag
    u32 ODOVIF      : 1;    //!< OUT Data Buffer Overrun Interrupt Flag
    u32 ITRXIF      : 1;    //!< IN Token Received Interrupt Flag
    u32 IDTXIF      : 1;    //!< IN Data Transmitted Interrupt Flag
    u32 NAKIF       : 1;    //!< NAK Transmitted Interrupt Flag
    u32 STLIF       : 1;    //!< STALL Transmitted Interrupt Flag
    u32 UERIF       : 1;    //!< USB Error Interrupt Flag
    u32             : 24;
} STRUCT_REGISTER_END USBEPnISR_4_7_reg;

STRUCT_SIZE_ASSERT(USBEPnISR_4_7_reg, 4);

// USBEPnTCR_4_7
STRUCT_REGISTER_START {
    u32 TCNT0       : 10;   //!< Buffer 0 Transfer Byte Count
    u32             : 6;
    u32 TCNT1       : 10;   //!< Buffer 1 Transfer Byte Count
    u32             : 6;
} STRUCT_REGISTER_END USBEPnTCR_4_7_reg;

STRUCT_SIZE_ASSERT(USBEPnTCR_4_7_reg, 4);

// USBEPnCFGR_4_7
STRUCT_REGISTER_START {
    u32 EPBUFA      : 10;   //!< Endpoint Buffer Address
    u32 EPLEN       : 10;   //!< Endpoint Buffer Length
    u32             : 3;
    u32 SDBS        : 1;    //!< Single-Buffering or Double-Buffering Selection
    u32 EPADR       : 4;    //!< Endpoint Address
    u32 EPDIR       : 1;    //!< Transfer Direction
    u32 EPTYPE      : 1;    //!< Transfer Type
    u32             : 1;
    u32 EPEN        : 1;    //!< Endpoint Enable Control
} STRUCT_REGISTER_END USBEPnCFGR_4_7_reg;

STRUCT_SIZE_ASSERT(USBEPnCFGR_4_7_reg, 4);

// USB
typedef struct {
    USBCSR_reg   USBCSR;            //!< USB Control and Status
    USBIER_reg   USBIER;            //!< USB Interrupt Enable
    USBISR_reg   USBISR;            //!< USB Interrupt Status
    USBFCR_reg   USBFCR;            //!< USB Frame Count
    USBDEVAR_reg USBDEVAR;          //!< USB Device Address

    USBEP0CSR_reg  USBEP0CSR;       //!< USB Endpoint 0 Control and Status
    USBEP0IER_reg  USBEP0IER;       //!< USB Endpoint 0 Interrupt Enable
    USBEP0ISR_reg  USBEP0ISR;       //!< USB Endpoint 0 Interrupt Status
    USBEP0TCR_reg  USBEP0TCR;       //!< USB Endpoint 0 Transfer Count
    USBEP0CFGR_reg USBEP0CFGR;      //!< USB Endpoint 0 Configuration

    USBEPnCSR_1_3_reg  USBEP1CSR;   //!< USB Endpoint 1 Control and Status
    USBEPnIER_1_3_reg  USBEP1IER;   //!< USB Endpoint 1 Interrupt Enable
    USBEPnISR_1_3_reg  USBEP1ISR;   //!< USB Endpoint 1 Interrupt Status
    USBEPnTCR_1_3_reg  USBEP1TCR;   //!< USB Endpoint 1 Transfer Count
    USBEPnCFGR_1_3_reg USBEP1CFGR;  //!< USB Endpoint 1 Configuration

    USBEPnCSR_1_3_reg  USBEP2CSR;   //!< USB Endpoint 2 Control and Status
    USBEPnIER_1_3_reg  USBEP2IER;   //!< USB Endpoint 2 Interrupt Enable
    USBEPnISR_1_3_reg  USBEP2ISR;   //!< USB Endpoint 2 Interrupt Status
    USBEPnTCR_1_3_reg  USBEP2TCR;   //!< USB Endpoint 2 Transfer Count
    USBEPnCFGR_1_3_reg USBEP2CFGR;  //!< USB Endpoint 2 Configuration

    USBEPnCSR_1_3_reg  USBEP3CSR;   //!< USB Endpoint 3 Control and Status
    USBEPnIER_1_3_reg  USBEP3IER;   //!< USB Endpoint 3 Interrupt Enable
    USBEPnISR_1_3_reg  USBEP3ISR;   //!< USB Endpoint 3 Interrupt Status
    USBEPnTCR_1_3_reg  USBEP3TCR;   //!< USB Endpoint 3 Transfer Count
    USBEPnCFGR_1_3_reg USBEP3CFGR;  //!< USB Endpoint 3 Configuration

    USBEPnCSR_4_7_reg  USBEP4CSR;   //!< USB Endpoint 4 Control and Status
    USBEPnIER_4_7_reg  USBEP4IER;   //!< USB Endpoint 4 Interrupt Enable
    USBEPnISR_4_7_reg  USBEP4ISR;   //!< USB Endpoint 4 Interrupt Status
    USBEPnTCR_4_7_reg  USBEP4TCR;   //!< USB Endpoint 4 Transfer Count
    USBEPnCFGR_4_7_reg USBEP4CFGR;  //!< USB Endpoint 4 Configuration

    USBEPnCSR_4_7_reg  USBEP5CSR;   //!< USB Endpoint 5 Control and Status
    USBEPnIER_4_7_reg  USBEP5IER;   //!< USB Endpoint 5 Interrupt Enable
    USBEPnISR_4_7_reg  USBEP5ISR;   //!< USB Endpoint 5 Interrupt Status
    USBEPnTCR_4_7_reg  USBEP5TCR;   //!< USB Endpoint 5 Transfer Count
    USBEPnCFGR_4_7_reg USBEP5CFGR;  //!< USB Endpoint 5 Configuration

    USBEPnCSR_4_7_reg  USBEP6CSR;   //!< USB Endpoint 6 Control and Status
    USBEPnIER_4_7_reg  USBEP6IER;   //!< USB Endpoint 6 Interrupt Enable
    USBEPnISR_4_7_reg  USBEP6ISR;   //!< USB Endpoint 6 Interrupt Status
    USBEPnTCR_4_7_reg  USBEP6TCR;   //!< USB Endpoint 6 Transfer Count
    USBEPnCFGR_4_7_reg USBEP6CFGR;  //!< USB Endpoint 6 Configuration

    USBEPnCSR_4_7_reg  USBEP7CSR;   //!< USB Endpoint 7 Control and Status
    USBEPnIER_4_7_reg  USBEP7IER;   //!< USB Endpoint 7 Interrupt Enable
    USBEPnISR_4_7_reg  USBEP7ISR;   //!< USB Endpoint 7 Interrupt Status
    USBEPnTCR_4_7_reg  USBEP7TCR;   //!< USB Endpoint 7 Transfer Count
    USBEPnCFGR_4_7_reg USBEP7CFGR;  //!< USB Endpoint 7 Configuration
} USB_map;
STRUCT_SIZE_ASSERT(USB_map, 0xB4);

#define REG_USB ((volatile USB_map *)USB_BASE)

// Analog To Digital Converter
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define ADC_BASE        0x40010000

// Nested Vectored Interrupt Controller
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define NVIC_BASE       0xE000E000


void ckcu_clocks_enable(int ahb_mask, int apb0_mask, int apb1_mask, int en);

void wdt_reload();

void gpio_set_input_enable(int port, int pin, int en);
void gpio_set_pin_pull_up_down(int port, int pin, int mode);

void afio_pin_config(int port, int pin, int function);


#endif // HT32F165X_H
