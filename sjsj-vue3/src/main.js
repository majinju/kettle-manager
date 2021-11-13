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
import 'xe-utils';
//引入vuetable内容格式化方法，全局可用，无需单独引用
import '@majinju/vxe-table/lib/style.css';
import 'vxe-table-plugin-element/dist/style.css'

//vxe表格
import installVxe from './plugins/vxe-table';
//国际化
import i18n from './i18n';
//图标:font-awesome
import "font-awesome/css/font-awesome.min.css";
import '@/assets/icon/iconfont.css';
//自定义公共样式
import './style/common.scss';
//水印
import watermark from './utils/watermark';
const app = createApp(App,{});
installElementPlus(app);
installVxe(app);
app.use(router).use(store)
  .use(i18n).mount('#app');
//设置服务端基础路径
axios.setBaseURL(process.env.VUE_APP_API_BASE_ROOT+WEB_CONFIG.baseRoot);
//设置水印
watermark.set(store.state.user.yhxm+","+store.state.user.yhdm);
