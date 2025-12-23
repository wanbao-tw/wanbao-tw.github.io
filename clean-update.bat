@echo off
chcp 65001 >nul 2>&1
title WANBAO - Clean Update

echo.
echo ========================================
echo    WANBAO - Clean Update v1.6
echo ========================================
echo.
echo  This script will:
echo  1. Delete all files except .git folder
echo  2. You extract new version here
echo  3. Build and push to GitHub
echo.
echo ========================================
echo.

cd /d "%~dp0"

:: Check if .git exists
if not exist ".git" (
    echo [ERROR] .git folder not found!
    echo Please run this script in your git repo folder.
    pause
    exit /b 1
)

echo [WARNING] This will DELETE all files except .git folder!
echo.
set /p CONFIRM="Are you sure? (Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo [Cancelled]
    pause
    exit /b 0
)

echo.
echo [1/5] Deleting old files...

:: Delete all files and folders except .git
for /d %%i in (*) do (
    if /i not "%%i"==".git" (
        echo   Removing folder: %%i
        rmdir /s /q "%%i" 2>nul
    )
)
for %%i in (*) do (
    echo   Removing file: %%i
    del /q "%%i" 2>nul
)

echo.
echo ========================================
echo    Files deleted!
echo ========================================
echo.
echo [2/5] Now extract wanbao-v1.6.zip here
echo       (into this same folder)
echo.
echo Press any key AFTER you extracted the files...
pause >nul

:: Check if package.json exists (verify extraction)
if not exist "package.json" (
    echo.
    echo [ERROR] package.json not found!
    echo Please extract the zip file first.
    pause
    exit /b 1
)

echo.
echo [3/5] Installing dependencies...
call npm install
if errorlevel 1 (
    echo [ERROR] npm install failed!
    pause
    exit /b 1
)

echo.
echo [4/5] Building site...
call npx astro build
if errorlevel 1 (
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo.
echo [5/5] Pushing to GitHub...
git add -A
git commit -m "v1.6: Clean update - restructured article folders"
git push origin main

if errorlevel 1 (
    echo [ERROR] Push failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo    SUCCESS! Clean update complete!
echo ========================================
echo.
echo Your site will be live in 1-2 minutes.
echo.

pause
