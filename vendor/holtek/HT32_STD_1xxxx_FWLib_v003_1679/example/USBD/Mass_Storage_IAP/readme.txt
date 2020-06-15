/**
 @page USBD_Mass_Storage_IAP

 @verbatim
 * @file    USBD/Mass_Storage_IAP/readme.txt
 * @version V1.00
 * @date    2014-06-30
 * @brief   Description of USB Device Mass Storage IAP example.
 @endverbatim

@par Example Description:

This example code shows how to update embedded firmware by HT32 USB Device Library and Mass Storage Class.
It communicates with PC host using the Bulk Only Transport (BOT) protocol. When the USB enumeration is
finished, you can update firmware by accessing a disk via windows file explorer. The example includes BOT,
SCSI Block Command (SBC-3 and SPC-4), In-Application Programming (IAP) and embedded Flash controller related
function. The data flow of BOT is as below.
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
  OUT(s)         ->       BOT -> SBC -> DISK (Embedded Flash)
                          Received data from Host and pass to SBC. Execute SBC command and write
                          data to disk if necessary.
  or

  IN(s)          <-       BOT <- SBC <- DISK (Embedded  Flash)
                          Send data to Host according to the SBC command.
  CSW            <-       Return CSW according to the SBC command result
</PRE>

@par Start AP / IAP mode:

After power up, the IAP loader will check the specific GPIO value to decide start user application or IAP
mode. If specific GPIO is equal to active level, IAP loader will start IAP mode immediately. If the GPIO
is not active, IAP loader will check PC and SP value of application image. The IAP loader will start the
application when its PC and SP value is valid. On the contrary, if the PC and SP value is invalid, the
volume label of IAP disk will become "IAP-APErr". A error message like " Application image is invalid!"
will be shown in "RESULT.TXT" file. The booting flow is shown as below:
<PRE>
              -----------
              |  Start  |
              -----------
                   |
              -----------
              |  GPIO   |  Y
              | Active? |  - - - - - - ->|
              -----------                |
                 N |                     |
              -----------                |        <---------------------------------
              |  SBVT1  |  Y             |          SBVT1 equal to specific value  |
              | Match?  |  - - - - - - ->|          (Set by application)           |
              -----------                |        <---------------------------------
                 N |                     |
              -----------                |
              | SP, PC  |  N             |
              | Valid?  |  - - - - - - ->|
              -----------                |
                 Y |                     |
              -----------           -----------
              |  Start  |           |  Start  |
              |   AP    |           |   IAP   |
              -----------           -----------
</PRE>
Besides, application can set SBVT1 as specific value and trigger a reset to start IAP mode.

@par IAP Operations:

When start IAP mode, you will see a disk which volume label is "HT32-IAP". By default, you can find 4 files
inside the disk as below.
  - ERASEALL.BAT: Double click to erase all Flash memory including Main Flash and Option Byte
  - MAIN_OPT.BAT: Double click to switch the programming target between Main Flash or Option Byte
  - READ.BAT:     Double click to enable or disable read mode
  - RESULT.TXT:   Display error message when SP and PC value of application image are invalid

The IAP example code supports 4 operations including "Program Main Flash", "Program Option Byte",
"Erase All", and "Read Main Flash / Option Byte". The detailed of each operations are described
as below:

    1. Program Main Flash:
       After power up and start IAP mode, the default programming target is Main Flash. You can identify
       it when the volume label of IAP disk is "HT32-IAP", "HT32-APErr", or "HT32-Main". Programming the Main
       Flash by coping the application binary file into the IAP disk, just like you would with a normal USB
       disk.

    2. Program Option Byte
       Double click the file "MAIN_OPT.BAT" to switch the programming target between Main Flash and Option
       Byte. The volume label of IAP disk will become "HT32-Option" / "HT32-Main" when the programming target
       is Option Byte / Main Flash. Programming the Option Byte by coping the binary file into the IAP disk.

    3. Erase All
       Double click the file "ERASEALL.BAT" to erase all Flash memory including Main Flash and Option Byte.
       It is useful when you want to clean all the contents of Flash memory (except IAP loader) and disable
       write protection function.

    4. Read Main Flash / Option Byte
       Double click the file "READ.BAT" to enable read mode. The volume label of IAP disk will become
       "HT32-Read" to identify that read mode is already enabled. The file named "IMAGE.BIN" and "OPTION.BIN"
       can be found in the IAP disk. You can use any software to read those two file in binary mode.
       "IMAGE.BIN" includes all contents of the Main Flash. "OPTION.BIN" includes all contents of the Option
       Byte.

@par Disable Write Protection:

  If the Write Protection function is enabled, you will meet a message like "Cannot copy filename: The device
  is not ready" during programming Main Flash or Option Byte by coping file into Flash Disk. In this situation,
  you can double click the file "ERASEALL.BAT" to disable write protection function. Note that all the Flash
  memory will be erased (except IAP loader) after the above operation.

@par Directory Contents:

- USBD/Mass_Storage_IAP/Src_AP/main.c                             Main program of application
- USBD/Mass_Storage_IAP/Src_AP/ht32fxxxx_it.c                     Interrupt handlers
- USBD/Mass_Storage_IAP/Src_AP/ht32fxxxx_conf.h                   Firmware library configuration file
- USBD/Mass_Storage_IAP/Src_AP/ht32fxxxx_usbdconf.h               USB Device Library configuration file
- USBD/Mass_Storage_IAP/Src_AP/system_ht32fxxxx.c                 System configuration file
- USBD/Mass_Storage_IAP/Src_IAP/iap_main.c                        Main program of IAP
- USBD/Mass_Storage_IAP/Src_IAP/iap_handler.c                     IAP handler who control the image update procedural
- USBD/Mass_Storage_IAP/Src_IAP/iap_handler.h                     Header file of the IAP handlers
- USBD/Mass_Storage_IAP/Src_IAP/iap_ht32_usbd_class.c             USB Device Class related function
- USBD/Mass_Storage_IAP/Src_IAP/iap_ht32_usbd_class.h             Header file of the USB Device Class
- USBD/Mass_Storage_IAP/Src_IAP/iap_ht32_usbd_descriptor.c        Descriptor of USB Device
- USBD/Mass_Storage_IAP/Src_IAP/iap_ht32_usbd_descriptor.h        Header file of the USB Device Descriptor
- USBD/Mass_Storage_IAP/Src_IAP/iap_usb_bulk_only_transport.c     Bulk only transport (BOT) related functions
- USBD/Mass_Storage_IAP/Src_IAP/iap_usb_bulk_only_transport.h     Header file of BOT
- USBD/Mass_Storage_IAP/Src_IAP/iap_usb_scsi_block_command.c      SCSI Block Command (SBC-3 and SPC4)
- USBD/Mass_Storage_IAP/Src_IAP/iap_usb_scsi_block_command.h      Header file of SCSI Block Command (API)
- USBD/Mass_Storage_IAP/Src_IAP/usb_scsi.h                        Header file of SCSI Block Command (Protocol)
- USBD/Mass_Storage_IAP/Src_IAP/iap_flash_disk.c                  Embedded Flash Disk related functions
- USBD/Mass_Storage_IAP/Src_IAP/iap_flash_disk.h                  Header file of Embedded Flash Disk
- USBD/Mass_Storage_IAP/Src_IAP/iap_ht32fxxxx_it.c                Interrupt handlers
- USBD/Mass_Storage_IAP/Src_IAP/iap_system_ht32fxxxx.c            System configuration file
- USBD/Mass_Storage_IAP/Src_IAP/ht32fxxxx_conf.h                  Firmware library configuration file
- USBD/Mass_Storage_IAP/Src_IAP/ht32fxxxx_usbdconf.h              USB Device Library configuration file

@par Hardware and Software Environment:

This example can be run on HT32 Series development board. By default, the IAP program uses BOOT0
to decide if user application or IAP mode should be started. An example which using Key1 of HT32Fxxxx
Development board to decide start user application or IAP mode can also be found in "iap_main.c".
This example uses the following endpoints.
<PRE>
  Endpoint    Transfer Type         Buffer Length
  ========    ====================  ==============
  0           Control               64 bytes
  1           Bulk IN               64 bytes
  2           Bulk OUT              64 bytes
</PRE>

@note

This example uses multi-project to manage both the IAP program and user's application. Multi-project
helps to build/download/debug both IAP and application in the same time. The following steps show
how to build/download/debug by multi-project setting.
<PRE>
  For Keil uVision:

    Build:    Double click on "MDK_ARM/Project.uvmpw" to open multi-project file. Press the "Batch Build"
              icon on the toolbar, or tick "Project -> Batch Build" to open the "Batch Build" window.
              Press "Build" or "Rebuild" button to build both IAP and application. The output file for
              the programming tools is as follows:

                MDK_ARM/AP/Obj/IAP_AP.hex            (HEX file of both IAP and application)
                MDK_ARM/AP/Obj/IAP_AP.axf.bin/AP     (Binary file of application)

    Download: Make sure the active project is "Project_AP" by right-clicking on the project name "Project_AP"
              in "Project" window and click "Set as Active Project". Press "LOAD" icon to download the IAP and
              application into Flash memory.

    Debug:    Make sure the active project is "Project_AP". Enter debug mode by pressing Ctrl+F5. The debug
              symbol of IAP will be loaded by "iap.ini". Since both images of IAP and application are loaded
              into uVision, trace the program switching behavior between IAP and application.

  For IAR EWARM:

    Build:    Double click on "EWARM/Project.eww" to open multi-project file. Press F8 or tick
              "Project -> Batch Build" to open the "Batch Build" window. Press "Make" or "Rebuild All"
              button to build both IAP and application. The output file for the programming tools is
              as follows:

                EWARM/IAP/Exe/IAP_AP.bin          (Binary file of both IAP and application)
                EWARM/AP/Exe/AP.bin               (Binary file of application)

    Download: Make sure the active project is "Project_IAP - IAP" by ticking the drop-down list in
              "Workspace" window. Press "Project -> Download -> Download active application" to download the
              IAP and application into Flash memory.

    Debug:    Make sure the active project is "Project_AP - AP". Enter debug mode by pressing
              Ctrl+D. Only the application program can be traced due to the current settings of project.
</PRE>

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
