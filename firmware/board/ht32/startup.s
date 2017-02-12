/* Startup for Holtek HT32F165x (ARM Cortex-M3) */

.thumb

.equ _stack_top,    0x20000400
.equ _stack_fill,   0xACACACAC

/* interrupt vector table */
/*.section ".vectors"*/
/*.global _vector_table*/

_vector_table:
    /* System Excpetions */
    .word   _stack_top      /*         Stack Pointer */
    .word   _start          /*  1      Reset */
    .word   _generic_intr   /*  2 -14  NMI */
    .word   _generic_intr   /*  3 -13  Hard Fault */
    .word   _generic_intr   /*  4 -12  MCU Fault */
    .word   _generic_intr   /*  5 -11  Bus Fault */
    .word   _generic_intr   /*  6 -10  Usage Fault */
    .word   0 /* Reserved       7      */
    .word   0 /* Reserved       8      */
    .word   0 /* Reserved       9      */
    .word   0 /* Reserved      10      */
    .word   _generic_intr   /* 11  -5  SVCCall */
    .word   _generic_intr   /* 12  -4  Debug Monitor */
    .word   0 /* Reserved      13      */
    .word   _generic_intr   /* 14  -2  PendSV */
    .word   _generic_intr   /* 15  -1  Systick */

    /* IRQs */
    .word   _generic_intr   /* 16   0  CKRDY */
    .word   _generic_intr   /* 17   1  LVD */
    .word   _generic_intr   /* 18   2  BOD */
    .word   _generic_intr   /* 19   3  WDT */
    .word   _generic_intr   /* 20   4  RTC */
    .word   _generic_intr   /* 21   5  FMC */
    .word   _generic_intr   /* 22   6  EVWUP */
    .word   _generic_intr   /* 23   7  LPWUP */
    .word   _generic_intr   /* 24   8  EXTI0 */
    .word   _generic_intr   /* 25   9  EXTI1 */
    .word   _generic_intr   /* 26  10  EXTI2 */
    .word   _generic_intr   /* 27  11  EXTI3 */
    .word   _generic_intr   /* 28  12  EXTI4 */
    .word   _generic_intr   /* 29  13  EXTI5 */
    .word   _generic_intr   /* 30  14  EXTI6 */
    .word   _generic_intr   /* 31  15  EXTI7 */
    .word   _generic_intr   /* 32  16  EXTI8 */
    .word   _generic_intr   /* 33  17  EXTI9 */
    .word   _generic_intr   /* 34  18  EXTI10 */
    .word   _generic_intr   /* 35  19  EXTI11 */
    .word   _generic_intr   /* 36  20  EXTI12 */
    .word   _generic_intr   /* 37  21  EXTI13 */
    .word   _generic_intr   /* 38  22  EXTI14 */
    .word   _generic_intr   /* 39  23  EXTI15 */
    .word   _generic_intr   /* 40  24  COMP */
    .word   _generic_intr   /* 41  25  ADC */
    .word   0 /* Reserved      42      */
    .word   _generic_intr   /* 43  27  MCTM0_BRK */
    .word   _generic_intr   /* 44  28  MCTM0_UP */
    .word   _generic_intr   /* 45  29  MCTM0_TR_UP2 */
    .word   _generic_intr   /* 46  30  MCTM0_CC */
    .word   _generic_intr   /* 47  31  MCTM1_BRK */
    .word   _generic_intr   /* 48  32  MCTM1_UP */
    .word   _generic_intr   /* 49  33  MCTM1_TR_UP2 */
    .word   _generic_intr   /* 50  34  MCTM1_CC */
    .word   _gptm0_intr     /* 51  35  GPTM0 */
    .word   _gptm1_intr     /* 52  36  GPTM1 */
    .word   0 /* Reserved      53      */
    .word   0 /* Reserved      54      */
    .word   0 /* Reserved      55      */
    .word   0 /* Reserved      56      */
    .word   _bftm0_intr     /* 57  41  BFTM0 */
    .word   _bftm1_intr     /* 58  42  BFTM1 */
    .word   _generic_intr   /* 59  43  I2C0 */
    .word   _generic_intr   /* 60  44  I2C1 */
    .word   _spi0_intr      /* 61  45  SPI0 */
    .word   _spi1_intr      /* 62  46  SPI1 */
    .word   _generic_intr   /* 63  47  USART0 */
    .word   _generic_intr   /* 64  48  USART1 */
    .word   _generic_intr   /* 65  49  UART0 */
    .word   _generic_intr   /* 66  50  UART1 */
    .word   _generic_intr   /* 67  51  SCI */
    .word   _generic_intr   /* 68  52  I2S */
    .word   _usb_intr       /* 69  53  USB */
    .word   0 /* Reserved      70      */
    .word   _generic_intr   /* 71  55  PDMA_CH0 */
    .word   _generic_intr   /* 72  56  PDMA_CH1 */
    .word   _generic_intr   /* 73  57  PDMA_CH2 */
    .word   _generic_intr   /* 74  58  PDMA_CH3 */
    .word   _generic_intr   /* 75  59  PDMA_CH4 */
    .word   _generic_intr   /* 76  60  PDMA_CH5 */
    .word   _generic_intr   /* 77  61  PDMA_CH6 */
    .word   _generic_intr   /* 78  62  PDMA_CH7 */
    .word   0 /* Reserved      79      */
    .word   0 /* Reserved      80      */
    .word   0 /* Reserved      81      */
    .word   0 /* Reserved      82      */
    .word   0 /* Reserved      83      */
    .word   _generic_intr   /* 84  68  EBI */

/* padding */
.word   0
.word   0
.word   0

/* hex dump strings */
.string "POK3R Custom\0\0\0"
.string "POK3R Custom\0\0\0"
.string "POK3R Custom\0\0\0"
.string "POK3R Custom\0\0\0"

.align 4

/* reset and interrupt code */
/*.section ".reset"*/

/* entry point */
.global _start
.thumb_func

_start:
    ldr r0, =_stack_top
    mov sp, r0

    bl _mem_init

    /* branch main */
    ldr r0, =main
    blx r0

    /* just loop if main exits */
    b .


/* generic interrupt handler */
.global _generic_intr
.thumb_func
_generic_intr:
    b .

/* GPTM0 interrupt handler */
.thumb_func
_gptm0_intr:
    ldr r0, =gptm0_isr
    bx r0
/* GPTM1 interrupt handler */
.thumb_func
_gptm1_intr:
    ldr r0, =gptm1_isr
    bx r0

/* BFTM0 interrupt handler */
.thumb_func
_bftm0_intr:
    ldr r0, =bftm0_isr
    bx r0
/* BFTM1 interrupt handler */
.thumb_func
_bftm1_intr:
    ldr r0, =bftm1_isr
    bx r0

/* SPI0 interrupt handler */
.thumb_func
_spi0_intr:
    ldr r0, =spi0_isr
    bx r0
/* SPI1 interrupt handler */
.thumb_func
_spi1_intr:
    ldr r0, =spi1_isr
    bx r0

/* USB interrupt handler */
.thumb_func
_usb_intr:
    ldr r0, =usb_isr
    bx r0


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
