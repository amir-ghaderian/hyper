@echo off
setlocal
cd /d "%~dp0"

where git >nul 2>nul
if errorlevel 1 (
  echo Git is not installed.
  pause
  exit /b 1
)

git add products.json products
git diff --cached --quiet
if not errorlevel 1 (
  echo No changes to publish.
  pause
  exit /b 0
)

git commit -m "Update products %date% %time%"
if errorlevel 1 (
  echo Commit failed.
  pause
  exit /b 1
)

git pull --rebase
if errorlevel 1 (
  echo.
  echo Conflict with someone else's changes. Cancelling safely...
  git rebase --abort
  echo Nothing was published. Tell the developer.
  pause
  exit /b 1
)

git push
if errorlevel 1 (
  echo Push failed. Tell the developer.
  pause
  exit /b 1
)

echo.
echo Published successfully.
pause
