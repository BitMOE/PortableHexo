@ECHO OFF
mode con cols=77 lines=25
title         ������ Hexo ��Я��ָ��ִ�п���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0������.bat
echo.
echo              ������ Hexo ָ��ִ�п���̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
cd %~dp0..\..\hexo
echo.
echo         ���ݲ�����ʹ��Ĭ���������ļ����ǵ�ǰ�����ļ��������������
echo.
echo         �١�ȷ��ִ�в��� �� �ڡ������ܿ���̨ �� �ۡ��˳�����̨ ��
echo.
set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RUN
echo.
del _config.backup.yml
@ren _config.yml _config.backup.yml
echo.
echo           ���� _config.yml �����ļ�Ϊ _config.backup.yml
@copy "%~dp0..\..\home\backup\_config.yml" "_config.yml"
echo           HEXO �������ļ�������ɡ�
set /p user_input=����������Ҫִ�еķ�����
echo.
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT
:EXIT
exit
:MENU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"