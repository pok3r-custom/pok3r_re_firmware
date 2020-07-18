/**
 @page I2C_PDMA

 @verbatim
 * @file    I2C/PDMA/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of I2C PDMA example.
 @endverbatim

@par Example Description:

This example describes how to configure I2C transmission by PDMA.

Transmission behavior implies as following:

I2Cx is configured as Master receiver in order to perform the function "I2C_PDMANACKCmd"
and I2Cy is configured as Slave transmitter, I2C_PDMANACKCmd will disable Acknowledge 
automatically before last data are sent. 

PDMA channel  x is configured to transmit data from I2C0->DR to I2C0_Buffer_Rx for I2Cx receiver,
PDMA channel  y is configured to transmit data from I2C1_Buffer_Tx to I2C1->DR for I2Cy transmitter.

After the related configuration are done, Master sends a START & slave address to start the 
transmission, Slave will be addressed, once the PDMA Rx request in Master and PDMA Tx request 
in Slave are enabled, Master sends data and Slave receives data simultaneously by PDMA channel x 
& channel y. After 16 data are sent, Master will give Slave an NACK, then I2C1 will release
SDA for Master STOP generation.

Program will compare the received data to the transferred data to check on data validation.

@par Directory Contents:

- I2C/PDMA/main.c               Main program
- I2C/PDMA/ht32fxxxx_it.c       Interrupt handlers

@par Hardware and Software Environment:
- Refer "ht32_board_config.h" for pin assignment.
- Remember to connect I2Cx(Master) to I2Cy(Slave) respectively.
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
