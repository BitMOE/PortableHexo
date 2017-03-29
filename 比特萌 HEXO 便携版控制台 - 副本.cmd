@ECHO OFF
mode con cols=77 lines=25
title         比特萌 Hexo 便携版控制台（ Windows 平台）
color 0a
@echo off
for /f "tokens=1-6 delims==" %%i in (rsync.ini) do (
	if "%%i"=="hostip" set hostip=%%j
	if "%%i"=="hostuser" set hostuser=%%j
	if "%%i"=="sshport" set sshport=%%j
	if "%%i"=="remotedir" set remotedir=%%j
	if "%%i"=="localdir" set localdir=%%j
 )

cls
:menu
cls
CALL contrib\BitmoeInc\欢迎信息.bat
echo        请输入对应数字，执行相应操作
echo.
echo       ①、基本操作手册 ； ②、配置基本信息 ； ③、服务部署配置 ；
echo       ④、新建博客文章 ； ⑤、本地服务测试 ； ⑥、生成并且部署 ；
echo       ⑦、重置配置文件 ； ⑧、启动指令模式 ； ⑨、关闭并且退出 ；
echo.

REM ①②③④⑤⑥⑦⑧⑨⑩
set /p user_input=请输入数字：

if %user_input% equ 1 goto CONF
if %user_input% equ 2 goto SYNC
if %user_input% equ 3 goto EXIT
if %user_input% equ 4 goto CONF
if %user_input% equ 5 goto SYNC
if %user_input% equ 6 goto EXIT
if %user_input% equ 7 goto CONF
if %user_input% equ 8 goto 启动指令模式
if %user_input% equ 9 goto EXIT

:启动指令模式
CALL 启动指令模式.cmd

:CONF
cls
@echo off
set /p hostip=请输入远程主机地址: 
set /p hostuser=请输入远程用户名: 
set /p localdir=请输入本地目录地址: 
set /p remotedir=请输入远程目录地址: 
set /p sshport=请输入远程SSH端口: 

echo 您输入远程主机地址 %hostip%  
echo 您输入远程主机地址 %hostuser%  
echo 您输入远程主机地址 %localdir%  
echo 您输入远程主机地址 %remotedir%  
echo 您输入远程主机地址 %sshport%  


@echo hostip=%hostip%>rsync.txt.ini
@echo hostuser=%hostuser%>>rsync.txt.ini
@echo localdir=%localdir%>>rsync.txt.ini
@echo remotedir=%remotedir%>>rsync.txt.ini
@echo sshport=%sshport%>>rsync.txt.ini
goto menu


:SYNC
cls
echo.
echo.
echo        ============================================================
echo          ______   _____  _________  ____    ____   ___   ________  
echo         ^|_   _ \ ^|_   _^|^|  _   _  ^|^|_   \  /   _^|.'   `.^|_   __  ^| 
echo           ^| ^|_) ^|  ^| ^|  ^|_/ ^| ^| \_^|  ^|   \/   ^| /  .-.  \ ^| ^|_ \_^| 
echo           ^|  __'.  ^| ^|      ^| ^|      ^| ^|\  /^| ^| ^| ^|   ^| ^| ^|  _^| _  
echo          _^| ^|__) ^|_^| ^|_    _^| ^|_    _^| ^|_\/_^| ^|_\  `-'  /_^| ^|__/ ^| 
echo         ^|_______/^|_____^|  ^|_____^|  ^|_____^|^|_____^|`.___.'^|________^| 
echo        ============================================================
echo.
echo          》感谢您长期以来的对 比特萌 HEXO 便携版的关注及支持！《        
echo.
echo             比特萌 Hexo 便携版 Rsync 同步脚本（ Windows 平台）          
echo.
echo          本程序由 比特萌公司（Bitmoe Inc.） 编写并提供技术支持
echo                项目主页: HTTPS://PortableHexo.Bitmoe.cn
echo.
echo     当前 Rsync 配置信息，确认无误后回车执行同步指令。
echo       服务器地址：%hostip% * 用户：%hostuser% * 端口：%sshport%
echo       远程目录：%remotedir% * 本地目录：%localdir%
echo.
pause>nul
goto menu

:EXIT
exit
;ping 1 -w 100>nul
;pause>nul
;echo rsync --delete -v -az -e 'ssh -p %sshport%' "%localdir%" "%hostuser%@%hostip%:%remotedir%"
;rsync --delete -v -az -e 'ssh -p %sshport%' "%localdir%" "%hostuser%@%hostip%:%remotedir%"