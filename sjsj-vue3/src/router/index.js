import { createRouter, createWebHashHistory } from 'vue-router'

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
        path: 'MySelect',
        name:'查询列表',
        component: () => import('../views/common/MySelect'),
        props: route => ({
          sjdx:{
            dxdm: route.query['sjdx.dxdm']
          },
          sys:{
            authCode: route.query['sys.authCode']
          }
        })
      },
      {
        path: 'MyUpdate',
        name:'编辑页面',
        component: () => import('../views/common/MyUpdate'),
        props: route => ({
          sjdx:{
            dxdm: route.query['sjdx.dxdm']
          },
          sys:{
            authCode: route.query['sys.authCode']
          }
        })
      },
      {
        path: 'KFZFW_PTGL_ZDGL',
        name:'字典管理',
        meta:{
          title:'字典管理'
        },
        component: () => import('../views/zdgl/Select'),
      },
      {
        path: 'test',
        name:'测试',
        component: () => import('../views/common/Test'),
      },
      {
        path: 'vxe',
        name:"分页",
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
  let token = sessionStorage.getItem('token')
  if (to.name === 'Login'||token) {
    next()
  } else {
    next({ path: '/login' })
  }

});
export default router
