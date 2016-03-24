@echo off
cls
cd blog
set path=%path%;%cd%\..\support\git\bin\;%cd%\..\support\npm\bin\;%cd%\..\support\nodejs\;%cd%\..\support\npm\;%cd%\..\support\git\
del _config.yml
copy %cd%\..\support\backup\_config.yml _config.yml
cls
echo ÷ÿ÷√ÕÍ±œ
pause
