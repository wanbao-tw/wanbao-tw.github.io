---
title: "【範例】如何新增文章"
description: "這是一篇範例文章，教你如何在玩報新增文章"
tag: "guide"
tagName: "攻略"
date: "2024-12-18"
author: "玩報編輯部"
draft: true
---

這是一篇**範例文章**，展示 Markdown 的寫法。

當你看到這篇文章時，代表設定成功了！

## 如何新增文章

1. 在 `src/content/articles/` 資料夾新增 `.md` 檔案
2. 檔名會成為網址，例如 `my-article.md` → `/articles/my-article`
3. 在檔案開頭加上 frontmatter（就是 `---` 包起來的那段）
4. 下面寫文章內容，支援 Markdown 語法

## Frontmatter 欄位說明

```yaml
---
title: "文章標題"
description: "文章描述（SEO 用）"
tag: "guide"           # 可選：guide / vtuber / news / review
tagName: "攻略"        # 顯示的標籤文字
date: "2024-12-18"     # 發布日期
author: "玩報編輯部"    # 作者名稱
image: "/images/xxx.jpg"  # 封面圖（選填）
draft: false           # true = 草稿不發布
---
```

## Markdown 語法範例

### 文字格式

- **粗體** 用 `**文字**`
- *斜體* 用 `*文字*`
- [連結](https://wanbao.tw) 用 `[文字](網址)`

### 清單

- 項目一
- 項目二
- 項目三

### 引用

> 這是引用區塊，適合放重點或名言。

### 圖片

```markdown
![圖片說明](/images/example.jpg)
```

---

**記得把這篇文章的 `draft: true` 改成 `draft: false` 或刪除這個欄位，文章才會顯示！**
