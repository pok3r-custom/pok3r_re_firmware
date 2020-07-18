/**
 @page PWRCU_BackupData

 @verbatim
 * @file    PWRCU/BackupData/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of BackupData example.
 @endverbatim

@par Example Description:

This example describes how to save users' data in the backup domain. As long as the VBAT pin
is still powered, the backup data will be retained.  

The Low Speed External (LSE) clock is used as RTC clock source. 

The program behaves as follows:

1. After starting the program, check the backup data register value:
  - PWRCU_BAKREG_0 is not correct(PWRCU_BAKREG_0~9 values are not correct or have not yet
    been programmed if the program is executed for the first time). Store the backup data
    to PWRCU_BAKREG_0~9.
  - PWRCU_BAKREG_0 is correct: PWRCU_BAKREG_0~9 will be checked and displayed on HyperTerminal.
2. When an External Reset occurs, the BAK domain is not reset and the PWRCU_BAKREG_0~9 are not lost.

Three LEDs behave as follows:
1. LED1- toggles every 1 second when the program is running.
2. LED2- If the backup data are stored to PWRCU_BAKREG_0~9 for the first time, LED2 will be turned on.
3. LED3- If the backup data are not correct, LED3 will be turned on.

@par Directory Contents:

- PWRCU/BackupData/main.c                   Main program
- PWRCU/BackupData/ht32fxxxx_it.c           Interrupt handlers

@par Hardware and Software Environment:

- Connect a null-modem female/female RS232 cable between the COM1 connector and PC serial port.
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
