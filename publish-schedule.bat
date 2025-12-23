@echo off
chcp 65001 >nul
title 玩報 WANBAO - 排程發佈工具

echo ╔══════════════════════════════════════════════════════════════╗
echo ║           玩報 WANBAO - 排程發佈工具 v1.0                    ║
echo ║                                                              ║
echo ║  此工具可以設定文章在指定時間自動發佈                        ║
echo ║  原理：使用 Windows 工作排程器 (Task Scheduler)              ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set REPO_PATH=%~dp0

echo [選項]
echo 1. 立即發佈所有變更
echo 2. 設定排程發佈（指定時間）
echo 3. 查看目前的排程任務
echo 4. 取消排程任務
echo 5. 離開
echo.
set /p CHOICE="請選擇 (1-5): "

if "%CHOICE%"=="1" goto publish_now
if "%CHOICE%"=="2" goto schedule_publish
if "%CHOICE%"=="3" goto view_schedule
if "%CHOICE%"=="4" goto cancel_schedule
if "%CHOICE%"=="5" exit /b 0

echo [錯誤] 無效的選項
pause
exit /b 1

:publish_now
echo.
echo [執行] 立即發佈...
call "%REPO_PATH%publish.bat"
goto end

:schedule_publish
echo.
echo [排程發佈設定]
echo 請輸入發佈時間（24小時制）
echo.
set /p PUB_DATE="發佈日期 (格式: 2025/01/15): "
set /p PUB_TIME="發佈時間 (格式: 09:00): "
set /p TASK_NAME="任務名稱 (例如: 玩報-元旦特輯): "

if "%PUB_DATE%"=="" goto invalid_input
if "%PUB_TIME%"=="" goto invalid_input
if "%TASK_NAME%"=="" set TASK_NAME=玩報自動發佈

echo.
echo [確認] 將於 %PUB_DATE% %PUB_TIME% 執行發佈
echo [任務名稱] %TASK_NAME%
set /p CONFIRM="確定要建立排程？(Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo [取消] 已取消
    pause
    goto end
)

:: 建立排程任務
schtasks /create /tn "%TASK_NAME%" /tr "\"%REPO_PATH%publish.bat\"" /sc once /sd %PUB_DATE% /st %PUB_TIME% /f

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ╔══════════════════════════════════════════════════════════════╗
    echo ║                 ✅ 排程建立成功！                            ║
    echo ║                                                              ║
    echo ║  文章將於 %PUB_DATE% %PUB_TIME% 自動發佈                     ║
    echo ║  注意：請確保電腦在該時間是開機狀態                          ║
    echo ╚══════════════════════════════════════════════════════════════╝
) else (
    echo [錯誤] 排程建立失敗
)
pause
goto end

:view_schedule
echo.
echo [目前的玩報排程任務]
echo ─────────────────────────────────────────
schtasks /query /tn "玩報*" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo 目前沒有排程任務
)
echo ─────────────────────────────────────────
pause
goto end

:cancel_schedule
echo.
set /p DEL_TASK="請輸入要取消的任務名稱: "
schtasks /delete /tn "%DEL_TASK%" /f
if %ERRORLEVEL% EQU 0 (
    echo [成功] 已取消排程任務: %DEL_TASK%
) else (
    echo [錯誤] 找不到該任務或取消失敗
)
pause
goto end

:invalid_input
echo [錯誤] 輸入無效
pause
goto end

:end
