@ECHO OFF
mode con cols=77 lines=25
title         ������ HEXO ��Я��Զ�̲������̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\������.bat
echo.
echo             ������ HEXO ��Я��Զ�̲������̨�� Windows ƽ̨��
CALL %~dp0contrib\BitmoeInc\�汾��.bat
cd %~dp0hexo
echo.
echo          ��������������Ϊ������ HEXO ����Ϊ��ҳ��̬�ļ���
echo.
echo              ������̿�����Ҫ���޶� �� �����ʱ�䣬
echo.
echo                  ����ʱ�������ļ�������ü�����������Ӱ�졣
echo.
echo.
pause
cmd /c %~dp0contrib\BitmoeInc\hexog.bat
echo.
echo        o(��_��)o 
echo    ��̬�ļ����ɳɹ�
echo.
pause
CALL %~dp0contrib\BitmoeInc\������.bat
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\������.bat
echo.
echo             ������ HEXO ��Я��Զ�̲������̨�� Windows ƽ̨��
CALL %~dp0contrib\BitmoeInc\�汾��.bat
pushd %~dp0hexo
echo.
echo          o(��_��)o ���ۣ���������վ����ֻʣ���һ���ˣ�����
echo                PS������Ϊ���в������ã���ѡ���������ö�Ӧ����
echo.
echo       �١�Rsync ���䣨�Ƽ����� �ڡ�Git ���� �� �ۡ�FTP ���䣨���Ƽ�����
echo       �ܡ�Rsync ����        �� �ݡ�Git ���� �� �ޡ�FTP ����          ��
echo.
echo.
echo.


set /p user_input=����������Ҫִ�еķ�����
if %user_input% equ 1 goto RSYNC
if %user_input% equ 2 goto GIT
if %user_input% equ 3 goto FTP
if %user_input% equ 4 goto RSYNCCONF
if %user_input% equ 5 goto GITCONF
if %user_input% equ 6 goto FTPCONF

:RSYNC
CALL %~dp0RSYNC����.cmd
pause