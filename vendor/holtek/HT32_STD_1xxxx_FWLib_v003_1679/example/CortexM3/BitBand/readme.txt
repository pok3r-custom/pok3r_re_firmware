/**
 @page CortexM3_BitBand

 @verbatim
 * @file    CortexM3/BitBand/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of BitBand example.
 @endverbatim

@par Example Description:

This example describes how to use bit-band alias to access SRAM and peripheral's register.

A mapping formula shows how to reference each word in the alias region to a corresponding
bit in the bit-band region. The mapping formula is:
- bit_word_addr = (Addr & 0xF0000000) + 0x02000000 + ((Addr & 0xFFFFF) << 5) + (BitNumber << 2))

where:
 - bit_word_addr: is the address of the word in the alias memory region that maps to the targeted bit.
 - Addr is the SRAM or peripheral's register address.
 - BitNumber is the bit position (0-31) of the targeted bit

@par Directory Contents:

- CortexM3/BitBand/main.c                   Main program
- CortexM3/BitBand/ht32f1xxxx_01_it.c       Interrupt handlers

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
