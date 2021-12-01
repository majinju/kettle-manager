"use strict";

import {ElMessage, ElLoading, ElMessageBox} from 'element-plus'
import axios from "axios";
import router from '../router'

let loading = null

// Full config:  https://github.com/axios/axios#request-config
let config = {
  baseURL: process.env.baseURL || process.env.apiUrl || "",
  timeout: 60 * 1000, // Timeout
  withCredentials: true, // Check cross-site Access-Control
  responseType: 'json',
  header:{
    'Content-Type':'application/json;charset=utf-8',
    post:{
      'Content-Type':'application/json;charset=utf-8'
    },
    get:{
      'Content-Type':'multipart/form-data'
    }
  }
};
const server = axios.create(config);

// 添加请求拦截器
server.interceptors.request.use(
  function(config) {
    //开发环境设置固定值
    // config.headers.token='4978866291C611DA0D2D5999C413107F';
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
    if(response.headers["content-type"].indexOf("application/octet-stream")>-1){
      //下载文件的场景
      response.data.filename=response.headers["filename"];
    }
    return Promise.resolve(response.data)
  },
  function(error) {
    // 对响应错误做点什么
    if (loading) {
      loading.close()
    }
    let data = error.response.data;
    if(!data){
      data = {
        code:error.response.status,
        msg:error.response.statusText || error.response.status
      }
    }
    errorMessageHand(data.code, data);
    return Promise.reject(data);
  }
);
function errorMessageHand(status, data) {
  status = parseInt(status)
  switch (status) {
    case 200:
      //正常
      break
    case 403:
      // token失效
      ElMessageBox.confirm((data.msg|| '该操作没有权限')+'，请重新登陆试试', {
        confirmButtonText: "重新登陆",
        cancelButtonText: "取消",
        type: "error"
      }).then(() => {
        router.push('/login').then();
      }).catch(()=>{
      })
      break
    default:
      // 其他错误，直接抛出错误提示
      ElMessageBox.alert(data.msg||'请求异常', '提示', {
        confirmButtonText: 'OK',
        type: "warning",
        callback: (action) => {
        },
      }).then();
  }
}
const httpHandle = {
  setToken:function (token){
    server.defaults.headers['token']=token;
  },
  setBaseURL:function (baseURL) {
    server.defaults.baseURL=baseURL;
    console.log("后台服务路径："+baseURL);
  },
  getBaseURL:function () {
    return server.defaults.baseURL;
  },
  /**
   * 常规数据处理
   * @param data
   * @param tloading 是否显示等待提示，默认提示
   * @returns {*}
   */
  post: (data,tloading=true)=>{
    if(tloading){
      loading = ElLoading.service({text:'数据请求中！', background: 'rgba(0,0,0,0.6)'});
    }
    return server({
      method: 'post',
      data:data
    })
  },
  /**
   * 上传文件
   * @param data 表单数据
   * @param tloading 是否显示等待提示，默认提示
   * @returns {*}
   */
  upload:(data,tloading=true)=>{
    if(tloading){
      loading = ElLoading.service({text:'数据请求中！', background: 'rgba(0,0,0,0.6)'});
    }
    return server({
      headers: {
        'Content-Type': 'multipart/form-data'
      },
      method: 'post',
      data: data
    })
  },
  /**
   * 下载文件
   * @param data 数据
   * @param tloading 是否显示等待提示，默认提示
   */
  download: (data,tloading=true)=>{
    if(tloading){
      loading = ElLoading.service({text:'数据请求中！', background: 'rgba(0,0,0,0.6)'});
    }
    server({
      method: 'post',
      data: data,
      responseType: 'blob'
    }).then((req) => {
      let blob = new Blob([req]);
      let href = URL.createObjectURL(blob);
      let event = new MouseEvent("click");
      let a = document.createElement("a");
      a.href = href;
      a.download = data.sys.dcwjm;
      a.dispatchEvent(event);
      URL.revokeObjectURL(href);
    })
  }
}

export default httpHandle;
