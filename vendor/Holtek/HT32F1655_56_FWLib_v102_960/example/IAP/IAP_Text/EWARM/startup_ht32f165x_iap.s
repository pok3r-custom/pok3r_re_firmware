;/*---------------------------------------------------------------------------------------------------------*/
;/* Holtek Semiconductor Inc.                                                                               */
;/*                                                                                                         */
;/* Copyright (c) 2014 by Holtek Semiconductor Inc.                                                         */
;/* All rights reserved.                                                                                    */
;/*                                                                                                         */
;/*-----------------------------------------------------------------------------------------------------------
;  File Name        : startup_ht32f165x_iap.s
;  Version          : $Rev:: 889          $
;  Date             : $Date:: 2015-08-03 #$
;  Description      : Startup code.
;-----------------------------------------------------------------------------------------------------------*/

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACKIAP:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        EXTERN  SystemInit
        PUBLIC  __vector_table

;*******************************************************************************
; Fill-up the Vector Table entries with the exceptions ISR address
;*******************************************************************************
        DATA

__vector_table

        DCD  sfe(CSTACKIAP)                     ; Top address of Stack
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

        SECTION .usartisr:CODE:ROOT(2)
        EXTERN  UxART_IRQHandler
        DATA
        DCD  UxART_IRQHandler

        THUMB

        PUBWEAK Reset_Handler
        SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler
        LDR     R0, =SystemInit
        BLX     R0
        LDR     R0, =__iar_program_start
        BX      R0

        PUBWEAK NMI_Handler
        PUBWEAK HardFault_Handler
        PUBWEAK MemManage_Handler
        PUBWEAK BusFault_Handler
        PUBWEAK UsageFault_Handler
        PUBWEAK SVC_Handler
        PUBWEAK DebugMon_Handler
        PUBWEAK PendSV_Handler
        PUBWEAK SysTick_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
NMI_Handler
HardFault_Handler
MemManage_Handler
BusFault_Handler
UsageFault_Handler
SVC_Handler
DebugMon_Handler
PendSV_Handler
SysTick_Handler
        B .

        END
