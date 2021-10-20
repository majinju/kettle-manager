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
//专业表单、表格工具vxe-table
import 'xe-utils';
import 'vxe-table/lib/style.css';
import VXETable from 'vxe-table';
//vxe-table的饿了么扩展，支持饿了么的组件
import VXETablePluginElement from 'vxe-table-plugin-element'
import 'vxe-table-plugin-element/dist/style.css'
//国际化
import i18n from './i18n';
//图标:font-awesome
import "font-awesome/css/font-awesome.min.css";
//自定义公共样式
import './style/common.scss';
//水印
import watermark from './utils/watermark';

const app = createApp(App,{});

//设置服务端基础路径
axios.setBaseURL(process.env.VUE_APP_API_BASE_ROOT+WEB_CONFIG.baseRoot);
//设置水印
watermark.set(store.state.user.yhxm+","+store.state.user.yhdm);

installElementPlus(app);
VXETable.setup({
  // 对组件内置的提示语进行国际化翻译
  i18n: (key, args) => i18n.global.t(key, args),
  // 可选，对参数中的列头、校验提示..等进行自动翻译（只对支持国际化的有效）
  translate (key, args) {
    // 例如，只翻译 "app." 开头的键值
    if (key && key.indexOf('app.') > -1) {
      return i18n.global.t(key, args)
    }
    return key
  }
});
VXETable.use(VXETablePluginElement);
app.use(router).use(store).use(VXETable)
  .use(i18n).mount('#app');
