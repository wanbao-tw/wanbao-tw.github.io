import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://wanbao.tw',
  
  // 建置設定
  build: {
    // 壓縮 HTML
    inlineStylesheets: 'auto',
  },
  
  // 開發伺服器
  server: {
    port: 4321,
    host: true,
  },
  
  // Markdown 設定
  markdown: {
    shikiConfig: {
      theme: 'one-dark-pro',
      wrap: true,
    },
  },
});
