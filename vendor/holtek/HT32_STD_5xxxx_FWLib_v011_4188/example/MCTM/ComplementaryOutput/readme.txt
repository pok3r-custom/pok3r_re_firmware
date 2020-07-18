/**
 @page MCTM_ComplementaryOutput

 @verbatim
 * @file    MCTM/ComplementaryOutput/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of the MCTM_ComplementaryOutput example.
 @endverbatim

@par Example Description:

This example describes how to configure MCTM to generate three complementary output signals with a dead time
inserted and break function. Since the system clock is 48 MHz/40 MHz and MCTM prescaler is equal to 0, the
MCTM counter clock is 48 MHz/40 MHz.

- MCTM frequency = MCTM counter clock / (MCTM_Reload + 1) = 2 kHz.
- MCTM Channel0 duty cycle = CH0_CCR / (MCTM_Reload + 1) = 75%.
- MCTM Channel0N duty cycle = (MCTM_Reload - CH0_CCR + 1) / (MCTM_Reload + 1) = 25%.

- MCTM Channel1 duty cycle = CH1_CCR / (MCTM_Reload + 1) = 50%.
- MCTM Channel1N duty cycle = (MCTM_Reload - CH1_CCR + 1) / (MCTM_Reload + 1) = 50%.

- MCTM Channel2 duty cycle = CH2_CCR / (MCTM_Reload + 1) = 25%.
- MCTM Channel2N duty cycle = (MCTM_Reload - CH2_CCR + 1) / (MCTM_Reload + 1) = 75%.

A 1.5us dead time is inserted and break polarity is configurated at high level.
The Lock level 2 is selected.

@par Directory Contents:

- MCTM/ComplementaryOutput/main.c               Main program
- MCTM/ComplementaryOutput/ht32fxxxx_it.c       Interrupt handlers

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
