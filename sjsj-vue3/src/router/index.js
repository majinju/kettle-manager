import { createRouter, createWebHashHistory } from 'vue-router'

const routes = [
  {
    path: "/login",
    name: "Login",
    component: () => import ('../views/Login')
  },
  // {
  //   path: "/home",
  //   name: "Home",
  //   component: () => import('@/views/Home'),
  //   children: [
  //     {
  //       path: 'DictionaryManagement',
  //       name:'字典管理',
  //       component: () => import('@/views/zdgl/dictionaryManager'),
  //     },
  //     {
  //       path: '/dictionaryAdd' ,
  //       name: '详情页',
  //       component: () => import('@/views/zdgl/dictionaryAdd')
  //     },
  //     {
  //       path: '/home/dictionaryEdit',
  //       name: '编辑页',
  //       component: () =>import('@/views/zdgl/dictionaryEdit')
  //     }
  //   ]
  // },
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
  let token = sessionStorage.getItem('token')
  if (to.name == 'Login'||token) {
    next()
  } else {
    next({ path: '/login' })
  }

});
export default router
