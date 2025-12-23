@echo off
chcp 65001 >nul 2>&1
title WANBAO Publisher

echo.
echo ========================================
echo    WANBAO - One Click Publish
echo ========================================
echo.

cd /d "%~dp0"

echo [1/4] Building site...
call npm run build
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
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
