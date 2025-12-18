import { defineCollection, z } from 'astro:content';

const articles = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    tag: z.enum(['news', 'guide', 'vtuber', 'review']),
    tagName: z.string(),
    date: z.string(),
    author: z.string().default('玩報編輯部'),
    image: z.string().optional(),
    draft: z.boolean().default(false),
  }),
});

export const collections = { articles };
