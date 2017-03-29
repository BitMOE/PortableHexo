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
echo.
echo          Rsync 方式部署方式适用于您拥有自己的服务器或者VPS的情形，
echo          它需要您在服务器上也安上 rsync 软件，代码同步时会通过 SSH
echo          隧道建立与服务器的联系，并调用 rsync 进行数据交换。
echo.
echo       常见系统安装 Rsync 指令如下：
echo       ①、RedHat/CentOS/Fedora : yum install -y rsync ；
echo       ②、Debian/Ubuntu : apt-get install -y rsync ；
echo       ③、FreeBSD/OpenBSD : cd /usr/ports/net/rsync ^&^& make install clean ；
REM echo       ④、新建博客文章 ； ⑤、本地服务测试 ； ⑥、生成并且部署 ；
REM echo       ⑦、重置配置文件 ； ⑧、启动指令模式 ； ⑨、关闭并且退出 ；
echo.
echo.
pause

@echo off
for /f "tokens=1-6 delims==" %%i in (rsync.ini) do (
	if "%%i"=="hostip" set hostip=%%j
	if "%%i"=="hostuser" set hostuser=%%j
	if "%%i"=="sshport" set sshport=%%j
	if "%%i"=="remotedir" set remotedir=%%j
	if "%%i"=="localdir" set localdir=%%j
 )

:MENU
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"
:EXIT
exit