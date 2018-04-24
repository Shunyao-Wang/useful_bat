@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"



color A
@echo on
@echo  *************************
@echo  *    1、启用有线网络    *
@echo  *    2、启用无线网络    *
@echo  *    3、退出            *
@echo  *************************
@echo off
set /p input=请输入数字选择需要进行的操作:
if "%input%"=="1" goto A
if "%input%"=="2" goto B
if "%input%"=="3" goto C
pause
@echo on
exit
:A
@echo\
@echo 1、启用有线网络中。。。
netsh interface set interface "以太网" enabled
netsh interface set interface "WLAN" disabled
@echo 【有线网络启用成功！】
@echo\
goto Q
:B
@echo\
@echo 2、启用无线网络:
netsh interface set interface "WLAN" enabled
netsh interface set interface "以太网" disabled
@echo 【无线网络启用成功！】
@echo\
goto Q
:C
Exit
:Q
@echo on
@echo  *************************
@echo  *    1、启用有线网络    *
@echo  *    2、启用无线网络    *
@echo  *    3、退出            *
@echo  *************************
@echo off
set /p input=请输入数字选择需要进行的操作:
if "%input%"=="1" goto A
if "%input%"=="2" goto B
if "%input%"=="3" goto C
pause
@echo on
exit
