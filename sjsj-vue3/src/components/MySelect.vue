<template>
  <vxe-select ref="xInput" :options="mydata.options" :disabled="readonly||disabled">
  </vxe-select>
</template>

<script>
import { defineComponent, onMounted, reactive, ref,watch } from 'vue'
import { zdList } from "@/utils/common"
export default defineComponent({
  name:'MySelect',
  inheritAttrs: true,
  props: {
    /**
     * 字典类别
     */
    zdlb:{
      type: String,
      required: true
    },
    disabled:{
      type: String
    },
    readonly:{
      type: String
    }
  },
  setup:async (props,context)=> {
    const mydata = reactive({
      options:{}
    });
    const xInput = ref({});
    //加载字典
    await zdList(props.zdlb).then(function (data){
      mydata.options=data;
    });

    watch(()=>props.zdlb,(newZdlb)=>{
      zdList(props.zdlb).then(function (data){
        mydata.options=data;
      })
    })
    /**
     * 返回值
     */
    return {
      mydata,
      xInput,
    }
  },
})

</script>
<style scoped>
</style>
