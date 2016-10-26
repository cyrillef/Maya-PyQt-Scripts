@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

set QMAKESPEC=%QTDIR%\mkspecs\%_QMAKESPEC_%
if not exist "%QMAKESPEC%\qmake.conf" (
	echo "You need to uncompress %MAYA_LOCATION%\mkspecs\qt-5.6.1-mkspecs.tar.gz !"
	goto end
)
if not exist "%MAYA_LOCATION%\include\Qt\QtCore\qdir.h" (
	echo "You need to uncompress %MAYA_LOCATION%\include\qt-5.6.1-include.tar.gz in %MAYA_LOCATION%\include\Qt !"
	goto end
)
findstr /L /C:"Headers=include/Qt" "%MAYA_LOCATION%\bin\qt.conf" >nul 2>&1
if ERRORLEVEL 1 (
	echo "You need to edit %MAYA_LOCATION%\bin\qt.conf to use 'Headers=include/Qt'"
	goto end
)
findstr /L /C:"-lqtmain -lshell32" "%QTDIR%\mkspecs\common\msvc-desktop.conf" >nul 2>&1
if ERRORLEVEL 1 (
	echo "You need to edit %QTDIR%\mkspecs\common\msvc-desktop.conf to use 'QMAKE_LIBS_QT_ENTRY     = -lqtmain -lshell32'"
	goto end
)
if not exist "%MAYA_LOCATION%\include\Qt\qtnfc.disabled" (
	echo "You need to rename %MAYA_LOCATION%\include\Qt\qtnfc to %MAYA_LOCATION\include\Qt\qtnfc.disabled"
	goto end
)
	
pushd %PYQTDIR%

"%MAYA_LOCATION%\bin\mayapy" configure.py --spec %QMAKESPEC% LIBDIR_QT="%QTDIR%\lib" INCDIR_QT="%QTDIR%\include\Qt" MOC="%QTDIR%\bin\moc.exe" --sip="%QTDIR%\Python\sip.exe" --sip-incdir="%QTDIR%\Python\include" -w --no-designer-plugin
nmake
nmake install
popd

:end
