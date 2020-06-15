/**
 @page EXTI_WakeUp_DeepSleepMode1

 @verbatim
 * @file    EXTI/WakeUp_DeepSleepMode1/readme.txt
 * @version V1.02
 * @date    2019-05-31
 * @brief   Description of EXTI WakeUp_DeepSleepMode1 example.
 @endverbatim

@par Example Description:

This example shows how to configure the GPIO as EXTI Wake Up Event to wake up the system from the
Deep Sleep mode 1.

The example also shows the different of WFI and WFE. Please set the "LOWPOWER_MODE_WFI"
as 1 (WFI, default) or 0 (WFE) to change the WFI/WFE mode.
  WFI: Wake up by interrupt only. Use the Event Wake Up interrupt (EVWUP) to wake up the system.
  WFE: Wake up by interrupt or EXTI Event. Use the EXTI Wake up Event to wake up the system.

LEDs off means the chip is in Deep Sleep mode 1.
LED1/LED2 is turn on by the ISR of Wake Up interrupt, EVWUP_IRQHandler() when using WFI mode.
LED3 is turn on by the main loop after system wake up.

@par Directory Contents:

- EXTI/WakeUp_DeepSleepMode1/main.c               Main program
- EXTI/WakeUp_DeepSleepMode1/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

- LEDs are used as the sign to indicate if the system is in the Deep Sleep mode 1 or not.
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
