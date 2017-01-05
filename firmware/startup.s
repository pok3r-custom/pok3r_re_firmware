
.text

.cpu cortex-m3
.thumb

.global _start

.equ _stack_top,    0x20000400
.equ _stack_fill,   0xACACACAC

_vectors:
    .word   _stack_top      /* Stack Pointer */
    .word   _start          /* Reset */
    .word   _generic_intr   /* NMI */
    .word   _generic_intr   /* Hard Fault */
    .word   _generic_intr   /* MCU Fault */
    .word   _generic_intr   /* Bus Fault */
    .word   _generic_intr   /* Usage Fault */
    .word   0               /* Reserved */

.string "POK3R Custom\0\0\0"
.string "POK3R Custom\0\0\0"
.string "POK3R Custom\0\0\0"
.string "POK3R Custom\0\0\0"
.align 2


/* entry point */
.thumb_func
_start:
    ldr r0, =_stack_top
    mov sp, r0

    bl _mem_init

    /* branch main */
    ldr r0, =main
    blx r0

    /* just loop if main exits */
    b _start


/* generic interrupt handler */
.thumb_func
_generic_intr:
    b .


/* memory initialization */
.thumb_func
_mem_init:
    /* stack */
    /* fill with 0xAC */
    ldr r1, =__stack_start
    ldr r2, =__stack_end
    ldr r3, =_stack_fill
stack_init:
    cmp r1, r2
    bge stack_init_end
    stmia r1!, {r3}
    b stack_init
stack_init_end:

    /* bss */
    /* zero */
    ldr r1, =__bss_start
    ldr r2, =__bss_end
    mov r3, #0
bss_init:
    cmp r1, r2
    bge bss_init_end
    stmia r1!, {r3}
    b bss_init
bss_init_end:

    /* data */
    /* copy from flash */
    ldr r0, =__data_load
    ldr r1, =__data_start
    ldr r2, =__data_end
data_init:
    cmp r1, r2
    bge data_init_end
    ldmia r0!, {r3}
    stmia r1!, {r3}
    b data_init
data_init_end:

    bx lr
