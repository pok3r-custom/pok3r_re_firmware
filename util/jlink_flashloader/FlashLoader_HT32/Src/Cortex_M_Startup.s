/*****************************************************************************
 * Copyright (c) 2014 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *****************************************************************************/

.macro ISR_HANDLER name=
  .section .vectors, "ax"
  .word \name
  .section .init, "ax"
  .thumb_func
  .weak \name
\name:
1: b 1b /* endless loop */
.endm

.macro ISR_RESERVED
  .section .vectors, "ax"
  .word 0
.endm

  .syntax unified
  .global reset_handler

  .section .vectors, "ax"
  .code 16 
  .global _vectors

.macro DEFAULT_ISR_HANDLER name=
  .thumb_func
  .weak \name
\name:
1: b 1b /* endless loop */
.endm

_vectors:
  .word __stack_end__
  .word reset_handler
ISR_HANDLER NMI_Handler
ISR_HANDLER HardFault_Handler
ISR_RESERVED // Populate if using MemManage (MPU)
ISR_RESERVED // Populate if using Bus fault
ISR_RESERVED // Populate if using Usage fault
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_HANDLER SVC_Handler
ISR_RESERVED // Populate if using a debug monitor
ISR_RESERVED
ISR_HANDLER PendSV_Handler
ISR_HANDLER SysTick_Handler
  // External interrupts start her 
ISR_HANDLER ExternalISR0
ISR_HANDLER ExternalISR1
ISR_HANDLER ExternalISR2
ISR_HANDLER ExternalISR3
ISR_HANDLER ExternalISR4
ISR_HANDLER ExternalISR5
ISR_HANDLER ExternalISR6
ISR_HANDLER ExternalISR7
ISR_HANDLER ExternalISR8
ISR_HANDLER ExternalISR9
ISR_HANDLER ExternalISR10
ISR_HANDLER ExternalISR11
ISR_HANDLER ExternalISR12
ISR_HANDLER ExternalISR13
ISR_HANDLER ExternalISR14
ISR_HANDLER ExternalISR15
ISR_HANDLER ExternalISR16
ISR_HANDLER ExternalISR17
ISR_HANDLER ExternalISR18
ISR_HANDLER ExternalISR19
ISR_HANDLER ExternalISR20
ISR_HANDLER ExternalISR21
ISR_HANDLER ExternalISR22
ISR_HANDLER ExternalISR23
ISR_HANDLER ExternalISR24
ISR_HANDLER ExternalISR25
ISR_HANDLER ExternalISR26
ISR_HANDLER ExternalISR27
ISR_HANDLER ExternalISR28
ISR_HANDLER ExternalISR29
ISR_HANDLER ExternalISR30
ISR_HANDLER ExternalISR31
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
ISR_RESERVED
  .section .vectors, "ax"
_vectors_end:

  .section .init, "ax"
  .thumb_func

  reset_handler:

#ifndef __NO_SYSTEM_INIT
  ldr r0, =__RAM_segment_end__
  mov sp, r0
  bl SystemInit
#endif

  b _start

#ifndef __NO_SYSTEM_INIT
  .thumb_func
  .weak SystemInit
SystemInit:
  bx lr
#endif
