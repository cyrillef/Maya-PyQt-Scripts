@echo off
IF NOT "%CYRILLE%" == "OK", call "E:\__sdkext\_Maya2013 Scripts\build setup.bat"

rem ------------------------------------------------
rem Building OpenSSL
http://www.uvm.edu/~gcd/2010/09/compiling-openssl-for-win-x64/

cd %OPENSSL%
set PREFIXSSL=v:/openssl-1.0.0e

subst p: /d
subst p: "C:\Program Files\ActivePerl"
set PERL="p:\bin\perl.exe"
set PATH=%PATH%;p:\bin

rem %PERL% Configure VC-WIN64A --prefix=%PREFIXSSL% no-shared no-idea
%PERL% Configure VC-WIN64A --prefix=%PREFIXSSL%
call ms\do_win64a.bat
nmake -f ms\nt.mak
nmake -f ms\ntdll.mak

rem nmake -f ms\nt.mak install
rem nmake -f ms\ntdll.mak install

rem ------------------------------------------------

