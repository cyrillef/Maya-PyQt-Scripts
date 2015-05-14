@echo off

set MAYAQTBUILD=%~dp0
set MAYAQTBUILD=%MAYAQTBUILD:~0,-1%
if exist v:\nul subst v: /d
subst v: "%MAYAQTBUILD%"
v:

set OPENSSL=v:\openssl-1.01c
set QTDIR=v:\qt-adsk-4.8.2
set SIPDIR=v:\sip-4.14.5
set PYQTDIR=v:\PyQt-win-gpl-4.10
set AQTDIR=v:\aqt-4.8.2

set PATH=%QTDIR%\bin;%PATH%
set MSVC_VERSION=2010
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 10.0
set QMAKESPEC=win32-msvc%MSVC_VERSION%
rem set QMAKESPEC=%QTDIR%\mkspecs\win32-msvc%MSVC_VERSION%

rem if [%LIBPATH%]==[] call "%MSVC_DIR%\VC\vcvarsall" amd64

set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2014
set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.7;%MAYA_LOCATION%\Python\include
set LIB=%LIB%;%MAYA_LOCATION%\lib
