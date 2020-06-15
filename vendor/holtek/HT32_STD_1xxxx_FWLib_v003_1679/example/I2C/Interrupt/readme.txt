/**
 @page I2C_Interrupt

 @verbatim
 * @file    I2C/Interrupt/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of I2C Interrupt example.
 @endverbatim

@par Example Description:

This example describes how to configure I2C transmission by interrupts.

Transmission behavior implies as following:

Step1:
I2C0 is configured as Master transmitter and I2C1 is configured as Slave receiver. 
Enable Related I2C interrupts, then I2C0 generates a START & sends slave address to
generate the interrupt respectively, each interrupt matches the event in I2Cx ISR(Interrupt
Service Routine) and will react as the example program, after 4 data are transmitted,
I2C0 will generate a Re-START and become Master receiver.

Step2:
I2C0 acts as Master receiver and I2C1 acts as Slave transmitter.
I2C1 sends data to I2C0 one by one, next datum will be sent by I2C1 until I2C0 receives 
each datum completely, after 4 data are sent, I2C0 will generate a STOP and program will
compare the received data to the transferred data to check on data validation. 

@par Directory Contents:

- I2C/Interrupt/main.c               Main program
- I2C/Interrupt/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:

- Remember to connect I2C0 to I2C1 respectively. Refer "ht32_board_config.h" for pin assignment.
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
