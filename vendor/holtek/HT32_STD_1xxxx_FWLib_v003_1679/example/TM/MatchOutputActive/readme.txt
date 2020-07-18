/**
 @page TM_MatchOutputActive

 @verbatim
 * @file    TM/MatchOutputActive/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of GPTM output active on match mode example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM output active on match mode after a start condition. 
-The GPTM0_PCLK frequency is set to 72 MHz or 96 MHz and the Prescaler is 10, so the GPTM0 counter clock is 7.2 MHz or 9.6 MHz.
-The compare value is 7200 or 9600 (GPTM0_CH3CCR), so the CH3 will output active level when the GPTM is enabled and
 the time passed 1 mS (7200 / 7.2 MHz or 9600 / 9.6 MHz).

@par Directory Contents:

- GPTM/MatchOutputActive/main.c                   Main program
- GPTM/MatchOutputActive/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Connect the GT0_CH3(PA7) and KEY1 pins to an oscilloscope to monitor the waveform.
- Press KEY1 to start the GPTM0.
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
