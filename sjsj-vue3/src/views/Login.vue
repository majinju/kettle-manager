<template>
  <el-container>
    <el-header>
      数据世界
    </el-header>
    <el-main>
      <!--                @submit="submitEvent"-->
      <vxe-form :data="data.formData" :items="data.formItems" title-align="right"
                title-width="100" title-colon>
      </vxe-form>
    </el-main>
    <el-footer>
      版权所有@马进举
    </el-footer>
  </el-container>
</template>

<script>
import { defineComponent, reactive } from 'vue'
// import { VXETable, VxeFormEvents} from 'vxe-table'

export default defineComponent({
  setup () {
    const data = reactive({
      loading:false,
      formData: {
        yhdm: '',
        yhmm: ''
      },
      formItems: [
        { title: "数据世界",span: 24,className:"xtbt",titleWidth:"100%"},
        { field: 'yhdm', title: '用户名', span: 24, itemRender: { name: 'ElInput', props:
              { placeholder: '请输入用户名',clearable:true,"prefix-icon":"el-icon-user" } } },
        { field: 'role', title: '密码', span: 24, itemRender: { name: 'ElInput', props:
              { placeholder: '请输入密码',type:"password",clearable:true,"show-password":true,"prefix-icon":"fa fad fa-key" } } },
        { align: 'center', span: 24, itemRender: { name: '$buttons', children: [
              { props: { type: 'submit', content: '登陆', status: 'primary' } },
              { props: { type: 'reset', content: '重置' } },
              { props: { type: 'button', content: '忘记密码' } },
              { props: { type: 'button', content: '注册' } }
            ]
          }
        }
      ]
    });
    // const submitEvent: VxeFormEvents.Submit = () => {
    //   data.loading = true
    //   setTimeout(() => {
    //     data.loading = false
    //     VXETable.modal.message({ content: '保存成功'+data.formData, status: 'success' })
    //   }, 1000)
    // }
    return {
      data
    }
  }
})
</script>
<style scoped lang="scss">
.el-container{
  .el-main{
    margin-top: 150px;
    .vxe-form{
      width: 400px;
      border-radius: 5px;
      margin: auto;
      ::v-deep .xtbt{
        border-bottom: #c6d5d2 solid 1px;
        .vxe-form--item-title-content{
          text-align: center;
          font-size: x-large;
        }
        .vxe-form--item-title-postfix{
          display: none;
        }
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
