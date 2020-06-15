/**
 @page FLASH_Security

 @verbatim
 * @file    FMC/FLASH_Security/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of FLASH security example.
 @endverbatim

@par Example Description:

This example describes how to enable security protection for HT32 FLASH.

If the security function has been enabled, the flash code and data can not be read by debug port. The only way
to disable the security function is mass erase.

Enable security function by calling FLASH_ProgramOptionByte() function with the struct member,
"MainSecurity=1". Generate a system reset to reload the new Option Byte value by NVIC_SystemReset() function.

The Flash code and data access is not allowed when the security protection is enabled and debug port access
occurred. It causes the program can not be executed when you download it into the Flash by the IDE via debug
adapter (debug port access). So that, you need apply a power-on reset to run the code. (power-off the board
and power-on again).

@par Directory Contents:

- FMC/FLASH_Security/main.c                Main program
- FMC/FLASH_Security/ht32f1xxxx_01_it.c    Interrupt handlers

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
