@ECHO OFF
rsync --delete -v -az -e 'ssh -i %~dp0..\..\home\.ssh\id_rsa -p %sshport%' "%localdir%" "%hostuser%@%hostip%:%remotedir%"