@echo off

pushd %~d0

call "setup.bat"
call "sip.bat"
call "pyqt.bat"

popd
