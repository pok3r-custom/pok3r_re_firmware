/**
 @page TM_MatchOutputToggle

 @verbatim
 * @file    TM/MatchOutputToggle/readme.txt
 * @version V1.00
 * @date    2016-04-27
 * @brief   Description of GPTM output toggle on match mode example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM output toggle on match mode to output 4 different frequency.

The GPTM_PCLK frequency is set to 40, 48 or 60 MHz and the Prescaler is 0, so the GPTM_PCLK_CNT (GPTM0 counter clock) is 40, 48 or 60 MHz respectively.

The counter reload is configured to max value 0xFFFF;

The channels delta compare match value as following:
- Channel0 output 100 Hz frequency, the CH0DeltaValue = (GPTM_PCLK_CNT Hz / (100Hz * (Prescaler+1))
- Channel1 output 500 Hz frequency, the CH1DeltaValue = (GPTM_PCLK_CNT Hz / (500Hz * (Prescaler+1))
- Channel2 output 1000 Hz frequency, the CH2DeltaValue = (GPTM_PCLK_CNT Hz / (1000Hz * (Prescaler+1))
- Channel3 output 2000 kHz frequency, the CH3DeltaValue = (GPTM_PCLK_CNT Hz / (2000Hz * (Prescaler+1))

The channel 0 ~ 3 are configured as Match Output Toggle mode and the compare match interrupts are enabled.
In the interrupt service routine will update the CHxCCR value for next compare match.
Next CHxCCR = CHxCCR + CHxDeltaValue (x = 0 ~ 3)

@par Directory Contents:

- TM/MatchOutputToggle/main.c                   Main program
- TM/MatchOutputToggle/ht32fxxxx_it.c           Interrupt handlers

@par Hardware and Software Environment:

- Refer "ht32_board_config.h" for pin assignment.
- Connect the GT_CH0 ~ GT_CH3 to an oscilloscope to monitor the waveform.
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
