<template>
  <el-container>
    <el-header>

    </el-header>
    <el-main>
      <div class="content">
        <div class="xtbt">{{ data.title }}</div>
        <vxe-form :data="data.formData" :items="data.formItems" :rules="data.formRule" title-align="right"
                  title-width="100" title-colon :loading="data.loading" @submit="submitEvent">
        </vxe-form>
      </div>
    </el-main>
    <el-footer>
      版权所有@马进举
    </el-footer>
  </el-container>
</template>

<script>
import { defineComponent, reactive } from 'vue'
import axios from '../axios'
import {ElMessage} from "element-plus";
import { useStore } from "vuex";

export default defineComponent({
  setup () {
    const data = reactive({
      title:"数据世界",
      loading:false,
      formData: {
        yhdm: '',
        yhmm: ''
      },
      formItems: [
        { field: 'yhdm', title: '用户名', span: 24, itemRender: { name: 'ElInput', props:
              { placeholder: '请输入用户名',clearable:true,"prefix-icon":"el-icon-user" } } },
        { field: 'yhmm', title: '密码', span: 24, itemRender: { name: 'ElInput', props:
              { placeholder: '请输入密码',type:"password",clearable:true,"show-password":true,"prefix-icon":"fa fad fa-key" } } },
        { align: 'center', span: 24, itemRender: { name: '$buttons', children: [
              { props: { type: 'button', content: '忘记密码' } },
              { props: { type: 'submit', content: '登陆', status: 'primary' } }
            ]
          }
        }
      ],
      formRule:{
        yhdm:[
          { required: true, message: '请输入用户名' }
        ],
        yhmm:[
          { required: true, message: '请输入密码' }
        ]
      }
    });
    document.title=data.title;
    const store = useStore();
    const submitEvent = function (){
      axios.post({
        sjdx:{
          dxdm:"SYS_QX_YHXX_MRDL"
        },
        sys:{
          cllx:"yhdl"
        },
        yobj:data.formData
      }).then(response => {
        if(response.status){
          store.commit("setSys",response.data.sys)
          store.commit("setUser",response.data.user)
          ElMessage.info("登陆成功");
        }else{
          ElMessage.error(response.msg)
        }
      })
    }
    return {
      data,
      submitEvent
    }
  }
})
</script>
<style scoped lang="scss">
.el-container{
  .el-main{
    margin-top: 120px;
    .content{
      width: 400px;
      margin: auto;
      .xtbt{
        font-size: xx-large;
        text-align: center;
        background: #f6f6f69e;
      }
    }
  }
  .el-footer{
    text-align: center;
    background-color: lavender;
    position: absolute;
    bottom: 0;
    padding: 10px;
    width: 100%;
    height: 40px;
  }
}
</style>
