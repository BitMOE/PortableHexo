@ECHO OFF
mode con cols=77 lines=25
title         ������ Hexo ��Я��ָ��ִ�п���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\������.bat
echo.
echo              ������ Hexo ָ��ִ�п���̨�� Windows ƽ̨��
CALL %~dp0contrib\BitmoeInc\�汾��.bat

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
cd %~dp0hexo
del _config.backup.yml
@ren _config.yml _config.backup.yml
echo.
echo           ���� _config.yml �����ļ�Ϊ _config.backup.yml
@copy "%~dp0home\backup\_config.yml" "_config.yml"
echo           HEXO �������ļ�������ɡ�
set /p user_input=����������Ҫִ�еķ�����
echo.
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT
:EXIT
exit
:MENU
CALL "%~dp0������ HEXO ��Я���ܿ���̨.cmd"