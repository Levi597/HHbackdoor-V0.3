@echo off
title WINSCP.COM
:loop
IF EXIST BATCHOLD.LOG del batchold.log
xcopy batch.log %cd%\files
ren %cd%\files\batch.log batchold.log
xcopy %cd%\files\batchold.log %cd%
del files\batchold.log
:checksizeftp
cls
setlocal enableextensions disabledelayedexpansion
for %%z in ("batchold.log") do for /f "tokens=1,2" %%a in ('
robocopy "%%~dpz." "%%~dpz." "%%~nxz" /l /nocopy /is /njh /njs /ndl /nc
') do if "%%~dz"=="%%~db" (
set size=%%a
echo  "%%~z" : [%%a]
) else (
echo  "%%~z" : [%%a%%b]
)
:checksizeftp2
cls
setlocal enableextensions disabledelayedexpansion
for %%z in ("batch.log") do for /f "tokens=1,2" %%a in ('
robocopy "%%~dpz." "%%~dpz." "%%~nxz" /l /nocopy /is /njh /njs /ndl /nc
') do if "%%~dz"=="%%~db" (
set size2=%%a
echo  "%%~z" : [%%a]
) else (
echo  "%%~z" : [%%a%%b]
)
if %size% NEQ %size2% goto neq
if %size% EQ %size2% goto eq
:neq
cls
ecgo neq
pause
goto upload
:eq 
cls
echo eq
pause
goto loop 
:upload
"%cd%\ftp\app\winscp\winscp.com" /script="%cd%\winscp.hh"
pause
goto loop 