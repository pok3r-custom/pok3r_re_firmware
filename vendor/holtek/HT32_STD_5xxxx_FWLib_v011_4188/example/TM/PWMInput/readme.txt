/**
 @page TM_PWMInput

 @verbatim
 * @file    TM/PWMInput/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of TM PWM Input example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM peripheral to measure the frequency and duty cycle of an external
signal.

- The GPTM_PCLK frequency is set to 40, 48 or 60 MHz, the Prescaler is 0 and so the GPTM counter clock is 40, 48 or 60 MHz respectively.
- The minimum frequency value to measure is GPTM_PCLK/65536 Hz.
- GPTM is configured as PWM Input Mode: the external signal is connected to GPTM Channel 1 as input pin.
- Measure the frequency and the duty cycle by the GPTM CH1CC interrupt request.
- In the GPTM_IRQHandler routine, the frequency and the duty cycle of the external signal will be computed.

The "wFrequency" variable contains the external signal frequency:
- wFrequency = GPTM counter clock / GPTM_CH1CCR in Hz.
The "wDutyCycle" variable contains the external signal duty cycle:
- wDutyCycle = (GPTM_CH0CCR*100)/(GPTM_CH1CCR) in % used fix point 16.16 format.

The GPTM Channel 1 is configured as output PWM output signal for GPTM PWM Input measurement for loop back
purpose.

If the USART is connected to PC serial port, the wFrequency and wDutyCycle will be printed on Hyperterminal.

@par Directory Contents:

- TM/PWMInput/main.c                Main program
- TM/PWMInput/ht32fxxxx_it.c        Interrupt handlers

@par Hardware and Software Environment:

- Refer "ht32_board_config.h" for pin assignment.
- Connect the external signal to the GPTM.
  @note GPTM Channel 1 can be used as PWM output for loop back purpose.
- Connect a null-modem female/female RS232 cable between the COM1 connector and PC serial port.
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
