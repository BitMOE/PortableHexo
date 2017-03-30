@ECHO OFF
mode con cols=77 lines=25
title         比特萌 Hexo 便携版总控制台（ Windows 平台）
color 0a
cls
:menu
cls
CALL %~dp0contrib\BitmoeInc\启动欢迎信息.bat
echo        请输入对应数字，执行相应操作
echo.
echo       ①、配置基本信息 ； ②、服务部署配置 ； ③、新建博客文章 ；
echo       ④、本地服务测试 ； ⑤、生成并且部署 ； ⑥、重置配置文件 ；
echo       ⑦、启动指令模式 ； ⑧、关闭并且退出 ； ⑨、关于本便携版 ；
echo.

REM ①②③④⑤⑥⑦⑧⑨⑩
set /p user_input=请输入数字：

if %user_input% equ 1 goto SETINF
if %user_input% equ 2 goto SETDEP
if %user_input% equ 3 goto NEWPOS
if %user_input% equ 4 goto LOCALP
if %user_input% equ 5 goto DEPLOY
if %user_input% equ 6 goto RESETH
if %user_input% equ 7 goto SSHELL
if %user_input% equ 8 goto EXITHP
if %user_input% equ 9 goto ABOUTP

REM 1
:SETINF
CALL %~dp0contrib\BitmoeInc\服务部署配置.bat

REM 2
:SETDEP
CALL %~dp0contrib\BitmoeInc\服务部署配置.bat

REM 3
:NEWPOS
CALL %~dp0contrib\BitmoeInc\新建博客文章.bat

REM 4
:LOCALP
CALL %~dp0contrib\BitmoeInc\本地服务测试.bat

REM 5
:DEPLOY
CALL %~dp0contrib\BitmoeInc\生成静态页面.bat

REM 6
:RESETH
CALL %~dp0contrib\BitmoeInc\重置配置文件.bat

REM 7
:SSHELL
CALL %~dp0contrib\BitmoeInc\启动指令模式.bat

REM 8
:EXITHP
exit

REM 9
:ABOUTP
CALL %~dp0contrib\BitmoeInc\关于HEXO便携版.bat