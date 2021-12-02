@echo off
IF EXIST "%~dp0\update\update.bat" (del /f "%~dp0\update\update.bat")

powershell -Command "Start-Process '%~dp0\batch\main.bat' -Verb RunAs"