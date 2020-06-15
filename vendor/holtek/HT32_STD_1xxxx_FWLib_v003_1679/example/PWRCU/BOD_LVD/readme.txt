/**
 @page PWRCU_BOD_LVD

 @verbatim
 * @file    PWRCU/BOD_LVD/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of LVD and BOD example.
 @endverbatim

@par Example Description:

This example describes how to use the LVD and the BOD function.

The BOD is configured to generate reset and to turn off the LDO when the VDD33 less then 2.6V.

The LVD is configured to generate interrupt when the VDD33 less then 2.8V.
The LVD interrupt service routine will toggle the LED2 till the VDD33 above 2.8V. 

The LED1 will toggle in an infinite loop at main function.

@par Directory Contents:

- PWRCU/BOD_LVD/main.c                        Main program
- PWRCU/BOD_LVD/ht32f1xxxx_01_it.c            Interrupt handlers

@par Hardware and Software Environment:

- Remove jumper J7 and connect a power supply to the MVDD (J7 left side).
- Change the MVDD voltage slowly (3.3V -> 2.5V -> 3.3V) and observe the LED1 and the LED2 behavior.
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
