@echo off
:: Move to the script's directory
cd /d "%~dp0"

echo ===================================================
echo     SUBHAS TEA STALL - GIT AUTO UPDATE SCRIPT
echo ===================================================
echo.

:: Check if git is initialized
if not exist .git (
    echo Git repository not found. Initializing now...
    git init
    git branch -M main
    git remote add origin https://github.com/rajsubhajit554-cloud/SW-Subhas-Tea-Stall.git
    echo.
)

:: Show status of files
echo Checking modified/untracked files...
git status -s
echo.

:: Confirm with the user before proceeding
echo Press [Ctrl+C] to abort, or press any key to start staging and pushing...
pause >nul

echo.
echo Staging all changes...
git add -A

echo.
:: Ask for a commit message
set /p commit_msg="Enter your commit message (or press Enter for 'Auto Update'): "
if "%commit_msg%"=="" set commit_msg=Auto Update

echo.
echo Committing changes...
git commit -m "%commit_msg%"

echo.
echo Pushing changes to GitHub (main branch)...
git push -u origin main

echo.
echo ===================================================
echo             GIT UPDATE PROCESS FINISHED
echo ===================================================
echo.
pause
