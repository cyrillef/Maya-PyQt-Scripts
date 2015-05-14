@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building PyQt

cd \PyQt-win-gpl-4.9.4

"%MAYA_LOCATION%\bin\mayapy" configure.py LIBDIR_QT=%QTDIR%\lib INCDIR_QT=%QTDIR%\include MOC=%QTDIR%\bin\moc.exe -w --no-designer-plugin
set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.6;%MAYA_LOCATION%\Python\include
nmake
nmake install

rem ------------------------------------------------

