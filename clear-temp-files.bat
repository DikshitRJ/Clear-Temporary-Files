set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@echo OFF
::This clears the Temp files
del %TEMP%\*.* /f /s /q
::Change C: to another letter if the 'Windows' folder is located in another drive
del C:\Windows\Prefetch\*.* /f /s /q
del C:\Windows\Temp\*.* /f /s /q
defrag /C /O
rd /s /q %systemdrive%\$Recycle.bin
::Change 'c' at the end of the line to another letter if you want to run disk cleanup in another disk (/d<Drive>)
c:\windows\SYSTEM32\cleanmgr.exe /dc
