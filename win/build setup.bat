@echo off
subst v: /d
subst v: "E:\__sdkext\_Maya2013-5 Scripts"
v:
SET CYRILLE=OK

set QTDIR=v:\qt-adsk-4.7.1
set PATH=%QTDIR%\bin;%PATH%
SET MSVC_VERSION=2010
SET MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 10.0
set QMAKESPEC=win32-msvc%MSVC_VERSION%

rem call "%MSVC_DIR%\VC\vcvarsall" amd64

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2013.5
set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.6;%MAYA_LOCATION%\Python\include
set LIB=%LIB%;%MAYA_LOCATION%\lib
rem set QMAKESPEC=%QTDIR%\mkspecs\win32-msvc%MSVC_VERSION%
