@echo off
set XXX=%~dp0
if ["%MAYAPYQTBUILD%"]==[""] call "%XXX%setup.bat"

set QMAKESPEC=%QTDIR%\mkspecs\%_QMAKESPEC_%
if not exist "%QMAKESPEC%\qmake.conf" (
	echo "You need to uncompress %MAYA_LOCATION%\mkspecs\qt-4.8.6-mkspecs.tar.gz !"
	goto end
)
if not exist "%MAYA_LOCATION%\include\Qt\QtCore\qdir.h" (
	echo "You need to uncompress %MAYA_LOCATION%\include\qt-4.8.6-include.tar.gz in %MAYA_LOCATION%\include\Qt !"
	goto end
)
findstr /L /C:"Headers=../include/Qt" "%MAYA_LOCATION%\bin\qt.conf" >nul 2>&1
if ERRORLEVEL 1 (
	echo "You need to edit %MAYA_LOCATION%\bin\qt.conf to use 'Headers=../include/Qt'"
	goto end
)
	
pushd %PYQTDIR%

pushd pylupdate
del moc_translator.cpp 2> nul
del moc_translator.obj 2> nul
m:\bin\moc.exe -o moc_translator.cpp translator.h
popd

"%MAYA_LOCATION%\bin\mayapy" configure.py -p %QMAKESPEC% LIBDIR_QT="%QTDIR%\lib" INCDIR_QT="%QTDIR%\include\Qt" MOC="%QTDIR%\bin\moc.exe" -w --no-designer-plugin
nmake
nmake install
popd

:end
