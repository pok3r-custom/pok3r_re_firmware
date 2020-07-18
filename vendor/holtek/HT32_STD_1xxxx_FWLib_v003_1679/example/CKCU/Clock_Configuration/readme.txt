/**
 @page CKCU_Clock_Configuration

 @verbatim
 * @file    CKCU/Clock_Configuration/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of CKCU example.
 @endverbatim

@par Example Description:

This example describes how to configure the system clock to get different 
frequencies of 8 MHz, 24 MHz, 48 MHz, 72 MHz and 96 MHz that have been defined in main.c.

Call function CKCU_GetClocksFrequency to get the current clocks setting.
The ClockFreq structure configures the different frequencies on chip.

This example also shows the HSE (High Speed External clock) monitor function.
If HSE clock fails (maybe broken), HSI will be selected as the system clock source.
NMI exception will then be generated if the clock stuck interrupt was enabled.
In the NMI handler, enables the HSE ready interrupt so that once the HSE clock 
is recovered, the HSE ready interrupt can be generated.

In the CKRDY handler, the system clock can be reconfigured.

The HSE clock output is on the CKOUT pin.

Toggle three LEDs with a timing delay.

@par Directory Contents:

- CKCU/Clock_Configuration/main.c                    Main program
- CKCU/Clock_Configuration/ht32f1xxxx_01_it.c        Interrupt handlers

@par Hardware and Software Environment:

- Use LED1, LED2 and LED3 of HT32 Development board.
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
