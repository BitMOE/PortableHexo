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
echo       ①、基本操作手册 ； ②、配置基本信息 ； ③、服务部署配置 ；
echo       ④、新建博客文章 ； ⑤、本地服务测试 ； ⑥、生成并且部署 ；
echo       ⑦、重置配置文件 ； ⑧、启动指令模式 ； ⑨、关闭并且退出 ；
echo.

REM ①②③④⑤⑥⑦⑧⑨⑩
set /p user_input=请输入数字：

if %user_input% equ 1 goto CONF
if %user_input% equ 2 goto SYNC
if %user_input% equ 3 goto DEPLOY
if %user_input% equ 4 goto CONF
if %user_input% equ 5 goto SERVER
if %user_input% equ 6 goto EXIT
if %user_input% equ 7 goto RESET
if %user_input% equ 8 goto SHELL
if %user_input% equ 9 goto EXIT


:SERVER
CALL 本地服务测试.cmd
:DEPLOY
CALL 服务部署配置.cmd

:RESET
CALL 重置配置文件.cmd
:SHELL
CALL 启动指令模式.cmd
:EXIT
exit