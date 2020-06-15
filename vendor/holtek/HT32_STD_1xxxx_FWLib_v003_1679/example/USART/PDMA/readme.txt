/**
 @page USART_PDMA

 @verbatim
 * @file    USART/PDMA/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of USART Tx Rx used PDMA example.
 @endverbatim

@par Example Description:

This example describes how to get data from or put data to USART used the PDMA.

The USART baud rate is set to 115200 bps.

USART will read data from Rx buffer and then write the data to Tx buffer via PDMA mode 
in an infinite loop.

@par Directory Contents:

- USART/PDMA/main.c               Main program
- USART/PDMA/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:

- Connect a null-modem female/female RS232 cable between the COM1 DB9 connector
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
