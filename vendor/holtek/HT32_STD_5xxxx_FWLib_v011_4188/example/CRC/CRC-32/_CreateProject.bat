@echo off
REM /*********************************************************************************************************//**
REM * @file    _CreateProject.bat
REM * @version $Rev:: 3609         $
REM * @date    $Date:: 2019-03-31 #$
REM * @brief   Main program.
REM *************************************************************************************************************
REM * @attention
REM *
REM * Firmware Disclaimer Information
REM *
REM * 1. The customer hereby acknowledges and agrees that the program technical documentation, including the
REM *    code, which is supplied by Holtek Semiconductor Inc., (hereinafter referred to as "HOLTEK") is the
REM *    proprietary and confidential intellectual property of HOLTEK, and is protected by copyright law and
REM *    other intellectual property laws.
REM *
REM * 2. The customer hereby acknowledges and agrees that the program technical documentation, including the
REM *    code, is confidential information belonging to HOLTEK, and must not be disclosed to any third parties
REM *    other than HOLTEK and the customer.
REM *
REM * 3. The program technical documentation, including the code, is provided "as is" and for customer reference
REM *    only. After delivery by HOLTEK, the customer shall use the program technical documentation, including
REM *    the code, at their own risk. HOLTEK disclaims any expressed, implied or statutory warranties, including
REM *    the warranties of merchantability, satisfactory quality and fitness for a particular purpose.
REM *
REM * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
REM ************************************************************************************************************/

title Create Project

IF EXIST "..\..\..\project_template\Script\_CreateProjectScript.bat" GOTO CREATE_PROJECT
GOTO CREATE_PROJECT_ERR

:CREATE_PROJECT
copy "..\..\..\project_template\Script\_CreateProjectScript.bat"  "."
call _CreateProjectScript.bat Template
REM call _CreateProjectScript.bat Template_USB

GOTO CREATE_PROJECT_END


:CREATE_PROJECT_ERR
ECHO "_CreateProjectScript.bat" is not exist. Please update to the latest Firmware Library.
pause

:CREATE_PROJECT_END
