"use strict";

import { ElMessage, ElLoading, ElMessageBox } from 'element-plus'
import axios from "axios";
import router from '../router'

let loading: any = null

// Full config:  https://github.com/axios/axios#request-config
let config = {
  baseURL: "",
  timeout: 60 * 1000 * 10, // Timeout
  withCredentials: true, // Check cross-site Access-Control
  responseType: 'json',
  header: {
    'Content-Type': 'application/json;charset=utf-8',
    post: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    get: {
      'Content-Type': 'multipart/form-data'
    }
  }
};
const server = axios.create(config as any);

// 添加请求拦截器
server.interceptors.request.use(
  function (config) {
    //开发环境设置固定值
    // config.headers.token='4978866291C611DA0D2D5999C413107F';
    return config;
  },
  function (error) {
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
  function (response) {
    // 对响应数据做点什么
    if (loading) {
      loading.close()
    }
    if (response.headers["filename"]) {
      //下载文件的场景
      response.data.filename = decodeURI(response.headers["filename"]);
    }
    return Promise.resolve(response.data)
  },
  function (error) {
    // 对响应错误做点什么
    if (loading) {
      loading.close()
    }
    let data = error.response.data;
    if (!data) {
      data = {
        code: error.response.status,
        msg: error.response.statusText || error.response.status
      }
    }
    errorMessageHand(data.code, data);
    return Promise.reject(data);
  }
);
/**
 * 提示标志，避免重复提示
 * @type {boolean}
 */
let ts = false;
function errorMessageHand(status: any, data: any) {
  status = parseInt(status)
  switch (status) {
    case 200:
      //正常
      break
    case 403:
      // token失效
      if (!ts) {
        ts = true;
        ElMessageBox.confirm((data.msg || '该操作没有权限') + '，请确认是否拥有该权限，重新登陆试试', {
          confirmButtonText: "重新登陆",
          cancelButtonText: "取消",
          type: "error"
        }).then(() => {
          ts = false
          router.push('/login').then();
        }).catch(() => {
          ts = false
          console.log("没有权限，用户没有重新登陆");
        })
      }
      break
    default:
      // 其他错误，直接抛出错误提示
      if (!ts) {
        ts = true;
        ElMessageBox.alert(data.msg || '网络请求异常，请联系管理员', '提示', {
          confirmButtonText: 'OK',
          type: "warning",
          callback: (action: any) => {
            ts = false
          },
        }).then(function () {
          ts = false
        });
      }
  }
}
const httpHandle = {
  setToken: function (token: any) {
    server.defaults.headers['token'] = token;
  },
  setBaseURL: function (baseURL: any) {
    server.defaults.baseURL = baseURL;
    console.log("后台服务路径：" + baseURL);
  },
  getBaseURL: function () {
    return server.defaults.baseURL;
  },
  /**
   * 常规数据处理
   * @param data
   * @param tloading 是否显示等待提示，默认提示
   * @returns {*}
   */
  post: (data: any, tloading = true) => {
    if (tloading) {
      loading = ElLoading.service({ text: '数据请求中！', background: 'rgba(0,0,0,0.6)' });
    }
    return server({
      method: 'post',
      data: data
    })
  },
  /**
   * 上传文件
   * @param data 表单数据
   * @param tloading 是否显示等待提示，默认提示
   * @returns {*}
   */
  upload: (data: any, tloading = true) => {
    if (tloading) {
      loading = ElLoading.service({ text: '数据请求中！', background: 'rgba(0,0,0,0.6)' });
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
  download: (data: any, tloading = true) => {
    if (tloading) {
      loading = ElLoading.service({ text: '数据请求中！', background: 'rgba(0,0,0,0.6)' });
    }
    server({
      method: 'post',
      data: data,
      responseType: 'blob'
    }).then((req: any) => {
      let blob = new Blob([req]);
      let href = URL.createObjectURL(blob);
      let event = new MouseEvent("click");
      let a = document.createElement("a");
      a.href = href;
      if (req.filename) {
        a.download = req.filename;
      } else {
        a.download = data.sys.dcwjm;
      }
      a.dispatchEvent(event);
      URL.revokeObjectURL(href);
    })
  }
}

export default httpHandle;
