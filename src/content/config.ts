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
    // 支持兩種格式：
    // - 純日期: "2025-12-23"
    // - 含時間: "2025-12-23T14:30" 或 "2025-12-23 14:30"
    date: z.string(),
    time: z.string().optional(),  // 可選的獨立時間欄位 "14:30"
    author: z.string().default('玩報編輯部'),
    image: z.string().optional(),
    draft: z.boolean().default(false),
    
    // 主分類標籤（決定文章主要類別）
    tag: z.enum(tagTypes),
    tagName: z.string(),
    
    // 額外分類標籤（可選，讓文章出現在多個分類頁面）
    extraTags: z.array(z.enum(tagTypes)).optional(),
    
    // SEO 增強欄位
    keywords: z.array(z.string()).optional(),
    series: z.string().optional(),
    game: z.string().optional(),
    vtuberName: z.string().optional(),
    relatedArticles: z.array(z.string()).optional(),
    featured: z.boolean().default(false),
    
    // 社群互動
    allowComments: z.boolean().default(true),
    showComments: z.boolean().default(true),
    
    // 排程發佈
    publishDate: z.string().optional(),
    updateDate: z.string().optional(),
    readingTime: z.number().optional(),
  }),
});

export const collections = { articles };
