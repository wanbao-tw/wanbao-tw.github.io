@echo off
chcp 65001 >nul 2>&1
title WANBAO Publisher

echo.
echo ========================================
echo    WANBAO - One Click Publish
echo ========================================
echo.

cd /d "%~dp0"

:: Check if node_modules exists
if not exist "node_modules" (
    echo [0/4] Installing dependencies...
    call npm install
    if errorlevel 1 (
        echo.
        echo [ERROR] npm install failed!
        pause
        exit /b 1
    )
    echo.
)

echo [1/4] Building site...
call npx astro build
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    echo.
    echo Possible solutions:
    echo   1. Run "npm install" first
    echo   2. Check if Node.js is installed
    echo   3. Try running "npx astro build" manually
    pause
    exit /b 1
)

echo.
echo [2/4] Adding files to git...
git add -A

echo.
echo [3/4] Creating commit...
set "msg=Update: %date% %time%"
git commit -m "%msg%"

echo.
echo [4/4] Pushing to GitHub...
git push origin main
if errorlevel 1 (
    echo.
    echo [ERROR] Push failed! Check your git credentials.
    pause
    exit /b 1
)

echo.
echo ========================================
echo    SUCCESS! Site published!
echo ========================================
echo.
echo Your site will be live in 1-2 minutes at:
echo https://wanbao.tw
echo.

pause
