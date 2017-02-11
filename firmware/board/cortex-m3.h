#ifndef CORTEXM3_H
#define CORTEXM3_H

#include "board.h"

// Private Peripherals
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define PPB_BASE        0xE0000000

#define NVIC_BASE       0xE000E000

#define SCB_BASE        0xE000E008
#define ST_BASE         0xE000E010
#define MPU_BASE        0xE000EF00

// Nested Vectored Interrupt Controller
// ////////////////////////////////////////////////////////////////////////////////////////////////
#define NVIC_ISERn(n)   NVIC_BASE + 0x100 + (n * 0x4)   // Interrupt Set-Enable Registers
#define NVIC_ICERn(n)   NVIC_BASE + 0x180 + (n * 0x4)   // Interrupt Clear-Enable Registers
#define NVIC_ISPRn(n)   NVIC_BASE + 0x200 + (n * 0x4)   // Interrupt Set-Pending Registers
#define NVIC_ICPRn(n)   NVIC_BASE + 0x280 + (n * 0x4)   // Interrupt Clear-Pending Registers
#define NVIC_IABRn(n)   NVIC_BASE + 0x300 + (n * 0x4)   // Interrupt Active Bit Registers
#define NVIC_IPRn(n)    NVIC_BASE + 0x400 + (n * 0x4)   // Interrupt Priority Registers
#define NVIC_STIR       NVIC_BASE + 0xF00               // Software Trigger Interrupt Register

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
    u32 _pad1[0x100];
    // 0x100
    u32 ISER[8];        //!< Interrupt Set-Enable Registers
    u32 _pad2[0x60];
    // 0x180
    u32 ICER[8];        //!< Interrupt Clear-Enable Registers
    // 0x200
    u32 ISPR[8];        //!< Interrupt Set-Pending Registers
    u32 _pad3[0x60];
    // 0x280
    u32 ICPR[8];        //!< Interrupt Clear-Pending Registers
    // 0x300
    u32 IABR[8];        //!< Interrupt Active Bit Registers
    u32 _pad4[0xE0];
    // 0x400
    u32 IPR[60];        //!< Interrupt Priority Registers
    u32 _pad5[0xE10];
    // 0xF00
    u32 STIR;           //!< Software Trigger Interrupt Register
} NVIC_map;
STRUCT_SIZE_ASSERT(NVIC_map, 0xF04);

#define REG_NVIC STRUCT_REG_PTR(NVIC)

STRUCT_ADDR_ASSERT(NVIC_ISERn(0), REG_NVIC->ISER[0]);
STRUCT_ADDR_ASSERT(NVIC_ICERn(0), REG_NVIC->ICER[0]);
STRUCT_ADDR_ASSERT(NVIC_ISPRn(0), REG_NVIC->ISPR[0]);
STRUCT_ADDR_ASSERT(NVIC_ICPRn(0), REG_NVIC->ICPR[0]);
STRUCT_ADDR_ASSERT(NVIC_IABRn(0), REG_NVIC->IABR[0]);
STRUCT_ADDR_ASSERT(NVIC_IPRn(0), REG_NVIC->IPR[0]);
STRUCT_ADDR_ASSERT(NVIC_STIR, REG_NVIC->STIR);

void nvic_enable_intr(int )

#endif // CORTEXM3_H
