//JavaScript 严格模式：指定代码在严格条件下执行，严格模式下你不能使用未声明的变量。
'use strict'
const path = require('path')
function resolve(dir) {
  //__dirname 变量 是以文件所处的路径为值
  return path.join(__dirname, dir)
}
// 初始网页标题
const name = process.env.VUE_APP_TITLE || '系统加载中...'
module.exports = {
  //运行时编译
  runtimeCompiler: true,
  //部署的根路径
  publicPath: './',
  // 在npm run build 或 yarn build 时 ，生成文件的目录名称（要和baseUrl的生产环境路径一致）（默认dist）
  outputDir: 'dist',
  // 用于放置生成的静态资源 (js、css、img、fonts) 的；（项目打包之后，静态资源会放在这个文件夹下）
  assetsDir: 'static',
  // 如果你不需要生产环境的 source map，可以将其设置为 false 以加速生产环境构建。
  productionSourceMap: false,
  // 是否开启eslint保存检测，有效值：ture | false | 'error'
  //lintOnSave: process.env.NODE_ENV !== 'development',
  lintOnSave: false,
  devServer: {
    port: 9001,
    open: true,
    watchOptions: {
      ignored: ['node_modules'],
      aggregateTimeout: 300,
      poll: 1500
    },
    overlay: {
      warnings: false,
      errors: true
    },
    proxy: {
      // detail: https://cli.vuejs.org/config/#devserver-proxy
      [process.env.VUE_APP_API_BASE_ROOT]: {
        ws: false,
        target: process.env.VUE_APP_API_BASE_HOST,
        changeOrigin: true,
        pathRewrite: {
          ['^' + process.env.VUE_APP_API_BASE_ROOT]: '/'
        }
      }
    },
    disableHostCheck: true
  },
  css: {
    sourceMap: process.env.NODE_ENV === 'development',
    requireModuleExtension: true,
    loaderOptions: {
      scss: {
        prependData: '@import "@/style/loader.scss";'
      },
      less: {
        javascriptEnabled: true
      }
    }
  },
  configureWebpack: {
    resolve: {
      alias: {
        '@': resolve('src'),
        'assets': resolve('src/assets'),
        'components': resolve('src/components'),
        'public': resolve('public')
      }
    }
  },
  chainWebpack(config) {
    config.plugin('html').tap(args => {
      //修改进行系统时，加载中的标题
      args[0].title = name
      return args
    })

    // set svg-sprite-loader
    config.module
      .rule('svg')
      .exclude.add(resolve('src/assets/svg'))
      .end()
    config.module
      .rule('icons')
      .test(/\.svg$/)
      .include.add(resolve('src/assets/svg'))
      .end()
      .use('svg-sprite-loader')
      .loader('svg-sprite-loader')
      .options({
        symbolId: 'icon-[name]'
      })
      .end()

    //开发环境配置
    config.when(
      process.env.NODE_ENV === 'development',
      config => config.devtool('source-map') // cheap-source-map
    )
    //非开发环境配置
    config.when(process.env.NODE_ENV !== 'development', config => {
      config.optimization.splitChunks({
        chunks: 'all',
        cacheGroups: {
          libs: {
            name: 'chunk-libs',
            priority: 10,
            test: /[\\/]node_modules[\\/]/,
            chunks: 'initial' // only package third parties that are initially dependent
          },
          elementUI: {
            name: 'chunk-elementUI', // split elementUI into a single package
            priority: 20, // the weight needs to be larger than libs and app or it will be packaged into libs or app
            test: /[\\/]node_modules[\\/]_?element-plus(.*)/ // in order to adapt to cnpm
          },
          commons: {
            name: 'chunk-commons',
            test: resolve('src/components'), // can customize your rules
            minChunks: 3, //  minimum common number
            priority: 5,
            reuseExistingChunk: true
          }
        }
      })
      config.optimization.runtimeChunk('single'),
        {
          from: path.resolve(__dirname, './public/robots.txt'), //防爬虫文件
          to: './' //到根目录下
        }
    })
  }
}
