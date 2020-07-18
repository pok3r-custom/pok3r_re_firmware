/**
 @page TM_PWMOut_PDMA

 @verbatim
 * @file    TM/PWMOut_PDMA/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of the MCTM_PWMOut_PDMA example.
 @endverbatim

@par Example Description:

This example describes how to use MCTM/GPTM Update Event 1 PDMA request to change the
Channel n Capture/Compare Register (Channel n duty cycle).

Since the system clock is 40, 48 or 60 MHz and MCTM/GPTM prescaler is equal to 0, the MCTM/GPTM counter
clock is 40, 48 or 60 MHz respectively.

MCTM/GPTM frequency = TM counter clock / (MCTM_Reload + 1) = 2 kHz.

The MCTM/GPTM Channel n is configured to generate a complementary PWM1 signal with a
different duty cycle by the PDMA when three times MCTM/GPTM Update Event occurred.

@par Directory Contents:

- TM/PWMOut_PDMA/main.c               Main program
- TM/PWMOut_PDMA/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

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
