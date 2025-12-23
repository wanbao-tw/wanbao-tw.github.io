# 玩報 WANBAO v1.6 - Claude 交接文件

> 給下一個 Claude：這是長緣的遊戲媒體網站，請先讀完這份文件再開始工作。

---

## 🚨 最重要的事 - 未來方向

**不要再做本地工具、batch 檔、複雜的資料夾結構了！**

長緣要的是：

### 線上後台 + 自動排程

```
Discord OAuth2 登入
      ↓
後台寫文章 → 存到 D1 資料庫 → 設定發布時間
      ↓
Cloudflare Worker 每小時檢查
      ↓
時間到了 → 自動發布
```

### 技術棧（她已經會的）

| 功能 | 技術 |
|------|------|
| 登入系統 | Discord OAuth2（她做過裏之森會員） |
| 文章儲存 | Cloudflare D1 |
| 定時發布 | Cloudflare Workers Cron |
| 留言系統 | D1 + Discord OAuth2 |
| 多人編輯 | Discord 身分組權限 |

**全部在 Cloudflare 免費額度內。**

### 她想要的功能

1. **線上後台寫文章**（不要再手動改 .md）
2. **排程發布**（一次寫好，自動每小時/每天發）
3. **Discord 身分組權限**（編輯者可以進後台）
4. **留言區**（不是 Discord 嵌入！是真正的討論區）

### 留言區架構（重要！）

**不要用 Discord 聊天室嵌入，那個是錯的。**

她要的是像巴哈姆特那樣的討論區：

```
文章 A
├── 留言 1（用戶 A，頭像，時間）
├── 留言 2（用戶 B，頭像，時間）
└── 留言 3（用戶 A，頭像，時間）
```

技術架構：
```
Discord OAuth2 登入
      ↓
拿到用戶 ID、名字、頭像
      ↓
留言存進 D1 資料庫
      ↓
顯示在文章下方
```

D1 資料表大概長這樣：
```sql
comments (
  id
  article_slug
  user_discord_id
  user_name
  user_avatar
  content
  created_at
)
```

**下次對話直接往這個方向做，不要再繞路了。**

---

## 🎯 專案概述

- **網站名稱**：玩報 WANBAO
- **網址**：https://wanbao.tw
- **用途**：遊戲攻略 + VTuber 資訊的獨立媒體
- **技術**：Astro 靜態網站
- **部署**：GitHub → Cloudflare Pages（自動）
- **版本**：v1.6

---

## 📁 目前專案結構

```
wanbao/
├── src/
│   ├── content/
│   │   └── articles/          ⭐ 文章都在這裡
│   │       ├── _template/     ← 新增文章的模板
│   │       │   └── index.md
│   │       ├── tobarana-eromori-interview/
│   │       │   ├── index.md   ← 文章內容
│   │       │   └── cover.svg  ← 封面（同資料夾）
│   │       └── welcome-to-wanbao/
│   │           ├── index.md
│   │           └── cover.jpg
│   ├── components/
│   ├── layouts/
│   ├── pages/
│   └── styles/
│       └── global.css
├── public/
│   └── images/
├── publish.bat
└── package.json
```

---

## ⭐ 目前文章管理方式（過渡期）

在線上後台做好之前，暫時這樣用：

### 文章結構

每篇文章是一個資料夾：

```
src/content/articles/my-article/
├── index.md      ← 文章內容
└── cover.jpg     ← 封面
```

### 封面圖片路徑

```yaml
image: ./cover.jpg    ← 相對路徑
```

---

## 📝 文章 Frontmatter

```yaml
---
title: '文章標題'
description: 'SEO 描述'
date: '2025-12-23'
time: '10:43'
author: '玩報編輯部'
tag: 'news'
tagName: '新聞'
extraTags: ['vtuber']
image: ./cover.jpg
draft: false
keywords: ['關鍵字']
---
```

### 可用的 tag

news, guide, vtuber, review, interview, indie, esports, event

---

## 🎨 品牌色

- **黃**：`#F7B32B`
- **藍**：`#1E4B8E`

---

## 💡 長緣的偏好

- **簡單直接**，不要複雜工具
- **線上操作**，不要本地指令
- **自動化**，不要每天手動發
- 中文介面優先

---

*最後更新：2025-12-23 v1.6*
