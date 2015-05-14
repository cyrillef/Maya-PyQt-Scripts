@echo off
 
set MAYAQTBUILD=%~dp0
set MAYAQTBUILD=%MAYAQTBUILD:~0,-1%
if exist v:\nul subst v: /d
subst v: "%MAYAQTBUILD%"
v:
 
set SIPDIR=v:\sip-4.15.5
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 11.0
if [%LIBPATH%]==[] call "%MSVC_DIR%\VC\vcvarsall" amd64
 
set MAYA_LOCATION=C:\Program Files\Autodesk\Maya2015
set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.7;%MAYA_LOCATION%\Python\include
set LIB=%LIB%;%MAYA_LOCATION%\lib
 
cd %SIPDIR%
"%MAYA_LOCATION%\bin\mayapy" configure.py
nmake
nmake install