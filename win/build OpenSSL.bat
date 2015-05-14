@echo off
set XXX=%~dp0
if ["%MAYAQTBUILD%"]==[""] call "%XXX%build setup.bat"

rem http://www.uvm.edu/~gcd/2010/09/compiling-openssl-for-win-x64/
cd %OPENSSL%
set PREFIXSSL=%OPENSSL%

if exist p:\nul subst p: /d
subst p: "C:\Program Files\ActivePerl"
set PERL="p:\bin\perl.exe"
set PATH=%PATH%;p:\bin

rem %PERL% Configure VC-WIN64A --prefix=%PREFIXSSL% no-shared no-idea
%PERL% Configure VC-WIN64A --prefix=%PREFIXSSL%
call ms\do_win64a.bat
nmake -f ms\nt.mak
nmake -f ms\ntdll.mak

pause