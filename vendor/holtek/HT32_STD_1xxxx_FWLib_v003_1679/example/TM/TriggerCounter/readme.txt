/**
 @page TM_TriggerCounter

 @verbatim
 * @file    TM/TriggerCounter/readme.txt
 * @version V1.00
 * @date    2019-03-13
 * @brief   Description of TM Trigger Counter example.
 @endverbatim

@par Example Description:

This example shows how to use the xxTM peripheral to count the number of pulses on an input pin.
  1. Configure the TMn CH0 as an input capture mode (rising edge)
  2. Set the Slave Trigger Input (STI) source as Filtered Input of CH0 (TI0S0, TRSEL=b0001).
  3. Set the TMn as slave mode, trigger by STI (SMSEL = b111).

After the above setting, the counter of TMn will be incremented by one on the rising edge of TMn CH0.

@par Directory Contents:

- GPTM/TriggerCounter/main.c                   Main program
- GPTM/TriggerCounter/ht32f1xxxx_01_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Connect a button or VDD/GND to the TM CHn input pin. Refer "ht32_board_config.h" for pin assignment.
- Generate a rising edge on the TM CHn input pin to clock the TM.
- When TM Capture the signal, the message shall be output, "Capture! Counter = 00001".
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
