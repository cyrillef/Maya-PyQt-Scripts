@echo off
set XXX=%~dp0
if ["%MAYAQTBUILD%"]==[""] call "%XXX%build setup.bat"

cd %SIPDIR%
"%MAYA_LOCATION%\bin\mayapy" configure.py
nmake
nmake install

pause