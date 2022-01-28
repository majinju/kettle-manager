import { createStore } from 'vuex'
import watermark from '../utils/watermark';
import axios from "../axios";

export default createStore({
  state: {
    /**
     * 用户信息
     */
    user:{
    },
    /**
     * 系统参数，记录了用户的ip等基础信息
     */
    sys:{
    },
    /**
     * 系统信息
     */
    xtxx:{
      /**
       * 代码
       */
      dm:"KFZFW"
    },
  },
  mutations: {
    /**
     * 设置系统基础信息
     * @param state 系统状态对象
     * @param user 用户信息
     */
    setUser(state,user){
      state.user=user;
      watermark.set(user.yhxm+","+user.yhdm);
    },
    /**
     * 设置系统基础信息
     * @param state 系统状态对象
     * @param sys 系统参数
     */
    setSys(state,sys){
      state.sys=sys;
      axios.setToken(sys.token);
    },
    /**
     * 设置系统信息
     * @param state 系统状态对象
     * @param xtxx 系统信息
     */
    setXtxx(state,xtxx){
      state.xtxx=xtxx;
    }
  },
  actions: {
  },
  modules: {
  },
  getters:{
    /**
     * @param state 系统状态对象
     * @returns {{}} 当前登录用户
     */
    getUser: state => state.user,
    /**
     * @param state 系统状态对象
     * @returns {{}} 当前系统参数
     */
    getSys: state => state.sys,
    getXtcs: state => state.xtcs
  }
})
