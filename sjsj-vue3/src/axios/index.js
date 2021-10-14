"use strict";

import { ElMessage,ElLoading } from 'element-plus'
import axios from "axios";
import qs from "qs";
import store from '../store'
import router from '../router'

let loading = null

// Full config:  https://github.com/axios/axios#request-config
let config = {
  baseURL: process.env.baseURL || process.env.apiUrl || "",
  timeout: 60 * 1000, // Timeout
  withCredentials: true, // Check cross-site Access-Control
  responseType: 'json',
};
//设置请求参为json
axios.defaults.headers['Content-Type'] = 'application/json;charset=utf-8';

const server = axios.create(config);

// 添加请求拦截器
server.interceptors.request.use(
  function(config) {
    loading = ElLoading.service({text:'数据请求中！', background: 'rgba(0,0,0,0.6)'});
    //设置权限码
    config.headers.token = store.state.token;
    return config;
  },
  function(error) {
    // 对请求错误做些什么
    ElMessage({
      message: `错误信息：${error}!`,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error);
  }
);

// 添加响应拦截器
server.interceptors.response.use(
  function(response) {
    // 对响应数据做点什么
    if (loading) {
      loading.close()
    }
    if (response.status === 200) {
      errorMessageHand(response.data.code, response.data.msg)
      return Promise.resolve(response.data)
    }
    return Promise.reject(response)
  },
  function(error) {
    // 对响应错误做点什么
    if (loading) {
      loading.close()
    }
    if (error.response && error.response.status) {
      let msg = error.response.statusText || error.response.status
      errorMessageHand(error.response.status, msg)
    }
    return Promise.reject(error);
  }
);
function errorMessageHand(status, msg) {
  status = parseInt(status)
  switch (status) {
    case 404:
      ElMessage({
        type: 'error',
        message: '网络请求不存在',
        duration: 5000
      })
      break
    // 其他错误，直接抛出错误提示
    case 403:
      // token失效
      ElMessage({
        type: 'error',
        message: msg?msg: '登录已过期，请重新登录',
        duration: 5000
      })
      router.push('/login').then();
      break
  }
}
const httpHandle = {
  /**
   * 后台服务基础路径
   * @type {string}
   */
  serviceBasicUrl:"",
  /**
   * 常规数据处理
   * @param data
   * @returns {*}
   */
  post: (data)=>{
    return server({
      url: this.serviceBasicUrl,
      method: 'post',
      data: data
    })
  },
  /**
   * 上传文件
   * @param data
   * @returns {*}
   */
  upload:(data)=>{
    return server({
      url: this.serviceBasicUrl,
      method: 'post',
      headers:{
        "Content-Type":"multipart/form-data"
      },
      paramsSerializer: function(data) {
        return qs.stringify(data)
      },
    })
  },
  /**
   * 下载文件
   * @param data
   */
  download: (data)=>{
    server({
      url: this.serviceBasicUrl,
      method: 'post',
      data: data,
      responseType: 'blob'
    }).then((req) => {
      let blob = new Blob([req]);
      let href = URL.createObjectURL(blob);
      let event = new MouseEvent("click");
      let a = document.createElement("a");
      a.href = href;
      a.dispatchEvent(event);
      URL.revokeObjectURL(href);
    })
  },
}

export default httpHandle;
