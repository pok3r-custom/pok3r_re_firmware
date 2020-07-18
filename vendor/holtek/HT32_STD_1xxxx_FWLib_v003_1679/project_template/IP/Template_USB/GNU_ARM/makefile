#/*---------------------------------------------------------------------------------------------------------*/
#/* Holtek Semiconductor Inc.                                                                               */
#/*                                                                                                         */
#/* Copyright (C) Holtek Semiconductor Inc.                                                                 */
#/* All rights reserved.                                                                                    */
#/*                                                                                                         */
#/*-----------------------------------------------------------------------------------------------------------
#  File Name        : makefile
#  Version          : V1.00
#  Date             : 2018-09-09
#  Description      : The makefile.
#-----------------------------------------------------------------------------------------------------------*/
#
#/*---------------------------------------------------------------------------------------------------------*/
#/* How to Use                                                                                              */
#/*---------------------------------------------------------------------------------------------------------*/
#  1. Download and install GNU make for windows.
#     http://gnuwin32.sourceforge.net/packages/make.htm
#     http://gnuwin32.sourceforge.net/downlinks/make.php
#
#  2. Add "make" execution path into system Path.
#     For example: "C:\Program Files (x86)\GnuWin32\bin"
#
#  3. How to Build
#     Use command line and change working directory into the "GNU_ARM" folder of the project.
#     And then typing "make xxxxx" or "make -f xxxxx.mk" to build the code. xxxxx is chip name.
#     For example:
#     --------------------------------------------------------------------------------------------------
#     |C:\Users\Username>d:                                                                            |
#     |D:\>cd HT32_STD_5xxxx_FWLib_v005_2639\project_template\IP\Example\GNU_ARM                       |
#     |D:\HT32_STD_5xxxx_FWLib_v005_2639\project_template\IP\Example\GNU_ARM>make -f 52352.mk          |
#     |                                                                                                |
#     |     ......build message......                                                                  |
#     |                                                                                                |
#     |arm-none-eabi-size.exe HT32M\52352\Obj\HT32.elf                                                 |
#     |   text    data     bss     dec     hex filename                                                |
#     |   3192       8      32    3232     ca0 HT32M\52352\Obj\HT32.elf                                |
#     |========                                                                                        |
#     |BUILD SUCCESSFUL                                                                                |
#     |                                                                                                |
#     |D:\HT32_STD_5xxxx_FWLib_v005_2639\project_template\IP\Example\GNU_ARM>                          |
#     --------------------------------------------------------------------------------------------------
#
#  4. How to Clean
#     Follow the step3 to change the working directory and typing "make clean" or "make -f xxxxx.mk clean".
#


#/*---------------------------------------------------------------------------------------------------------*/
#/* Make Targets                                                                                            */
#/*---------------------------------------------------------------------------------------------------------*/
all:
	@echo Use following command to build or clean target. Use "make help" for detailed.
	@echo   Build: "make xxxxx" or "make -f xxxxx.mk"
	@echo   Clean: "make clean" or "make -f xxxxx.mk clean"
	@echo           where xxxxx is chip name.
	@echo           For example: "make 52352", "make -f 52352.mk", "make -f 52352.mk clean"


ifneq "$(MAKECMDGOALS)" "clean"
ifneq "$(MAKECMDGOALS)" "all"
ifneq "$(MAKECMDGOALS)" "help"
$(MAKECMDGOALS):
	@make -f $(MAKECMDGOALS).mk
endif
endif
endif


help:
	@echo /*----------------------------------------------------------------------------------------------------------*/
	@echo /* How to Use                                                                                               */
	@echo /*----------------------------------------------------------------------------------------------------------*/
	@echo /*  1. Download and install GNU make for windows.                                                           */
	@echo /*     http://gnuwin32.sourceforge.net/packages/make.htm                                                    */
	@echo /*     http://gnuwin32.sourceforge.net/downlinks/make.php                                                   */
	@echo /*                                                                                                          */
	@echo /*  2. Add "make" execution path into system Path.                                                          */
	@echo /*     For example: "C:\Program Files (x86)\GnuWin32\bin"                                                   */
	@echo /*                                                                                                          */
	@echo /*  3. How to Build                                                                                         */
	@echo /*     Use command line and change working directory into the "GNU_ARM" folder of the project.              */
	@echo /*     And then typing "make xxxxx" or "make -f xxxxx.mk" to build the code. xxxxx is chip name.            */
	@echo /*     For example:                                                                                         */
	@echo        "------------------------------------------------------------------------------------------"
	@echo        "|C:\Users\Username>d:                                                                    |"
	@echo        "|D:\>cd HT32_STD_5xxxx_FWLib_v005_2639\project_template\IP\Example\GNU_ARM               |"
	@echo        "|D:\HT32_STD_5xxxx_FWLib_v005_2639\project_template\IP\Example\GNU_ARM>make -f 52352.mk  |"
	@echo        "|                                                                                        |"
	@echo        "|     ......build message......                                                          |"
	@echo        "|                                                                                        |"
	@echo        "|arm-none-eabi-size.exe HT32M\52352\Obj\HT32.elf                                         |"
	@echo        "|   text    data     bss     dec     hex filename                                        |"
	@echo        "|   3192       8      32    3232     ca0 HT32M\52352\Obj\HT32.elf                        |"
	@echo        "|========                                                                                |"
	@echo        "|BUILD SUCCESSFUL                                                                        |"
	@echo        "|                                                                                        |"
	@echo        "|D:\HT32_STD_5xxxx_FWLib_v005_2639\project_template\IP\Example\GNU_ARM>                  |"
	@echo        "------------------------------------------------------------------------------------------"
	@echo /*                                                                                                          */
	@echo /*  4. How to Clean                                                                                         */
	@echo /*     Follow the step3 to change the working directory and typing "make clean" or "make -f xxxxx.mk clean".*/
	@echo /*                                                                                                          */


clean:
	-del /q /f .\HT32M\$(CHIP_NAME)\Obj\* 1>nul 2>&1 || (exit 0)
	-del /q /f *.o *.bin *.elf *.hex *.map *.d 1>nul 2>&1 || (exit 0)
	-rmdir /S /Q "HT32M\" 1>nul 2>&1 || (exit 0)
	@echo ========
	@echo CLEAN SUCCESSFUL
