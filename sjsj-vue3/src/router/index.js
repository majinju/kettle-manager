import { createRouter, createWebHashHistory } from 'vue-router'
import {useStore} from "vuex";

const routes = [
  {
    path: "/login",
    name: "Login",
    component: () => import ('../views/Login')
  },
  {
    path: "/home",
    name: "平台首页",
    meta:{
      title:'平台首页'
    },
    component: () => import('../views/Home'),
    children: [
      {
        path: 'sjdx',
        name:'数据对象',
        component: () => import('../views/Sjdx')
      },
      {
        path: 'KFZFW_QTGN_CSZY',
        name:'字典管理',
        meta:{
          title:'字典管理'
        },
        component: () => import('../views/zdgl/Select'),
      },
      {
        path: 'test',
        name:"测试",
        component:()=> import('../components/Test')
      }
    ]
  },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})
router.beforeEach((to, from, next) => {
  /** 页面发生变化修改页面title*/
  if(to.meta.title){
    document.title = to.meta.title
  }
  const store = useStore();
  if(store){
    let token = store.state.user.token;
    if (to.name === 'Login'||token) {
      next()
    } else {
      next({ path: '/login' })
    }
  }else{
    next()
  }

});
export default router
