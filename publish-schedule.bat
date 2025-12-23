@echo off
chcp 65001 >nul 2>&1
title WANBAO Schedule Publisher

echo.
echo ========================================
echo    WANBAO - Schedule Publisher v1.3
echo ========================================
echo.
echo  Schedule articles to publish at a
echo  specific time using Windows Task Scheduler
echo.
echo ========================================
echo.

set REPO_PATH=%~dp0

echo [Options]
echo 1. Publish now
echo 2. Schedule publish (set time)
echo 3. View scheduled tasks
echo 4. Cancel scheduled task
echo 5. Exit
echo.
set /p CHOICE="Select (1-5): "

if "%CHOICE%"=="1" goto publish_now
if "%CHOICE%"=="2" goto schedule_publish
if "%CHOICE%"=="3" goto view_schedule
if "%CHOICE%"=="4" goto cancel_schedule
if "%CHOICE%"=="5" exit /b 0

echo [Error] Invalid option
pause
exit /b 1

:publish_now
echo.
echo [Running] Publishing now...
call "%REPO_PATH%publish.bat"
goto end

:schedule_publish
echo.
echo [Schedule Settings]
echo Enter publish time (24-hour format)
echo.
set /p PUB_DATE="Date (format: 2025/01/15): "
set /p PUB_TIME="Time (format: 09:00): "
set /p TASK_NAME="Task name (e.g. WANBAO-NewYear): "

if "%PUB_DATE%"=="" goto invalid_input
if "%PUB_TIME%"=="" goto invalid_input
if "%TASK_NAME%"=="" set TASK_NAME=WANBAO-AutoPublish

echo.
echo [Confirm] Will publish at %PUB_DATE% %PUB_TIME%
echo [Task Name] %TASK_NAME%
set /p CONFIRM="Create schedule? (Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo [Cancelled]
    pause
    goto end
)

:: Create scheduled task
schtasks /create /tn "%TASK_NAME%" /tr "\"%REPO_PATH%publish.bat\"" /sc once /sd %PUB_DATE% /st %PUB_TIME% /f

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo    Schedule created successfully!
    echo ========================================
    echo.
    echo  Article will publish at:
    echo  %PUB_DATE% %PUB_TIME%
    echo.
    echo  Note: Computer must be ON at that time
    echo ========================================
) else (
    echo [Error] Failed to create schedule
    echo.
    echo Make sure to run as Administrator if needed
)
pause
goto end

:view_schedule
echo.
echo [Current WANBAO Tasks]
echo ----------------------------------------
schtasks /query /tn "WANBAO*" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo No scheduled tasks found
)
echo ----------------------------------------
pause
goto end

:cancel_schedule
echo.
set /p DEL_TASK="Enter task name to cancel: "
schtasks /delete /tn "%DEL_TASK%" /f
if %ERRORLEVEL% EQU 0 (
    echo [Success] Cancelled task: %DEL_TASK%
) else (
    echo [Error] Task not found or cancel failed
)
pause
goto end

:invalid_input
echo [Error] Invalid input
pause
goto end

:end
