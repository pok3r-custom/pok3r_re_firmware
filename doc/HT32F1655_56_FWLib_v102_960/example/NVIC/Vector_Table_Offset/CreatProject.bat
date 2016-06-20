@echo off
title CreatProject

xcopy /S "..\..\..\project_template\IP\Template\MDK_ARM\*"  ".\MDK_ARM\"
xcopy /S "..\..\..\project_template\IP\Template\EWARM\*"  ".\EWARM\"
xcopy /S "..\..\..\project_template\IP\Template\ht32f*_conf.h"  "."
xcopy /S "..\..\..\project_template\IP\Template\ht32f*_usbdconf.h"  "."
xcopy /S "..\..\..\project_template\IP\Template\system_ht32f*.c"  "."
