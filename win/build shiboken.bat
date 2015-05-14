@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013-5 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building shiboken

set CMAKE=E:\__sdkext\cmake-2.8.9-win32-x86\bin\cmake.exe
set QMAKE=%QTDIR%\qmake.exe
set PYTHON_EXEC="%MAYA_LOCATION%\bin\mayapy.exe"
set PYTHON_INC="%MAYA_LOCATION%\include\python2.6"
set PYTHON_LIB="%MAYA_LOCATION%\lib\python26.lib"
set OUTPUT="V:\pyside-qt4.8+1.1.2"

cd \shiboken-1.1.2\_build
rem %CMAKE% -G "NMake Makefiles" -C "init_cache.txt"
%CMAKE% -G "NMake Makefiles" -DQT_QMAKE_EXECUTABLE=%QMAKE% -DBUILD_TESTS=False -DPYTHON_EXECUTABLE=%PYTHON_EXEC% -DPYTHON_INCLUDE_DIR=%PYTHON_INC% -DPYTHON_LIBRARY=%PYTHON_LIB% -DCMAKE_BUILD_TYPE=Release ..

nmake
nmake install/fast

rem ------------------------------------------------

