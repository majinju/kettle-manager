<template>
  <div>
    <my-form :key="key" v-for="(jcxx,key,index) in dxjcxx" :dxjcxx="jcxx"
             v-show="key===activeSjdx" v-cloak></my-form>
  </div>
</template>

<script>
import { ElMessage} from "element-plus";
import {setByPath} from "@/utils/common";
import axios from "@/axios";
import MyForm from "@/views/sjdx1/MyForm1";

export default {
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
  data:function (){
    return {
      /**
       * 对象基础信息集合<key,dxjcxx>
       */
      dxjcxx:{},
      /**
       * 活动的数据对象key
       */
      activeSjdx: ""
    }
  },
  methods:{
    /**
     * 根据请求参数进行对象基础信息的加载
     * @param query 查询参数
     * @returns {Promise<void>}
     */
    initPage: async function(query){
      let dxjcxx = {sys:{},sjdx:{},yobj:{}}
      for(let key in query){
        setByPath(dxjcxx,key,this.$route.query[key]);
      }
      if(!dxjcxx.sys.cllx){
        dxjcxx.sys.cllx="select";
      }
      const cacheKey = dxjcxx.sjdx.dxdm+dxjcxx.sjdx.id+dxjcxx.sys.authCode;
      if(!cacheKey){
        ElMessage.error("传入数据对象信息");
      }else if(!this.dxjcxx[cacheKey]){
        //加载对象基础信息
        await axios.post({
          sjdx:dxjcxx.sjdx,
          sys:{
            authCode: dxjcxx.sys.authCode,
            cllx:"dxjcxx"
          }
        }).then((rep)=>{
          rep.data.sys.cllx=dxjcxx.sys.cllx;
          this.dxjcxx[cacheKey] = rep.data;
        });
      }
      //将当前传入的部分定制信息设置进去传入子组件
      this.dxjcxx[cacheKey].sys.cllx=dxjcxx.sys.cllx;
      this.dxjcxx[cacheKey].yobj=dxjcxx.yobj;
      //设置当前显示的组件
      this.activeSjdx=cacheKey;
    }
  },
  /**
   * 所有页面入口，该组件会缓存各数据对象基础信息，对各页面进行复用
   */
  created:function (){
    // 当参数更改时获取用户信息
    this.$watch(
      () => this.$route.query,
      async newQuery => {
        if(this.$route.path.startsWith("/home/sjdx")&&Object.keys(newQuery).length>0){
          await this.initPage(newQuery);
        }
      }
    )
    //初次进入调用
    this.initPage(this.$route.query);
  }
}
</script>

<style scoped>
</style>
