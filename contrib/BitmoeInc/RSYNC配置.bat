@ECHO OFF
mode con cols=77 lines=25
title          比特萌 Hexo 便携版 RSYNC 同步配置控制台（ Windows 平台）
color 0a
cls
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo          比特萌 Hexo 便携版 RSYNC 同步配置控制台（ Windows 平台）
CALL %~dp0版本号.bat
echo.
echo       以下将为您生成 RSYNC 同步主配置文件 rsync.ini
echo.
echo       请您根据提示依次输入需要提供的帐号信息，
echo           信息将保存在便携版 根目录/home/rsync.ini 文件中
echo.
echo       您需要提供的信息分别为 远程主机域名或 IP ，用户名，端口，
echo       远程服务器存储目录位置（一般为网页服务器指定位置，以 "/" 结尾）。
echo.
echo.
echo    准备好了？
pause

@echo off
echo.
set /p hostip=请输入远程主机地址: 
set /p sshport=请输入远程SSH端口: 
set /p hostuser=请输入远程用户名: 
set /p remotedir=请输入远程目录地址: 
set localdir="public/"
echo.

echo    信息输入完成，以下是您输入的信息，请确认。
echo.
echo 您输入远程主机登录地址为： %hostip%
echo 您输入远程主机登录端口为： %sshport%
echo 您输入远程主机登录用户为： %hostuser%
REM echo 您输入远程主机地址为： %localdir%
echo 您输入远程主机存储位置为： %remotedir% （务必确认以 / 结尾 ）
echo.
echo    确认无误？
pause

cmd /c "%~dp0rsyncconfrite.bat"

echo.
echo    配置文件写入完成！
echo.
pause
CALL %~dp0比特萌.bat
echo.
echo.
echo.
echo          比特萌 Hexo 便携版 RSYNC 同步配置控制台（ Windows 平台）
CALL %~dp0版本号.bat
echo.
echo.
echo                       Rsync 主配置已经完成更新！！！
echo.
echo.
echo        ①、立即执行同步操作 ； ②、配置其他部署方案 ； ③、返回主控制台 ；
echo.
echo.

set /p user_input=请输入您需要执行的方案：
if %user_input% equ 1 goto PREV
if %user_input% equ 2 goto NEXT
if %user_input% equ 3 goto RETU

:PREV
CALL "%~dp0RSYNC传输.bat"
:NEXT
CALL "%~dp0服务部署配置.bat"
:RETU
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"