@echo off
echo Hosts IP address:
ipconfig | findstr "^...IPv4"
pause
