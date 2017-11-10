/* GNU Linker Script for Holtek HT32F1655 (ARM Cortex-M3) */

OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

/* Physical memory map */
MEMORY {
  flash (rx)  : ORIGIN = 0x00000000, LENGTH = 128K
  sram  (rwx) : ORIGIN = 0x20000000, LENGTH = 32K
}

IMAGE_BASE = 0x0;

/* Various stack sizes */
C_STACK_SIZE   = 1024;
IRQ_STACK_SIZE = 0;
FIQ_STACK_SIZE = 0;
SVC_STACK_SIZE = 0;
ABT_STACK_SIZE = 0;
UND_STACK_SIZE = 0;

/* Sections */
SECTIONS {

    /* vector table and reset code */
    .reset IMAGE_BASE : {
        *(.vectors)
        *(.reset)
        . = ALIGN(4);
    } > flash

    /* main code */
    .text : {
        *(.text .text.*)
        *(.glue_7t) *(.glue_7)

        . = ALIGN (4);
        *(.rodata .rodata.*)
    } > flash

    /* stack */
    .stack : {
        . = ALIGN(4);
        __stack_start = .;

        . += C_STACK_SIZE;

        . = ALIGN (4);
        __stack_end = .;
    } > sram

    /* uninitialized (zeroed) data */
    .bss : {
        . = ALIGN(4);
        __bss_start = .;

        *(.bss .bss.*)

        . = ALIGN (4);
        __bss_end = .;
    } > sram

    /* data loaded from flash to sram */
    .data : {
        . = ALIGN(4);
        __data_load = (LOADADDR(.data) + 4 - 1) & ~(4 - 1);
        __data_start = .;

        *(.data .data.*)

        . = ALIGN (4);
        __data_end = .;
    } > sram AT > flash

    /* stabs are not included */
    .stab 0 (NOLOAD) : {
        *(.stab)
    }
    .stabstr 0 (NOLOAD) : {
        *(.stabstr)
    }

    /* DWARF debug sections.
    * Symbols in the DWARF debugging sections are relative to the beginning
    * of the section so we begin them at 0.
    */
    /* DWARF 1 */
    .debug          0 : { *(.debug) }
    .line           0 : { *(.line) }
    /* GNU DWARF 1 extensions */
    .debug_srcinfo  0 : { *(.debug_srcinfo) }
    .debug_sfnames  0 : { *(.debug_sfnames) }
    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    /* DWARF 2 */
    .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }
    .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }
    .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) }
    /DISCARD/ : { *(.note.GNU-stack)  }

}
