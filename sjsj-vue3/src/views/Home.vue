<template>
  <el-container>
    <el-aside :width="data.asideWidth">Aside</el-aside>
    <el-container>
      <el-header>Header</el-header>
      <el-main>Main</el-main>
      <el-footer :style="'width: calc(100% - '+data.asideWidth+');'">
        版权所有@马进举
      </el-footer>
    </el-container>
  </el-container>
</template>
<script>
import { defineComponent, reactive } from 'vue'
import {useStore} from "vuex";
import {useRouter} from "vue-router";
import axios from "../axios";
import {ElMessage} from "element-plus";

export default defineComponent({
  setup () {
    const data = reactive({
      title:"数据世界",
      asideWidth:"200px"
    });
    const store = useStore();
    const router = useRouter();
    const submitEvent = function (){
      axios.post({
        sjdx:{
          dxdm:"SYS_QX_YHXX_MRDL"
        },
        sys:{
          cllx:"yhdl"
        }
      }).then(response => {
        if(response.status){
          store.commit("setSys",response.data.sys)
          store.commit("setUser",response.data.user)
          ElMessage.info("登陆成功");
          router.push("/home");
        }else{
          ElMessage.error(response.msg)
        }
      })
    }
    return {
      data,
      submitEvent
    }
  }
})
</script>
<style scoped lang="scss">
</style>
