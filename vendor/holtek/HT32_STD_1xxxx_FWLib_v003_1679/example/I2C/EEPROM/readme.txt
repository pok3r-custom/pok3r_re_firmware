/**
 @page I2C_EEPROM

 @verbatim
 * @file    I2C/EEPROM/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of I2C EEPROM example.
 @endverbatim

@par Example Description:

This example describes how to use the I2C to communicate with the 24LC02 EEPROM.

The I2C is configured as Master transmitter during write operation and as Master 
receiver during read operation with 24LC02 EEPROM.

More details about the behavior of 24LC02 EEPROM such as page write, acknowledge
polling and sequential read,... please refer to 24LC02 datasheet.

@par Directory Contents:

- I2C/EEPROM/main.c               Main program
- I2C/EEPROM/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:

- This example shows the result by USART through hyperterminal.
- The device address of 24LC02 EEPROM is hard-wired as 0x51.
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
