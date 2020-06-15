/**
 @page ADC_PWMTrigger_OneShotMode

 @verbatim
 * @file    ADC/PWMTrigger_OneShotMode/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of PWM trigger ADC start of conversion example.
 @endverbatim

@par Example Description:

This example shows how to use the ADC one shot mode trigged by GPTM0 CH3O.
- The GPTM0 CH3O is configured as PWM2 output mode.
- The frequency is 1 Hz and the duty cycle is 1800 PCLK. ADC will be trigger every 1 second.
- The ADCLK frequency is set to 12 MHz (72 MHz /6 or 96 MHz /8).
- The ADC channel x 3 is configured as ADC input.

The ADC is configured as one shot mode and the sequence length is 3.
- Rank 0 used to convert Channel HTCFG_VR_ADC_CH. The conversion time = (1/12)*24 = 2us.
- Rank 1 used to convert Channel HTCFG_OTHER0_ADC_CH. The conversion time = (1/12)*19 = 1.58us.
- Rank 2 used to convert Channel HTCFG_OTHER1_ADC_CH. The conversion time = (1/12)*20 = 1.67us.

The cycle end of conversion interrupt is enabled. Each time the ADC cycle conversion is finished (Three
Channels are finished), a cycle end of conversion interrupt will occur. The ADC interrupt service routine will
store the ADC result into the global variable gADC_Result.

If the USART is connected to PC, the transformed data will be printed on Hyperterminal.

@par Directory Contents:

- ADC/PWMTrigger_OneShotMode/main.c                 Main program
- ADC/PWMTrigger_OneShotMode/ht32f1xxxx_01_it.c     Interrupt handlers

@par Hardware and Software Environment:

- Connect a null-modem female/female RS232 cable between the DB9 connector
  CN9 (USART0) and PC serial port. HyperTerminal configuration:
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
