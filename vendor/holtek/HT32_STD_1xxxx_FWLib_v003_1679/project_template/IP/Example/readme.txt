/**
 @page Project_Template

 @verbatim
 * @file    IP/Example/readme.txt
 * @version V1.04
 * @date    2019-03-26
 * @brief   Description of project template.
 @endverbatim

@par Example Description:

The project template includes project related files for Keil MDK-ARM, and IAR EWARM. It provides
a convenient way to create and configure projects for Holtek example codes.

@par IDE Version:

<PRE>
  IDE/Tool Name       IDE Version(*1)      Project File            Template Folder
  ================    =================    ====================    ===============================================
  SEGGER emStudio     emStudio V4.12       Project_xxxxx.emProject project_template/IP/Template/emStudiov4/
  IAR EWARM           EWARM    V6.50       Project_xxxxx.eww       project_template/IP/Template/EWARM/
  IAR EWARM           EWARM    V8.11       Project_xxxxx.eww       project_template/IP/Template/EWARMv8/
  GNU Arm             MDK-ARM  V5.15       Project_xxxxx.uvprojx   Project_template/IP/Template/GNU_ARM/
  Keil MDK-ARM        MDK-ARM  V4.21       Project_xxxxx.uvproj    project_template/IP/Template/MDK_ARM/
  Keil MDK-ARM        MDK-ARM  V5.15       Project_xxxxx.uvprojx   project_template/IP/Template/MDK_ARMv5/
  SourceryG++Lite     MDK-ARM  V5.15       Project_xxxxx.uvprojx   project_template/IP/Template/SourceryG++Lite/

Note 1: The format of project files may not be compatible with different IDE versions. For the situation,
        users may need to create project files based on the IDE version before used.
</PRE>

@par Create project automatically:

To create project of each example automatically, double click the CreatProject.bat file in each example
folder.

@par Create project manually:

To create project of each example manually, copy the corresponding project template folder into the path
of example code. For example, copy "project_template/IP/Template/MDK_ARM/" into "example/GPIO/InputOutput/".

Files below also needs to copy from template folder into the path of example code. For example,
from "project_template/IP/Template/" into "example/GPIO/InputOutput/".
  - ht32fxxxx_conf.h
  - ht32fxxxx_usbdconf.h
  - system_ht32fxxxx.c

For the example code which has special project setting, Holtek provides separate project related files
(on the folder of the example). User do not need to copy any template files to these examples.

After the copy is finished, double click on Project File to load the IDE. Follow the instruction of IDE to
build, download, and debug the example code. Refer to the Quick Start guides below for more information.
- "Keil MDK-ARM Quick Start for Holtek's HT32 Series Microcontrollers"
- "IAR EWARM Quick Start for Holtek's HT32 Series Microcontrollers"

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
