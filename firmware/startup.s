
.text

/* .cpu cortex-m3 */
.thumb

_vectors:
    .word   0x20000400      /* Stack Pointer */
/*    .word   _stack_top      /* Stack Pointer */
    .word   _start          /* Reset */
    .word   _generic_intr   /* NMI */
    .word   _generic_intr   /* Hard Fault */
    .word   _generic_intr   /* MCU Fault */
    .word   _generic_intr   /* Bus Fault */
    .word   _generic_intr   /* Usage Fault */
    .word   0               /* Reserved */

.thumb_func
.global _start

_start:
    b .

.thumb_func

genertic_intr:
    b .
