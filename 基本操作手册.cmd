@ECHO OFF
mode con cols=77 lines=25
title            ������ Hexo ��Я������ֲᣨ Windows ƽ̨��
color 0a
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\������.bat
echo.
echo              ������ Hexo ָ��ִ�п���̨�� Windows ƽ̨��
CALL %~dp0contrib\BitmoeInc\�汾��.bat
cd %~dp0hexo
echo.
echo                         Hexo ��Я������ֲ�
echo.
echo       �١�HEXO ��ʲô���� �ڡ����л��ƣ�   �� �ۡ����������� ��
echo       �ܡ��½��������� �� �ݡ����ط������ �� �ޡ����ɲ��Ҳ��� ��
echo       �ߡ����������ļ� �� �ࡢ����ָ��ģʽ �� �ᡢ�رղ����˳� ��
echo.
echo         �١�ȷ��ִ�в��� �� �ڡ������ܿ���̨ �� �ۡ��˳�����̨ ��
echo.
set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto RUN
if %user_input% equ 2 goto MENU
if %user_input% equ 3 goto EXIT

:RUN
cmd
:MENU
CALL "%~dp0������ HEXO ��Я���ܿ���̨.cmd"
:EXIT
exit