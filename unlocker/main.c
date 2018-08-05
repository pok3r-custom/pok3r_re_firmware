
#include <stdint.h>

#define HT32F1655
#include "board/ht32/ht32f165x.h"
#include "board/cortex-m3.h"

#define SCB_BASE    0xE000E000
#define SCB_AIRCR   SCB_BASE + 0xD0C    // Application Interrupt and Reset Control Register

#define BOOTLOADER_LEN 0x2800

uint32_t flash_data[BOOTLOADER_LEN / 4];

__attribute__((section(".ramcode")))
void flash_mass_erase(void){
    FMC->OCMR = FMC_OCMR_CMD_MASS_ERASE;
    FMC->OPCR = FMC_OPCR_OPM_COMMIT;
    while((FMC->OPCR & FMC_OPCR_OPM_MASK) != FMC_OPCR_OPM_FINISHED);
}

__attribute__((section(".ramcode")))
void flash_write_word(uint32_t addr, uint32_t word){
    FMC->TADR = addr;
    FMC->WRDR = word;
    FMC->OCMR = FMC_OCMR_CMD_WORD_PROGRAM;
    FMC->OPCR = FMC_OPCR_OPM_COMMIT;
    while((FMC->OPCR & FMC_OPCR_OPM_MASK) != FMC_OPCR_OPM_FINISHED);
}

__attribute__((section(".ramcode")))
void flash_read(uint32_t *dest, const uint32_t *begin, const uint32_t *end){
    while(begin < end){
        *dest = *begin;
        ++begin;
    }
}

__attribute__((section(".ramcode")))
void flash_write(uint32_t target, const uint32_t *begin, const uint32_t *end){
    while(begin < end){
        flash_write_word(target, *begin);
        target += 4;
        ++begin;
    }
}

__attribute__((section(".ramcode")))
int main(){
    
    const uint32_t *bootloader_start = (const uint32_t *)0x0;
    const uint32_t *bootloader_end = (const uint32_t *)BOOTLOADER_LEN;

    // Copy bootloader to SRAM
    flash_read(flash_data, bootloader_start, bootloader_end);
    
    // Erase flash
    flash_mass_erase();
    
    // Copy bootloader to SRAM
    flash_write(0x0, flash_data, flash_data + (BOOTLOADER_LEN / 4));

    // System reset
    *((uint32_t *)SCB_AIRCR) = 0x05FA0004;

    // Dead loop
    while(1);
}
