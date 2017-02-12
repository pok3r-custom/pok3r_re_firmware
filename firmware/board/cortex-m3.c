#include "cortex-m3.h"

void nvic_set_vtor(u32 addr){
    addr &= 0x1fffff80;
    REG(SCB_VTOR) = addr;
}

void nvic_enable_intr(u8 num){
    u8 off = num >> 5;
    u32 mask = 1 << (num & 0x1f);
    REG(NVIC_ISERn(off)) = mask;
}

void nvic_disable_intr(u8 num){
    u8 off = num >> 5;
    u32 mask = 1 << (num & 0x1f);
    REG(NVIC_ICERn(off)) = mask;
}
