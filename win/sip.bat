@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

pushd %SIPDIR%
rem "%MAYA_LOCATION%\bin\mayapy" configure-ng.py --spec %_QMAKESPEC_%
"%MAYA_LOCATION%\bin\mayapy" configure.py
nmake
nmake install
popd
