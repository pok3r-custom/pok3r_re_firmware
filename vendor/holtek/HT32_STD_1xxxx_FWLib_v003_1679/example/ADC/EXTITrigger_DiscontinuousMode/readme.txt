/**
@page ADC_EXTITrigger_DiscontinuousMode ADC_EXTITrigger_DiscontinuousMode

 @verbatim
 * @file    ADC/EXTITrigger_DiscontinuousMode/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of EXTI trigger ADC discontinuous mode example.
 @endverbatim

@par Example Description:

This example shows how to use the ADC discontinuous mode trigged by EXTI channel.
- The KEY1 is connected to EXTI channel used to trigger ADC.
- The ADCLK frequency is set to 12 MHz (72 MHz /6 or 96 MHz /8).
- Three ADC channel are configured as ADC input.

The ADC is configured as discontinuous mode. The sequence length is 3 and subgroup length is 2.

The subgroup 0 includes:
- Sequence 0 used to convert Channel n1. The conversion time = (1/12)*14 = 1.167us.
- Sequence 1 used to convert Channel n2. The conversion time = (1/12)*14 = 1.167us.

The subgroup 1 includes:
- Sequence 2 used to convert Channel n3. The conversion time = (1/12)*14 = 1.167us.

The cycle and subgroup EOC(end of conversion) interrupt is enabled. The ADC interrupt service routine will
store ADC result into the global variable gADC_Result. The subgroup length is 2. So every 2 ADC single EOC
occur a subgroup EOC interrupt. Because sequence length is 3 and subgroup length is 2, the last subgroup
length is 1 (3 mod 2 = 1). When the last subgroup is finished, both cycle and subgroup EOC flag are set. So
this program use cycle EOC to distinguish the last subgroup.

If the USART is connected to PC, the transformed data will be printed on Hyperterminal.

@par Directory Contents:

- ADC/EXTITrigger_DiscontinuousMode/main.c               Main program
- ADC/EXTITrigger_DiscontinuousMode/ht32f1xxxx_01_it.c   Interrupt handlers

@par Hardware and Software Environment:

- Refer "ht32_board_config.h" for pin assignment.
- Connect a null-modem female/female RS232 cable between the COM1 DB9 connector and PC serial port.
  HyperTerminal configuration:
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
