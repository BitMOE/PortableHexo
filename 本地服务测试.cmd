@ECHO OFF
mode con cols=77 lines=25
title         ������ HEXO ��Я�汾�ص��Կ���̨�� Windows ƽ̨��
color 0a
cls
CALL %~dp0contrib\node-v6.10.1-win-x86\nodevars.bat
cls
CALL %~dp0contrib\BitmoeInc\������.bat
echo.
echo             ������ HEXO ��Я�汾�ص��Կ���̨�� Windows ƽ̨��
CALL %~dp0contrib\BitmoeInc\�汾��.bat
pushd %~dp0hexo
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
hexo clean && hexo s --debug
pause
popd