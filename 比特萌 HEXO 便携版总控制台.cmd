@ECHO OFF
mode con cols=77 lines=25
title         ������ Hexo ��Я���ܿ���̨�� Windows ƽ̨��
color 0a
cls
:menu
cls
CALL %~dp0contrib\BitmoeInc\������ӭ��Ϣ.bat
echo        �������Ӧ���֣�ִ����Ӧ����
echo.
echo       �١����������ֲ� �� �ڡ����û�����Ϣ �� �ۡ����������� ��
echo       �ܡ��½��������� �� �ݡ����ط������ �� �ޡ����ɲ��Ҳ��� ��
echo       �ߡ����������ļ� �� �ࡢ����ָ��ģʽ �� �ᡢ�رղ����˳� ��
echo.

REM �٢ڢۢܢݢޢߢ���
set /p user_input=���������֣�

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
CALL ���ط������.cmd
:DEPLOY
CALL ����������.cmd

:RESET
CALL ���������ļ�.cmd
:SHELL
CALL ����ָ��ģʽ.cmd
:EXIT
exit