@ECHO OFF
mode con cols=77 lines=25
title         比特萌 HEXO 便携版本地调试控制台（ Windows 平台）
color 0a
cls
CALL %~dp0..\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0比特萌.bat
echo.
echo             比特萌 HEXO 便携版本地调试控制台（ Windows 平台）
CALL %~dp0版本号.bat
cd %~dp0..\..\hexo
echo.
echo          本程序接下来会为您打开 HEXO 本地调试模式；
echo              您可以使用浏览器访问 Hexo is running at 后的网址；
echo                  如果浏览器打开长期白屏或无响应，
echo                     （可能您有本地程序占用4000端口，例如福听阅读器）
echo                请使用总控制台->⑧、启动指令模式，
echo                手动执行hexo s --debug -p 5000 （临时更换监听端口）
echo.
echo.
pause
cmd /c %~dp0hexos.bat
pause
:RETU
CALL "%~dp0../../比特萌 HEXO 便携版总控制台.cmd"
