/**
 @page SYSTICK_Period_DownCounting

 @verbatim
 * @file    SYSTICK/Period_DownCounting/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of Period_DownCounting example.
 @endverbatim

@par Example Description:

This example describes how to configure the SYSTICK down counter in order to generate SYSTICK interrupt with
a period of 1 ms, and the LEDs flashing frequency is 1Hz.
 
@par Directory Contents:

- SYSTICK/Period_DownCounting/main.c               Main program
- SYSTICK/Period_DownCounting/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

- This example can be run on HT32 Series development board.

@note

The frequency of LEDs flashing is set to 1Hz by inserting a delay into the 'Delay' function.
The LEDs flashing frequency can be changed.

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
