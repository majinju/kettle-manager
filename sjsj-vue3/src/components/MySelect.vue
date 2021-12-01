<template>
  <vxe-select ref="xInput" :options="mydata.options" :disabled="mydata.isdisabled"
              :model-value="mydata.valve" @update:modelValue="updateVal">
  </vxe-select>
</template>

<script>
import { defineComponent, reactive, ref,watch } from 'vue'
import { zdList } from "@/utils/common"
export default defineComponent({
  name:'MySelect',
  inheritAttrs: true,
  props: {
    /**
     * 输入值
     */
    modelValue:{
      type: String
    },
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
  // emits:["update:modelValue"],
  setup:async (props,context)=> {
    const mydata = reactive({
      options:{},
      valve:props.modelValue,
      isdisabled:props.readonly||props.disabled
    });
    const xInput = ref({});
    //加载字典
    await zdList(props.zdlb).then(function (data){
      mydata.options=data;
    });
    watch(()=>props.zdlb,async (newZdlb)=>{
      await zdList(props.zdlb).then(function (data){
        mydata.options=data;
      })
    })
    // watch(()=>props.disabled,(newValue)=>{
    //   mydata.isdisabled = props.readonly||newValue
    // })
    // watch(()=>props.readonly,(newValue)=>{
    //   mydata.isdisabled = props.disabled||newValue
    // })
    watch(()=>props.modelValue,(newValue)=>{
      mydata.valve = newValue
    })
    const updateVal = (newValue) => {
      context.emit("update:modelValue",newValue)
      mydata.valve = newValue
    }
    /**
     * 返回值
     */
    return {
      mydata,
      xInput,
      updateVal
    }
  },
})

</script>
<style scoped>
</style>
