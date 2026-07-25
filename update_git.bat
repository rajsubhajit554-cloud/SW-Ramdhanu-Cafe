@echo off
title Git Auto Update - SW-Cafe
echo =======================================================
echo          SW-Cafe Git Repository Update Tool            
echo =======================================================
echo.

echo Checking repository status...
git status

echo.
echo Staging changes...
git add .

set /p commit_msg="Enter commit message (Press Enter for default: 'Update SW-Cafe website'): "

if "%commit_msg%"=="" (
    set commit_msg=Update SW-Cafe website
)

echo.
echo Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"

echo.
echo Pushing changes to GitHub (origin main)...
git push origin main

echo.
if %errorlevel% equ 0 (
    echo =======================================================
    echo          SUCCESS: Git Update Completed!               
    echo =======================================================
) else (
    echo =======================================================
    echo          ERROR: Failed to push to GitHub.             
    echo =======================================================
)

echo.
pause
