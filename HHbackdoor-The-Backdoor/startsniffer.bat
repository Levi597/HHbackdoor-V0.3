@echo off
cls
mkdir files
title HHS V0.3
FOR /F "delims=: tokens=2" %%a in ('ipconfig ^| find "IPv4"') do set IPAddress=%%a
ECHO %IPAddress%
python print(localhost)
python -m pyftpdlib --directory=%cd%\ --write --interface=%IPAddress% --port=21111 --username=Victim --password=Victim
pause 