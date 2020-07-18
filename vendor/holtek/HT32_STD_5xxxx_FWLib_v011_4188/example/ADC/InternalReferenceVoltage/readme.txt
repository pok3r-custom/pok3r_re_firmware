/**
 @page ADC_InternalReferenceVoltage

 @verbatim
 * @file    ADC/InternalReferenceVoltage/readme.txt
 * @version V1.00
 * @date    2019-03-07
 * @brief   Description of Internal VREF Generator Output Voltage example.
 @endverbatim

@par Example Description:

This example shows how to use the ADC Reference Voltage to get VDDA and Potentiometer.

Change the ReferenceVoltage and ADC_VREFConfig to Output different Refernece Voltage.

The ADCLK frequency is set to CK_AHB / 64. Conversion time = (1/(CK_AHB / 64)) * 14.
The ADC channel n is configured as ADC input.

The ADC is configured as continuous mode and the single end of conversion interrupt is enabled.
Therefore, the ADC will continuously convert ADC input.
Each time the ADC conversion is finished, a single end of conversion interrupt will occur.
The ADC interrupt service routine will transform the MVDDA, IVREF, ADC result to milli-Voltage(mV).

If the USART is connected to PC, the transformed data will be printed on Hyperterminal.

@par Directory Contents:

- ADC/InternalReferenceVoltage/main.c                 Main program
- ADC/InternalReferenceVoltage/ht32fxxxx_it.c         Interrupt handlers

@par Hardware and Software Environment:

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
