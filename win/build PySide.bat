@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\build setup.bat"

rem ------------------------------------------------
rem Building PySide

set CMAKE=v:\cmake-2.8.9-win32-x86\bin\cmake.exe
set QMAKE=%QTDIR%\qmake.exe
set PYTHON_EXEC="%MAYA_LOCATION%\bin\mayapy.exe"

set SHIBOKEN="C:\Program Files\shiboken"
subst s: /d
subst s: %SHIBOKEN%
set SHIBOKEN_DIR=s:\lib\cmake\Shiboken-1.1.2

cd \pyside-qt4.8+1.1.2

rem %PYTHON_EXEC% setup.py bdist_wininst --qmake=%QMAKE%
rem dist

%CMAKE% -G "NMake Makefiles" -DQT_QMAKE_EXECUTABLE=%QMAKE% -DBUILD_TESTS=False -DCMAKE_BUILD_TYPE=Release -DShiboken_DIR=%SHIBOKEN_DIR% ..

nmake
nmake install

rem ------------------------------------------------

rem Deploy PySide packages

rem copy files from our deploy folder to path-to-maya\Python\lib\site-packages:  
rem    shiboken\lib\site-packages\shiboken.pyd
rem    pyside\lib\site-packages\PySide
rem Besides, we also need to copy two dlls to path-to-maya\Python\lib\site-packages\PySide
rem    pyside\bin\pyside-python2.6.dll
rem    shiboken\bin\shiboken-python2.6.dll


rem V:\pyside-qt4.8+1.1.2\_build\PySide\QtGui\PySide\QtGui\qmenu_wrapper.cpp(3735) :
rem  error C2589: 'constant' : illegal token on right side of '::'
rem V:\pyside-qt4.8+1.1.2\_build\PySide\QtGui\PySide\QtGui\qmenu_wrapper.cpp(3735) :
rem  error C2059: syntax error : '::'
rem NMAKE : fatal error U1077: 'C:\PROGRA~2\MICROS~2.0\VC\bin\amd64\cl.exe' : return
rem  code '0x2'
rem Stop.

rem line #3735
rem  ::QPoint* cppArg0 = /*QPoint::*/NULL;