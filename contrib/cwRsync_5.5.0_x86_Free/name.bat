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
pause

