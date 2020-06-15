/**
 @page TM_InputCapture

 @verbatim
 * @file    TM/InputCapture/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of GPTM Input Capture example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM peripheral to measure pulse width of an external signal. The GPTM0 is
set to output pulse every 1 second for test purpose.
- CH0: pulse width 25 uS
- CH1: pulse width 250 uS
- CH2: pulse width 25 mS
- CH3: pulse width 950 mS

The GPTM1_PCLK frequency is set to 72 MHz or 96 MHz, the Prescaler is 0 and so the GPTM1 counter clock is 72
MHz or 96 MHz. GPTM1 is configured as Input Capture Mode: the external signals are connected to GPTM1
Channel1, Channel3 as input pin. The GPTM1 Channel Capture interrupts and Update Event interrupt are enabled.

In the GPTM1_IRQHandler routine:
- The GPTM1 update interrupt is used to deal counter overflow condition.
- The GPTM1 capture interrupt will store the capture value to global variable StartValue or compute the
  measured pulse width depending on rising/falling edge of the external signal.

The formular:
- pulse_width = (OverflowCounter << 16) + capture_value - StartValue;

If the USART is connected to PC serial port and the channels capture pulse value are valid, the pulse width
duration will be printed on Hyperterminal in an infinite loop if needed.

@par Directory Contents:

- GPTM/InputCapture/main.c                   Main program
- GPTM/InputCapture/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Connect the external signals (PA4~PA7) to the GPTM1 CH0~CH3 pins (PC0~PC3).
  @note GPTM0 Channel0 ~ 3 (PA4~PA7) is pulse output for loop back purpose.
- Connect a null-modem female/female RS232 cable between the DB9 connector
  COM1 and PC serial port. Hyperterminal configuration:
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
