@ECHO OFF
mode con cols=77 lines=25
title         比特萌 HEXO 便携版远程部署控制台（ Windows 平台）
color 0a
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo             比特萌 HEXO 便携版远程部署控制台（ Windows 平台）
CALL %~dp0版本号.bat
cd %~dp0..\..\hexo
echo.
echo          o(∩_∩)o ，哇，您距离网站上线只剩最后一步了！！！
echo                PS：若您为进行部署配置，请选择先行配置对应设置
echo.
echo       ①、Rsync 传输（推荐）； ②、Git 传输 ； ③、FTP 传输（不推荐）；
echo       ④、Rsync 配置        ； ⑤、Git 配置 ； ⑥、FTP 配置          ；
echo.
echo.
echo.


set /p user_input=请输入您需要执行的方案：
if %user_input% equ 1 goto RSYNC
if %user_input% equ 2 goto GIT
if %user_input% equ 3 goto FTP
if %user_input% equ 4 goto RSYNCCONF
if %user_input% equ 5 goto GITCONF
if %user_input% equ 6 goto FTPCONF

:RSYNC
CALL %~dp0RSYNC传输.bat
pause