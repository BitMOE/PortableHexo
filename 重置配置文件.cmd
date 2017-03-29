@ECHO OFF
mode con cols=77 lines=25
title         比特萌 Hexo 便携版指令执行控制台（ Windows 平台）
color 0a
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\比特萌.bat
echo.
echo              比特萌 Hexo 指令执行控制台（ Windows 平台）
CALL %~dp0contrib\BitmoeInc\版本号.bat

echo.
echo         备份操作会使用默认主配置文件覆盖当前配置文件，请谨慎操作！
echo.
echo         ①、确认执行操作 ； ②、返回总控制台 ； ③、退出控制台 ；
echo.
set /p user_input=请输入您需要执行的方案：
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RUN
echo.
cd %~dp0hexo
del _config.backup.yml
@ren _config.yml _config.backup.yml
echo.
echo           备份 _config.yml 配置文件为 _config.backup.yml
@copy "%~dp0home\backup\_config.yml" "_config.yml"
echo           HEXO 主配置文件重置完成。
set /p user_input=请输入您需要执行的方案：
echo.
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT
:EXIT
exit
:MENU
CALL "%~dp0比特萌 HEXO 便携版总控制台.cmd"