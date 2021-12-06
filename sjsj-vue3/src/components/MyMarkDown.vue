<template>
  <v-md-editor v-model="myData.value"
               left-toolbar="undo redo clear | codeType h bold italic strikethrough quote | ul ol table hr | link image code | save"
               :toolbar="myData.toolbar"
               @change="valChange"
               :disabled-menus="[]"
               @upload-image="uploadImage"/>
</template>

<script>

import {defineComponent, reactive, watch} from "vue";
import {isEmpty, jsonFormat} from "@/utils/common"

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
      value:"",
      codeType:props.codeType,
      toolbar:{
        codeType: {
          title: '代码风格',
          icon: 'el-icon-price-tag',
          menus: [
            {
              name: 'json',
              text: 'json格式',
              action() {
                myData.codeType = "json"
                setValue(props.modelValue)
              },
            },
            {
              name: 'sql',
              text: 'sql格式',
              action() {
                myData.codeType = "sql"
                setValue(props.modelValue)
              },
            },
            {
              name: 'java',
              text: 'java格式',
              action() {
                myData.codeType = "java"
                setValue(props.modelValue)
              },
            },
            {
              name: 'javascript',
              text: 'javascript格式',
              action() {
                myData.codeType = "javascript"
                setValue(props.modelValue)
              },
            },
            {
              name: 'code',
              text: '任何代码',
              action() {
                myData.codeType = "code"
                setValue(props.modelValue)
              },
            },
            {
              name: 'null',
              text: '无格式',
              action() {
                myData.codeType = ""
                setValue(props.modelValue)
              },
            },
          ],
        }
      }
    });
    const setValue = (val) => {
      if(!val){
        //设置默认值
        if(myData.codeType==='json'){
          //json编辑器
          val = "{}"
        }else{
          val = "";
        }
        context.emit('update:modelValue',val)
      }
      if(myData.codeType==='json'){
        val = jsonFormat(val);
      }
      if(myData.codeType === "code"){
        //设置了代码类型
        myData.value = "```\n"+val+"\n```"
      }else if(myData.codeType){
        //设置了代码类型
        myData.value = "```"+myData.codeType+"\n"+val+"\n```"
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
      if(!isEmpty(myData.codeType)){
        context.emit('update:modelValue',val.replace(/```.*\n/,"").replace("\n```",""))
      }
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
