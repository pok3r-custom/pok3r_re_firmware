;/*---------------------------------------------------------------------------------------------------------*/
;/* Holtek Semiconductor Inc.                                                                               */
;/*                                                                                                         */
;/* Copyright (c) 2014 by Holtek Semiconductor Inc.                                                         */
;/* All rights reserved.                                                                                    */
;/*                                                                                                         */
;/*-----------------------------------------------------------------------------------------------------------
;  File Name        : startup_ht32f165x.s
;  Version          : $Rev:: 881          $
;  Date             : $Date:: 2015-07-15 #$
;  Description      : Startup code.
;-----------------------------------------------------------------------------------------------------------*/

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        EXTERN  SystemInit
        PUBLIC  __vector_table

;*******************************************************************************
; Fill-up the Vector Table entries with the exceptions ISR address
;*******************************************************************************
        DATA

__vector_table

        DCD  sfe(CSTACK)                        ; Top address of Stack
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

        THUMB

        PUBWEAK Reset_Handler
        SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler
        LDR     R0, =SystemInit
        BLX     R0
        LDR     R0, =__iar_program_start
        BX      R0

        PUBWEAK NMI_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
NMI_Handler
        B NMI_Handler

        PUBWEAK HardFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
HardFault_Handler
        B HardFault_Handler

        PUBWEAK MemManage_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
MemManage_Handler
        B MemManage_Handler

        PUBWEAK BusFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
BusFault_Handler
        B BusFault_Handler

        PUBWEAK UsageFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
UsageFault_Handler
        B UsageFault_Handler

        PUBWEAK SVC_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SVC_Handler
        B SVC_Handler

        PUBWEAK DebugMon_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
DebugMon_Handler
        B DebugMon_Handler

        PUBWEAK PendSV_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
PendSV_Handler
        B PendSV_Handler

        PUBWEAK SysTick_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SysTick_Handler
        B SysTick_Handler


        PUBWEAK CKRDY_IRQHandler
        PUBWEAK LVD_IRQHandler
        PUBWEAK BOD_IRQHandler
        PUBWEAK WDT_IRQHandler
        PUBWEAK RTC_IRQHandler
        PUBWEAK FLASH_IRQHandler
        PUBWEAK EVWUP_IRQHandler
        PUBWEAK LPWUP_IRQHandler
        PUBWEAK EXTI0_IRQHandler
        PUBWEAK EXTI1_IRQHandler
        PUBWEAK EXTI2_IRQHandler
        PUBWEAK EXTI3_IRQHandler
        PUBWEAK EXTI4_IRQHandler
        PUBWEAK EXTI5_IRQHandler
        PUBWEAK EXTI6_IRQHandler
        PUBWEAK EXTI7_IRQHandler
        PUBWEAK EXTI8_IRQHandler
        PUBWEAK EXTI9_IRQHandler
        PUBWEAK EXTI10_IRQHandler
        PUBWEAK EXTI11_IRQHandler
        PUBWEAK EXTI12_IRQHandler
        PUBWEAK EXTI13_IRQHandler
        PUBWEAK EXTI14_IRQHandler
        PUBWEAK EXTI15_IRQHandler
        PUBWEAK COMP_IRQHandler
        PUBWEAK ADC_IRQHandler
        PUBWEAK MCTM0BRK_IRQHandler
        PUBWEAK MCTM0UP_IRQHandler
        PUBWEAK MCTM0TR_IRQHandler
        PUBWEAK MCTM0CC_IRQHandler
        PUBWEAK MCTM1BRK_IRQHandler
        PUBWEAK MCTM1UP_IRQHandler
        PUBWEAK MCTM1TR_IRQHandler
        PUBWEAK MCTM1CC_IRQHandler
        PUBWEAK GPTM0_IRQHandler
        PUBWEAK GPTM1_IRQHandler
        PUBWEAK BFTM0_IRQHandler
        PUBWEAK BFTM1_IRQHandler
        PUBWEAK I2C0_IRQHandler
        PUBWEAK I2C1_IRQHandler
        PUBWEAK SPI0_IRQHandler
        PUBWEAK SPI1_IRQHandler
        PUBWEAK USART0_IRQHandler
        PUBWEAK USART1_IRQHandler
        PUBWEAK UART0_IRQHandler
        PUBWEAK UART1_IRQHandler
        PUBWEAK SCI_IRQHandler
        PUBWEAK I2S_IRQHandler
        PUBWEAK USB_IRQHandler
        PUBWEAK PDMA_CH0_IRQHandler
        PUBWEAK PDMA_CH1_IRQHandler
        PUBWEAK PDMA_CH2_IRQHandler
        PUBWEAK PDMA_CH3_IRQHandler
        PUBWEAK PDMA_CH4_IRQHandler
        PUBWEAK PDMA_CH5_IRQHandler
        PUBWEAK PDMA_CH6_IRQHandler
        PUBWEAK PDMA_CH7_IRQHandler
        PUBWEAK EBI_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
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
        B .

        END
