@echo off
%~d0
cd /d %~dp0..

call "build setup.bat"
call "build Qt.bat"
call "build SIP.bat"
call "build PyQt.bat"

pause