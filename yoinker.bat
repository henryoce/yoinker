@echo off
time /t >> output.txt
echo "Starting script" >> output.txt

REM Find all APs and pipe into profiles.txt, format below
REM 
REM Profiles on interface Wi-Fi:
REM      All User Profile       : Wifi 1
REM      All User Profile       : Wifi 2
REM 
netsh wlan show profile | findstr ":" > profiles.txt

REM For loop to grab the details of each AP
for /F "tokens=*" %%A in (profiles.txt) do call :hloop %%A
goto End

:hloop
netsh wlan show profile %5 key=clear >> output.txt
goto :eof

:End



del names.txt
del profiles.txt