@echo off
clss
cd hexo
set PortableHexo="%~dp0"
set path=%path%;%cd%\..\support\git\bin\;%cd%\..\support\nodejs\;%cd%\..\hexo\node_modules\.bin;%cd%\..\support\nodejs\node_modules\.bin;%cd%\..\support\git\
start git-bash "%cd%\..\support\script\configSet.sh"

