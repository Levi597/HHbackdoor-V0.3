rem HHB. V 0.3 P.F.B 20.7
@echo off
FOR /F "delims=: tokens=2" %%a in ('ipconfig ^| find "IPv4"') do set IPAddress=%%a
%cd%\upnpc-static.exe -a %IPAddress% 21111 21111 TCP
echo Proxy server running