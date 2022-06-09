import { createApp } from 'vue';
import App from './App.vue';
//状态
import store from './store';
//请求工具
import axios from "./axios";
//路由
import router from './router';
//饿了么组件
import installElementPlus from './plugins/element';
//vxe表格
import installVxe from './plugins/vxe-table';
//国际化
// import i18n from './i18n';//暂时屏蔽
//自定义公共样式
import './style/common.scss';
//水印
import watermark from './utils/watermark';
import '@/assets/icon/iconfont.css'
// import { WEB_CONFIG } from "public/config"
//设置服务端基础路径
axios.setBaseURL('/sjsj-ht/index');
// axios.setBaseURL(WEB_CONFIG.baseRoot);

const app = createApp(App, {});

installElementPlus(app);
installVxe(app);
//markdown
import installMarkdown from "@/plugins/markdown";
installMarkdown(app);
// app.use(router).use(store)
//   .use(i18n).mount('#app');
app.use(router).use(store)
  .mount('#app');
