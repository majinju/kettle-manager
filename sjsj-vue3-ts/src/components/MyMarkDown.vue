<template>
  <v-md-editor v-model="myData.value"
               left-toolbar="undo redo clear | codeType h bold italic strikethrough quote | ul ol table hr | link image uploadFile code "
               :toolbar="myData.toolbar"
               @change="valChange"
               :disabled-menus="[]"
               @upload-image="uploadImage"/>
</template>

<script lang="ts">

import {defineComponent, reactive, watch} from "vue";
import {isEmpty, jsonFormat} from "@/utils/common"
import axios from "@/axios";
import {ElMessage} from "element-plus";
import {VXETable} from "@majinju/vxe-table";

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
        uploadFile: {
          title: '上传文件',
          icon: 'el-icon-upload',
          async action(editor) {
            const { file,files } = await VXETable.readFile({
              multiple: true
            })
            const formBody = new FormData();
            formBody.append("sys.authCode", "QTQX");
            formBody.append("sys.cllx", "upload");
            for(let i=0;i<files.length;i++){
              formBody.append("files", files[i]);
            }
            axios.upload(formBody).then((res) => {
              if (res.status) {
                editor.insert(function (selected) {
                  let content = "";
                  for(let i=0;i<res.data.length;i++){
                    const f = res.data[i];
                    content += "1. ["+f.wjm+"]("+axios.getBaseURL()+'?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id='+f.id+")\n"
                  }
                  return {
                    text: `${content}`,
                    selected: "",
                  };
                });
                ElMessage.info("上传成功："+res.data.length);
              }
            });
          }
        },
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
    /**
     * 设置值
     * @param val 值
     */
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
      }else{
        context.emit('update:modelValue',val)
      }
    }
    /**
     * 上传图片
     * @param event 事件
     * @param insertImage 插入图片方法
     * @param files 文件列表
     */
    const uploadImage = (event, insertImage, files) => {
      const formBody = new FormData();
      formBody.append("sys.authCode", "QTQX");
      formBody.append("sys.cllx", "upload");
      for(let i=0;i<files.length;i++){
        formBody.append("files", files[i]);
      }
      axios.upload(formBody).then((res) => {
        if (res.status) {
          const f = res.data[0];
          insertImage({
            url: axios.getBaseURL()+'?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id='+f.id,
            desc: f.wjm,
            // width: 'auto',
            // height: 'auto',
          });
          ElMessage.info("上传图片成功");
        }
      });
    }
    return {
      myData,
      valChange,
      uploadImage
    }
  }
})
</script>

<style scoped>

</style>
