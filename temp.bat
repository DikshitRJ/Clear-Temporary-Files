set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@echo OFF
del %TEMP%\*.* /f /s /q
del C:\Windows\Prefetch\*.* /f /s /q
del C:\Windows\Temp\*.* /f /s /q
defrag /C /O
rd /s /q %systemdrive%\$Recycle.bin
c:\windows\SYSTEM32\cleanmgr.exe /dc