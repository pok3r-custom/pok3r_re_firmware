/**
 @page EBI_DM9000A_ReadID

 @verbatim
 * @file    EBI/DM9000A_ReadID/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of EBI DM9000A Read ID example.
 @endverbatim

@par Example Description:

This example describes how to communicate to DM9000A with EBI interface. The example will show the following
message via the UART interface.
<PRE>
  Init DM9000A....
  DM9000A id: 0x90000a46
  IO 8 bits mode
  DM9000A MAC: F0:F1:F2:F3:F4:F5:
  operating at 100M full duplex mode
  Init DM9000A Successful!
</PRE>

@par Directory Contents:

- EBI/DM9000A_ReadID/main.c               Main program
- EBI/DM9000A_ReadID/dm9000a.c            DM9000A driver
- EBI/DM9000A_ReadID/dm9000a.h            Header file of the DM9000A driver
- EBI/DM9000A_ReadID/dm9000a_reg.h        Register define of DM9000A
- EBI/DM9000A_ReadID/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:

- Connect a null-modem female/female RS232 cable between the COM1 DB9 connector and PC serial port.
  Hyperterminal configuration:
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
