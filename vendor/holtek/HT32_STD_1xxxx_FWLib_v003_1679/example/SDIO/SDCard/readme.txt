/**
 @page SDCard

 @verbatim
 * @file    SDIO/SDCard/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of the SDIO Example.
 @endverbatim

@par Example Description:

This example provides a basic application of how to use the SDIO firmware library
and an associate driver to perform read/write operations on the SD Card memory 
(SD Card V1.0, V1.1, V2.0 and SDHC (High Capacity) protocol)that could be mounted 
on the HT32F1xxxx.

The example provides different SD Card transfer states and operations.
Below a description of each step:

- SD Card Initialized Operation
  - First the SDIO peripheral and SD Card are initialized using the "SD_Init()" function:
  - Configure the SDIO according to the desired SDIO_CK clock frequency.
  - Reset the SD Card.
  - Identify the SD Card.
  - Initialize the SD Card.
  - Get the SD Card Information.
  - Select the SD Card.
  - Enable the Wide Bus mode (4-bit data).

- SD Card Erase Operation
  - Start an Erase operation: Erase the corresponding blocks using the "SD_Erase()" function. 
  - Read the Erased blocks using the "SD_ReadMultiBlocks()" function.
  - Test if the corresponding Blocks are well erased: check if the errorstatus variable is equal to PASSED.
    
- SD Card Single Block Operation
  - Start a Write operation: Write a single Block using the "SD_WriteBlock()" function.
  - Read a single Block using the "SD_ReadBlock()" function
  - Compare the written Block and the read one: check if the errorstatus variable is equal to PASSED.

- SD Card Multiple Block Operation
  - Start a Multiple Write operation: Write a multi Blocks using the "SD_WriteMultiBlocks()" function.
  - Read a multiple Blocks using the "SD_ReadMultiBlocks()" function.
  - Compare the written Blocks and the read one: check if the errorstatus variable is equal to PASSED.

  All data transfers are made by DMA.

@par Directory Contents:

- SDIO/SDCard/main.c                Main program
- SDIO/SDCard/ht32f1xxxx_01_it.c    Interrupt handlers
- SDIO/SDCard/sdio_sd.c             The source file of sdio_sd.
- SDIO/SDCard/sdio_sd.h             The header file of sdio_sd.

@par Hardware and Software Environment:

- Refer "ht32_board_config.h" for pin assignment.
- Connect a null-modem female/female RS232 cable between the COM1 connector
  and PC serial port. HyperTerminal configuration:
- Word Length = 8 Bits
- One Stop Bit
- No parity
- BaudRate = 115200 baud
- flow control: None
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
