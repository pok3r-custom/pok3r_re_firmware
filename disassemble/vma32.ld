
OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

MEMORY {
  flash (rx)  : ORIGIN = 0x0, LENGTH = 63K
}

IMAGE_BASE = 0x3200;

SECTIONS {
    .text IMAGE_BASE : {
        *(.text)
    } > flash
}
