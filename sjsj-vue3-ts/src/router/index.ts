import { createRouter, createWebHashHistory } from 'vue-router'
import {useStore} from "vuex";

const routes = [
  {
    path: "/login/:sys?",
    alias: "/",
    name: "Login",
    component: () => import ('../views/Login')
  },
  // {
  //   path: '/test1',
  //   name: "测试1",
  //   component:()=> import('../views/test/text.vue')
  // },
  // {
  //   path: '/sjdx1',
  //   name:'数据对象1',
  //   component: () => import('../views/sjdx1/Sjdx1.vue')
  // },
  {
    path: '/sjdx2',
    name:'数据对象2',
    component: () => import('../components/Sjdx')
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
      },
      // {
      //   path: 'test',
      //   name:'测试1',
      //   component: ()=> import('../views/test/text.vue'),
      //   children:[
      //     {
      //       path: 'sjdxs',
      //       name:'数据对象1',
      //       component: () => import('../components/Sjdx.vue')
      //     },
      //   ]
      // }
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
