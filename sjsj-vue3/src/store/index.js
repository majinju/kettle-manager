import { createStore } from 'vuex'
import watermark from '../utils/watermark';
import axios from "../axios";

export default createStore({
  state: {
    //用户信息
    user:{
      yhxm:"临时用户",
      yhdm:"lsyh",
    },
    //系统参数，记录了用户的ip等基础信息
    sys:{
      token:""
    },
    userInfo: {},
    tagsList: [],
    currTag: ""
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
      //在回话中设置用户权限码
      sessionStorage.setItem('token',sys.token);
      axios.setToken(sys.token);
    },
    delTagsItem(state, data) {
      state
        .tagsList
        .splice(data.i, 1);
    },
    setTagsItem(state, data) {
      state
        .tagsList
        .push(data)
    },
    setCurrTag(state, data) {
      state.currTag=data;
    },
    clearTags(state) {
      state.tagsList = []
    },
    closeTagsOther(state, data) {
      state.tagsList = data;
    },
    closeCurrentTag(state, data) {
      for (let i = 0, len = state.tagsList.length; i < len; i++) {
        const item = state.tagsList[i];
        if (item.path === data.$route.fullPath) {
          if (i < len - 1) {
            data
              .$router
              .push(state.tagsList[i + 1].path);
          } else if (i > 0) {
            data
              .$router
              .push(state.tagsList[i - 1].path);
          } else {
            data
              .$router
              .push("/home");
          }
          state
            .tagsList
            .splice(i, 1);
          break;
        }
      }
    },
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
  }
})
