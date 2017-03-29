@ECHO OFF
mode con cols=77 lines=25
title         ������ Hexo ��Я�����̨�� Windows ƽ̨��
color 0a
@echo off
for /f "tokens=1-6 delims==" %%i in (rsync.ini) do (
	if "%%i"=="hostip" set hostip=%%j
	if "%%i"=="hostuser" set hostuser=%%j
	if "%%i"=="sshport" set sshport=%%j
	if "%%i"=="remotedir" set remotedir=%%j
	if "%%i"=="localdir" set localdir=%%j
 )

cls
:menu
cls
CALL contrib\BitmoeInc\��ӭ��Ϣ.bat
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
if %user_input% equ 3 goto EXIT
if %user_input% equ 4 goto CONF
if %user_input% equ 5 goto SYNC
if %user_input% equ 6 goto EXIT
if %user_input% equ 7 goto CONF
if %user_input% equ 8 goto ����ָ��ģʽ
if %user_input% equ 9 goto EXIT

:����ָ��ģʽ
CALL ����ָ��ģʽ.cmd

:CONF
cls
@echo off
set /p hostip=������Զ��������ַ: 
set /p hostuser=������Զ���û���: 
set /p localdir=�����뱾��Ŀ¼��ַ: 
set /p remotedir=������Զ��Ŀ¼��ַ: 
set /p sshport=������Զ��SSH�˿�: 

echo ������Զ��������ַ %hostip%  
echo ������Զ��������ַ %hostuser%  
echo ������Զ��������ַ %localdir%  
echo ������Զ��������ַ %remotedir%  
echo ������Զ��������ַ %sshport%  


@echo hostip=%hostip%>rsync.txt.ini
@echo hostuser=%hostuser%>>rsync.txt.ini
@echo localdir=%localdir%>>rsync.txt.ini
@echo remotedir=%remotedir%>>rsync.txt.ini
@echo sshport=%sshport%>>rsync.txt.ini
goto menu


:SYNC
cls
echo.
echo.
echo        ============================================================
echo          ______   _____  _________  ____    ____   ___   ________  
echo         ^|_   _ \ ^|_   _^|^|  _   _  ^|^|_   \  /   _^|.'   `.^|_   __  ^| 
echo           ^| ^|_) ^|  ^| ^|  ^|_/ ^| ^| \_^|  ^|   \/   ^| /  .-.  \ ^| ^|_ \_^| 
echo           ^|  __'.  ^| ^|      ^| ^|      ^| ^|\  /^| ^| ^| ^|   ^| ^| ^|  _^| _  
echo          _^| ^|__) ^|_^| ^|_    _^| ^|_    _^| ^|_\/_^| ^|_\  `-'  /_^| ^|__/ ^| 
echo         ^|_______/^|_____^|  ^|_____^|  ^|_____^|^|_____^|`.___.'^|________^| 
echo        ============================================================
echo.
echo          ����л�����������Ķ� ������ HEXO ��Я��Ĺ�ע��֧�֣���        
echo.
echo             ������ Hexo ��Я�� Rsync ͬ���ű��� Windows ƽ̨��          
echo.
echo          �������� �����ȹ�˾��Bitmoe Inc.�� ��д���ṩ����֧��
echo                ��Ŀ��ҳ: HTTPS://PortableHexo.Bitmoe.cn
echo.
echo     ��ǰ Rsync ������Ϣ��ȷ�������س�ִ��ͬ��ָ�
echo       ��������ַ��%hostip% * �û���%hostuser% * �˿ڣ�%sshport%
echo       Զ��Ŀ¼��%remotedir% * ����Ŀ¼��%localdir%
echo.
pause>nul
goto menu

:EXIT
exit
;ping 1 -w 100>nul
;pause>nul
;echo rsync --delete -v -az -e 'ssh -p %sshport%' "%localdir%" "%hostuser%@%hostip%:%remotedir%"
;rsync --delete -v -az -e 'ssh -p %sshport%' "%localdir%" "%hostuser%@%hostip%:%remotedir%"