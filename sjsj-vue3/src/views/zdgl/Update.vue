<template>
  <div class="new-page-warp">
    <vxe-modal  v-model="params.dialogVisible" :title="params.title"
                width="1000px" height="600px" show-zoom resize
                 :before-hide-method="close">
      <template #default>
        <vxe-form :data="params.formData" :rules="params.formRules"
                  title-align="right" title-width="100"
                  :items="params.formItems" ref="form"  @submit="saveAdd">
          <template #operate>
            <vxe-button type="submit" status="primary" content="确定" v-show="params.isShow"></vxe-button>
            <vxe-button content="关闭" @click="close"></vxe-button>
          </template>
        </vxe-form>
      </template>
    </vxe-modal>
  </div>
</template>
<script>
import {defineComponent, reactive} from 'vue'
import axios from "@/axios";
import { ElMessage ,ElMessageBox} from "element-plus";
import {options} from "@/plugins/vxe-table";
export default defineComponent({
  name: "zdlbAdd",
  components:{},
  setup(props,context){
   const params =reactive({
     dialogVisible:false,
     czlx:'',
     title:'',
     isShow:true,
     formData: {
     },
     formRules: {
       dm: [
         { required: true, message: '请输入代码',trigger: 'blur'},
       ],
       mc: [
         { required: true, message: '请输入名称',trigger: 'blur' }
       ],
       zdlb: [
         { required: true, message: '请选择字典类别',trigger: 'blur' }
       ]
     },
     formItems:[
       { field: 'dm', title: '代码', span: 8, itemRender: { name: '$input', props:
             { placeholder: '请输入代码',clearable:true ,disabled:false} } },
       {field: 'px',title: '排序',span: 8,itemRender: {name:'$input',props:
             {placeholder: '请输入排序',clearable:true,disabled:false }}},
       {field: 'zdlb',title: '字典类别',span: 8,itemRender: { name: 'MyDownList',props:{zdlb:'SYS_COMMON_ZDLB',disabled :false}}},
       {field: 'mc',title: '名称',span: 8,itemRender: {name: '$input',props:
             {placeholder: '请输入名称',clearable:true ,disabled:false}}},
       {field: 'bzzd',title: '标准字典',span: 8,itemRender: {name: 'MyDownList',props:
             {zdlb:'SYS_COMMON_ZDLB',disabled:false}}},
       {field: 'sjly',title: '数据来源',span: 8,itemRender: {name: '$input',props:
             {placeholder: '请输入数据来源',clearable:true ,disabled:false}}},
       {field: 'upnode',title: '父节点',span: 8,itemRender: { name: 'MyDownList',props:
             {zdlb:'SYS_COMMON_ZDLB',disabled : false}}},
       { field: 'yxx', title: '有效性', span: 8, itemRender:
           { name: 'ElSelect' ,props:{size:'mini',placeholder:'请选择',disabled:false},options: [
               {value: '1', label: '是'}, {value: '0', label: '否'}]}},
       { field: 'cache', title: '是否缓存', span: 8, itemRender:
           { name: 'ElSelect' ,props:{size:'mini',placeholder:'请选择',disabled:false}, options: [
               {value: '1', label: '是'}, {value: '0', label: '否'}]}},
       { field: 'lbsql', title: '类别sql', span: 24, itemRender: { name: '$textarea',props:{disabled:false}}},
       { field: 'ms', title: '描述', span: 24, itemRender: { name: '$input' ,props:{disabled:false}}},
       { field: 'jp',visible:false, title: '简拼', span: 24, itemRender: { name: '$input' ,props:
             {disabled:false}}},
       { field: 'qp',visible:false, title: '全拼', span: 24, itemRender: { name: '$input' ,props:
             {disabled:false}}},
       { field: 'gxsj',visible:false, title: '更新时间',formatter:"formatDate", span: 8, itemRender: { name: 'ElDatePicker',props:
             {type:'datetime',clearable:options.input.clearable,size:options.input.size,disabled:false} }},
       { field: 'cjsj',visible:false, title: '创建时间',formatter:"formatDate", span: 8, itemRender: { name: 'ElDatePicker',props:
             {type:'datetime',clearable:options.input.clearable,size:options.input.size,disabled:false} }},
       { field: 'cjrxm',visible:false, title: '创建人姓名', span: 8, itemRender: { name: '$input',props:
             {size:'mini',disabled:false} }},
       { field: 'cjrdwmc',visible:false, title: '创建人单位名称', span: 8, itemRender: { name: '$input',props:
             {size:'mini',disabled:false} }},
       { align: 'center', span: 24,slots:{default:'operate'},itemRender: {props:
             {size:'mini',disabled:false} }}
     ]
    })
    /** 新增弹窗 */
    const addDialog = () => {
      params.dialogVisible=true
      params.czlx="xz"
      params.title="新增"
    }
    /** 编辑弹窗 */
    const editDialog = (id) =>{
      params.dialogVisible=true
      params.formData.id=id
      params.czlx="bj"
      params.title="编辑"
      params.formItems.forEach(item=>{
        item.visible=true
      })
      for (let i = 12; i < 17; i++) {
        params.formItems[i].itemRender.props.disabled=true
      }
      getDataById(id)
    }
    const getDataById = (id) =>{
      axios.post({
        sjdx:{
          dxdm:"SYS_SJGL_TYZD_DEMO"
        },
        sys:{
          cllx:"dxjcxx",
        },
        "yobj":{
          "id":id
        }
      }).then(req=>{
        params.formData = req.data.obj
      })
    }
    /** 详情弹窗 */
    const detailDialog = (id) =>{
      params.isShow=false
      params.formItems.forEach(item=>{
        item.visible=true
        item.itemRender.props.disabled =true
      })
      params.dialogVisible=true
      params.title="详情"
      getDataById(id)
    }
    const saveAdd = () =>{
      ElMessageBox.confirm("你确定要提交吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          if(params.czlx==="xz"){
            save("SYS_SJGL_TYZD_DEMO","insert")
          }else {
            save("SYS_SJGL_TYZD_DEMO","update")
          }
        })
        .catch(() => {});
    }
    const save=(dxdm,cllx) =>{
      axios.post({
        sjdx:{
          dxdm:dxdm
        },
        sys:{
          cllx:cllx,
        },
        yobj:params.formData
      }).then(req=>{
        if (req.status) {
          ElMessage.success(req.msg);
          context.emit('upnode',true)
        } else {
          ElMessage.success(req.msg ? req.msg : "保存失败");
          context.emit('upnode')
        }
      })
    }
    const close = () =>{
      params.dialogVisible=false
      context.emit('upnode')
    }
    return{
      params,
      addDialog,
      close,
      editDialog,
      detailDialog,
      getDataById,
      saveAdd,
    }
  }
})
</script>
