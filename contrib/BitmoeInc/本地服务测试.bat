@ECHO OFF
mode con cols=77 lines=25
title         ������ HEXO ��Я�汾�ص��Կ���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0..\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0������.bat
echo.
echo             ������ HEXO ��Я�汾�ص��Կ���̨�� Windows ƽ̨��
CALL %~dp0�汾��.bat
cd %~dp0..\..\hexo
echo.
echo          �������������Ϊ���� HEXO ���ص���ģʽ��
echo              ������ʹ����������� Hexo is running at �����ַ��
echo                  ���������򿪳��ڰ���������Ӧ��
echo                     ���������б��س���ռ��4000�˿ڣ����縣���Ķ�����
echo                ��ʹ���ܿ���̨->�ࡢ����ָ��ģʽ��
echo                �ֶ�ִ��hexo s --debug -p 5000 ����ʱ���������˿ڣ�
echo.
echo.
pause
cmd /c %~dp0hexos.bat
pause
:RETU
CALL "%~dp0../../������ HEXO ��Я���ܿ���̨.cmd"
