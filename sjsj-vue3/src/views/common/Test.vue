<template>
</template>

<script>
//导入使用的API
import { reactive, toRefs, getCurrentInstance,onBeforeMount, onMounted,onBeforeUpdate,onUpdated,onBeforeUnmount, onUnmounted, watch,computed} from "vue"
import axios from "@/axios";
export default {
  components: {},
  props: {},
  setup(props, context) {
    console.log("*******setup******")
    //获取当前实例
    const {ctx, proxy} = getCurrentInstance()
    // 定义响应式data 数据
    const state = reactive({})
    console.log("*******end reactive******")
    // 定义方法
    const methods = {
      async dealData(firstResData) {
        if (firstResData.status == "finished") {
          state.collection_data = firstResData.data
          state.colection_id = firstResData.id
          await axios.post({
            "sjdx":{
              "dxdm":"SYS_SJGL_TYZD_DEMO"
            },
            "sys":{
              "cllx":"dxjcxx"
            }
          }).then((resData) => {
            console.log("state.layoutX" + state.layoutX)
            console.log("state.layoutY" + state.layoutY)
          })
        }
      },
      // ***********async/await 实现请求同步功能**************
      async refreshData() {
        await axios.post({
          "sjdx":{
            "dxdm":"SYS_SJGL_TYZD_DEMO"
          },
          "sys":{
            "cllx":"dxjcxx"
          }
        }).then(firstResData => {
          console.log("state.curStatus=" + firstResData.status)
          methods.dealData(firstResData)
        }).catch(() => {

        })
      },
    }
    console.log("*******end methods******")
    onBeforeMount(() => {
      // dom 挂载前
      console.log("*******onBeforeMount******")
    })
    onMounted(async () => {
      //dom 挂载后
      console.log("*******onMounted******")
      state.collection_id = proxy.$route.query.id
      await methods.refreshData()
    })
    onBeforeUpdate(() => {
      //对响应式data数据有更新， 更新前
      console.log("*******onBeforeUpdate******")
    })
    onUpdated(() => {
      //对响应式data数据有更新， 更新后
      console.log("*******onUpdated******")
    })
    onBeforeUnmount(() => {
      //销毁页面组件前， 即关闭
      console.log("*******onBeforeUnmount******")
    })
    onUnmounted(() => {
      //销毁后
      console.log("*******onUnmounted******")
    })

    return {
      ...toRefs(state),
      ...methods,

    }
  }
}

</script>

<style scoped>

</style>
