/**
 @page TM_MatchOutputToggle

 @verbatim
 * @file    TM/MatchOutputToggle/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of GPTM output toggle on match mode example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM output toggle on match mode to output 4 different frequency
used one GPTM.

The GPTM0_PCLK frequency is set to 72 MHz / 96 MHz and the Prescaler is 0, so the GPTM0 counter clock is
72 MHz / 96 MHz.

The counter reload is configured to max value 0xFFFF;

The channels delta compare match value as following:
- Channel0 output 1 kHz frequency, the CH0DeltaValue = (GPTM0_PCLK / (1 kHz * 2 * (Prescaler+1))
- Channel1 output 2 kHz frequency, the CH1DeltaValue = (GPTM0_PCLK / (2 kHz * 2 * (Prescaler+1))
- Channel2 output 3 kHz frequency, the CH2DeltaValue = (GPTM0_PCLK / (3 kHz * 2 * (Prescaler+1))
- Channel3 output 4 kHz frequency, the CH3DeltaValue = (GPTM0_PCLK / (4 kHz * 2 * (Prescaler+1))

The channel 0 ~ 3 are configured as Match Output Toggle mode and the compare match interrupts are enabled.
In the interrupt service routine will update the CHxCCR value for next compare match.
Next CHxCCR = CHxCCR + CHxDeltaValue (x = 0 ~ 3)

@par Directory Contents:

- GPTM/MatchOutputToggle/main.c                   Main program
- GPTM/MatchOutputToggle/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Connect the GT0_CH0 ~ GT0_CH3 (PA4~PA7) to an oscilloscope to monitor the waveform.
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
