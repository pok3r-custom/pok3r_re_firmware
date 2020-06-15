/**
 @page DAC_Sync_12bit_2CH_Interrupt

 @verbatim
 * @file    DAC/Sync_12bit_2CH_Interrupt/readme.txt
 * @version V1.00
 * @date    2019-05-28
 * @brief   Description of DAC.
 @endverbatim

@par Example Description:

This example describes how to use HT32 DAC synchronize. DAC's channel0 output 1.65v, and DAC's channel1 output 1.65v.

Note. Different resolutions of the DAC Sync mode have different setting data methods.

@par Directory Contents:

- DAC/Sync_12bit_2CH_Interrupt/main.c               Main program
- DAC/Sync_12bit_2CH_Interrupt/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

- This example can be run on HT32 Series development board.
- Please observe the DAC's voltage change through the oscilloscope.

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
