/**
 @page IAP_AP_Example

 @verbatim
 * @file    IAP/AP_Example/readme.txt
 * @version V1.00
 * @date    2014-11-13
 * @brief   Description of In-Application Programming example, AP example.
 @endverbatim

@par Example Description:

This example describes how to set RO address for IAP usage. The RO address shall be
set as 0xC00 for the IAP application (Reserved first 3k Bytes for IAP).

@par Directory Contents:

- IAP/AP_Example/main.c                                Main program
- IAP/AP_Example/ht32fxxxx_it.c                        Interrupt handlers
- IAP/AP_Example/ht32fxxxx_conf.h                      Firmware library configuration file
- IAP/AP_Example/ht32fxxxx_usbdconf.h                  USB Device Library configuration file
- IAP/AP_Example/system_ht32fxxxx.c                    System configuration file
- IAP/AP_Example/EWARM/Project.eww                     Project file of EWARM
- IAP/AP_Example/EWARM/startup_ht32fxxxx.s             Startup file of EWARM
- IAP/AP_Example/EWARM/linker.icf                      Link script file of EWARM
- IAP/AP_Example/MDK_ARM/Project.uvproj                Project file of MDK-ARM
- IAP/AP_Example/MDK_ARM/startup_ht32fxxxx.s           Startup file of MDK-ARM
- IAP/AP_Example/MDK_ARM/HT32Fxxxx_DebugSupport.ini    Debug initialization file
- IAP/AP_Example/SourceryG++Lite/Project.uvproj        Project file of SourceryG++ Lite
- IAP/AP_Example/SourceryG++Lite/startup_ht32fxxxx.s   Startup file of SourceryG++ Lite
- IAP/AP_Example/SourceryG++Lite/linker.ld             Link script file of SourceryG++ Lite

@par Hardware and Software Environment:

This example can be run on HT32 series development board. Make sure the IAP program has already been
downloaded into the start position of the main Flash (IAP program starts from 0x0 to 0xBFF).

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

 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 */
