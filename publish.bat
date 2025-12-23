@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: ============================================
:: 玩報 WANBAO - GitHub 自動發佈腳本 v1.0
:: ============================================
:: 使用方式：
:: 1. 將新文章 .md 檔案放到 src/content/articles/ 資料夾
:: 2. 雙擊執行此腳本
:: 3. 腳本會自動 commit 並 push 到 GitHub
:: ============================================

title 玩報 WANBAO - 發佈工具

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║        🎮 玩報 WANBAO - GitHub 發佈工具 v1.0           ║
echo ╚════════════════════════════════════════════════════════╝
echo.

:: 檢查是否在正確的目錄
if not exist "package.json" (
    echo [錯誤] 請在玩報專案根目錄執行此腳本！
    pause
    exit /b 1
)

:: 檢查 git 是否可用
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [錯誤] 找不到 Git！請先安裝 Git。
    echo 下載連結：https://git-scm.com/download/win
    pause
    exit /b 1
)

:: 顯示目前狀態
echo [1/5] 檢查檔案變更...
echo.
git status --short
echo.

:: 檢查是否有變更
git diff --quiet --exit-code
if %errorlevel% equ 0 (
    git diff --quiet --cached --exit-code
    if %errorlevel% equ 0 (
        echo [提示] 沒有偵測到任何變更！
        echo 請確認你已經將 .md 文章檔案放到 src/content/articles/ 資料夾。
        pause
        exit /b 0
    )
)

:: 列出新增/修改的文章
echo [2/5] 偵測到以下文章變更：
echo.
for /f "tokens=*" %%i in ('git status --short src/content/articles/') do (
    echo   %%i
)
echo.

:: 詢問 commit message
set /p commit_msg="[3/5] 請輸入發佈說明（例如：新增樂奈專訪文章）： "
if "%commit_msg%"=="" set commit_msg=更新文章內容

:: 取得目前時間
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (set mytime=%%a:%%b)

:: 執行 git 操作
echo.
echo [4/5] 正在提交變更...
git add .
git commit -m "📰 %commit_msg% [%mydate% %mytime%]"

if %errorlevel% neq 0 (
    echo [錯誤] Git commit 失敗！
    pause
    exit /b 1
)

echo.
echo [5/5] 正在推送到 GitHub...
git push

if %errorlevel% neq 0 (
    echo [錯誤] Git push 失敗！請檢查網路連線或 GitHub 認證設定。
    pause
    exit /b 1
)

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║                   ✅ 發佈成功！                        ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo 你的文章已推送到 GitHub！
echo.
echo Cloudflare Pages 會自動偵測變更並部署。
echo 通常需要 1-3 分鐘，部署完成後即可在網站上看到新文章。
echo.
echo 網站網址：https://wanbao.tw
echo.

pause
