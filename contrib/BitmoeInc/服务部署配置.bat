@ECHO OFF
mode con cols=77 lines=25
title            ������ HEXO ��Я����������̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0������.bat
echo.
echo              ������ HEXO ��Я����������̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
echo.
echo          ��ӭ��ʹ�� ������ Hexo ��Я�沿�����̨��
echo.             ���������ʵ�����ѡ���ʺ����Ĳ���ʽ��
echo.
echo       �١�Rsync ���𷽰�����ӵ���Լ��ķ��������� VPS ��
echo       �ڡ�Git ���𷽰������й��� Github/Coding �ȷ�����֮�ϣ�
echo       �ۡ�FTP ���������Ƽ�������ֻ��������������ֻ֧�� FTP ͬ�� ��
echo.
echo.
set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto RSYNC
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RSYNC
CALL %~dp0RSYNC����.bat
set /p user_input=����������Ҫִ�еķ�����
:MENU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"
:EXIT
exit