#ifndef CORTEXM3_H
#define CORTEXM3_H

#include "board.h"

// Private Peripherals
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define PPB_BASE        0xE0000000

#define NVIC_BASE       0xE000E000

#define SCB_BASE        0xE000E000

#define ST_BASE         0xE000E010
#define MPU_BASE        0xE000EF00

#define CM3_ROM_BASE    0xE00FF000

// Nested Vectored Interrupt Controller
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define NVIC_ICTR       NVIC_BASE + 0x4                 // Interrupt Set-Enable Registers
#define NVIC_ISERn(n)   NVIC_BASE + 0x100 + (n * 0x4)   // Interrupt Set-Enable Registers
#define NVIC_ICERn(n)   NVIC_BASE + 0x180 + (n * 0x4)   // Interrupt Clear-Enable Registers
#define NVIC_ISPRn(n)   NVIC_BASE + 0x200 + (n * 0x4)   // Interrupt Set-Pending Registers
#define NVIC_ICPRn(n)   NVIC_BASE + 0x280 + (n * 0x4)   // Interrupt Clear-Pending Registers
#define NVIC_IABRn(n)   NVIC_BASE + 0x300 + (n * 0x4)   // Interrupt Active Bit Registers
#define NVIC_IPRn(n)    NVIC_BASE + 0x400 + (n * 0x4)   // Interrupt Priority Registers
#define NVIC_STIR       NVIC_BASE + 0xF00               // Software Trigger Interrupt Register

// ICTR
STRUCT_REGISTER_START {
    u32 INTLINESNUM : 4;    //!< Total number of interrupt lines in groups of 32
    u32             : 28;
} STRUCT_REGISTER_END ICTR_reg;
STRUCT_SIZE_ASSERT(ICTR_reg, 4);

// IPR
STRUCT_REGISTER_START {
    u32 PRI_0   : 8;    //!< Priority Value 4n
    u32 PRI_1   : 8;    //!< Priority Value 4n+1
    u32 PRI_2   : 8;    //!< Priority Value 4n+2
    u32 PRI_3   : 8;    //!< Priority Value 4n+3
} STRUCT_REGISTER_END IPR_reg;
STRUCT_SIZE_ASSERT(IPR_reg, 4);

// STIR
STRUCT_REGISTER_START {
    u32 INTID   : 9;    //!< Interrupt ID
    u32         : 23;
} STRUCT_REGISTER_END STIR_reg;
STRUCT_SIZE_ASSERT(STIR_reg, 4);

typedef struct {
    u8 _pad8[0x4];
    const ICTR_reg ICTR;    //!< Interrupt Controller Type
    u8 _pad1[0xF8];
    // 0x100
    u32 ISER[8];            //!< Interrupt Set-Enable Registers
    u8 _pad2[0x60];
    // 0x180
    u32 ICER[8];            //!< Interrupt Clear-Enable Registers
    u8 _pad3[0x60];
    // 0x200
    u32 ISPR[8];            //!< Interrupt Set-Pending Registers
    u8 _pad4[0x60];
    // 0x280
    u32 ICPR[8];            //!< Interrupt Clear-Pending Registers
    u8 _pad5[0x60];
    // 0x300
    u32 IABR[8];            //!< Interrupt Active Bit Registers
    u8 _pad6[0xE0];
    // 0x400
    IPR_reg IPR[60];        //!< Interrupt Priority Registers
    u8 _pad7[0xA10];
    // 0xF00
    STIR_reg STIR;          //!< Software Trigger Interrupt Register
} NVIC_map;
STRUCT_SIZE_ASSERT(NVIC_map, 0xF04);

#define REG_NVIC STRUCT_REG_PTR(NVIC)

STRUCT_ADDR_ASSERT(REG_NVIC->ICTR, NVIC_ICTR);
STRUCT_ADDR_ASSERT(REG_NVIC->ISER[0], NVIC_ISERn(0));
STRUCT_ADDR_ASSERT(REG_NVIC->ICER[0], NVIC_ICERn(0));
STRUCT_ADDR_ASSERT(REG_NVIC->ISPR[0], NVIC_ISPRn(0));
STRUCT_ADDR_ASSERT(REG_NVIC->ICPR[0], NVIC_ICPRn(0));
STRUCT_ADDR_ASSERT(REG_NVIC->IABR[0], NVIC_IABRn(0));
STRUCT_ADDR_ASSERT(REG_NVIC->IPR[0], NVIC_IPRn(0));
STRUCT_ADDR_ASSERT(REG_NVIC->STIR, NVIC_STIR);

// System Control Block
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define SCB_ACTLR   SCB_BASE + 0x8      // Auxilary Control Register
#define SCB_CPUID   SCB_BASE + 0xD00    // CPUID Base Register
#define SCB_ICSR    SCB_BASE + 0xD04    // Interrupt Control and State
#define SCB_VTOR    SCB_BASE + 0xD08    // Vector Table Offset Register
#define SCB_AIRCR   SCB_BASE + 0xD0C    // Application Interrupt and Reset Control Register
#define SCB_SRC     SCB_BASE + 0xD10    // System Control Register
#define SCB_CCR     SCB_BASE + 0xD14    // Configuration and Control Register
#define SCB_SHPR1   SCB_BASE + 0xD18    // System Handler Priority Register 1
#define SCB_SHPR2   SCB_BASE + 0xD1C    // System Handler Priority Register 2
#define SCB_SHPR3   SCB_BASE + 0xD20    // System Handler Priority Register 3
#define SCB_SHCRS   SCB_BASE + 0xD24    // System Handler Control and State Register
#define SCB_CFSR    SCB_BASE + 0xD28    // Configurable Fault Status Register
#define SCB_MMSR    SCB_BASE + 0xD28    // MemManage Fault Status Register
#define SCB_BFSR    SCB_BASE + 0xD29    // BusFault Status Register
#define SCB_UFSR    SCB_BASE + 0xD2A    // UsageFault Status Register
#define SCB_HFSR    SCB_BASE + 0xD2C    // HardFault Status Register
#define SCB_MMAR    SCB_BASE + 0xD34    // MemManage Fault Address Register
#define SCB_BFAR    SCB_BASE + 0xD38    // BusFault Address Register
#define SCB_AFSR    SCB_BASE + 0xD3C    // Auxilary Fault Status Register

// Cortex-M3 ROM Table
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define ROM_SCS     CM3_ROM_BASE + 0x0
#define ROM_DWT     CM3_ROM_BASE + 0x4
#define ROM_FPB     CM3_ROM_BASE + 0x8
#define ROM_ITM     CM3_ROM_BASE + 0xC
#define ROM_TPIU    CM3_ROM_BASE + 0x10
#define ROM_ETM     CM3_ROM_BASE + 0x14
#define ROM_END     CM3_ROM_BASE + 0x18

#define ROM_PID4    CM3_ROM_BASE + 0xFD0    // Peripheral ID4
#define ROM_PID5    CM3_ROM_BASE + 0xFD4    // Peripheral ID5
#define ROM_PID6    CM3_ROM_BASE + 0xFD8    // Peripheral ID6
#define ROM_PID7    CM3_ROM_BASE + 0xFDC    // Peripheral ID7
#define ROM_PID0    CM3_ROM_BASE + 0xFE0    // Peripheral ID0
#define ROM_PID1    CM3_ROM_BASE + 0xFE4    // Peripheral ID1
#define ROM_PID2    CM3_ROM_BASE + 0xFE8    // Peripheral ID2
#define ROM_PID3    CM3_ROM_BASE + 0xFEC    // Peripheral ID3
#define ROM_CID0    CM3_ROM_BASE + 0xFF0    // Component ID0
#define ROM_CID1    CM3_ROM_BASE + 0xFF4    // Component ID1
#define ROM_CID2    CM3_ROM_BASE + 0xFF8    // Component ID2
#define ROM_CID3    CM3_ROM_BASE + 0xFFC    // Component ID3

#define ROM_SYSTEM_ACCESS   CM3_ROM_BASE + 0xFCC

void nvic_set_vtor(u32 addr);
void nvic_enable_intr(u8 num);
void nvic_disable_intr(u8 num);

#endif // CORTEXM3_H
