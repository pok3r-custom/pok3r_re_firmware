/**
 @page ADC_PDMA_ADCResult

 @verbatim
 * @file    ADC/PDMA_ADCResult/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of PDMA move ADC result example.
 @endverbatim

@par Example Description:

This example shows how to use the PDMA to move ADC result from ADC->DR[0] to MCTM CHnCCR.

The MCTM CHnO is configured as PWM2 output mode.
The MCTM MTO is connected to update event.

The ADCLK frequency is set to 12 MHz (72 MHz /6 or 96 MHz /8).
The ADC channel 15 is configured as ADC input.

The ADC is configured as one shot mode and the sequence length is 1,
Rank 0 used to convert Channel 15. The conversion time = (1/12)*14 = 1.167us.

The PDMA channel 0 is configured to move ADC result from ADC->DR[0] to MCTM CHnCCR.
The ADC cycle end of conversion PDMA request is enabled.

Use MCTM MTO as ADC trigger source. So the ADC will be trigger periodically.

@par Directory Contents:

- ADC/PDMA_ADCResult/main.c               Main program
- ADC/PDMA_ADCResult/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:

- Adjust the potentiometer to change the input level and observe the LED.
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
