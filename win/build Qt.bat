@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013-5 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building Qt

cd %QTDIR%
rem nmake confclean
configure -platform win32-msvc%MSVC_VERSION% -debug-and-release -no-qt3support -no-phonon -no-phonon-backend -no-webkit
nmake

rem Building the Maya devkit Qt plug-ins 
rem c:
rem cd \Program Files\Autodesk\Maya2011\devkit\plug-ins 
rem nmake -f Makefile.qt 
rem nmake -f Makefile.qt clean 
rem v:

rem ------------------------------------------------

