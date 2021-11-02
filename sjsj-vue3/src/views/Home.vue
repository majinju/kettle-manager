<template>
  <el-container>
    <el-aside :width="data.asideWidth">
      <el-menu
        default-active="2"
        class="el-menu-vertical-demo"
        :collapse="data.isCollapse"
        @open="handleOpen"
      >
        <el-sub-menu index="1">
          <template #title>
            <i class="el-icon-location"></i>
            <span>Navigator One</span>
          </template>
          <el-menu-item-group>
            <template #title><span>Group One</span></template>
            <el-menu-item index="1-1">item one</el-menu-item>
            <el-menu-item index="1-2">item two</el-menu-item>
          </el-menu-item-group>
          <el-menu-item-group title="Group Two">
            <el-menu-item index="1-3">item three</el-menu-item>
          </el-menu-item-group>
          <el-sub-menu index="1-4">
            <template #title><span>item four</span></template>
            <el-menu-item index="1-4-1">item one</el-menu-item>
          </el-sub-menu>
        </el-sub-menu>
        <el-menu-item index="2">
          <i class="el-icon-menu"></i>
          <template #title>Navigator Two</template>
        </el-menu-item>
        <el-menu-item index="3" disabled>
          <i class="el-icon-document"></i>
          <template #title>Navigator Three</template>
        </el-menu-item>
        <el-menu-item index="4">
          <i class="el-icon-setting"></i>
          <template #title>Navigator Four</template>
        </el-menu-item>
      </el-menu>
    </el-aside>
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
  components:{
  },
  setup () {
    const data = reactive({
      title:"数据世界",
      asideWidth:"200px",
      isCollapse:false
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
    const handleOpen = function (key, keyPath){
      console.log(key, keyPath)
    }
    return {
      data,
      submitEvent,
      handleOpen
    }
  }
})
</script>
<style scoped lang="scss">
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
</style>
