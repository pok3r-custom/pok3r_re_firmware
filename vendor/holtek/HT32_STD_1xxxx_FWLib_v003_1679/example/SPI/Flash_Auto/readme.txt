/**
 @page SPI_Flash_Auto

 @verbatim
 * @file    SPI/Flash_Auto/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of the SPI Flash example (with auto detection).
 @endverbatim

@par Example Description:

This example describes how to use the SPI to communicate with SPI FLASH.

Read the Flash ID from SPI flash and compare. If the ID is correct, turn on the LED1.

Prior to write operation, the program should perform an erase operation of the selected sector.
Then a write of a Tx_Buffer to the memory followed by a dual output read of the written memory address.
The data read from the memory is stored in the Rx_Buffer and compared with the values of the
Tx_Buffer. If both data are identical, LED2 will be turned on.

Finally, the same sectors are erased again. All the data address written before are read (non-dual output)
and checked with 0xFF. If the verification is passed, LED3 will be turned on.

The SPI is configured as Master with an 8-bit data size. The SPI clock is set to
HCLK/2 MHz. The FLASH_WriteAddress and the FLASH_ReadAddress are defined as 0x100000
in this example.

@par Directory Contents:

- SPI/Flash_Auto/main.c                 Main program
- SPI/Flash_Auto/ht32f1xxxx_01_it.c     Interrupt handlers

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
