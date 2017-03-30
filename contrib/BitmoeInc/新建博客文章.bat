@ECHO OFF
mode con cols=77 lines=25
title          比特萌 HEXO 便携版新建博文控制台（ Windows 平台）
color 0a
cls
CALL %~dp0..\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo             比特萌 HEXO 便携版新建博文控制台（ Windows 平台）
CALL %~dp0版本号.bat
cd %~dp0..\..\hexo
echo.
echo      ^|--------------------------------------------------------------
echo      ^|      由于 HEXO 是根据您文章的文件名生成博客文章 URL 的，    ^|
echo      ^| 中文文件路径或者中文文件名在国内部分主机可能存在兼容性问题，^|
echo      ^|          所以强烈建议您将文章名换成 拼音 或者 英文，        ^|
echo      ^|         也就是以下文章文件名推荐使用 拼音 或者 英文。       ^|
echo      --------------------------------------------------------------^|
echo              文章创建成功后您可以使用任何您顺手的编辑器编辑它！
@echo off
echo.
set /p postname=请输入准备撰写的文章文件名: 
echo.
REM echo 您刚输入的文章名为 %postname%
REM @pause >nul
cmd /c %~dp0hexon.bat
pause
:RETU
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"
