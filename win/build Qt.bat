@echo off
set XXX=%~dp0
if ["%MAYAQTBUILD%"]==[""] call "%XXX%build setup.bat"

cd %QTDIR%
rem nmake confclean
rem configure -platform win32-msvc%MSVC_VERSION% -debug-and-release -no-qt3support -no-phonon -no-phonon-backend -no-webkit
configure -prefix %AQTDIR% -platform win32-msvc%MSVC_VERSION% -debug-and-release -no-qt3support
nmake

pause