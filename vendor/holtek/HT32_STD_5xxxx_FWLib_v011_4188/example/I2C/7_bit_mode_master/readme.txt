/**
 @page I2C_7_bit_mode_master

 @verbatim
 * @file    I2C/7_bit_mode_master/readme.txt
 * @version V1.00
 * @date    2016-04-21
 * @brief   Description of I2C Master 7 bit mode example.
 @endverbatim

@par Example Description:

This example describes how to configure I2C as Master mode.

Transmission behavior implies as following:

I2C is configured as Master and sends data to Slave one by one until 4 data are sent, then Master will
waiting for for the received data until 4 data are received.

@par Directory Contents:

- I2C/7_bit_mode_master/main.c               Main program
- I2C/7_bit_mode_master/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:

- Remember to connect I2C to other I2C slave respectively. Refer "ht32_board_config.h" for pin assignment.
- This example shows the result by LED1 and LED2.
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
