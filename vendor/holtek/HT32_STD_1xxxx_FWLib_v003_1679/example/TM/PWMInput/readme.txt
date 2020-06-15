/**
 @page TM_PWMInput

 @verbatim
 * @file    TM/PWMInput/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of GPTM PWM Input example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM peripheral to measure the frequency and duty cycle of an external
signal.

HT32F165x:
- The GPTM1_PCLK frequency is set to 72 MHz, the Prescaler is 0 and so the GPTM1 counter clock is 72 MHz.
- The minimum frequency value to measure is 72M/65536 = 1099 Hz.

HT32F1xxxx:
- The GPTM1_PCLK frequency is set to 96 MHz, the Prescaler is 0 and so the GPTM1 counter clock is 96 MHz.
- The minimum frequency value to measure is 96M/65536 = 1465 Hz.

- GPTM1 is configured as PWM Input Mode: the external signal is connected to GPTM1 Channel 1 as input pin.
- Measure the frequency and the duty cycle by the GPTM1 CH1CC interrupt request.
- In the GPTM1_IRQHandler routine, the frequency and the duty cycle of the external signal will be computed.

The "wFrequency" variable contains the external signal frequency:
- wFrequency = GPTM1 counter clock / GPTM1_CH1CCR in Hz.
The "wDutyCycle" variable contains the external signal duty cycle:
- wDutyCycle = (GPTM1_CH0CCR*100)/(GPTM1_CH1CCR) in % used fix point 16.16 format.

The GPTM0 Channel 1 is configured as output PWM output signal for GPTM1 PWM Input measurement for loop back
purpose.

If the USART is connected to PC serial port, the wFrequency and wDutyCycle will be printed on Hyperterminal.

@par Directory Contents:

- GPTM/PWMInput/main.c                   Main program
- GPTM/PWMInput/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Connect the external signal to the GPTM1 CH1 pin.Refer "ht32_board_config.h" for pin assignment.
  @note GPTM0 Channel 1(PA5) can be used as PWM output for loop back purpose.
- Connect a null-modem female/female RS232 cable between the COM1 DB9 connector and PC serial port.
  Hyperterminal configuration:
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
