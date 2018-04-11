
OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

MEMORY {
  flash (rx)  : ORIGIN = 0x0, LENGTH = 128K
}

IMAGE_BASE = 0x2c00;

SECTIONS {
    .text IMAGE_BASE : {
        *(.text)
    } > flash
}
