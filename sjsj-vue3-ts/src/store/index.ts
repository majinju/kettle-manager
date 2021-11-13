import { createStore } from 'vuex'
import watermark from '../utils/watermark'

export default createStore({
  state: {
    // 用户信息
    user: {
      yhxm: '临时用户',
      yhdm: 'lsyh'
    },
    // 操作日志，记录了用户的ip等基础信息
    czrz: {
      token: ''
    }
  },
  mutations: {
    /**
     * 设置系统基础信息
     * @param state 系统状态对象
     * @param user 用户信息
     */
    setUser(state, user) {
      state.user = user
      watermark.set(user.yhxm + ',' + user.yhdm)
    },
    /**
     * 设置系统基础信息
     * @param state 系统状态对象
     * @param czrz 用户信息
     */
    setCzrz(state, czrz) {
      state.czrz = czrz
      // 在回话中设置用户权限码
      sessionStorage.setItem('token', czrz.token)
    }
  },
  actions: {
  },
  modules: {
  },
  getters: {
    /**
     * @param state 系统状态对象
     * @returns {{}} 当前登录用户
     */
    getUser: state => state.user,
    /**
     * @param state 系统状态对象
     * @returns {{}} 当前用户的一些信息
     */
    getCzrz: state => state.czrz
  }
})
