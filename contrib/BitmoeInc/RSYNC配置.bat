@ECHO OFF
mode con cols=77 lines=25
title          ������ Hexo ��Я�� RSYNC ͬ�����ÿ���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0������.bat
echo.
echo          ������ Hexo ��Я�� RSYNC ͬ�����ÿ���̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
echo.
echo       ���½�Ϊ������ RSYNC ͬ���������ļ� rsync.ini
echo.
echo       ����������ʾ����������Ҫ�ṩ���ʺ���Ϣ��
echo           ��Ϣ�������ڱ�Я�� ��Ŀ¼/home/rsync.ini �ļ���
echo.
echo       ����Ҫ�ṩ����Ϣ�ֱ�Ϊ Զ������������ IP ���û������˿ڣ�
echo       Զ�̷������洢Ŀ¼λ�ã�һ��Ϊ��ҳ������ָ��λ�ã��� "/" ��β����
echo.
echo.
echo    ׼�����ˣ�
pause

@echo off
echo.
set /p hostip=������Զ��������ַ: 
set /p sshport=������Զ��SSH�˿�: 
set /p hostuser=������Զ���û���: 
set /p remotedir=������Զ��Ŀ¼��ַ: 
set localdir="public/"
echo.

echo    ��Ϣ������ɣ����������������Ϣ����ȷ�ϡ�
echo.
echo ������Զ��������¼��ַΪ�� %hostip%
echo ������Զ��������¼�˿�Ϊ�� %sshport%
echo ������Զ��������¼�û�Ϊ�� %hostuser%
REM echo ������Զ��������ַΪ�� %localdir%
echo ������Զ�������洢λ��Ϊ�� %remotedir% �����ȷ���� / ��β ��
echo.
echo    ȷ������
pause

cmd /c "%~dp0rsyncconfrite.bat"

echo.
echo    �����ļ�д����ɣ�
echo.
pause
CALL %~dp0������.bat
echo.
echo.
echo.
echo          ������ Hexo ��Я�� RSYNC ͬ�����ÿ���̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
echo.
echo.
echo                       Rsync �������Ѿ���ɸ��£�����
echo.
echo.
echo        �١�����ִ��ͬ������ �� �ڡ������������𷽰� �� �ۡ�����������̨ ��
echo.
echo.

set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto PREV
if %user_input% equ 2 goto NEXT
if %user_input% equ 3 goto RETU

:PREV
CALL "%~dp0RSYNC����.bat"
:NEXT
CALL "%~dp0����������.bat"
:RETU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"