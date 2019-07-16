@echo off
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /t REG_DWORD /v EnableLinkedConnections /d 1 /f
exit /B 3010