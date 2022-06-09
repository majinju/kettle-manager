<template>
  <div>
    <el-row>
      <el-col span="3">
        <el-upload
          v-if="!myData.isdisabled"
          ref="uploadEle"
          :disabled="myData.isdisabled"
          v-model="myData.value"
          class="upload-demo"
          action="uploadUrl"
          :show-file-list="showFile"
          :limit="limitFlie"
          :file-list="myData.fileList"
          :on-exceed="handleExceed"
          :on-change="handleChange"
          :http-request="uploadSectionFile">
          <el-button size="mini" type="primary" class="upload-plsc">文件上传</el-button>
        </el-upload>
        <!--当传了默认值，并且默认值不为空的时候展示 -->
        <el-button type="text" v-else  @click="wjxzBtn">查看</el-button>
      </el-col>
      <el-col :span="3">
        <!--当没有传默认值，或默认值为空的时候展示v-if="!modelValue" -->
        <div class="qx-div" v-if="!myData.isdisabled">
          <i class="iconfont icon-x icon-class" title="清除文件" @click="cleanClick"></i>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script lang="ts">
import {defineComponent,reactive,ref,watch} from  'vue'
import {ElMessage} from 'element-plus'
import axios from "@/axios";
export default defineComponent({
  name: "MyFile",
  props: {
    //有的时候可能需要返回动态绑定到表单,如果没有，则可以不用(常用于编辑详情)
    modelValue:{
      type:String
    },
    /**
     * 这个不用了
     */
    showFile:{
      type:Boolean,
      default:true
    },
    //是否支持上传多个文件,不传默认为1个文件
    limitFlie:{
      type:Number,
      default: 1
    },
    //对象代码,文件提交的对象代码
    zdlb:{
      type:String,
    },
    disabled:{
      type: String
    },
    //处理类型,如果不传值，则默认为批量上传文件
    cllxValue:{
      type:String,
      default:"sjplsc"
    },
    readonly:{
      type: String
    }
  },
  //与父组件进项数据双向绑定
  emits:['update:modelValue'],
  setup(props,context){
    const myData = reactive({
      value:'',
      //保存上传文件的个数
      fileList:[],
      isdisabled:props.readonly||props.disabled
    })
    /**
     * 当上传文件改变是触发，
     */
    const handleChange = (file, fileList) =>{
      myData.fileList=fileList
    }
    /**
     * 文件超出限制的钩子函数
     */
    const handleExceed = (files, fileList)=>{
      ElMessage.warning(`当前限制选择 ${props.limitFlie} 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length} 个文件`);
    }
    /**
     * 自定义文件上传
     * @param params 文件参数
     */
    const uploadSectionFile =  (params) =>{
      const file = params.file,
        fileType = file.type,
        isFile = fileType.indexOf("sheet") !== -1;
      // if(!isFile){
      //   ElMessage.error("只能上传xlsx格式文件！")
      //   return ;
      // }
      const form = new FormData();
      form.append("files",file);
      form.append("sys.cllx","upload");
      form.append("sys.authCode",'QTQX');
      axios.post(form).then(res=>{
        if(res.status){
          ElMessage.success('上传成功！');
          myData.value=res.data[0].id
          context.emit("update:modelValue",res.data[0].id)
        }else {
          ElMessage.error(res.msg)
        }
      })
    }
    /**
     * 对文件进行清除
     */
    const uploadEle = ref(null)
    const cleanClick = ()=>{
      if(myData.fileList.length>0){
        uploadEle.value.clearFiles();
        ElMessage.success("清除文件"+myData.fileList.length+"个")
      }else {
        ElMessage.error("请先上传文件")
      }
    }
    /**
     * 文件下载查看
     */
    const wjxzBtn = () =>{
      if(props.modelValue===undefined || props.modelValue===''){
        ElMessage.error("没有数据，请先上传数据")
      }else {
        axios.download({
          sjdx:{
            dxdm:'SYS_QX_QTQX'
          },
          sys:{
            cllx:'download',
          },
          yobj:{
            id:props.modelValue
          }
        })
      }
    }
    watch(()=>props.disabled,(newValue)=>{
      myData.isdisabled = props.readonly||newValue
    })
    watch(()=>props.readonly,(newValue)=>{
      myData.isdisabled = props.disabled||newValue
    })
    return{
      myData,
      handleExceed,
      uploadSectionFile,
      wjxzBtn,
      handleChange,
      cleanClick,
      uploadEle
    }
  }
})
</script>

<style scoped lang="scss">
::v-deep(.el-upload) {
  height: 50px;
  width: 90px;
  margin-bottom: 7px;
  overflow: hidden;
}
.upload-plsc{
  margin-left: 8px;
  margin-top: 16px;
}
::v-deep(.el-upload--text ){
  border: 0;
}

.qx-div{
  margin-left: 30px;
  margin-top: 18px;
}
.ck-div{
  margin-left: 20px;
  margin-top: 11px;
}
.icon-class{
  cursor: pointer;
  width: 5px;
  height: 5px;
  color: #1b7ee5;
}
</style>


