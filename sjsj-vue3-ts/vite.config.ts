import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'
const path = require('path')
console.log(process.env.VUE_APP_API_BASE_ROOT)
function resolve(dir) {
  //__dirname 变量 是以文件所处的路径为值
  return path.join(__dirname, dir)
}
const name = process.env.VUE_APP_TITLE || '系统加载中...'
// https://vitejs.dev/config/

export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd(), '')
  return {
    plugins: [vue(), vueJsx()],
    define: {
      'process.env': env.APP_ENV
    },
    resolve: {
      alias: {
        '@': resolve('src'),
        'assets': resolve('src/assets'),
        'components': resolve('src/components'),
        'public': resolve('public')
      }
    },
    //部署的根路径
    // publicDir: './',
    server: {
      port: 9002,
      open: true,
      watch: {
        ignored: ['node_modules'],
      },
      proxy: {
        '/sjsj-ht': {
          ws: false,
          target: 'http://124.220.197.217:8168',
          changeOrigin: true,
          rewrite: (path) => path.replace(/^\/sjsj-ht/, '')
        }
      }
    }
  }
})
