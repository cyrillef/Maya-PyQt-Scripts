@echo off
 
set MAYAQTBUILD=%~dp0
set MAYAQTBUILD=%MAYAQTBUILD:~0,-1%
if exist v:\nul subst v: /d
subst v: "%MAYAQTBUILD%"
v:
 
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2015
if exist m:\nul subst m: /d
subst m: "%MAYA_LOCATION%"
set MAYA_LOCATION=m:
 
set QTDIR=%MAYA_LOCATION%
set MSVC_VERSION=2012
set QMAKESPEC=%QTDIR%\mkspecs\win32-msvc%MSVC_VERSION%
if not exist "%QMAKESPEC%\qmake.conf" (
    echo "You need to uncompress %MAYA_LOCATION%\mkspecs\qt-4.8.5-64-mkspecs.tar.gz !"
    goto :end
)
if not exist "%MAYA_LOCATION%\include\Qt\QtCore\qdir.h" (
    echo "You need to uncompress %MAYA_LOCATION%\include\qt-4.8.5-64-include.tar.gz in %MAYA_LOCATION%\include\Qt !"
    goto :end
)
findstr /L /C:"Headers=../include/Qt" %MAYA_LOCATION%\bin\qt.conf >nul 2>&1
if ERRORLEVEL 1 (
    echo "You need to edit %MAYA_LOCATION%\bin\qt.conf to use 'Headers=../include/Qt'"
    goto :end
)
 
set SIPDIR=v:\sip-4.15.5
set PYQTDIR=v:\PyQt-win-gpl-4.10.4
 
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 11.0
if [%LIBPATH%]==[] call "%MSVC_DIR%\VC\vcvarsall" amd64
 
set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.7;%MAYA_LOCATION%\Python\include
set LIB=%LIB%;%MAYA_LOCATION%\lib
 
cd %PYQTDIR%
set PATH=%QTDIR%\bin;%PATH%
"%MAYA_LOCATION%\bin\mayapy" configure.py LIBDIR_QT=%QTDIR%\lib INCDIR_QT=%QTDIR%\include\Qt MOC=%QTDIR%\bin\moc.exe -w --no-designer-plugin
nmake
nmake install
 
:end
pause