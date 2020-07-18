/**
 @page TM_SinglePulseMode

 @verbatim
 * @file    TM/SinglePulseMode/readme.txt
 * @version V1.00
 * @date    2016-04-27
 * @brief   Description of GPTM single pulse mode example.
 @endverbatim

@par Example Description:

This example shows how to use the GPTM peripheral to generate a Single Pulse Mode
after a rising edge of an external signal has been received in Timer Input pin.

If the GPTM0_PCLK frequency is set to 40 ,48 or 60 MHz and the Prescaler is 1, so the GPTM counter
clock is 20 MHz ,24 or 30MHz respectivly.

The maximum frequency value to trigger the GPTM input is GPTM_CounterClock/HTCFG_SINGLE_PULSE_GPTM_COUNTER_RELOAD = 500Hz

The GPTM is configured as follows:
- The Single Pulse mode is used.
- The rising edge is used as active edge.
- The Single Pulse signal is output on GT0_CH3.

The Compare value decides the delay value, the delay value is fixed to 1.5 ms:
- delay =  HTCFG_SINGLE_PULSE_GPTM_COMPARE / GPTM_CounterClock = 1.5 ms.
- The (CounterReload - Compare + 1) value decides the Single Pulse value,the pulse value is fixed to 0.5 ms:
Single Pulse value = (CounterReload - Compare + 1)/GPTM0_CounterClock = 0.5 ms.

@par Directory Contents:

- TM/SinglePulseMode/main.c                   Main program
- TM/SinglePulseMode/ht32fxxxx_it.c           Interrupt handlers

@par Hardware and Software Environment:

- Refer "ht32_board_config.h" for pin assignment.
- Connect the external signal to the Key1
  @note The Key2 Button can generate a rising edge to trigger single pulse output.
- Connect the GT0_CH pin to an oscilloscope to monitor the waveform.
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
