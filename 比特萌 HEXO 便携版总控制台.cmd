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
echo       �١����û�����Ϣ �� �ڡ����������� �� �ۡ��½��������� ��
echo       �ܡ����ط������ �� �ݡ����ɲ��Ҳ��� �� �ޡ����������ļ� ��
echo       �ߡ�����ָ��ģʽ �� �ࡢ�رղ����˳� �� �ᡢ���ڱ���Я�� ��
echo.

REM �٢ڢۢܢݢޢߢ���
set /p user_input=���������֣�

if %user_input% equ 1 goto SETINF
if %user_input% equ 2 goto SETDEP
if %user_input% equ 3 goto NEWPOS
if %user_input% equ 4 goto LOCALP
if %user_input% equ 5 goto DEPLOY
if %user_input% equ 6 goto RESETH
if %user_input% equ 7 goto SSHELL
if %user_input% equ 8 goto EXITHP
if %user_input% equ 9 goto ABOUTP

REM 1
:SETINF
CALL %~dp0contrib\BitmoeInc\����������.bat

REM 2
:SETDEP
CALL %~dp0contrib\BitmoeInc\����������.bat

REM 3
:NEWPOS
CALL %~dp0contrib\BitmoeInc\�½���������.bat

REM 4
:LOCALP
CALL %~dp0contrib\BitmoeInc\���ط������.bat

REM 5
:DEPLOY
CALL %~dp0contrib\BitmoeInc\���ɾ�̬ҳ��.bat

REM 6
:RESETH
CALL %~dp0contrib\BitmoeInc\���������ļ�.bat

REM 7
:SSHELL
CALL %~dp0contrib\BitmoeInc\����ָ��ģʽ.bat

REM 8
:EXITHP
exit

REM 9
:ABOUTP
CALL %~dp0contrib\BitmoeInc\����HEXO��Я��.bat