@ECHO OFF
mode con cols=77 lines=25
title            ������ Hexo ��Я����������̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0..\contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0������.bat
echo.
echo              ������ Hexo ��Я����������̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
cd %~dp0..\..\hexo
echo.
echo          Rsync ��ʽ����ʽ��������ӵ���Լ��ķ���������VPS�����Σ�
echo          ����Ҫ���ڷ�������Ҳ���� rsync ���������ͬ��ʱ��ͨ�� SSH
echo          ������������������ϵ�������� rsync �������ݽ�����
echo.
echo       ����ϵͳ��װ Rsync ָ�����£�
echo       �١�RedHat/CentOS/Fedora : yum install -y rsync ��
echo       �ڡ�Debian/Ubuntu : apt-get install -y rsync ��
echo       �ۡ�FreeBSD/OpenBSD : cd /usr/ports/net/rsync ^&^& make install clean ��
echo.
echo.
echo    ��������� Rsync ��׼������
pause

@echo off
for /f "tokens=1-6 delims==" %%i in (%~dp0..\..\home\rsync.ini) do (
	if "%%i"=="hostip" set hostip=%%j
	if "%%i"=="hostuser" set hostuser=%%j
	if "%%i"=="sshport" set sshport=%%j
	if "%%i"=="remotedir" set remotedir=%%j
	if "%%i"=="localdir" set localdir=%%j
 )

echo         Զ��������ַ�� %hostip%
echo         Զ��������ַ�� %sshport%
echo         Զ�̵�¼�û��� %hostuser%
echo         Զ������Ŀ¼�� %remotedir%
echo         ��������Ŀ¼�� %localdir%
echo.
echo    ������Ϣ׼ȷ����
pause

@ECHO OFF
SETLOCAL
SET CWRSYNCHOME=%~dp0..\..\
IF NOT EXIST %CWRSYNCHOME%\home\.ssh MKDIR %CWRSYNCHOME%\home\.ssh
SET CWOLDPATH=%PATH%
SET PATH=%~dp0..\..\contrib\cwRsync_5.5.0_x86_Free\bin;%PATH%
cls
cmd /c %~dp0rsync.bat
echo.
echo    Զ��ͬ����ɣ�
echo.
pause
CALL %~dp0������.bat
echo.
echo.
echo.
echo              ������ Hexo ��Я����������̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
echo.
echo.
echo           ������� %hostip% ͨ����ɣ�Զ�������Ѿ���ɸ��£�����
echo.
echo.
echo     �١�����ѡ������ͬ������ �� �ڡ�����������̨ �� �ۡ��˳�����̨ ��
echo.
echo.
set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto PREV
if %user_input% equ 2 goto NEXT
if %user_input% equ 3 goto EXIT

:PREV
CALL "%~dp0����̬ҳ��.bat"
:NEXT
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"
:EXIT
exit