/**
 @page RTC_Time_BackupDomain

 @verbatim
 * @file    RTC/Time_BackupDomain/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of RTC Time example.
 @endverbatim

@par Example Description:

This example describes how to use the RTC peripheral, in terms
of prescaler and interrupts, to keep time and to generate Second interrupt.

The Low Speed External (LSE) clock is used as RTC clock source. 

The RTC is in the backup domain and powered by VBAT when VDD has been switched off,
The RTC configuration will not be lost if a battery is connected to the VBAT pin. 
A key value is written in backup register0 (PWRCU_BAKREG_0) to indicate if the RTC
has already been configured.

The program behaves as follows:

1. When power on reset occurs:
  - If a battery is connected to the VBAT pin: the BAK domain will not be reset and
    the RTC configuration will still be kept.
  - If no battery is connected to the VBAT pin: the BKP domain will be reset and the
    RTC configuration will be lost.
2. After starting the program, check the backup data register value:
  - Register value is not correct(PWRCU_BAKREG_0 value will not be correct or has not yet
    been programmed if the program is executed for the first time): the RTC is
    configured and the time is set(through HyperTerminal).
    Then store the initial time to PWRCU_BAKREG_1.
  - Register value is correct: the RTC has been configured and the time will be displayed
    on HyperTerminal.
3. When an External Reset occurs, the BAK domain is not reset and the RTC configuration
   is not lost.

In the RTC interrupt service routine, the LED1 toggles every 1 second.
The C library printf function is retargeted to the USART, that is, the printf
message is output to the HyperTerminal through USART.

@par Directory Contents:

- RTC/Time_BackupDomain/main.c                Main program
- RTC/Time_BackupDomain/ht32fxxxx_it.c        Interrupt handlers

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
