<template>
  <div class="tags"  v-if="showTags">
    <el-tabs
      v-model="currTag"
      type="card"
      closable
      @tab-click="tabClick"
      @tab-remove="removeTab"
    >
      <el-tab-pane
        v-for="(item,index) in tagsList"
        :key="index"
        :label="item.pathName"
        :name="item.path"
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

<script>
import { computed ,reactive,watch,onMounted} from "vue";
import { useStore } from "vuex";
import { onBeforeRouteUpdate, useRoute, useRouter } from "vue-router";
export default {
  setup() {
    const route = useRoute();
    const router = useRouter();
    const parms = reactive({
      editableTabsValue:''
    })
    onMounted(()=>{
      getPath();
    })
    /**
     * 页面刷新执行，只保留当前tab
     */
    const getPath = () =>{
      const path = router.currentRoute.value.path
      router.getRoutes().map((item, index) => {
        if (path === item.path) {
            store.commit("setTagsItem", {
              name: route.name,
              title: route.meta.title,
              path: route.fullPath,
              pathName:route.query.pathName === undefined ? route.meta.title : route.query.pathName
            });
            store.commit("setCurrTag", route.fullPath);
        }else {
        }
      })
    }
    const tabClick = (index, event) =>{
      router.push(index.props.name)
    }
    const removeTab = (index,val) => {
      for (let i = 0; i <= tagsList.value.length+1; i++) {
        if(tagsList.value[i].path===index){
          const delItem = tagsList.value[i];
          store.commit("delTagsItem", { i });
          const item = tagsList.value[i]
            ? tagsList.value[i]
            : tagsList.value[i - 1];
          if(item){
            delItem.path === route.fullPath && router.push(item.path);
          }else {
            router.push("/home");
          }
        }else {
        }
      }
    }
    const store = useStore();
    const tagsList = computed(() => store.state.tagsList);
    const currTag = computed(() => store.state.currTag);
    const showTags = computed(() => tagsList.value.length > 0);
    // 设置标签
    const setTags = (route) => {
      const isExist = tagsList.value.some((item) => {
        return item.path === route.fullPath;
      });
      if (!isExist) {
        if (tagsList.value.length >= 15) {
          store.commit("delTagsItem", { index: 0 });
        }
        store.commit("setTagsItem", {
          name: route.name,
          title: route.meta.title,
          path: route.fullPath,
          pathName:route.query.pathName === undefined ? route.meta.title : route.query.pathName
        });
      }
      store.commit("setCurrTag", route.fullPath);
    };
    onBeforeRouteUpdate((to) => {
      setTags(to);
    });
    // 关闭全部标签
    // 关闭全部标签
    const closeAll = () => {
      store.commit("clearTags");
      router.push("/home");
    };
    // 关闭其他标签
    const closeOther = () => {
      const curItem = tagsList.value.filter((item) => {
        return item.path === route.fullPath;
      });
      store.commit("closeTagsOther", curItem);
    };
    const handleTags = (command) => {
      command === "other" ? closeOther() : closeAll();
    };

    return {
      tagsList,
      showTags,
      currTag,
      parms,
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
