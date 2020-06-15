/**
 @page I2C_EEPROM_Simulate

 @verbatim
 * @file    I2C/EEPROM_Simulate/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of I2C EEPROM example used interrupt.
 @endverbatim

@par Example Description:

This example describes how to use I2C slave to simulate an EEPROM by interrupt
and how to use I2C master to access the EEPROM by interrupts.

The I2C0 transmission behavior implies as following:

The I2C0 is configure as an I2C master used interrupt. The I2C0 interrupt service
routine will first check the bus error, timeout condition and arbitration loss condition.
If these condition occur, the ISR will generate an I2C STOP and store the error state
into the global variable I2CM_Transfer.Status for identification.

If the NACK condition occurs, the I2C0 ISR will check the I2CM_Transfer.RetryDownCounter.
When the I2CM_Transfer.RetryDownCounter reach 0, the ISR will generate an I2C STOP and
store I2CM_SLAVE_NO_RESPONSE into the I2CM_Transfer.Status. Else the ISR will generate
an I2C RE-START to try again.

If no error condition, the ISR goto normal state machine to deal the I2C0 master
transmission and reception function.

The I2C1 transmission behavior implies as following:

The I2C1 is configure as an I2C slave used interrupt to simulate an EEPROM.
When the I2C STOP condition is detected, the ISR will start to deal the received data.
The ACK function is disabled first to let EEPROM slave to reply NACK during the action.
A short delay is inserted for the EEPROM program time simulation. Afterward the ACK
function is re-enabled.

@par Directory Contents:

- I2C/EEPROM_Simulate/main.c                    Main program
- I2C/EEPROM_Simulate/i2cm.h                    I2C Master header file
- I2C/EEPROM_Simulate/ht32f1xxxx_01_it.c        Interrupt handlers

@par Hardware and Software Environment:

- For the default software configuration, the loop back mode is enabled. Only one
  development board is needed. But remember to connect I2C0 to I2C1. Refer "ht32_board_config.h" for pin assignment.
  respectively(I2C0 Master, I2C1 EEPROM).
- If the LOOP_BACK defined in main.c file is commented, the loop back mode is disabled.
  User must prepare two development boards to run the example code.
  Set one development board's BOOT0 pin to high to select EEPROM function.
  Set another one's BOOT0 pin to low to select I2C master function.
  Connect Master Development Board to EEPROM Development Board
  respectively and don't forget to connect the common-ground.
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
