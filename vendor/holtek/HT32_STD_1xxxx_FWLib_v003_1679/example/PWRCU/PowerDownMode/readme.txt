/**
 @page PWRCU_PowerDownMode

 @verbatim
 * @file    PWRCU/PowerDownMode/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of PWRCU Power Down Mode example.
 @endverbatim

@par Example Description:

This example describes how to enter the system to Power Down Mode and be waken up by
RTC Compare Match or WAKEUP pin.

The system clock is set to 72 MHz or 96 MHz by the external high speed oscillator(HSE),
an EXTI Channel is configured to generate an interrupt on falling edge and
the SysTick is programmed to generate an interrupt every 250 ms.
In the SysTick interrupt handler, the LED1 is toggled to indicate whether the MCU 
is in Power Down mode or RUN mode.

When a falling edge is detected on the EXTI Channel (i.e. KEY1 is pressed),
an interrupt is generated. In the EXTI handler routine, the RTC is configured 
to generate an Compare Match event in 3 seconds, the system will then enter 
Power Down mode causing the LED1 to stop toggling.
A rising edge on WAKEUP pin or an external RESET will wake up the system from
Power Down mode. If neither rising edge on WAKEUP pin nor external RESET
are generated within 3 second, the RTC Compare Match will wake up the system.

After waking up from Power Down mode, program execution restarts and LED1 toggles again.
The RTC configuration is kept so that it is not required to be reconfigured.

Three leds LED1, LED2 and LED3 are used to monitor the system state as following:
 - LED1 toggling: system is in RUN mode
 - LED1 off / LED2 off / LED3 off: system is in Power Down mode
 - LED2 on: system resumes from Power Down mode by WAKEUP pin
 - LED3 on: system resumes from Power Down mode by RTC Compare Match

@par Directory Contents:

- PWRCU/PowerDownMode/main.c                   Main program
- PWRCU/PowerDownMode/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- This example can be run on HT32 Series development board.

@note For power consumption measurement in Power Down Mode:
- Modify the example code to configure all unused GPIO pins as input floating.
- Replace jumper J7 with an ampere meter.

@note Re-flash the code:
- The system would have the matter with re-flashing the code when it enters into Power Down Mode. Users
  could press the Reset button on the board and then click the download icon before it enters into Power
  Down Mode.

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
