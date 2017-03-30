@echo off
set /p hostip=请输入远程主机地址: 
set /p hostuser=请输入远程用户名: 
set /p localdir=请输入本地目录地址: 
set /p remotedir=请输入远程目录地址: 
set /p sshport=请输入远程SSH端口: 

echo 您输入远程主机地址 %hostip%  
echo 您输入远程主机地址 %hostuser%  
echo 您输入远程主机地址 %localdir%  
echo 您输入远程主机地址 %remotedir%  
echo 您输入远程主机地址 %sshport%  


@echo hostip=%hostip%>rsync.txt.ini
@echo hostuser=%hostuser%>>rsync.txt.ini
@echo localdir=%localdir%>>rsync.txt.ini
@echo remotedir=%remotedir%>>rsync.txt.ini
@echo sshport=%sshport%>>rsync.txt.ini
pause

