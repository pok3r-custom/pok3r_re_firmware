/**
 @page USBD_Mass_Storage

 @verbatim
 * @file    USBD/Mass_Storage/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of USB Device Mass Storage example.
 @endverbatim

@par Example Description:

The USB Device Mass Storage example code shows how to use HT32 USB Device Library, enumeration, and Endpoint
bulk transfer. This example code communicates with PC host using the Bulk Only Transport (BOT) protocol.
When the USB enumeration is finished, you can access RAM disk and SD Disk by windows file explorer. The
example includes BOT, SCSI Block Command (SBC-3 and SPC-4), RAM and SD disk related function. The data flow
of BOT is as below.
<PRE>
              ---------
              | Ready |   <   -   -   -   |
              ---------
                  |                       |
              ---------
              |  CBW  |                   |
              ---------
          /       |       \               |
    -----------       ------------
    | DATA IN |   |   | DATA OUT |        |
    -----------       ------------
          \       |       /               |
              ---------
              |  CSW  |   -   -   -   -   |
              ---------

  Host                    Device
  ==========              ==========
  CBW            ->       BOT -> SBC
                          Process CBW command by BOT state machine and pass CB to SBC function.
  OUT(s)         ->       BOT -> SBC -> DISK (RAM or SD)
                          Received data from Host and pass to SBC. Execute SBC command and write
                          data to disk if necessary.
  or

  IN(s)          <-       BOT <- SBC <- DISK (RAM or SD)
                          Send data to Host according to the SBC command.
  CSW            <-       Return CSW according to the SBC command result
</PRE>

@par Directory Contents:

- USBD/Mass_Storage/main.c                                    Main program
- USBD/Mass_Storage/ht32fxxxx_it.c                            Interrupt handlers
- USBD/Mass_Storage/ht32fxxxx_conf.h                          Firmware library configuration file
- USBD/Mass_Storage/system_ht32fxxxx.c                        System configuration file
- USBD/Mass_Storage/ht32fxxxx_usbdconf.h                      USB Device Library configuration file
- USBD/Mass_Storage/ht32_usbd_class.c                         USB Device Class related function
- USBD/Mass_Storage/ht32_usbd_class.h                         Header file of the USB Device Class
- USBD/Mass_Storage/ht32_usbd_descriptor.c                    Descriptor of USB Device
- USBD/Mass_Storage/ht32_usbd_descriptor.h                    Header file of the USB Device Descriptor
- USBD/Mass_Storage/usb_bulk_only_transport.c                 Bulk only transport (BOT) related functions
- USBD/Mass_Storage/usb_bulk_only_transport.h                 Header file of BOT
- USBD/Mass_Storage/usb_scsi_block_command.c                  SCSI Block Command (SBC-3 and SPC-4)
- USBD/Mass_Storage/usb_scsi_block_command.h                  Header file of SCSI Block Command (API)
- USBD/Mass_Storage/usb_scsi.h                                Header file of SCSI Block Command (Protocol)
- USBD/Mass_Storage/ram_disk.c                                RAM Disk related functions
- USBD/Mass_Storage/ram_disk.h                                Header file of RAM Disk
- USBD/Mass_Storage/sd_disk.c                                 SD Disk related functions
- USBD/Mass_Storage/sd_disk.h                                 Header file of SD Disk
- USBD/Mass_Storage/spi_sd.c                                  SD Card raw access function
- USBD/Mass_Storage/spi_sd.h                                  Header file of SD Card

@par Hardware and Software Environment:

This example can be run on HT32 Series development board. This example uses the following endpoints.
<PRE>
  Endpoint    Transfer Type         Buffer Length
  ========    ====================  ==============
  0           Control               64 bytes
  1           Bulk IN               64 bytes
  2           Bulk OUT              64 bytes
</PRE>

Please create a project according to the project_template and add the following extra source files into it.
- ht32_usbd_class.c
- ht32_usbd_descriptor.c
- usb_bulk_only_transport.c
- usb_scsi_block_command.c
- ram_disk.c
- sd_disk.c
- spi_sd.c

This example code supports multiple LUN function which can used to access different media by single
USB Mass Storage Device. A RAM Disk and SD Disk are supported by this example code. You can enable/disable
both of them in "usb_bulk_only_transport.h" file. The number of LUN can also be changed in the same file.

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
