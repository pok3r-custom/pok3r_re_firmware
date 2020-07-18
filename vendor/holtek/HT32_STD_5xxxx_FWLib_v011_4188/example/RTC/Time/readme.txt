/**
 @page RTC_Time

 @verbatim
 * @file    RTC/Time/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of RTC Time example.
 @endverbatim

@par Example Description:

This example describes how to use the RTC peripheral, in terms
of prescaler and interrupts, to keep time and to generate Second interrupt.

The Low Speed External (LSE) clock is used as RTC clock source. 


The program behaves as follows:

 - Enable RTC PCLK and waits until it can be accessed.
   The RTC is located in backup domain.
   And the isolation is enabled when backup domain reset,
   Therefore you have to disable isolation via PWRCU_CheckReadyAccessed() API.
 - Init LED1 and USART.
 - Enable NVIC RTC interrupt.
 - RTC Configuration via RTC_Configuration function.
  The RTC counter will restart when match event occurred.
 - Adjust time by values entered by the user on the hyperterminal
   via Time_Regulate function. Then store the init time to TimeReg.
 - Set RTC Compare Register(RTC->CMP) as (86400 - TimeReg).
   Restart RTC Counter when Time is 23:59:59.
 - Enable RTC
 - If TimeReg register value correct:
   this means that the RTC is configured and the time is displayed on HyperTerminal.
 - Display current time in infinite loop.
   Current time is sum of the RTC counter value and the init time(stored in TimeReg register).
  The init time (TimeReg register) will be cleared and the RTC Compare Register(RTC->CMP)
   will be set to 86400 if the RTC Match flag(CMFLAG) is set. Refer to RTC_IRQHandler.

@par Directory Contents:

- RTC/Time/main.c                Main program
- RTC/Time/ht32fxxxx_it.c        Interrupt handlers

@par Hardware and Software Environment:

- Connect a null-modem female/female RS232 cable between the COM1 DB9 connector and PC serial port.
  Hyperterminal configuration:
  - Word Length = 8 Bits
  - One Stop Bit
  - No parity
  - BaudRate = 115200 baud
  - flow control: None
- Connect a 3V battery on Vbat pin.
- This example can be run on HT32 Series development board.

@par Firmware Disclaimer Information

1. The customer hereby acknowledges and agrees that the program technical documentation, including the
   code, which is supplied by Holtek Semiconductor Inc., (hereinafter referred to as "HOLTEK") is the
   proprietary and confidential intellectual property of HOLTEK, and is protected by copyright law and
   other intellectual property laws.

2. The customer hereby acknowledges and agrees that the program technical documentation, including the
   code, is confidential information belonging to HOLTEK, and must not be disclosed to any third parties
   other than HOLTEK and the customer.

3. The program technical documentation, including the code, is provided "as is" and for customer reference
   only. After delivery by HOLTEK, the customer shall use the program technical documentation, including
   the code, at their own risk. HOLTEK disclaims any expressed, implied or statutory warranties, including
   the warranties of merchantability, satisfactory quality and fitness for a particular purpose.

 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 */
