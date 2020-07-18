/**
 @page TM_MatchOutputActive

 @verbatim
 * @file    TM/MatchOutputActive/readme.txt
 * @version V1.00
 * @date    2016-04-27
 * @brief   Description of GPTM output active on match mode example.
 @endverbatim

@par Example Description:

This example shows how to use the SCTM/GPTM output active on match mode after a start condition. If the PCLK
frequency is set to 40, 48 or 60 MHz and the Prescaler is 9, so the PCLK_CNT (SCTM/GPTM counter clock) is 4.0, 4.8 or 6.0 MHz respectively.

The compare value is PCLK_CNT /1000 (CH0CCR), so the CH0 will output active level when the SCTM/GPTM is enabled and
the time passed 1 mS.

@par Directory Contents:

- TM/MatchOutputActive/main.c                   Main program
- TM/MatchOutputActive/ht32fxxxx_it.c           Interrupt handlers

@par Hardware and Software Environment:

- Refer "ht32_board_config.h" for pin assignment.
- Connect the SCTM_CH0 and KEY1 pins to an oscilloscope to monitor the waveform.
- Press KEY1 to start the SCTM/GPTM.
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
