@ECHO OFF
mode con cols=77 lines=25
title          ������ HEXO ��Я���½����Ŀ���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0..\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0������.bat
echo.
echo             ������ HEXO ��Я���½����Ŀ���̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
cd %~dp0..\..\hexo
echo.
echo      ^|--------------------------------------------------------------
echo      ^|      ���� HEXO �Ǹ��������µ��ļ������ɲ������� URL �ģ�    ^|
echo      ^| �����ļ�·�����������ļ����ڹ��ڲ����������ܴ��ڼ��������⣬^|
echo      ^|          ����ǿ�ҽ����������������� ƴ�� ���� Ӣ�ģ�        ^|
echo      ^|         Ҳ�������������ļ����Ƽ�ʹ�� ƴ�� ���� Ӣ�ġ�       ^|
echo      --------------------------------------------------------------^|
echo              ���´����ɹ���������ʹ���κ���˳�ֵı༭���༭����
@echo off
echo.
set /p postname=������׼��׫д�������ļ���: 
echo.
REM echo ���������������Ϊ %postname%
REM @pause >nul
cmd /c %~dp0hexon.bat
pause
:RETU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"
