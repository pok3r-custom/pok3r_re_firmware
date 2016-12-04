;/*---------------------------------------------------------------------------------------------------------*/
;/* Holtek Semiconductor Inc.                                                                               */
;/*                                                                                                         */
;/* Copyright (c) 2014 by Holtek Semiconductor Inc.                                                         */
;/* All rights reserved.                                                                                    */
;/*                                                                                                         */
;/*-----------------------------------------------------------------------------------------------------------
;  File Name        : startup_ht32f165x.s
;  Version          : $Rev:: 801          $
;  Date             : $Date:: 2014-12-31 #$
;  Description      : Startup code.
;-----------------------------------------------------------------------------------------------------------*/
;/* <<< Use Configuration Wizard in Context Menu >>>                                                        */

; Amount of memory (in bytes) allocated for Stack and Heap
; Tailor those values to your application needs
;//   <o> Stack Size (in Bytes, must 8 byte aligned) <0-32768:8>
Stack_Size          EQU     512

                    AREA    STACK, NOINIT, READWRITE, ALIGN = 3
Stack_Mem           SPACE   Stack_Size
__initial_sp

;//   <o>  Heap Size (in Bytes) <0-32768:8>
Heap_Size           EQU     0

                    AREA    HEAP, NOINIT, READWRITE, ALIGN = 3
__heap_base
Heap_Mem            SPACE   Heap_Size
__heap_limit

                    PRESERVE8
                    THUMB

;*******************************************************************************
; Fill-up the Vector Table entries with the exceptions ISR address
;*******************************************************************************
                    AREA    RESET, CODE, READONLY
                    EXPORT  __Vectors

__Vectors           DCD  __initial_sp                       ; Top address of Stack
                    DCD  Reset_Handler                      ; Reset Handler
                    DCD  NMI_Handler                        ; NMI Handler
                    DCD  HardFault_Handler                  ; Hard Fault Handler
                    DCD  MemManage_Handler                  ; Memory Management Fault Handler
                    DCD  BusFault_Handler                   ; Bus Fault Handler
                    DCD  UsageFault_Handler                 ; Usage Fault Handler
                    DCD  0                                  ; Reserved
                    DCD  0                                  ; Reserved
                    DCD  0                                  ; Reserved
                    DCD  0                                  ; Reserved
                    DCD  SVC_Handler                        ; SVC Handler
                    DCD  DebugMon_Handler                   ; Debug Monitor Handler
                    DCD  0                                  ; Reserved
                    DCD  PendSV_Handler                     ; PendSV Handler
                    DCD  SysTick_Handler                    ; SysTick Handler

                    ; External Interrupt Handler
                    DCD  CKRDY_IRQHandler
                    DCD  LVD_IRQHandler
                    DCD  BOD_IRQHandler
                    DCD  WDT_IRQHandler
                    DCD  RTC_IRQHandler
                    DCD  FLASH_IRQHandler
                    DCD  EVWUP_IRQHandler
                    DCD  LPWUP_IRQHandler
                    DCD  EXTI0_IRQHandler
                    DCD  EXTI1_IRQHandler
                    DCD  EXTI2_IRQHandler
                    DCD  EXTI3_IRQHandler
                    DCD  EXTI4_IRQHandler
                    DCD  EXTI5_IRQHandler
                    DCD  EXTI6_IRQHandler
                    DCD  EXTI7_IRQHandler
                    DCD  EXTI8_IRQHandler
                    DCD  EXTI9_IRQHandler
                    DCD  EXTI10_IRQHandler
                    DCD  EXTI11_IRQHandler
                    DCD  EXTI12_IRQHandler
                    DCD  EXTI13_IRQHandler
                    DCD  EXTI14_IRQHandler
                    DCD  EXTI15_IRQHandler
                    DCD  COMP_IRQHandler
                    DCD  ADC_IRQHandler
                    DCD  0
                    DCD  MCTM0BRK_IRQHandler
                    DCD  MCTM0UP_IRQHandler
                    DCD  MCTM0TR_IRQHandler
                    DCD  MCTM0CC_IRQHandler
                    DCD  MCTM1BRK_IRQHandler
                    DCD  MCTM1UP_IRQHandler
                    DCD  MCTM1TR_IRQHandler
                    DCD  MCTM1CC_IRQHandler
                    DCD  GPTM0_IRQHandler
                    DCD  GPTM1_IRQHandler
                    DCD  0
                    DCD  0
                    DCD  0
                    DCD  0
                    DCD  BFTM0_IRQHandler
                    DCD  BFTM1_IRQHandler
                    DCD  I2C0_IRQHandler
                    DCD  I2C1_IRQHandler
                    DCD  SPI0_IRQHandler
                    DCD  SPI1_IRQHandler
                    DCD  USART0_IRQHandler
                    DCD  USART1_IRQHandler
                    DCD  UART0_IRQHandler
                    DCD  UART1_IRQHandler
                    DCD  SCI_IRQHandler
                    DCD  I2S_IRQHandler
                    DCD  USB_IRQHandler
                    DCD  0
                    DCD  PDMA_CH0_IRQHandler
                    DCD  PDMA_CH1_IRQHandler
                    DCD  PDMA_CH2_IRQHandler
                    DCD  PDMA_CH3_IRQHandler
                    DCD  PDMA_CH4_IRQHandler
                    DCD  PDMA_CH5_IRQHandler
                    DCD  PDMA_CH6_IRQHandler
                    DCD  PDMA_CH7_IRQHandler
                    DCD  0
                    DCD  0
                    DCD  0
                    DCD  0
                    DCD  0
                    DCD  EBI_IRQHandler

; Reset handler routine
Reset_Handler       PROC
                    EXPORT  Reset_Handler                   [WEAK]
                    IMPORT  SystemInit
                    IMPORT  __main
                    LDR     R0, =SystemInit
                    BLX     R0
                    LDR     R0, =__main
                    BX      R0
                    ENDP

; Dummy Exception Handlers
NMI_Handler         PROC
                    EXPORT  NMI_Handler                     [WEAK]
                    B       .
                    ENDP

HardFault_Handler   PROC
                    EXPORT  HardFault_Handler               [WEAK]
                    B       .
                    ENDP

MemManage_Handler   PROC
                    EXPORT  MemManage_Handler               [WEAK]
                    B       .
                    ENDP

BusFault_Handler    PROC
                    EXPORT  BusFault_Handler                [WEAK]
                    B       .
                    ENDP

UsageFault_Handler  PROC
                    EXPORT  UsageFault_Handler              [WEAK]
                    B       .
                    ENDP

SVC_Handler         PROC
                    EXPORT  SVC_Handler                     [WEAK]
                    B       .
                    ENDP

DebugMon_Handler    PROC
                    EXPORT  DebugMon_Handler                [WEAK]
                    B       .
                    ENDP

PendSV_Handler      PROC
                    EXPORT  PendSV_Handler                  [WEAK]
                    B       .
                    ENDP

SysTick_Handler     PROC
                    EXPORT  SysTick_Handler                 [WEAK]
                    B       .
                    ENDP

Default_Handler     PROC
                    EXPORT  CKRDY_IRQHandler                [WEAK]
                    EXPORT  LVD_IRQHandler                  [WEAK]
                    EXPORT  BOD_IRQHandler                  [WEAK]
                    EXPORT  WDT_IRQHandler                  [WEAK]
                    EXPORT  RTC_IRQHandler                  [WEAK]
                    EXPORT  FLASH_IRQHandler                [WEAK]
                    EXPORT  EVWUP_IRQHandler                [WEAK]
                    EXPORT  LPWUP_IRQHandler                [WEAK]
                    EXPORT  EXTI0_IRQHandler                [WEAK]
                    EXPORT  EXTI1_IRQHandler                [WEAK]
                    EXPORT  EXTI2_IRQHandler                [WEAK]
                    EXPORT  EXTI3_IRQHandler                [WEAK]
                    EXPORT  EXTI4_IRQHandler                [WEAK]
                    EXPORT  EXTI5_IRQHandler                [WEAK]
                    EXPORT  EXTI6_IRQHandler                [WEAK]
                    EXPORT  EXTI7_IRQHandler                [WEAK]
                    EXPORT  EXTI8_IRQHandler                [WEAK]
                    EXPORT  EXTI9_IRQHandler                [WEAK]
                    EXPORT  EXTI10_IRQHandler               [WEAK]
                    EXPORT  EXTI11_IRQHandler               [WEAK]
                    EXPORT  EXTI12_IRQHandler               [WEAK]
                    EXPORT  EXTI13_IRQHandler               [WEAK]
                    EXPORT  EXTI14_IRQHandler               [WEAK]
                    EXPORT  EXTI15_IRQHandler               [WEAK]
                    EXPORT  COMP_IRQHandler                 [WEAK]
                    EXPORT  ADC_IRQHandler                  [WEAK]
                    EXPORT  MCTM0BRK_IRQHandler             [WEAK]
                    EXPORT  MCTM0UP_IRQHandler              [WEAK]
                    EXPORT  MCTM0TR_IRQHandler              [WEAK]
                    EXPORT  MCTM0CC_IRQHandler              [WEAK]
                    EXPORT  MCTM1BRK_IRQHandler             [WEAK]
                    EXPORT  MCTM1UP_IRQHandler              [WEAK]
                    EXPORT  MCTM1TR_IRQHandler              [WEAK]
                    EXPORT  MCTM1CC_IRQHandler              [WEAK]
                    EXPORT  GPTM0_IRQHandler                [WEAK]
                    EXPORT  GPTM1_IRQHandler                [WEAK]
                    EXPORT  BFTM0_IRQHandler                [WEAK]
                    EXPORT  BFTM1_IRQHandler                [WEAK]
                    EXPORT  I2C0_IRQHandler                 [WEAK]
                    EXPORT  I2C1_IRQHandler                 [WEAK]
                    EXPORT  SPI0_IRQHandler                 [WEAK]
                    EXPORT  SPI1_IRQHandler                 [WEAK]
                    EXPORT  USART0_IRQHandler               [WEAK]
                    EXPORT  USART1_IRQHandler               [WEAK]
                    EXPORT  UART0_IRQHandler                [WEAK]
                    EXPORT  UART1_IRQHandler                [WEAK]
                    EXPORT  SCI_IRQHandler                  [WEAK]
                    EXPORT  I2S_IRQHandler                  [WEAK]
                    EXPORT  USB_IRQHandler                  [WEAK]
                    EXPORT  PDMA_CH0_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH1_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH2_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH3_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH4_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH5_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH6_IRQHandler             [WEAK]
                    EXPORT  PDMA_CH7_IRQHandler             [WEAK]
                    EXPORT  EBI_IRQHandler                  [WEAK]
CKRDY_IRQHandler
LVD_IRQHandler
BOD_IRQHandler
WDT_IRQHandler
RTC_IRQHandler
FLASH_IRQHandler
EVWUP_IRQHandler
LPWUP_IRQHandler
EXTI0_IRQHandler
EXTI1_IRQHandler
EXTI2_IRQHandler
EXTI3_IRQHandler
EXTI4_IRQHandler
EXTI5_IRQHandler
EXTI6_IRQHandler
EXTI7_IRQHandler
EXTI8_IRQHandler
EXTI9_IRQHandler
EXTI10_IRQHandler
EXTI11_IRQHandler
EXTI12_IRQHandler
EXTI13_IRQHandler
EXTI14_IRQHandler
EXTI15_IRQHandler
COMP_IRQHandler
ADC_IRQHandler
MCTM0BRK_IRQHandler
MCTM0UP_IRQHandler
MCTM0TR_IRQHandler
MCTM0CC_IRQHandler
MCTM1BRK_IRQHandler
MCTM1UP_IRQHandler
MCTM1TR_IRQHandler
MCTM1CC_IRQHandler
GPTM0_IRQHandler
GPTM1_IRQHandler
BFTM0_IRQHandler
BFTM1_IRQHandler
I2C0_IRQHandler
I2C1_IRQHandler
SPI0_IRQHandler
SPI1_IRQHandler
USART0_IRQHandler
USART1_IRQHandler
UART0_IRQHandler
UART1_IRQHandler
SCI_IRQHandler
I2S_IRQHandler
USB_IRQHandler
PDMA_CH0_IRQHandler
PDMA_CH1_IRQHandler
PDMA_CH2_IRQHandler
PDMA_CH3_IRQHandler
PDMA_CH4_IRQHandler
PDMA_CH5_IRQHandler
PDMA_CH6_IRQHandler
PDMA_CH7_IRQHandler
EBI_IRQHandler
                    B       .
                    ENDP

                    ALIGN

;*******************************************************************************
; User Stack and Heap initialization
;*******************************************************************************
                    IF      :DEF:__MICROLIB

                    EXPORT  __initial_sp
                    EXPORT  __heap_base
                    EXPORT  __heap_limit

                    ELSE

                    IMPORT  __use_two_region_memory
                    EXPORT  __user_initial_stackheap
__user_initial_stackheap

                    LDR     R0, =  Heap_Mem
                    LDR     R1, = (Stack_Mem + Stack_Size)
                    LDR     R2, = (Heap_Mem + Heap_Size)
                    LDR     R3, = Stack_Mem
                    BX      LR

                    ALIGN

                    ENDIF

                    END
