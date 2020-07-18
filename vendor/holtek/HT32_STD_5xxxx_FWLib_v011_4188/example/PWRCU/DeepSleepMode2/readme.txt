/**
 @page PWRCU_DeepSleepMode2

 @verbatim
 * @file    PWRCU/DeepSleepMode2/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of PWRCU Deep Sleep Mode 2 example.
 @endverbatim

@par Example Description:

This example shows how to drive the system into Deep Sleep Mode 2 and be waken up by WAKEUP pin 
and RTC compare match wakeup.

The WAKEUP pin is configured to generate wakeup event at rising edge.
The RTC is configured to generate Compare Match Wakeup event and
the RTC time base is set to 1 second by the external low speed oscillator(LSE).

The system clock is set to 48/40 MHz by the external high speed oscillator(HSE).

Press KEY1 to enter the infinite loop:
- Short delay 0.5 second
- Configure RTC to generate a compare match in 3 seconds
- Turn off LED1
- Enter Deep Sleep Mode 2
- Turn on LED1

Three leds LED1, LED2 and LED3 are used to monitor the system state as following:
- LED1  on: system in RUN mode
- LED1 off: system in Deep Sleep Mode 2
- LED2 is toggled if Wakeup pin is used to exit from Deep Sleep Mode 2
- LED3 is toggled if RTC Compare Match is used to exit from Deep Sleep Mode 2

@par Directory Contents:

- PWRCU/DeepSleepMode2/main.c                   Main program
- PWRCU/DeepSleepMode2/ht32fxxxx_it.c           Interrupt handlers

@par Hardware and Software Environment:

- This example can be run on HT32 Series development board.

@note For power consumption measurement in Deep Sleep Mode 2:
- Modify the example code to configure all unused GPIO pins as input floating.
  The "DISABLE_DEBUG_PIN" setting in the example code could configure SWDIO, SWCLK, SWO as input floating.
- Replace MVDD jumper with an ampere meter.

@note Re-download the code after this example running:
- The debug adapter such as e-Link32 can not communicate with the chip when it enters into Deep Sleep Mode 1.
  Please press the Reset button on the board and then click the download icon before it enters into
  Deep Sleep Mode 1.
- If SWD debug pins are configured as input floating, please follow the steps:
  1. Power off, set booting jumpers as boot from SRAM.
  2. Power on, download the code.
  3. Power off, set booting jumpers as boot from Main Flash.
  4. Power on.

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
