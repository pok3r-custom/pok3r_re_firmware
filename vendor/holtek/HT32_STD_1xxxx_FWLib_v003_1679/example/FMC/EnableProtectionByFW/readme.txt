/**
 @page FLASH_EnableProtectionByFW

 @verbatim
 * @file    FMC/EnableProtectionByFW/readme.txt
 * @version V1.00
 * @date    2018-11-19
 * @brief   Description of FLASH EnableProtectionByFW example.
 @endverbatim

@par Example Description:

This example shows how to enable security/write protection by firmware. The firmware will check the security/
write protection setting in the optiob byte.If one of the setting is not enabled, firmware will enable them
and trigger the system system to reload the option bytes.

@par Directory Contents:

- FMC/EnableProtectionByFW/main.c                Main program
- FMC/EnableProtectionByFW/ht32fxxxxx_nn_it.c    Interrupt handlers

@par Hardware and Software Environment:

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
