;/*---------------------------------------------------------------------------------------------------------*/
;/* Holtek Semiconductor Inc.                                                                               */
;/*                                                                                                         */
;/* Copyright (C) Holtek Semiconductor Inc.                                                                 */
;/* All rights reserved.                                                                                    */
;/*                                                                                                         */
;/*-----------------------------------------------------------------------------------------------------------
;  File Name        : startup_ht32f1xxxx_01_iap.s
;  Version          : $Rev:: 1578         $
;  Date             : $Date:: 2019-03-29 #$
;  Description      : Startup code.
;-----------------------------------------------------------------------------------------------------------*/

;  Supported Device
;  ========================================
;   HT32F1653, HT32F1654
;   HT32F1655, HT32F1656
;   HT32F12365, HT32F12366
;   HT32F12345

;// <o>  HT32 Device
;//      <0=> By Project Asm Define
;//      <1=> HT32F1653/1654/1655/1656
;//      <2=> HT32F12365/12366
;//      <3=> HT32F12345
USE_HT32_CHIP_SET   EQU     0

_HT32FWID           EQU     0xFFFFFFFF
;_HT32FWID           EQU     0x00012366

HT32F1653_54_55_56  EQU     1
HT32F12365_66       EQU     2
HT32F12345          EQU     3

  IF USE_HT32_CHIP_SET=0
  ELSE
  #undef  USE_HT32_CHIP
  #define USE_HT32_CHIP      USE_HT32_CHIP_SET
  ENDIF

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
_RESERVED           EQU  0xFFFFFFFF
__vector_table
                    DCD  sfe(CSTACKIAP)                        ; ---, 00, 0x000, Top address of Stack
                    DCD  Reset_Handler                      ; ---, 01, 0x004, Reset Handler
                    DCD  NMI_Handler                        ; ---, 02, 0x008, NMI Handler
                    DCD  HardFault_Handler                  ; ---, 03, 0x00C, Hard Fault Handler
                    DCD  MemManage_Handler                  ; ---, 04, 0x010, Memory Management Fault Handler
                    DCD  BusFault_Handler                   ; ---, 05, 0x014, Bus Fault Handler
                    DCD  UsageFault_Handler                 ; ---, 06, 0x018, Usage Fault Handler
                    DCD  _RESERVED                          ; ---, 07, 0x01C, Reserved
                    DCD  _HT32FWID                          ; ---, 08, 0x020, Reserved
                    DCD  _RESERVED                          ; ---, 09, 0x024, Reserved
                    DCD  _RESERVED                          ; ---, 10, 0x028, Reserved
                    DCD  SVC_Handler                        ; ---, 11, 0x02C, SVC Handler
                    DCD  DebugMon_Handler                   ; ---, 12, 0x030, Debug Monitor Handler
                    DCD  _RESERVED                          ; ---, 13, 0x034, Reserved
                    DCD  PendSV_Handler                     ; ---, 14, 0x038, PendSV Handler
                    DCD  SysTick_Handler                    ; ---, 15, 0x03C, SysTick Handler

        SECTION .usartisr:CODE:ROOT(2)
        EXTERN UxART_IRQHandler
        DATA
                    DCD  UxART_IRQHandler

        THUMB

        PUBWEAK Reset_Handler
        SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler
                    IF (USE_HT32_CHIP=HT32F1653_54_55_56)
                    ELSE
                    LDR     R0, =BootProcess
                    BLX     R0
                    ENDIF
                    LDR     R0, =SystemInit
                    BLX     R0
                    LDR     R0, =__iar_program_start
                    BX      R0

                    IF (USE_HT32_CHIP=HT32F1653_54_55_56)
                    ELSE
BootProcess
                    LDR     R0, =0x40080300
                    LDR     R1,[R0, #0x10]
                    CMP     R1, #0
                    BNE     BP1
                    LDR     R1,[R0, #0x14]
                    CMP     R1, #0
                    BNE     BP1
                    LDR     R1,[R0, #0x18]
                    CMP     R1, #0
                    BNE     BP1
                    LDR     R1,[R0, #0x1C]
                    CMP     R1, #0
                    BEQ     BP2
BP1                 LDR     R0, =0x40080180
                    LDR     R1,[R0, #0xC]
                    LSLS    R1, R1, #4
                    LSRS    R1, R1, #20
                    CMP     R1, #0
                    BEQ     BP3
                    CMP     R1, #1
                    BEQ     BP3
                    CMP     R1, #2
                    BEQ     BP3
BP2                 DSB
                    LDR     R0, =0x20000000
                    LDR     R1, =0x05fa0004
                    STR     R1, [R0]
                    LDR     R1, =0xe000ed00
                    LDR     R0, =0x05fa0004
                    STR     R0, [R1, #0xC]
                    DSB
                    B       .
BP3                 LDR     R0, =0x20000000
                    LDR     R1, [R0]
                    LDR     R0, =0x05fa0004
                    CMP     R0, R1
                    BEQ     BP4
                    BX      LR
BP4                 LDR     R0, =0x40088100
                    LDR     R1, =0x00000001
                    STR     R1, [R0]
                    LDR     R0, =0x20000000
                    LDR     R1, =0x0
                    STR     R1, [R0]
                    BX      LR
                    ENDIF

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
                    B       .

                    END
