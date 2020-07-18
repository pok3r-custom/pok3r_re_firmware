/**
 @page CMP_InternalReference

 @verbatim
 * @file    CMP/InternalReference/readme.txt
 * @version V1.00
 * @date    2014-11-13
 * @brief   Description of CMP example.
 @endverbatim

@par Example Description:

This example describes how to perform the internal voltage reference provided by scaler
And how to config the cmp,in this code segment,
please enable the output rising/falling edge interrupts.
In the CMP ISR:
- Turn on LED1 when VP > VN.
- Turn off LED1 when VP < VN.

@par Directory Contents:

- CMP/InternalReference/main.c               Main program
- CMP/InternalReference/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:
- Connect a adjustable voltage to comparator CP1(PB10) pin.
  (If the development board has a variable resistor can also be used)
- Use LED1 are connected to PD.0 on HT32 DVB.
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
