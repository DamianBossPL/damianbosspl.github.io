@echo off
set /P updatechoice=Do you want to update to the latest version? [y/n] 

if /I "%updatechoice%" EQU "y" (goto :install) ELSE (goto :exit)

:install
powershell -Command "Invoke-WebRequest https://damianbosspl.github.io/cmdProtocol/update/updateFiles.zip -Outfile %~dp0\updateFiles.zip"
powershell -command "Expand-Archive -Force '%~dp0\updateFiles.zip' '%~dp0\files'"
del /f %~dp0\..\config.properties
del /f %~dp0\..\README.md
rmdir /S /Q %~dp0\..\src
rmdir /S /Q %~dp0\..\batch

xcopy %~dp0\files\src %~dp0\..\src
xcopy %~dp0\files\batch %~dp0\..\batch
copy %~dp0\files\README.md %~dp0\..\
copy %~dp0\files\config.properties %~dp0\..\

del /f %~dp0\updateFiles.zip
rmdir /S /Q %~dp0\files

:exit
exit