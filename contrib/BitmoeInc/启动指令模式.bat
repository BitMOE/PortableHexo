@ECHO OFF
mode con cols=77 lines=25
title         ������ Hexo ��Я��ָ��ִ�п���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0..\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0������.bat
echo.
echo              ������ Hexo ָ��ִ�п���̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
cd %~dp0..\..\hexo
echo.
echo        ���� HEXO ָ��ָ����
echo              �������£� hexo n ������
echo              ������棺 hexo clean
echo              ����Ԥ���� hexo server �� hexo s
echo              Զ�̲��� hexo deploy �� hexo d
echo.
echo         �١�ȷ��ִ�в��� �� �ڡ������ܿ���̨ �� �ۡ��˳�����̨ ��
echo.
set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RUN
cmd
:MENU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"
:EXIT
exit