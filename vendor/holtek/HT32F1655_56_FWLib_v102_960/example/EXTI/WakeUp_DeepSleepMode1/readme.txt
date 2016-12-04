/**
 @page EXTI_WakeUp_DeepSleepMode1

 @verbatim
 * @file    EXTI/WakeUp_DeepSleepMode1/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of EXTI WakeUp_DeepSleepMode1 example.
 @endverbatim

@par Example Description:

This example describes how to set related configuration of EXTI event in EXTI and configures 
the deep sleep mode 1 in NVIC. Press Wakeup button to wake up from deep sleep mode 1.

@par Directory Contents:

- EXTI/WakeUp_DeepSleepMode1/main.c               Main program
- EXTI/WakeUp_DeepSleepMode1/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

- LEDs are used as the sign to indicate if the program is sleeping. LEDs are
  Toggling means that the chip has already been waken up.
- This example can be run on HT32 Series development board.

@note
Deep sleep mode 1 will be waken up only if the event and the interrupt happen simultaneously.

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

 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 */
