import { defineCollection, z } from 'astro:content';

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
    
    // 主分類標籤
    tag: z.enum([
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
    ]),
    tagName: z.string(),
    
    // SEO 增強欄位
    keywords: z.array(z.string()).optional(),       // SEO 關鍵字
    series: z.string().optional(),                  // 系列文章
    game: z.string().optional(),                    // 遊戲名稱（用於攻略）
    relatedArticles: z.array(z.string()).optional(), // 相關文章 slug
    featured: z.boolean().default(false),           // 精選文章
    
    // 社群互動
    allowComments: z.boolean().default(true),       // 允許留言
    
    // 排程發佈
    publishDate: z.string().optional(),             // 預定發佈時間（用於排程）
  }),
});

export const collections = { articles };
