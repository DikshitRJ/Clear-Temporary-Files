set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@echo OFF
ECHO Deleting temp files
del %TEMP%\*.* /f /s /q
del %systemdrive%\Windows\Prefetch\*.* /f /s /q
del %systemdrive%\Windows\Temp\*.* /f /s /q
ECHO  Clearing recycle bin
rd /s /q %systemdrive%\$Recycle.bin
ECHO Bin cleared. Running Disk Cleanup
cleanmgr.exe /d%systemdrive%
taskkill /F /IM explorer.exe
start explorer.exe
