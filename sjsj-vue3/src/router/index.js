import { createRouter, createWebHashHistory } from 'vue-router'
import {useStore} from "vuex";

const routes = [
  {
    path: "/login/:sys?",
    alias: "/",
    name: "Login",
    component: () => import ('../views/Login')
  },
  {
    path: '/sjdx2',
    name:'数据对象2',
    component: () => import('../components/Sjdx2')
  },
  {
    path: '/test',
    name:'测试',
    component: () => import('../components/Test')
  },
  {
    path: "/home/:sys?",
    name: "平台首页",
    component: () => import('../views/Home'),
    children: [
      {
        path: 'sjdx',
        name:'数据对象',
        component: () => import('../components/Sjdx')
      }
    ]
  },

]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})
router.beforeEach((to, from, next) => {
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
