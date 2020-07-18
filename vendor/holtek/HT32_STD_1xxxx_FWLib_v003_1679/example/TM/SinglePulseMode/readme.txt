/**
 @page TM_SinglePulseMode

 @verbatim
 * @file    TM/SinglePulseMode/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of GPTM single pulse mode example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM peripheral to generate a Single Pulse Mode
after a rising edge of an external signal has been received in Timer Input pin.

If the GPTM0_PCLK frequency is set to 72 MHz / 96 MHz and the Prescaler is 72 / 96, so the GPTM0 counter
clock is 1 MHz.

The CounterReload value is 50000 (GPTM0_CRR), so the maximum frequency value to trigger
the GPTM0 input is 1 MHz/50000= 20 Hz.

The GPTM0 is configured as follows:
- The Single Pulse mode is used.
- The external signal is connected to GT0_ETI pin.
- The rising edge is used as active edge.
- The Single Pulse signal is output on GT0_CH3.

The Compare value decides the delay value, the delay value is fixed to 5 ms:
- delay = CH3CCR/GPTM0 counter clock = 5 ms.
(CounterReload - Compare + 1) defines the Single Pulse value while the pulse value is fixed to 45 ms.

@par Directory Contents:

- GPTM/SinglePulseMode/main.c                   Main program
- GPTM/SinglePulseMode/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Connect the external signal to the GT0_ETI pin. Refer "ht32_board_config.h" for pin assignment.
- Generate a rising edge on GT0_ETI to trigger single pulse output.
- Connect the GT0_CH3 (PA7) pin to an oscilloscope to monitor the waveform.
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
