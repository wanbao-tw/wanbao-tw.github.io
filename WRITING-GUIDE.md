# 玩報文章撰寫指南 📝

這份文件說明如何正確撰寫玩報的 Markdown 文章。請仔細閱讀並遵循這些規範，以確保文章能正確顯示。

---

## 📁 檔案位置

所有文章檔案放在：
```
src/content/articles/
```

---

## 📋 檔案命名規則

- **使用英文小寫和連字號**
- **不要用空格或中文**
- **副檔名為 `.md`**

✅ 正確範例：
```
tft-season-14-guide.md
vtuber-interview-tobarana.md
genshin-5-0-review.md
```

❌ 錯誤範例：
```
TFT攻略.md          ← 含有中文
my article.md       ← 含有空格
Guide.MD            ← 大寫
```

---

## 📝 文章格式模板

每篇文章必須以 YAML frontmatter 開頭（用三個連字號包圍）：

```markdown
---
title: "文章標題"
description: "文章簡短描述（50-150字，用於 SEO 和預覽）"
tag: "guide"
tagName: "攻略"
date: "2025-01-15"
author: "玩報編輯部"
image: "/images/articles/your-cover-image.jpg"
draft: false
keywords: ["關鍵字1", "關鍵字2", "關鍵字3"]
game: "遊戲名稱（如果是攻略文章）"
series: "系列名稱（如果是系列文章）"
featured: false
allowComments: true
---

# 正文從這裡開始

你的文章內容...
```

---

## 🏷️ 可用的標籤 (tag)

| tag 值 | tagName 顯示 | 說明 |
|--------|-------------|------|
| `news` | 新聞 | 遊戲產業新聞 |
| `guide` | 攻略 | 遊戲攻略教學 |
| `vtuber` | VTuber | VTuber 相關內容 |
| `review` | 評測 | 遊戲評測 |
| `interview` | 專訪 | 人物專訪 |
| `esports` | 電競 | 電競賽事新聞 |
| `indie` | 獨立遊戲 | 獨立遊戲相關 |
| `mobile` | 手遊 | 手機遊戲 |
| `pc` | PC遊戲 | PC 遊戲 |
| `console` | 主機遊戲 | 主機遊戲 |
| `event` | 活動 | 活動情報 |
| `opinion` | 觀點 | 觀點評論 |

---

## 📷 圖片使用

### 1. 封面圖片
把封面圖放在 `public/images/articles/` 資料夾，然後在 frontmatter 引用：

```yaml
image: "/images/articles/my-cover.jpg"
```

### 2. 文章內圖片
在文章中插入圖片：

```markdown
![圖片說明文字](/images/articles/screenshot.jpg)
```

### 圖片建議
- **封面圖尺寸**：1200 x 630 像素（16:9 比例）
- **格式**：JPG 或 WebP
- **檔案大小**：盡量壓縮到 200KB 以下

---

## ✍️ Markdown 語法速查

### 標題
```markdown
## 二級標題（文章內最大）
### 三級標題
#### 四級標題
```

### 文字樣式
```markdown
**粗體文字**
*斜體文字*
~~刪除線~~
`行內程式碼`
```

### 列表
```markdown
- 無序列表項目 1
- 無序列表項目 2

1. 有序列表項目 1
2. 有序列表項目 2
```

### 連結
```markdown
[連結文字](https://example.com)
```

### 引用
```markdown
> 這是引用文字
> 可以多行
```

### 程式碼區塊
````markdown
```javascript
const hello = "world";
console.log(hello);
```
````

### 分隔線
```markdown
---
```

### 表格
```markdown
| 欄位 1 | 欄位 2 | 欄位 3 |
|--------|--------|--------|
| 資料 1 | 資料 2 | 資料 3 |
```

---

## 📌 SEO 最佳實踐

### 1. 標題 (title)
- 保持在 30-60 字元
- 包含主要關鍵字
- 吸引人點擊

✅ 好的標題：
```
TFT S14 最強陣容攻略｜黑玫瑰上分教學
```

❌ 不好的標題：
```
攻略
TFT
```

### 2. 描述 (description)
- 50-150 字元
- 簡述文章重點
- 包含關鍵字

### 3. 關鍵字 (keywords)
- 3-8 個相關關鍵字
- 包含遊戲名稱、角色名、功能名稱等

```yaml
keywords: ["TFT", "聯盟戰棋", "S14", "黑玫瑰", "上分", "陣容推薦"]
```

---

## 📄 完整範例文章

```markdown
---
title: "TFT S14 黑玫瑰陣容攻略｜新手也能輕鬆上分"
description: "詳細解析 TFT 第 14 賽季黑玫瑰陣容的運營方式、關鍵裝備與轉型時機，帶你從鐵牌爬上鑽石。"
tag: "guide"
tagName: "攻略"
date: "2025-01-15"
author: "玩報編輯部"
image: "/images/articles/tft-s14-black-rose.jpg"
draft: false
keywords: ["TFT", "聯盟戰棋", "S14", "黑玫瑰", "攻略", "陣容"]
game: "聯盟戰棋"
series: "TFT S14 攻略系列"
featured: true
allowComments: true
---

今天要來分享 TFT 第 14 賽季最穩定的上分陣容之一——**黑玫瑰**。

這套陣容的優點是營運難度低、成型穩定，非常適合新手玩家。

## 陣容概述

黑玫瑰的核心角色是...

### 關鍵裝備

主 C 裝備優先順序：
1. **無盡之刃** — 暴擊傷害核心
2. **珠光護手** — 暴擊率補足
3. **巨人殺手** — 對抗坦克陣容

## 運營節奏

### 前期 (1-3 階段)

前期不搶裝、不虧血...

### 中期 (4 階段)

4-2 拉 7 找轉型...

## 總結

黑玫瑰是這個版本最穩定的上分選擇，希望這篇攻略對你有幫助！

如果有任何問題，歡迎在下方留言討論 💚
```

---

## ⚠️ 常見錯誤

### 1. frontmatter 格式錯誤
```yaml
# ❌ 錯誤：沒有引號
title: 這是標題

# ✅ 正確：用引號包起來
title: "這是標題"
```

### 2. 日期格式錯誤
```yaml
# ❌ 錯誤
date: "2025/01/15"
date: "Jan 15, 2025"

# ✅ 正確：YYYY-MM-DD
date: "2025-01-15"
```

### 3. 圖片路徑錯誤
```markdown
# ❌ 錯誤：相對路徑
![圖片](../images/photo.jpg)

# ✅ 正確：從根目錄開始
![圖片](/images/articles/photo.jpg)
```

---

## 🚀 發佈流程

1. 撰寫完成後，將 `.md` 檔案放入 `src/content/articles/`
2. 如果有圖片，放入 `public/images/articles/`
3. 執行 `publish.bat`（或 `publish-schedule.bat` 排程發佈）
4. 等待 1-2 分鐘，Cloudflare 會自動部署
5. 到 https://wanbao.tw 確認文章已上線

---

## 📞 需要幫助？

如果遇到任何問題，請聯繫：contact@wanbao.tw

---

*玩報編輯部 製作*
*最後更新：2025 年 12 月*
