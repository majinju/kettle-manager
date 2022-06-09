<template>
  <div class="tags" v-if="Object.keys(myData.tags).length>0">
    <el-tabs
      v-model="myData.currTag"
      type="card"
      closable
      @tab-click="tabClick"
      @tab-remove="removeTab"
    >
      <el-tab-pane
        v-for="(item,key,index) in myData.tags"
        :key="key"
        :label="item.query.pathName"
        :name="key"
      >
      </el-tab-pane>
    </el-tabs>
    <div class="tags-close-box">
      <el-dropdown @command="handleTags">
        <el-button size="mini" type="primary">
          关闭选择
          <i class="el-icon-arrow-down el-icon--right"></i>
        </el-button>
        <template #dropdown>
          <el-dropdown-menu size="small">
            <el-dropdown-item command="other">关闭其他</el-dropdown-item>
            <el-dropdown-item command="all">关闭所有</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted,reactive} from "vue";
import { onBeforeRouteUpdate, useRoute, useRouter } from "vue-router";
export default {
  setup() {
    const myData = reactive({
      tags:{},
      currTag:""
    })
    const route = useRoute();
    const router = useRouter();
    onMounted(()=>{
      //页面初始化设置
      setTags(router.currentRoute.value);
    })
    /**
     * 监听页面路由变化
     */
    onBeforeRouteUpdate((to) => {
      setTags(to);
    });
    /**
     * 设置标签
     * @param route 当前路由
     */
    const setTags = (route) => {
      const currTag = route.query["sys.authCode"];
      if(!currTag){
        return;
      }
      //判断当前路由是否已经存在
      let isExist = false;
      for(const i in myData.tags){
        if(i===currTag){
          isExist = true;
        }
      }
      if (!isExist) {
        myData.tags[currTag] = route;
      }
      myData.currTag = currTag;
    };
    /**
     * tab点击事件
     * @param index tab项
     * @param event 事件对象
     */
    const tabClick = (index, event) =>{
      router.push(myData.tags[index.props.name])
    }
    /**
     * 关闭标签
     * @param index 标签值
     */
    const removeTab = (index) => {
      for(const i in myData.tags){
        if(i===index){
          delete myData.tags[i];
        }
      }
      if(Object.keys(myData.tags).length>0){
        myData.currTag = Object.keys(myData.tags)[0];
        router.push(myData.tags[myData.currTag]);
      }else{
        router.push("/home");
      }
    }
    // 关闭全部标签
    const closeAll = () => {
      myData.tags={}
      router.push("/home");
    };
    // 关闭其他标签
    const closeOther = () => {
      for(const i in myData.tags){
        if(i!==myData.currTag){
          delete myData.tags[i];
        }
      }
    };
    /**
     * 末尾操作
     * @param command
     */
    const handleTags = (command) => {
      command === "other" ? closeOther() : closeAll();
    };
    return {
      myData,
      tabClick,
      removeTab,
      handleTags
    };
  },
};
</script>
<style>
.tags {
  height: 45px;
  background: #fff;
  padding-right: 130px;
  box-shadow: 0 5px 5px #ddd;
}

.tags-close-box {
  position: absolute;
  right: 0px;
  top: 0px;
  box-sizing: border-box;
  padding-top: 1px;
  text-align: center;
  width: 90px;
  height: 30px;
  background: #fff;
  /*box-shadow: -3px 0 15px 3px rgba(0, 0, 0, 0.1);*/
  z-index: 10;
}
</style>
