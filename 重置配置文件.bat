@echo off
cls
cd hexo
set PortableHexo="%~dp0"
set path=%path%;%cd%\..\support\git\bin\;%cd%\..\support\nodejs\;%cd%\..\hexo\node_modules\.bin;%cd%\..\support\nodejs\node_modules\.bin;%cd%\..\support\git\
del _config.yml
copy %cd%\..\support\backup\_config.yml _config.yml
cls
echo ÷ÿ÷√ÕÍ±œ
pause
