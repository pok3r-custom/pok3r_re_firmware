;/*---------------------------------------------------------------------------------------------------------*/
;/* Holtek Semiconductor Inc.                                                                               */
;/*                                                                                                         */
;/* Copyright (C) Holtek Semiconductor Inc.                                                                 */
;/* All rights reserved.                                                                                    */
;/*                                                                                                         */
;/*-----------------------------------------------------------------------------------------------------------
;  File Name        : startup_ht32f5xxxx_03_iap.s
;  Version          : $Rev:: 3927         $
;  Date             : $Date:: 2019-05-31 #$
;  Description      : Startup code.
;-----------------------------------------------------------------------------------------------------------*/

;  Supported Device
;  ========================================
;   HT32F0008
;   HT32F52142
;   HT32F52344, HT32F52354
;   HT32F52357, HT32F52367

;/* <<< Use Configuration Wizard in Context Menu >>>                                                        */

;// <o>  HT32 Device
;//      <0=> By Project Asm Define
;//      <6=> HT32F0008
;//      <6=> HT32F52142
;//      <9=> HT32F52344/54
;//      <11=> HT32F52357/67
USE_HT32_CHIP_SET   EQU     0

_HT32FWID           EQU     0xFFFFFFFF
;_HT32FWID           EQU     0x00000008
;_HT32FWID           EQU     0x00052142
;_HT32FWID           EQU     0x00052344
;_HT32FWID           EQU     0x00052354
;_HT32FWID           EQU     0x00052357
;_HT32FWID           EQU     0x00052367

HT32F0008           EQU     6
HT32F52142          EQU     6
HT32F52344_54       EQU     9
HT32F52357_67       EQU     11

  IF USE_HT32_CHIP_SET=0
  ELSE
USE_HT32_CHIP       EQU     USE_HT32_CHIP_SET
  ENDIF

; Amount of memory (in bytes) allocated for Stack and Heap
; Tailor those values to your application needs
;//   <o> Stack Size (in Bytes, must 8 byte aligned) <0-16384:8>
Stack_Size          EQU     512

                    AREA    STACK, NOINIT, READWRITE, ALIGN = 3
__HT_check_sp
Stack_Mem           SPACE   Stack_Size
__initial_sp

;//   <o>  Heap Size (in Bytes) <0-16384:8>
Heap_Size           EQU     0

                    AREA    HEAP, NOINIT, READWRITE, ALIGN = 3
__HT_check_heap
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
_RESERVED           EQU  0xFFFFFFFF
__Vectors
                    DCD  __initial_sp                       ; ---, 00, 0x000, Top address of Stack
                    DCD  Reset_Handler                      ; ---, 01, 0x004, Reset Handler
                    DCD  NMI_Handler                        ; -14, 02, 0x008, NMI Handler
                    DCD  HardFault_Handler                  ; -13, 03, 0x00C, Hard Fault Handler
                    DCD  _RESERVED                          ; ---, 04, 0x010, Reserved
                    DCD  _RESERVED                          ; ---, 05, 0x014, Reserved
                    DCD  _RESERVED                          ; ---, 06, 0x018, Reserved
                    DCD  _RESERVED                          ; ---, 07, 0x01C, Reserved
                    DCD  _HT32FWID                          ; ---, 08, 0x020, Reserved
                    DCD  _RESERVED                          ; ---, 09, 0x024, Reserved
                    DCD  _RESERVED                          ; ---, 10, 0x028, Reserved
                    DCD  SVC_Handler                        ; -05, 11, 0x02C, SVC Handler
                    DCD  _RESERVED                          ; ---, 12, 0x030, Reserved
                    DCD  _RESERVED                          ; ---, 13, 0x034, Reserved
                    DCD  PendSV_Handler                     ; -02, 14, 0x038, PendSV Handler
                    DCD  SysTick_Handler                    ; -01, 15, 0x03C, SysTick Handler

                    ;AREA    |.ARM.__AT_0x0000009C|, CODE, READONLY  ;IAP UART SETTING: Vector address of USART0
                    ;AREA    |.ARM.__AT_0x000000A0|, CODE, READONLY  ;IAP UART SETTING: Vector address of USART1
                    ;AREA    |.ARM.__AT_0x000000A4|, CODE, READONLY  ;IAP UART SETTING: Vector address of UART0
                    ;AREA    |.ARM.__AT_0x000000A8|, CODE, READONLY  ;IAP UART SETTING: Vector address of UART1
                  IF (USE_HT32_CHIP=HT32F0008)
                    AREA    |.ARM.__AT_0x000000A4|, CODE, READONLY  ;IAP UART SETTING: Vector address of UART0
                  ENDIF
                  IF (USE_HT32_CHIP=HT32F52344_54)
                    AREA    |.ARM.__AT_0x000000A8|, CODE, READONLY  ;IAP UART SETTING: Vector address of UART1
                  ENDIF
                  IF (USE_HT32_CHIP=HT32F52357_67)
                    AREA    |.ARM.__AT_0x000000A0|, CODE, READONLY  ;IAP UART SETTING: Vector address of USART1
                  ENDIF
                    IMPORT  UxART_IRQHandler
                    DCD     UxART_IRQHandler


; Reset handler routine
Reset_Handler       PROC
                    EXPORT  Reset_Handler                   [WEAK]
                    IMPORT  SystemInit
                    IMPORT  __main
                    LDR     R0, =BootProcess
                    BLX     R0
                    LDR     R0, =SystemInit
                    BLX     R0
                    LDR     R0, =__main
                    BX      R0
                    ENDP

BootProcess         PROC
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
                    CMP     R1, #5
                    BEQ     BP3
                    CMP     R1, #6
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

SVC_Handler         PROC
                    EXPORT  SVC_Handler                     [WEAK]
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


                    ALIGN

;*******************************************************************************
; User Stack and Heap initialization
;*******************************************************************************
                    IF      :DEF:__MICROLIB

                    EXPORT  __HT_check_heap
                    EXPORT  __HT_check_sp
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
