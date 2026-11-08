@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed. Install Node.js, then run this file again.
  pause
  exit /b 1
)

start "" powershell.exe -NoProfile -Command "$ready=$false; for($i=0;$i -lt 30;$i++){try{$null=Invoke-WebRequest -UseBasicParsing 'http://127.0.0.1:4173/admin.html' -TimeoutSec 1;$ready=$true;break}catch{Start-Sleep -Milliseconds 500}}; if($ready){Start-Process 'http://127.0.0.1:4173/admin.html'}"
node server.js
pause