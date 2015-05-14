@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013-5 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building SIP

cd \sip-4.13.3
set LIB=%LIB%;%MAYA_LOCATION%\lib
"%MAYA_LOCATION%\bin\mayapy" configure.py
nmake
nmake install

rem ------------------------------------------------

