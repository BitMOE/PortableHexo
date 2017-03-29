@ECHO OFF
mode con cols=77 lines=25
title            比特萌 Hexo 便携版操作手册（ Windows 平台）
color 0a
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\比特萌.bat
echo.
echo              比特萌 Hexo 指令执行控制台（ Windows 平台）
CALL %~dp0contrib\BitmoeInc\版本号.bat
cd %~dp0hexo
echo.
echo                         Hexo 便携版操作手册
echo.
echo       ①、HEXO 是什么？； ②、运行机制？   ； ③、服务部署配置 ；
echo       ④、新建博客文章 ； ⑤、本地服务测试 ； ⑥、生成并且部署 ；
echo       ⑦、重置配置文件 ； ⑧、启动指令模式 ； ⑨、关闭并且退出 ；
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
CALL "%~dp0比特萌 HEXO 便携版总控制台.cmd"
:EXIT
exit