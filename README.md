# 玩報 WANBAO

專注遊戲攻略與 VTuber 資訊的獨立遊戲媒體

🌐 **網站：** https://wanbao.tw

---

## 📁 專案結構

```
wanbao-astro/
├── src/
│   ├── components/        # 共用元件
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── HeroCarousel.astro  # 首頁輪播（可放廣告！）
│   │   └── ArticleCard.astro
│   ├── layouts/
│   │   └── BaseLayout.astro    # 主版型
│   ├── pages/
│   │   ├── index.astro         # 首頁
│   │   ├── guide.astro         # 攻略分類
│   │   ├── vtuber.astro        # VTuber 分類
│   │   ├── news.astro          # 新聞分類
│   │   ├── about.astro         # 關於我們
│   │   └── articles/           # 文章頁面
│   └── styles/
│       └── global.css          # 全域樣式
├── public/
│   └── images/                 # 圖片資料夾
├── astro.config.mjs
└── package.json
```

---

## 🚀 部署到 Cloudflare Pages

### 步驟 1：上傳到 GitHub

1. 建立新的 GitHub Repository：`wanbao`
2. 上傳所有檔案

### 步驟 2：連接 Cloudflare Pages

1. 登入 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 進入 **Workers & Pages** → **Create application** → **Pages**
3. 選擇 **Connect to Git**
4. 授權並選擇你的 `wanbao` repository
5. 設定 Build：
   - **Framework preset:** Astro
   - **Build command:** `npm run build`
   - **Build output directory:** `dist`
6. 點擊 **Save and Deploy**

### 步驟 3：綁定自訂網域

1. 部署完成後，進入專案設定
2. **Custom domains** → **Set up a custom domain**
3. 輸入 `wanbao.tw`
4. 到 GoDaddy 設定 DNS：
   - 新增 CNAME 記錄：`@` → `你的專案.pages.dev`
   - 或依照 Cloudflare 提供的說明設定

---

## ✍️ 新增文章

### 方法 1：建立新的 .astro 檔案

在 `src/pages/articles/` 資料夾新增檔案，例如 `my-new-article.astro`：

```astro
---
import BaseLayout from '../../layouts/BaseLayout.astro';
---

<BaseLayout title="文章標題" description="文章描述">
  <article class="article-page">
    <header class="article-header">
      <span class="article-card__tag tag-guide">攻略</span>
      <h1>文章標題</h1>
      <p class="article-meta">📅 2024-12-18 | ✍️ 玩報編輯部</p>
    </header>
    <div class="article-body">
      <p>文章內容...</p>
    </div>
  </article>
</BaseLayout>
```

### 方法 2：（進階）使用 Content Collections

之後可以改用 Markdown 寫文章，更方便！需要時再跟我說～

---

## 🎠 修改輪播 Banner

打開 `src/pages/index.astro`，找到 `slides` 陣列：

```javascript
const slides = [
  {
    title: '🎮 玩報 WANBAO',
    description: '專注遊戲攻略與 VTuber 資訊的獨立媒體',
    bgClass: 'slide-default'
  },
  // 新增廣告橫幅：
  {
    title: '🔥 新遊戲上市！',
    description: '點擊了解更多',
    link: 'https://example.com',
    linkText: '立即查看',
    bgImage: '/images/ad-banner.jpg'  // 放圖片
  },
];
```

---

## 🎨 修改樣式

所有顏色、間距都在 `src/styles/global.css` 最上方的 `:root` 區塊。

---

## 📋 待辦事項

- [ ] 放入 Logo 圖片（public/images/logo.jpg）
- [ ] 設定 favicon
- [ ] 撰寫第一批正式文章
- [ ] 設定 Google Analytics
- [ ] 申請 Google AdSense
- [ ] 綁定 wanbao.tw 網域

---

## 🛠️ 本地開發

```bash
# 安裝依賴
npm install

# 啟動開發伺服器
npm run dev

# 建置生產版本
npm run build

# 預覽生產版本
npm run preview
```

---

© 2024 玩報 WANBAO
