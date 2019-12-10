@echo off

set MAYAVERSION=2020
set ADSKQTVERSION=5.12.5
set SIPVERSION=4.19.19
set PYQTVERSION=5.13.2
set MAYADRIVE=m:
set BUILDDRIVE=v:

if exist %MAYADRIVE%\nul subst %MAYADRIVE% /d
subst %MAYADRIVE% "C:\Program Files\Autodesk\Maya%MAYAVERSION%"
set MAYA_LOCATION=%MAYADRIVE%

set MAYAPYQTBUILD=%~dp0
rem Removing trailing \
set MAYAPYQTBUILD=%MAYAPYQTBUILD:~0,-1%

if exist %BUILDDRIVE%\nul subst %BUILDDRIVE% /d
subst %BUILDDRIVE% "%MAYAPYQTBUILD%"

set SIPDIR=%BUILDDRIVE%\sip-%SIPVERSION%
set PYQTDIR=%BUILDDRIVE%\PyQt5-%PYQTVERSION%
rem set ADSKQTDIR=%BUILDDRIVE%\qt-%ADSKQTVERSION%
set QTDIR=%MAYA_LOCATION%

set PATH=%QTDIR%\bin;%PATH%
set MSVC_VERSION=2017
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0
set QMAKESPEC=%QTDIR%\mkspecs\win32-msvc
set _QMAKESPEC_=win32-msvc

if ["%LIBPATH%"]==[""] call "%MSVC_DIR%\VC\vcvarsall" amd64

set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\Python
set LIB=%LIB%;%MAYA_LOCATION%\lib
