/*****************************************************************************
 * Copyright (c) 2014 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *****************************************************************************/

#ifndef APP_ENTRY_POINT
#define APP_ENTRY_POINT main
#endif

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
  .extern APP_ENTRY_POINT

  .section .vectors, "ax"
  .code 16 
  .global _vectors

.macro DEFAULT_ISR_HANDLER name=
  .thumb_func
  .weak \name
\name:
1: b 1b /* endless loop */
.endm
  //
  // Minimal vector table
  //
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
  .section .vectors, "ax"
_vectors_end:

  .section .init, "ax"
  .thumb_func

reset_handler:
  //
  // Init stackpointers
  //
  ldr r1, =__stack_end__
  mov sp, r1
  ldr r1, =__stack_process_end__
  msr psp, r1
  //
  // Setup initial call frame
  //
  movs r0, #0
  mov lr, r0
  mov r12, sp
  //
  // Jump to main()
  //
  movs r0, #0
  movs r1, #0
  ldr r2, =APP_ENTRY_POINT
  blx r2
  //
  // Setup attibutes of stack and heap sections
  // so they don't take up room in the elf file
  //
  .section .stack, "wa", %nobits
  .section .stack_process, "wa", %nobits
  .section .heap, "wa", %nobits
