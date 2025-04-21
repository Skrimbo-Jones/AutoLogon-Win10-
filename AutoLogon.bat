@echo off
echo Be sure to run this as Admin!!
echo (E)nable or (D)isable Autologon?

set /p choice=

if %choice% == E goto :enable
if %choice% == e goto :enable
if %choice% == D goto :disable
if %choice% == d goto :disable

:Enable
cls
echo What is your current password?
set /p pass= 
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d %username% /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %pass% /f
cls
echo Registry Edited!! Please use this program to revert back to normal!
timeout /t 5
shutdown -r
exit

:disable
cls
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /f
cls
echo Registry Edited!! Your system will no longer log on automatically!
timeout 5
shutdown -r 
exit

