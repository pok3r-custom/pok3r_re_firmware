/**
 @page USBD_HID_Keyboard_Mass_Storage

 @verbatim
 * @file    USBD/HID_Keyboard_Mass_Storage/readme.txt
 * @version V1.00
 * @date    2019-01-18
 * @brief   Description of USB Device HID Keyboard + Mass Storage example.
 @endverbatim

@par Example Description:

The USB Device HID Keyboard example code which shows how to use HT32 USB Device Library, enumeration,
and Endpoint interrupt transfer. This example uses button and LED on the development board to emulate
Number Lock, Caps Lock, and Scroll Lock of Keyboard.
<PRE>
  Key                    Function
  ==================     ==================
  Wakeup                 Number Lock
  Key1                   Caps Lock
  Key2                   Scroll Lock
</PRE>

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

- USBD/HID_Keyboard_Mass_Storage/main.c                                          Main program
- USBD/HID_Keyboard_Mass_Storage/ht32fxxxx_it.c                                  Interrupt handlers
- USBD/HID_Keyboard_Mass_Storage/ht32fxxxx_conf.h                                Firmware library configuration file
- USBD/HID_Keyboard_Mass_Storage/system_ht32fxxxx.c                              System configuration file
- USBD/HID_Keyboard_Mass_Storage/ht32fxxxx_usbdconf.h                            USB Device Library configuration file
- USBD/HID_Keyboard_Mass_Storage/ht32_usbd_class.c                               USB Device Class related function
- USBD/HID_Keyboard_Mass_Storage/ht32_usbd_class.h                               Header file of the USB Device Class
- USBD/HID_Keyboard_Mass_Storage/ht32_usbd_descriptor.c                          Descriptor of USB Device
- USBD/HID_Keyboard_Mass_Storage/ht32_usbd_descriptor.h                          Header file of the USB Device Descriptor
- USBD/HID_Keyboard_Mass_Storage/CoIDE_HID_Keyboard/CoIDE_HID_Keyboard.cob       Project file of CoIDE
- USBD/HID_Keyboard_Mass_Storage/CoIDE_HID_Keyboard/startup_ht32fxxxx.c          Startup file of CoIDE
- USBD/HID_Keyboard_Mass_Storage/EWARM/Project.eww                               Project file of EWARM
- USBD/HID_Keyboard_Mass_Storage/EWARM/startup_ht32fxxxx.s                       Startup file of EWARM
- USBD/HID_Keyboard_Mass_Storage/EWARM/ht32fxxxx_flash.icf                       Link script file of EWARM
- USBD/HID_Keyboard_Mass_Storage/MDK_ARM/Project.uvproj                          Project file of MDK-ARM
- USBD/HID_Keyboard_Mass_Storage/MDK_ARM/startup_ht32fxxxx.s                     Startup file of MDK-ARM
- USBD/HID_Keyboard_Mass_Storage/SourceryG++Lite/Project.uvproj                  Project file of SourceryG++ Lite
- USBD/HID_Keyboard_Mass_Storage/SourceryG++Lite/startup_ht32fxxxx.s             Startup file of SourceryG++ Lite
- USBD/HID_Keyboard_Mass_Storage/SourceryG++Lite/ht32fxxxx.ld                    Link script file of SourceryG++ Lite
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/usb_bulk_only_transport.c       Bulk only transport (BOT) related functions
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/usb_bulk_only_transport.h       Header file of BOT
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/usb_scsi_block_command.c        SCSI Block Command (SBC-3 and SPC-4)
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/usb_scsi_block_command.h        Header file of SCSI Block Command (API)
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/usb_scsi.h                      Header file of SCSI Block Command (Protocol)
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/ram_disk.c                      RAM Disk related functions
- USBD/HID_Keyboard_Mass_Storage/Src_MassStorage/ram_disk.h                      Header file of RAM Disk

@par Hardware and Software Environment:

This example can be run on HT32 Series development board. This example uses the following endpoints.
<PRE>
  Endpoint    Transfer Type         Buffer Length
  ========    ====================  ==============
  0           Control               64 bytes
  1           Interrupt IN          8 bytes

  2           Bulk IN               64 bytes
  3           Bulk OUT              64 bytes

</PRE>

Please create a project according to the project_template and add the following extra source files into it.
- ht32_usbd_class.c
- ht32_usbd_descriptor.c
- usb_bulk_only_transport.c
- usb_scsi_block_command.c
- ram_disk.c

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
