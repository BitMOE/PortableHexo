@ECHO OFF
mode con cols=77 lines=25
title            比特萌 Hexo 便携版服务部署控制台（ Windows 平台）
color 0a
cls
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo              比特萌 Hexo 便携版服务部署控制台（ Windows 平台）
CALL %~dp0版本号.bat
cd %~dp0..\..\hexo
echo.
echo          Rsync 方式部署方式适用于您拥有自己的服务器或者VPS的情形，
echo          它需要您在服务器上也安上 rsync 软件，代码同步时会通过 SSH
echo          隧道建立与服务器的联系，并调用 rsync 进行数据交换。
echo.
echo       常见系统安装 Rsync 指令如下：
echo       ①、RedHat/CentOS/Fedora : yum install -y rsync ；
echo       ②、Debian/Ubuntu : apt-get install -y rsync ；
echo       ③、FreeBSD/OpenBSD : cd /usr/ports/net/rsync ^&^& make install clean ；
echo.
echo.
echo    若您服务端 Rsync 已准备就绪
pause

@echo off
for /f "tokens=1-6 delims==" %%i in (%~dp0..\..\home\rsync.ini) do (
	if "%%i"=="hostip" set hostip=%%j
	if "%%i"=="hostuser" set hostuser=%%j
	if "%%i"=="sshport" set sshport=%%j
	if "%%i"=="remotedir" set remotedir=%%j
	if "%%i"=="localdir" set localdir=%%j
 )

echo         远程主机地址： %hostip%
echo         远程主机地址： %sshport%
echo         远程登录用户： %hostuser%
echo         远程主机目录： %remotedir%
echo         本地主机目录： %localdir%
echo.
echo    以上信息准确无误？
pause

@ECHO OFF
SETLOCAL
SET CWRSYNCHOME=%~dp0..\..\
IF NOT EXIST %CWRSYNCHOME%\home\.ssh MKDIR %CWRSYNCHOME%\home\.ssh
SET CWOLDPATH=%PATH%
SET PATH=%~dp0..\..\contrib\cwRsync_5.5.0_x86_Free\bin;%PATH%
cls
cmd /c %~dp0rsync.bat
echo.
echo    远程同步完成！
echo.
pause
CALL %~dp0比特萌.bat
echo.
echo.
echo.
echo              比特萌 Hexo 便携版服务部署控制台（ Windows 平台）
CALL %~dp0版本号.bat
echo.
echo.
echo           与服务器 %hostip% 通信完成，远程数据已经完成更新！！！
echo.
echo.
echo     ①、返回选择其他同步方案 ； ②、返回主控制台 ； ③、退出控制台 ；
echo.
echo.
set /p user_input=请输入您需要执行的方案：
if %user_input% equ 1 goto PREV
if %user_input% equ 2 goto NEXT
if %user_input% equ 3 goto EXIT

:PREV
CALL "%~dp0部署静态页面.bat"
:NEXT
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"
:EXIT
exit