/**
 @page ADC_TM_Trigger_with_Delay

 @verbatim
 * @file    ADC/TM_Trigger_with_Delay/readme.txt
 * @version V1.01
 * @date    2016-10-16
 * @brief   Description of Timer trigger ADC start of conversion example.
 @endverbatim

@par Example Description:

This example shows how to trigger ADC by GPTM0 CH2 PWM output with delay time.
- The GPTM0 CH2 is configured as PWM Output.
- The GPTM0 CH3O is configured to trigger the ADC.
- The frequency is 1 Hz and the duty is 50%. ADC will be trigger every 1 second.
- The ADCLK frequency is set to CK_AHB / 64.
- The conversion time = (1/(CK_AHB / 64)) * (12.5 + 1.5 + 36).
- The ADC is configured as one shot mode and the sequence length is 3.

The cycle end of conversion interrupt is enabled. Each time the ADC cycle conversion is finished (Three
Channels are finished), a cycle end of conversion interrupt will occur. The ADC interrupt service routine will
store the ADC result into the global variable, gADC_Result.

If the USART is connected to PC, the transformed data will be printed on Hyperterminal. Besides, LED1 ~ LED3
represent to GPTM0 CH3 compare match (trigger), single end of conversion, and cycle end of conversion.

@par Directory Contents:

- ADC/TM_Trigger_with_Delay/main.c                 Main program
- ADC/TM_Trigger_with_Delay/ht32fxxxx_it.c         Interrupt handlers

@par Hardware and Software Environment:

- Connect a null-modem female/female RS232 cable between the COM1 DB9 connector and PC serial port.
  HyperTerminal configuration:
  - Word Length = 8 Bits
  - One Stop Bit
  - No parity
  - BaudRate = 115200 baud
  - flow control: None
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
