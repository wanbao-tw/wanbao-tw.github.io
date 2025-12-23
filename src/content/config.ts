import { defineCollection, z } from 'astro:content';

// 可用的標籤類型
const tagTypes = [
  'news',      // 新聞
  'guide',     // 攻略
  'vtuber',    // VTuber
  'review',    // 評測
  'interview', // 專訪
  'esports',   // 電競
  'indie',     // 獨立遊戲
  'mobile',    // 手遊
  'pc',        // PC遊戲
  'console',   // 主機遊戲
  'event',     // 活動
  'opinion',   // 觀點
] as const;

const articles = defineCollection({
  type: 'content',
  schema: z.object({
    // 基本資訊
    title: z.string(),
    description: z.string().optional(),
    date: z.string(),
    author: z.string().default('玩報編輯部'),
    image: z.string().optional(),
    draft: z.boolean().default(false),
    
    // 主分類標籤（決定文章主要類別）
    tag: z.enum(tagTypes),
    tagName: z.string(),
    
    // 額外分類標籤（可選，讓文章出現在多個分類頁面）
    // 例如：VTuber 專訪可以同時出現在 vtuber 和 news 分類
    extraTags: z.array(z.enum(tagTypes)).optional(),
    
    // SEO 增強欄位
    keywords: z.array(z.string()).optional(),       // SEO 關鍵字
    series: z.string().optional(),                  // 系列文章
    game: z.string().optional(),                    // 遊戲名稱（用於攻略）
    vtuberName: z.string().optional(),              // VTuber 名稱
    relatedArticles: z.array(z.string()).optional(), // 相關文章 slug
    featured: z.boolean().default(false),           // 精選文章
    
    // 社群互動
    allowComments: z.boolean().default(true),       // 允許留言
    showComments: z.boolean().default(true),        // 顯示留言區
    
    // 排程發佈
    publishDate: z.string().optional(),             // 預定發佈時間（用於排程）
    updateDate: z.string().optional(),              // 更新日期
    readingTime: z.number().optional(),             // 閱讀時間（分鐘）
  }),
});

export const collections = { articles };
