@echo off
title Loading...
echo Loading config . . .
IF NOT EXIST "%~dp0\..\config.properties" (echo Config not found && PAUSE && exit) ELSE (goto :configload)

:configload

rename "%~dp0\..\config.properties" config.bat
call "%~dp0\..\config.bat"
rename "%~dp0\..\config.bat" config.properties
echo Config Loaded!
goto :checkversion

:checkversion
cls
title Checking for updates...
echo Checking for updates . . .
powershell -Command "Invoke-WebRequest https://damianbosspl.github.io/cmdProtocol/latestVersion.txt -Outfile %~dp0\..\update\updatecheck\isUpdat.bat"
call "%~dp0\..\update\updatecheck\isUpdat.bat"

IF NOT EXIST "%~dp0\..\update\updatecheck\isUpdat.bat" (echo Failed to get new version number. You must both have powershell and be connected to the internet. && PAUSE && goto :main)

IF NOT %version%==%newversionupdate% (goto :update) ELSE (echo You have the latest update! && PAUSE && goto :main)

:update

cls
title Update
echo The newest version is %newversionupdate%
echo You are running %version%
set /P updatechoice=Do you want to update to the latest version? [y/n] 

if /I "%updatechoice%" EQU "y" (goto :install)
if /I "%updatechoice%" EQU "n" (goto :main)
goto :update

:install

title Wait...

powershell -Command "Invoke-WebRequest https://damianbosspl.github.io/cmdProtocol/install.bat -Outfile %~dp0\..\update\update.bat"

%~dp0\..\update\update.bat

PAUSE
goto :main

:main

cls
title Cmd protocol Installer

echo odddddddddddddddhsssssssssssssssso++++++++++++++/-     
echo ddddddddddddddddhsssssssssssssssso++++++++++++++++     
echo ddddddddddddddddhsssssssssssssssso++++++++++++++++     
echo /////////////////:::::::::::::::::::::::::::::::::     
echo ::::::::::::::::::::::::::::::::::::::::::::::::::     
echo ::::::::/+::::::::::::::::::::::::::::::::::::::::     1 - Install
echo :::::::sdmdo::::::::::::::::::::::::::::::::::::::     
echo ::::::odmmmmdo::::::::::::::::::::::::::::::::::::     2 - Uninstall
echo :::::::/ydmmmmdo::::::::::::::::::::::::::::::::::     
echo :::::::::+ydmmmmho::::::::::::::::::::::::::::::::     3 - Enable
echo :::::::::::+ymmmmmho::::::::::::::::::::::::::::::     
echo :::::::::::/ohdmmmdo::::::::::::::::::::::::::::::     4 - Disable
echo :::::::::/oyyyyhho::::::::::::::::::::::::::::::::     
echo :::::::/oyyyyys+::::::::::::::::::::::::::::::::::     5 - Update
echo ::::::+yyyyys+::::::::::::::::::::::::::::::::::::     
echo :::::::oyyy+::::::::::::::::::::::::::::::::::::::     
echo :::::::::/::::::::::::::::::::::::::::::::::::::::     
echo ::::::::::::::::::::::::::::::::::::::::::::::::::     
echo .-::::::::::::::::::::::::::::::::::::::::::::::-.     

echo Welcome to the Installer of the cmd protocol!
set /P option=Please select an option to start: 
if /I "%option%" EQU "1" (goto :1install)
if /I "%option%" EQU "2" (goto :2install)
if /I "%option%" EQU "3" (goto :3enable)
if /I "%option%" EQU "4" (goto :4disable)
if /I "%option%" EQU "5" (goto :checkversion)

goto :main

:1install
cls
set /P c1=Are you sure you want proceed with the installation? [y/n] 

if /I "%c1%" EQU "y" goto :1installinstall
if /I "%c1%" EQU "n" goto :main
goto :1install

:1installinstall

xcopy "%~dp0\..\python-runtime" "C:\Windows\cmdProtocol\python-runtime" /E /H /C /I
copy "%~dp0\..\src\run.py" "C:\Windows\cmdProtocol"
"%~dp0\..\reg\enableCmdProtocol.reg"

:1exit

echo The installation is complete, press any key to continue . . .
PAUSE > nul
goto :main

:1no

echo The installation has been canceled, press any key to continue . . .
PAUSE > nul
goto :main




:2install
cls
set /P c2=Are you sure you want proceed with the uninstallation? [y/n] 

if /I "%c2%" EQU "y" goto :2installinstall
if /I "%c2%" EQU "n" goto :main
goto :1install

:2installinstall

echo Deleting files . . .
rmdir /S /Q "C:\Windows\cmdProtocol"
"%~dp0\..\reg\disableCmdProtocol.reg"

:2exit

echo The uninstallation is complete, press any key to continue . . .
PAUSE > nul
goto :main

:2no

echo The uninstallation has been canceled, press any key to continue . . .
PAUSE > nul
goto :main


:3enable
cls
set /P c3=Are you sure you want to enable the cmd protocol? (this won't work if you haven't installed yet) [y/n] 

if /I "%c3%" EQU "y" goto :3enableinstall
if /I "%c3%" EQU "n" goto :3no
goto :choice

:3enableinstall

IF NOT EXIST "C:\Windows\cmdProtocol" (goto :ytfulying)

"%~dp0\..\reg\enableCmdProtocol.reg"

goto :3exit

:ytfulying

echo Why?
PAUSE > nul

echo Why can't you just install it?
PAUSE > nul

echo To me, it says, "C:\Windows\cmdProtocol does not exist" I'm sending you to the main menu . . .
PAUSE > nul
goto :main

:3exit

echo The cmd protocol has been enabled, press any key to continue . . .
PAUSE > nul
goto :main

:3no

echo The enabling has been canceled, press any key to continue . . .
PAUSE > nul
goto :main




:4disable
cls
set /P c4=Are you sure you want to disable the cmd protocol? (this won't delete any files) [y/n] 

if /I "%c4%" EQU "y" goto :4disableinstall
if /I "%c4%" EQU "n" goto :4no
goto :choice

:4disableinstall

"%~dp0\..\reg\disableCmdProtocol.reg"

goto :4exit

:4exit

echo The cmd protocol has been disabled, press any key to continue . . .
PAUSE > nul
goto :main

:4no

echo The disabling has been canceled, press any key to continue . . .
PAUSE > nul
goto :main