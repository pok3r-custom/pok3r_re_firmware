/**
 @page USBD_USB_UAC_Sound USBD_USB_UAC_Sound

 @verbatim
 * @file    USBD/USB_UAC_Sound/readme.txt
 * @version V1.00
 * @date    2015-05-12
 * @brief   Description of USB Device Audio Class example.
 @endverbatim

@par Example Description:

The USB Device Audio example code which shows how to use HT32 USB Device Library, enumeration, and Endpoint
Isochronous transfer. This example shows the USB sound function by using WM8978 audio codec and HT32 USB
device peripheral. Please connect a headphone to the headphone jack, the sound of PC will play to the
headphone via the USB.

This device

@par Directory Contents:

- USBD/USB_UAC_Sound/main.c                                    Main program
- USBD/USB_UAC_Sound/ht32fxxxx_it.c                            Interrupt handlers
- USBD/USB_UAC_Sound/ht32fxxxx_usbdconf.h                      USB Device Library configuration file
- USBD/USB_UAC_Sound/ht32_usbd_class.c                         USB Device Class related function
- USBD/USB_UAC_Sound/ht32_usbd_class.h                         Header file of the USB Device Class
- USBD/USB_UAC_Sound/ht32_usbd_descriptor.c                    Descriptor of USB Device
- USBD/USB_UAC_Sound/ht32_usbd_descriptor.h                    Header file of the USB Device Descriptor
- USBD/USB_UAC_Sound/i2cm.h                                    Header file of the I2C master driver
- USBD/USB_UAC_Sound/wm8978.h                                  Header file of wm8978 driver

@par Hardware and Software Environment:

This example can be run on HT32 Series development board. This example uses the following endpoints.
<PRE>
  Endpoint    Transfer Type         Buffer Length
  ========    ====================  ==============
  0           Control               64 bytes
  4           Isochronous IN        192 bytes
</PRE>

Please create a project according to the project_template and add the following extra source files into it.
- ht32_usbd_class.c
- ht32_usbd_descriptor.c

@par Low Power mode:

For the convenient during debugging and evaluation stage, the USBDCore_LowPower() in the main.c is map to
a null function by default. In the real product, you must map this function to the low power function of
firmware library by setting USBDCORE_ENABLE_LOW_POWER as 1 (in the ht32fxxxx_usbdconf.h file).

@par USB Library debug mode:

For debug purpose, your can turn on the USB Library debug mode by setting "USBDCORE_DEBUG" definition
value as 1 (which located at ht32_usbd_core.h). The debug message will be shown via the printf function
to the UART or ITM interface according to the retarget setting of firmware library.

NOTE THAT USB DEBUG MODE DEGRADES THE PERFORMANCE AND MAY CAUSE USB ERROR UNDER SOME CONDITIONS.

You shall turn off the USB debug mode on your final application. We strongly recommend turn off the
"Dump USB Debug data (USBDCORE_DEBUG_DATA)" option when you enable the USB debug mode and retarget the
message to UART.

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
