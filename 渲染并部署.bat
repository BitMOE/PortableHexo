@echo off
cls
cd blog
set path=%path%;%cd%\..\support\git\bin\;%cd%\..\support\npm\bin\;%cd%\..\support\nodejs\;%cd%\..\support\npm\;%cd%\..\support\git\
start git-bash "%cd%\..\support\script\generateAndDelpoy.sh"

