@echo off
REM Import library for toggling key status
:lib
cmd.exe /c lib\winkeylib.bat
REM Capslock toggle loop 
set loop=0
:loop
start /b /wait powershell.exe -nologo -WindowStyle Hidden -sta -command "$wsh = New-Object -ComObject WScript.Shell;$wsh.SendKeys('{CAPSLOCK}')"
sleep .05
set /a loop=%loop%+1
if "%loop%"=="20" goto end
goto loop
:end
