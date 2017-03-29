@ECHO OFF
@echo hostip=%hostip%>%~dp0..\..\home\rsync.ini
@echo hostuser=%hostuser%>>%~dp0..\..\home\rsync.ini
@echo localdir=%localdir%>>%~dp0..\..\home\rsync.ini
@echo remotedir=%remotedir%>>%~dp0..\..\home\rsync.ini
@echo sshport=%sshport%>>%~dp0..\..\home\rsync.ini