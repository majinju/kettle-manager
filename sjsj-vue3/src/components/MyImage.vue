<template>
  <div>
    <el-upload
      v-if="modelValue===undefined"
      v-model="myData.value"
      class="avatar-uploader"
      :disabled="myData.isdisabled"
      action="fakeaction"
      ref="upload"
      :show-file-list="false"
      :http-request="uploadSectionFile">
      <img v-if="myData.imageUrl" :src="myData.imageUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
    <el-upload
      v-else
      v-model="myData.value"
      class="avatar-uploader"
      :disabled="myData.isdisabled"
      action="fakeaction"
      ref="upload"
      :show-file-list="false"
      :http-request="uploadSectionFile">
      <img v-if="myData.imageUrlDefault" :src="myData.imageUrlDefault" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
  </div>
</template>

<script>
import { defineComponent, reactive,watch} from 'vue'
import axios from "@/axios";
import { ElMessage } from "element-plus";
export default defineComponent({
  name: "MyImage",
  inheritAttrs: false,
  props:{
    /**
     * 输入值
     */
    modelValue:{
      type: String
    },
    //对象代码
    zdlb:{
      type:String,
    },
    disabled:{
      type:String,
    },
    readonly:{
      type: String
    }
  },
  //与父组件进行双向绑定，绑定值为图片的id
  emits:["update:modelValue"],
  setup(props,context){
    const myData = reactive({
      value:'',
      imageUrl:'',
      /**
       * 与父组件的图片id进行动态绑定，如果有则展示图片，一般用于编辑
       */
      imageUrlDefault:process.env.VUE_APP_API_BASE_ROOT+WEB_CONFIG.baseRoot +
        "?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id="+props.modelValue,
      isdisabled:props.readonly||props.disabled
    })
    /**
     * 自定义上传方式
     * @param params
     */
    const uploadSectionFile = (params)=>{
      const file = params.file,
        fileType = file.type,
        isImage = fileType.indexOf("image") !==-1,
        isLt2M = file.size / 1024 / 1024 < 2;
      //对上传文件过滤，只允许上传图片
      if(!isImage){
        ElMessage.error("只能上传图片格式png、jpg、gif!")
        return ;
      }
      if(!isLt2M){
        ElMessage.error("只能上传图片大小小于2M")
        return ;
      }
      // 根据后台需求数据格式.可后续根据需要进行修改
      const form = new FormData();
      form.append("files", file);
      form.append("sys.cllx", "upload");
      form.append("yobj.sjzt", "default");
      form.append("sys.authCode", "QTQX");
      axios.post(form).then(res=>{
        if(res.status){
          myData.value=res.data[0].id
          myData.imageUrl= process.env.VUE_APP_API_BASE_ROOT+WEB_CONFIG.baseRoot + "?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id=" + res.data[0].id
          myData.imageUrlDefault= process.env.VUE_APP_API_BASE_ROOT+WEB_CONFIG.baseRoot + "?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id=" + res.data[0].id
          context.emit("update:modelValue", res.data[0].id)
        }else {
          ElMessage.error("数据上传失败")
        }
      })
    }
    watch(()=>props.disabled,(newValue)=>{
      myData.isdisabled = props.readonly||newValue
    })
    watch(()=>props.readonly,(newValue)=>{
      myData.isdisabled = props.disabled||newValue
    })
    return{
      myData,
      uploadSectionFile
    }
  }
})
</script>

<style scoped lang="scss">
::v-deep(.avatar-uploader .el-upload) {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  width: 100px;
  height: 100px;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 15px;
  color: #8c939d;
  width: 20px;
  height: 20px;
  line-height: 100px;
  text-align: center;
}
::v-deep(.avatar)  {
  width: 100px;
  height: 100px;
  display: block;
}
</style>
