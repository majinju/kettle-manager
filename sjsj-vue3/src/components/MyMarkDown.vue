<template>
  <v-md-editor v-model="myData.value" @change="valChange"/>
</template>

<script>

import {defineComponent, reactive, watch} from "vue";

export default defineComponent({
  name: "MyMarkDown",
  props: {
    /**
     * 输入值
     */
    modelValue:{
      type: String
    },
    /**
     * 代码类型，传了就作为代码编辑器，不传就是普通markdown编辑器
     */
    codeType:{
      type: String
    }
  },
  emits:["update:modelValue"],
  setup (props,context) {
    const myData = reactive({
      value:""
    });
    const setValue = (val) => {
      if(!val){
        //设置默认值
        if(props.codeType==='json'){
          //json编辑器
          val = "{}"
        }else{
          val = "";
        }
        context.emit('update:modelValue',val)
      }
      if(props.codeType){
        //设置了代码类型
        myData.value = "```"+props.codeType+"\n"+val+"\n```"
      }else{
        //普通markdown编辑器
        myData.value = val
      }
    }
    setValue(props.modelValue)
    watch(()=>props.modelValue,function (newValue){
      setValue(newValue)
    });
    const valChange = function (val) {
      context.emit('update:modelValue',val.replace("```"+props.codeType+"\n","").replace("\n```",""))
    }
    return {
      myData,
      valChange
    }
  }
})
</script>

<style scoped>

</style>
