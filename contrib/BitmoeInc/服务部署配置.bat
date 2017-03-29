@ECHO OFF
mode con cols=77 lines=25
title            比特萌 HEXO 便携版服务部署控制台（ Windows 平台）
color 0a
cls
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo              比特萌 HEXO 便携版服务部署控制台（ Windows 平台）
CALL %~dp0版本号.bat
echo.
echo          欢迎您使用 比特萌 Hexo 便携版部署控制台，
echo.             请根据您的实际情况选择适合您的部署方式。
echo.
echo       ①、Rsync 部署方案：您拥有自己的服务器或者 VPS ；
echo       ②、Git 部署方案：您托管于 Github/Coding 等服务商之上；
echo       ③、FTP 方案（不推荐）：您只有虚拟主机，且只支持 FTP 同步 ；
echo.
echo.
set /p user_input=请输入您需要执行的方案：
if %user_input% equ 1 goto RSYNC
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RSYNC
CALL %~dp0RSYNC配置.bat
set /p user_input=请输入您需要执行的方案：
:MENU
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"
:EXIT
exit