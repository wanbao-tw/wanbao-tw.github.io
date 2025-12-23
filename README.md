# 🎮 玩報 WANBAO v1.4

專注遊戲攻略與 VTuber 資訊的獨立遊戲媒體

網站：https://wanbao.tw

---

## ✨ v1.4 更新內容

### ⏰ 時間顯示功能
- 新增 `time` 欄位，可顯示發佈時間（如：14:30）
- 文章卡片和文章頁面都會顯示完整時間
- 兩種使用方式：
  ```yaml
  # 方式一：分開設定
  date: '2025-12-23'
  time: '14:30'
  
  # 方式二：合併在 date（也支援）
  date: '2025-12-23T14:30'
  ```

### 📝 文章管理後台
新增本地後台工具 `admin/index.html`：
- **視覺化表單**：填寫即可生成 Markdown
- **即時預覽**：邊填邊看生成結果
- **封面處理**：拖放上傳，自動命名
- **一鍵下載**：同時下載 .md 和封面圖片
- **快捷鍵支援**：Ctrl+S 生成、Ctrl+D 下載

使用方式：直接用瀏覽器開啟 `admin/index.html`

### 🚀 批量發佈建議
1. 使用後台工具批量生成 .md 檔案
2. 將所有檔案放入 `src/content/articles/`
3. 封面圖片放入 `public/images/articles/`
4. 執行一次 `publish.bat` 即可全部發佈

---

## ✨ v1.3 更新內容

### 🔧 修正 publish.bat
- 改用 `npx astro build` 解決 astro 命令找不到的問題
- 自動檢查 node_modules 是否存在，不存在會自動執行 `npm install`
- 新增錯誤提示和解決方案說明

### 🔧 修正 publish-schedule.bat
- 改用英文介面避免中文編碼問題
- 同樣使用 npx 確保 astro 可執行
- 簡化介面，提升穩定性

### 📰 多分類功能
- 新增 `extraTags` 欄位，讓同一篇文章可以出現在多個分類頁面
- 例如：VTuber 專訪可以同時出現在「VTuber」和「新聞」分類
- 使用方式：在文章 frontmatter 添加 `extraTags: ['vtuber', 'news']`

---

## ✨ v1.2 更新內容

### 🎮 鼠標樣式重新設計
- 全新精緻的遊戲風格游標，使用漸層效果和細緻描邊
- 一般狀態：藍色漸層箭頭搭配金色描邊
- 互動狀態：金色漸層指針搭配藍色描邊
- 優化滑鼠粒子效果，更圓潤自然

### 💬 Discord 留言區重新設計
- 移除直接嵌入的 WidgetBot 聊天室（原本每篇文章共用同一個頻道）
- 改為引導式設計，邀請讀者加入 Discord 社群
- 更融入網站整體風格的視覺設計
- 新增社群功能提示區塊

### 🦶 Footer 改進
- Logo 移除白色底色，改用 drop-shadow 增加可讀性
- 新增頂部金色裝飾線條
- 改進整體排版和視覺層次
- 優化連結 hover 動畫效果

### 🎨 整體視覺改進
- 滾動條重新設計，使用品牌漸層色
- 改進 focus 狀態樣式（無障礙改進）
- 優化圖片載入過渡效果
- 更精緻的陰影和圓角處理

---

## 📁 專案結構

```
wanbao/
├── src/
│   ├── components/          # 組件
│   │   ├── Header.astro     # 頁首（含 logo、導覽、搜尋）
│   │   ├── Footer.astro     # 頁尾
│   │   ├── ArticleCard.astro # 文章卡片
│   │   ├── DiscordComments.astro # Discord 留言區
│   │   └── ...
│   ├── content/
│   │   ├── articles/        # 📝 文章放這裡！
│   │   │   ├── _template.md # 文章模板
│   │   │   └── ...
│   │   └── config.ts        # 文章欄位定義
│   ├── layouts/
│   │   └── BaseLayout.astro # 基礎版型
│   ├── pages/               # 頁面
│   │   ├── index.astro      # 首頁
│   │   ├── about.astro      # 關於我們
│   │   ├── search.astro     # 搜尋頁面
│   │   └── articles/[slug].astro # 文章頁面
│   └── styles/
│       └── global.css       # 全域樣式
├── public/
│   └── images/              # 圖片資源
│       ├── logo-150.png     # Logo 小
│       ├── logo-300.png     # Logo 大
│       └── wanbao-cover.jpg # 預設封面
├── publish.bat              # 🚀 一鍵發佈腳本
├── schedule-publish.bat     # ⏰ 排程發佈腳本
└── package.json
```

---

## 📝 如何發佈新文章

### 方法一：使用 publish.bat（推薦）

1. **撰寫文章**
   - 複製 `src/content/articles/_template.md`
   - 重新命名（例如：`my-new-article.md`）
   - 編輯內容，記得將 `draft: true` 改為 `draft: false`

2. **發佈文章**
   - 雙擊執行 `publish.bat`
   - 輸入發佈說明
   - 等待自動推送到 GitHub

3. **等待部署**
   - Cloudflare Pages 會自動偵測變更
   - 通常 1-3 分鐘後即可在網站上看到新文章

### 方法二：排程發佈

1. 雙擊執行 `schedule-publish.bat`
2. 選擇「設定排程發佈」
3. 輸入希望發佈的時間
4. 電腦會在指定時間自動執行發佈

---

## 📋 文章撰寫原則

### 必填欄位

```yaml
title: "文章標題"              # 標題
description: "文章描述"        # SEO 描述
date: "2024-12-23"            # 發佈日期
tag: "news"                   # 分類標籤
tagName: "新聞"               # 分類名稱
```

### 可用的分類標籤

| tag | tagName | 說明 |
|-----|---------|------|
| news | 新聞 | 遊戲新聞 |
| guide | 攻略 | 遊戲攻略 |
| vtuber | VTuber | VTuber 專區 |
| review | 評測 | 遊戲評測 |
| interview | 專訪 | 人物專訪 |
| indie | 獨立遊戲 | 獨立遊戲報導 |
| esports | 電競 | 電競賽事 |
| mobile | 手遊 | 手機遊戲 |
| pc | PC | PC 遊戲 |
| console | 主機 | 主機遊戲 |
| event | 活動 | 活動報導 |
| opinion | 觀點 | 觀點評論 |

### SEO 建議

1. **標題**：包含主要關鍵字，50 字以內
2. **描述**：清楚描述內容，100-160 字
3. **關鍵字**：3-5 個相關關鍵字
4. **圖片**：提供封面圖片，建議 1200x630px

---

## 🔧 開發相關

### 本地開發

```bash
# 安裝依賴
npm install

# 啟動開發伺服器
npm run dev

# 建置專案
npm run build
```

### 技術棧

- **框架**：Astro
- **部署**：Cloudflare Pages
- **樣式**：原生 CSS + CSS Variables

---

## 🎨 設計規範

### 色彩

- 主色：`#F7B32B`（黃色）
- 副色：`#1E4B8E`（藍色）
- 背景：`#F8F9FA`
- 文字：`#2D3436`

### 分類標籤色彩

- 新聞：`#E74C3C`（紅）
- 攻略：`#27AE60`（綠）
- VTuber：`#9B59B6`（紫）
- 評測：`#3498DB`（藍）

---

## 📞 聯絡我們

- **Email**：contact@wanbao.tw
- **Twitter**：@wanbao_tw

---

## 📄 授權

© 2024 玩報 WANBAO. All Rights Reserved.

---

*「每一個聲音都值得被聽見。」*
