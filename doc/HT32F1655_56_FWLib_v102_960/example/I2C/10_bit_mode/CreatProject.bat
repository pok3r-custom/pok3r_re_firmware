@echo off
title CreatProject

set "CoIDE_DIR=%cd%"
:1
set "CoIDE_DIR=%CoIDE_DIR:*\=%"&set "b=%CoIDE_DIR:\=%"
if "%b%" neq "%CoIDE_DIR%" goto 1
set "CoIDE_DIR=CoIDE_%CoIDE_DIR%"

xcopy /S "..\..\..\project_template\IP\Template\*"  "."
rename "CoIDE_Template\CoIDE_Template.cob" "%CoIDE_DIR%.cob"
mv CoIDE_Template %CoIDE_DIR%
