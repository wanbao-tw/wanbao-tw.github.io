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
  schema: ({ image }) => z.object({
    // 基本資訊
    title: z.string(),
    description: z.string().optional(),
    date: z.string(),
    time: z.string().optional(),
    author: z.string().default('玩報編輯部'),
    // 封面圖片：支援相對路徑（同資料夾）或絕對路徑
    image: image().optional(),
    draft: z.boolean().default(false),
    
    // 主分類標籤
    tag: z.enum(tagTypes),
    tagName: z.string(),
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
