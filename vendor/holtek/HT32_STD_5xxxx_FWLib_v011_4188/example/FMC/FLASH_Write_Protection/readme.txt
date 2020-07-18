/**
 @page FLASH_Write_Protection

 @verbatim
 * @file    FMC/FLASH_Write_Protection/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of FLASH write protection example.
 @endverbatim

@par Example Description:

This example describes how to enable and disable the write protection for HT32 FLASH.

To enable the write protection, "WRITE_PROTECT_ENABLE" must be defined in main.c.

Protect the pages by FLASH_ProgramOptionByte() function and define the parameter about the pages which are
protected. Generate a system reset to reload the new Option Byte value by NVIC_SystemReset() function.

To disable the write protection, "WRITE_PROTECT_DISABLE" must be defined in main.c.

Erase the Option Byte to disable the write protection by FLASH_EraseOptionByte() function. Generate a system
reset to reload the new Option Byte value by NVIC_SystemReset() function.

If the write protection of the specific pages has been disabled, the page can then be erased and programmed.

@par Directory Contents:

- FMC/FLASH_Write_Protection/main.c                Main program
- FMC/FLASH_Write_Protection/ht32fxxxx_it.c        Interrupt handlers

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
