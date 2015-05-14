@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013-5 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building PyQt

cd \PyQt-win-gpl-4.9.4

"%MAYA_LOCATION%\bin\mayapy" configure.py LIBDIR_QT=%QTDIR%\lib INCDIR_QT=%QTDIR%\include MOC=%QTDIR%\bin\moc.exe -w --no-designer-plugin
set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.6;%MAYA_LOCATION%\Python\include
nmake
nmake install

rem ------------------------------------------------

rem "c:\Program Files\Autodesk\Maya2013.5\bin\mayapy" configure.py LIBDIR_QT=V:\qt-adsk-4.7.1\lib INCDIR_QT=V:\qt-adsk-4.7.1\include MOC=moc.exe -w --no-designer-plugin