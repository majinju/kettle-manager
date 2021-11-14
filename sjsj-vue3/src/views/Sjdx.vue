<template>
  <div>
    <my-form :key="key" v-for="(dxjcxx,key,index) in myData.dxjcxx" :dxjcxx="dxjcxx"
             v-show="key===myData.activeSjdx"></my-form>
  </div>
</template>

<script>
import {defineComponent, reactive, ref, watch} from "vue";
import { ElMessage} from "element-plus";
import {useRoute} from "vue-router";
import {setByPath} from "../utils/common";
import axios from "@/axios";
import MyForm from "../components/MyForm";

export default defineComponent({
  name: "Sjdx",
  components:{MyForm},
  props:{
  },
  /**
   * 监测路由变化
   * @param to 目标路由
   * @param from 来源路由
   * @returns {Promise<void>}
   */
  beforeRouteUpdate: (to, from)=>{
  },
  /**
   * 所有页面入口，该组件会缓存各数据对象基础信息，对各页面进行复用
   * @param props
   * @param context
   * @returns {Promise<{myData: UnwrapNestedRefs<{activeSjdx: string, dxjcxx: {}}>}>}
   */
  setup:async (props,context)=>{
    const route = useRoute();
    const myData =reactive({
      /**
       * 对象基础信息集合<key,dxjcxx>
       */
      dxjcxx:{},
      /**
       * 活动的数据对象key
       */
      activeSjdx: ""
    });
    /**
     * 根据请求参数进行对象基础信息的加载
     * @param query 查询参数
     * @returns {Promise<void>}
     */
    const initPage = async (query) => {
      let dxjcxx = {sys:{},sjdx:{},yobj:{}}
      for(let key in query){
        setByPath(dxjcxx,key,route.query[key]);
      }
      if(!dxjcxx.sys.cllx){
        dxjcxx.sys.cllx="select";
      }
      const cacheKey = dxjcxx.sjdx.dxdm+dxjcxx.sjdx.id+dxjcxx.sys.authCode;
      if(!cacheKey){
        ElMessage.error("传入数据对象信息");
      }else if(!myData.dxjcxx[cacheKey]){
        //加载对象基础信息
        await axios.post({
          sjdx:dxjcxx.sjdx,
          sys:{
            authCode: dxjcxx.sys.authCode,
            cllx:"dxjcxx"
          }
        }).then((rep)=>{
          rep.data.sys.cllx=dxjcxx.sys.cllx;
          myData.dxjcxx[cacheKey] = rep.data;
        });
      }
      //将当前传入的部分定制信息设置进去传入子组件
      myData.dxjcxx[cacheKey].sys.cllx=dxjcxx.sys.cllx;
      myData.dxjcxx[cacheKey].yobj=dxjcxx.yobj;
      //设置当前显示的组件
      myData.activeSjdx=cacheKey;
    }
    // 当参数更改时获取用户信息
    watch(
      () => route.query,
      async newQuery => {
        if(route.path.startsWith("/home/sjdx")&&Object.keys(newQuery).length>0){
          await initPage(newQuery);
        }
      }
    )
    //初次进入调用
    await initPage(route.query);
    return {
      myData
    }
  }
});
</script>

<style scoped>
</style>
