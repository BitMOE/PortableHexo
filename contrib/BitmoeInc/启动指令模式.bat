@ECHO OFF
mode con cols=77 lines=25
title         比特萌 Hexo 便携版指令执行控制台（ Windows 平台）
color 0a
cls
CALL %~dp0..\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo              比特萌 Hexo 指令执行控制台（ Windows 平台）
CALL %~dp0版本号.bat
cd %~dp0..\..\hexo
echo.
echo        常用 HEXO 指令指引：
echo              创建文章： hexo n 文章名
echo              清除缓存： hexo clean
echo              本地预览： hexo server 或 hexo s
echo              远程部署： hexo deploy 或 hexo d
echo.
echo         ①、确认执行操作 ； ②、返回总控制台 ； ③、退出控制台 ；
echo.
set /p user_input=请输入您需要执行的方案：
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RUN
cmd
:MENU
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"
:EXIT
exit