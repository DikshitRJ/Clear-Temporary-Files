set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@echo OFF
::The first three lines clear the temporary files
del %TEMP%\*.* /f /s /q
del %systemdrive%\Windows\Prefetch\*.* /f /s /q
del %systemdrive%\Windows\Temp\*.* /f /s /q
::This defragments and optimizes all drives
defrag /C /O
::This clears the Recycle Bin
rd /s /q %systemdrive%\$Recycle.bin
::This runs the Disk Cleanup utility
cleanmgr.exe
