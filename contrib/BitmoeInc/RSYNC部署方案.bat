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
echo.
echo          Rsync ��ʽ����ʽ��������ӵ���Լ��ķ���������VPS�����Σ�
echo          ����Ҫ���ڷ�������Ҳ���� rsync ���������ͬ��ʱ��ͨ�� SSH
echo          ������������������ϵ�������� rsync �������ݽ�����
echo.
echo       ����ϵͳ��װ Rsync ָ�����£�
echo       �١�RedHat/CentOS/Fedora : yum install -y rsync ��
echo       �ڡ�Debian/Ubuntu : apt-get install -y rsync ��
echo       �ۡ�FreeBSD/OpenBSD : cd /usr/ports/net/rsync ^&^& make install clean ��
REM echo       �ܡ��½��������� �� �ݡ����ط������ �� �ޡ����ɲ��Ҳ��� ��
REM echo       �ߡ����������ļ� �� �ࡢ����ָ��ģʽ �� �ᡢ�رղ����˳� ��
echo.
echo.
pause

@echo off
for /f "tokens=1-6 delims==" %%i in (rsync.ini) do (
	if "%%i"=="hostip" set hostip=%%j
	if "%%i"=="hostuser" set hostuser=%%j
	if "%%i"=="sshport" set sshport=%%j
	if "%%i"=="remotedir" set remotedir=%%j
	if "%%i"=="localdir" set localdir=%%j
 )

:MENU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"
:EXIT
exit