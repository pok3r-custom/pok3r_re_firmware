/**
 @page SPI_SEL_Software

 @verbatim
 * @file    SPI/SEL_Software/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of the SPI SEL software control example.
 @endverbatim

@par Example Description:

This example describes how to configure SPI transmission by SEL software control.

Transmission behavior implies as following:

This example configures SPI0 as master and SPI1 as slave, remember to set SEL as output mode
for slave select. Both SPIs are configured with 8 bits mode, non-FIFO mode, HCLK/6 MHz transmission speed.

Notice setting SEL output as active to select slave SPI1 before transmission begins, SPI0 starts to send
data from SPI0_Buffer_Tx and receives data to SPI0_Buffer_Rx one by one. The same behavior slave
SPI1 does simultaneously, Transmission and Receiving by polling, This example will end after 4 data
are sent and received for each SPI, program will compare the received data to the transferred data to
check on data validation.

@par Directory Contents:

- SPI/SEL_Software/main.c                 Main program
- SPI/SEL_Software/ht32f1xxxx_01_it.c     Interrupt handlers

@par Hardware and Software Environment:

- Remember to connect SPI0 to SPI1 respectively. Refer "ht32_board_config.h" for pin assignment.
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
