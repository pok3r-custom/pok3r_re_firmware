/**
 @page IAP_UI IAP_UI

 @verbatim
 * @file    IAP/IAP_UI/readme.txt
 * @version V1.00
 * @date    2014-11-13
 * @brief   Description of In-Application Programming example (IAP UI mode).
 @endverbatim

@par Example Description:

The example code of IAP UI mode which is connected with a user interface to download user's image
into main Flash via UART.

The user interface can be the windows-based HT32 Flash Programmer or any application program
developed by customer. The IAP UI mode firmware fits the HT32 Flash Command Protocol and
supports the following commands:

<PRE>
- Notation:

      Command:  [C] [P1] [P2]....[0xD]
                [C]  : Command
                     : Space
                [Px] : parameter
                [0xD]: Carriage Return indicates the end of command

                Note: All the command and parameter must be lowercase letters.

- Return:       [INFO][ST]

                [INFO]: Information from device
                [ST]  : Execution result of command
                        O Command execution is successful
                        F Command execution is failed
                        Z Command error or not supported

- Command Set and return value:

      i [TYPE][0xD]                   Get information from device
                                      [TYPE]:   Information type
                                                0 Chip name
                                                1 Flash size
                                                2 Option size
                                                3 OB_PP bit count
                                                4 Firmware version
                                                5 Firmware date
                                                6 ISP/IAP start address
                                      Return Value: [INFO][ST]

      e [TYPE] [SADDR] [EADDR][0xD]   Page erase
                                      [TYPE]:   1 for Page erase
                                      [SADDR]:  Start address
                                      [EADDR]:  End address
                                      Return Value:[ST]

      b [SADDR] [EADDR][0xD]          Blank check
                                      [SADDR]:  Start address
                                      [EADDR]:  End address
                                      Return Value:[ST]

      w [TYPE] [SADDR] [EADDR][0xD]   Start Xmodem protocol for program or verify operation.
                                      [TYPE]:   Mode
                                                0 Verification mode
                                                1 Programming mode
                                      [SADDR]:  Start address
                                      [EADDR]:  End address
                                      Return Value:[ST]

      c [SADDR] [EADDR][0xD]          CRC check
                                      [SADDR]:  Start address
                                      [EADDR]:  End address
                                      Return Value: [CRC][ST]

      g [TYPE][0xD]                   Execution/Exit command
                                      [TYPE]:   Mode
                                                0 Execution
                                                1 Exit
                                                2 Reset
                                      Return Value: None

      r [R1] [SADDR] [EADDR]          Read Flash memory content from chip
                                      [R1]:     Reserved
                                      [SADDR]:  Start address
                                      [EADDR]:  End address
                                      Return Value: [Byte stream][ST]
</PRE>

Refer to the "In-System / In-Application Programmer for HT32 Family" user manual for more information.

@par Directory Contents:

- IAP/IAP_UI/Src_AP/main.c                         Main program of application
- IAP/IAP_UI/Src_AP/ht32fxxxx_it.c                 Interrupt handlers
- IAP/IAP_UI/Src_AP/ht32fxxxx_conf.h               Firmware library configuration file
- IAP/IAP_UI/Src_AP/ht32fxxxx_usbdconf.h           USB Device Library configuration file
- IAP/IAP_UI/Src_AP/system_ht32fxxxx.c             System configuration file
- IAP/IAP_UI/Src_IAP/iap_main.c                    Main program of IAP
- IAP/IAP_UI/Src_IAP/iap_handler.c                 IAP handler who control the image update procedural
- IAP/IAP_UI/Src_IAP/iap_handler.h                 Header file of the IAP handlers
- IAP/IAP_UI/Src_IAP/iap_xmodem.c                  Xmodem transmission protocol
- IAP/IAP_UI/Src_IAP/iap_xmodem.h                  Header file of Xmodem transmission protocol
- IAP/IAP_UI/Src_IAP/iap_buffer.c                  Buffer function for UART
- IAP/IAP_UI/Src_IAP/iap_buffer.h                  Header file of buffer
- IAP/IAP_UI/Src_IAP/iap_crc16.c                   CRC algorithm for Xmodem and Flash checksum
- IAP/IAP_UI/Src_IAP/iap_crc16.h                   Header file of CRC algorithm
- IAP/IAP_UI/Src_IAP/iap_ht32fxxxx_it.c            Interrupt handlers
- IAP/IAP_UI/Src_IAP/ht32fxxxx_conf.h              Firmware library configuration file
- IAP/IAP_UI/Src_IAP/ht32fxxxx_usbdconf.h          USB Device Library configuration file
- IAP/IAP_UI/Src_IAP/iap_system_ht32fxxxx.c        System configuration file
- IAP/IAP_UI/EWARM/Project.eww                     Project file of EWARM
- IAP/IAP_UI/EWARM/startup_ht32fxxxx.s             Application startup file of EWARM
- IAP/IAP_UI/EWARM/startup_ht32fxxxx_iap.s         IAP startup file of EWARM
- IAP/IAP_UI/EWARM/linker.icf                      Application link script file of EWARM
- IAP/IAP_UI/EWARM/linker_iap.icf                  IAP link script file of EWARM
- IAP/IAP_UI/MDK_ARM/Project.uvmpw                 Multi-project file of MDK-ARM
- IAP/IAP_UI/MDK_ARM/startup_xxxx.s                Application startup file of MDK-ARM
- IAP/IAP_UI/MDK_ARM/startup_xxxx_iap.s            IAP startup file of MDK-ARM
- IAP/IAP_UI/MDK_ARM/iap.s                         ASM file for include IAP binary into application
- IAP/IAP_UI/MDK_ARM/linker.lin                    Link script file of MDK-ARM
- IAP/IAP_UI/MDK_ARM/HT32Fxxxx_DebugSupport.ini    Debug initialization file

@par Hardware and Software Environment:

This example can be run on HT32 Series development board.

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

                  MDK_ARM/HT32/xxxxx/AP/Obj/IAP_AP.hex                (HEX file of both IAP and application)
                  MDK_ARM/HT32/xxxxx/AP/Obj/IAP_AP.axf.bin/AP         (Binary file of application)

    Download: Make sure the active project is "Project_AP" by right-clicking on the project name "Project_AP"
              in "Project" window and click "Set as Active Project". Press "LOAD" icon
              to download both IAP and application into Flash memory.

    Debug:    Make sure the active project is "Project_AP". Enter debug mode by pressing Ctrl+F5.
              The debug symbol of IAP will be loaded by "HT32Fxxxx_DebugSupport.ini".
              Since both images of IAP and application are loaded into uVision, trace the program switching
              behavior between IAP and application is possible.

  For IAR EWARM:

    Build:    Double click on "EWARM/Project.eww" to open multi-project file. Press F8 or tick
              "Project -> Batch Build" to open the "Batch Build" window. Press "Make" or "Rebuild All"
              button to build both IAP and application. The output file for the programming tools is
              as follows:

                  EWARM/HT32/xxxxx/IAP/Exe/IAP_AP.hex                 (HEX file of both IAP and application)
                  EWARM/HT32/xxxxx/AP/Exe/AP.bin                      (Binary file of application)

    Download: Make sure the active project is "Project_IAP - IAP" by ticking the drop-down list in
              "Workspace" window. Press "Project -> Download -> Download active application"
              to download both IAP and application into Flash memory.

    Debug:    Make sure the active project is "Project_AP - AP". Enter debug mode by pressing Ctrl+D.
              The debug symbol of IAP will be loaded by project setting.
              Since both images of IAP and application are loaded into EWARM, trace the program switching
              behavior between IAP and application is possible.
</PRE>

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
