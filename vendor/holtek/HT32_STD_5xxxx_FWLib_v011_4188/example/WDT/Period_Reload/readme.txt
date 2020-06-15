/**
 @page WDT_Period_Reload

 @verbatim
 * @file    WDT/Period_Reload/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of WDT Period_Reload example.
 @endverbatim

@par Example Description:

This example describes how to set watch dog timer to reload periodically by SYSTICK interrupt to keep the
program working.

note.If you want the example to execute normally instead of the WDT, clear the Systick_Handler WDT_Restart(); comment.

@par Directory Contents:

- WDT/Period_Reload/main.c               Main program
- WDT/Period_Reload/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

- This example use LED1, LED2.
- LEDs are used as the sign to indicate if the program is still working. 
- if WDT underflow happens,then LED1 turned on and LED2 turned off. 
- if WDT error happens,then LED1 turned off and LED2 turned on and. 
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
