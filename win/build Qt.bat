@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building Qt

cd %QTDIR%
rem nmake confclean
rem configure -platform win32-msvc%MSVC_VERSION% -debug-and-release 
rem configure -platform win32-msvc%MSVC_VERSION% -debug-and-release -no-phonon -no-phonon-backend -no-webkit
configure -platform win32-msvc%MSVC_VERSION% -debug-and-release -openssl-linked -I %OPENSSL%\inc32 -L %OPENSSL%\out32dll OPENSSL_LIBS="-lssleay32 -llibeay32 -lgdi32 -lcrypt32 -luser32 -ladvapi32"
nmake

rem Building the Maya devkit Qt plug-ins 
rem c:
rem cd \Program Files\Autodesk\Maya2011\devkit\plug-ins 
rem nmake -f Makefile.qt 
rem nmake -f Makefile.qt clean 
rem v:

rem ------------------------------------------------

