<template>
  <div class="new-page-warp">
        <vxe-form :data="myData.formData" :rules="myData.formRule"
                  :items="myData.formItems" ref="xForm" @submit="saveAdd">
        </vxe-form>
  </div>
</template>
<script>
import {defineComponent, onMounted, reactive, ref} from 'vue'
import { ElMessage ,ElMessageBox} from "element-plus";
import axios from "@/axios";
import {options} from "@/plugins/vxe-table";
import {zdList} from "../../utils/common";

export default defineComponent({
  name: "MyUpdate",
  components:{},
  props:{
    /**
     * 数据对象
     */
    sjdx:{
      type:Object,
      default: {}
    },
    /**
     * 系统参数
     */
    sys:{
      type:Object,
      default: {}
    },
    /**
     * 表单参数
     */
    yobj:{
      type:Object,
      default: {}
    }
  },
  /**
   * 监测路由变化
   * @param to 目标路由
   * @param from 来源路由
   * @returns {Promise<void>}
   */
  beforeRouteUpdate: async (to, from)=>{

  },
  setup:async (props,context)=>{
    const myData =reactive({
      /**
       * 对象基础信息
       */
      dxjcxx:{
        sjdx:{
          dxmc:''
        }
      },
      /**
       * 全局统一配置
       */
      options: options,
      /**
       * 当前时间作为id
       */
      timestamp:new Date().getTime(),
      /**
       * 表单数据，查询默认值可以设置其中
       */
      formData:{
      },
      /**
       * 表单字段信息
       */
      formItems:[],
      /**
       * 表单字段验证规则
       */
      formRule:{
      },
      /**
       * 处理类型
       */
      cllx:'',
      /**
       * 显示确定按钮
       */
      xsqdan:true,
    })
    /**
     * 表单引用对象
     * @type {Ref<UnwrapRef<{}>>}
     */
    const xForm = ref({});
    /**
     * 页面挂载后执行
     */
    onMounted(()=>{
    })
    const initPage = () => {
      axios.post({
        sjdx:props.sjdx,
        sys:{
          authCode: props.sys.authCode,
          cllx:"dxjcxx"
        }
      }).then(async (rep)=>{
        myData.dxjcxx=rep.data;
        const fields = rep.data.fields;
        let fi;
        for(const key in fields){
          const f = fields[key];
          if(f.xzzs==='1'){
            //新增字段
            fi = {field: f.zddm, title: f.zdmc, span: 8}
            switch (f.kjlx){
              case '$switch':
                fi.itemRender={ name: '$switch' ,props:{placeholder:f.zdts}};
                break
              case '$select':
                if(f.zdfy==='1'){
                  //大字典，采用下拉分页搜索框
                  fi.itemRender={ name: 'MyDownList' ,props:{placeholder:f.zdts||'请选择',zdlb:f.zdzdlb}};
                }else{
                  //普通下拉框
                  fi.itemRender={ name: '$select' ,props:{placeholder:f.zdts}};
                  await zdList(f.zdzdlb).then((data)=>{
                    fi.itemRender.options=data;
                  })
                }
                break
              case 'ElDatePicker':
                //时间选择器
                fi.itemRender={ name: 'ElDatePicker',props:{type:'datetimerange',clearable:options.input.clearable,
                    size:options.input.size} };
                break
              default:
                //默认普通输入框
                fi.itemRender={ name: '$input' ,props:{}};
            }
            myData.formItems.push(fi);
          }
        }
        myData.formItems.push({ align: 'center', span: 24, itemRender: { name: '$buttons', children: [
              { props: { type: 'submit', content: '确定', status: 'primary' } }
            ]}});
      });
    }
    //加载对象基础信息
    await axios.post({
      sjdx:props.sjdx,
      sys:{
        authCode: props.sys.authCode,
        cllx:"dxjcxx"
      }
    }).then(async (rep)=>{
      myData.dxjcxx=rep.data;
      const fields = rep.data.fields;
      let fi;
      for(const key in fields){
        const f = fields[key];
        if(f.xzzs==='1'){
          //新增字段
          fi = {field: f.zddm, title: f.zdmc, span: 8}
          switch (f.kjlx){
            case '$switch':
              fi.itemRender={ name: '$switch' ,props:{placeholder:f.zdts,openLabel: '是', closeLabel: '否'}};
              break
            case '$select':
              if(f.zdfy==='1'){
                //大字典，采用下拉分页搜索框
                fi.itemRender={ name: 'MyDownList' ,props:{placeholder:f.zdts||'请选择',zdlb:f.zdzdlb,gridOptions: {stripe:true}}};
              }else{
                //普通下拉框
                fi.itemRender={ name: '$select' ,props:{placeholder:f.zdts}};
                await zdList(f.zdzdlb).then((data)=>{
                  fi.itemRender.options=data;
                })
              }
              break
            case 'ElDatePicker':
              //时间选择器
              fi.itemRender={ name: 'ElDatePicker',props:{type:'datetimerange',clearable:options.input.clearable,
                  size:options.input.size} };
              break
            default:
              //默认普通输入框
              fi.itemRender={ name: '$input' ,props:{}};
          }
          myData.formItems.push(fi);
        }
      }
      myData.formItems.push({ align: 'center', span: 24, itemRender: { name: '$buttons', children: [
            { props: { type: 'submit', content: '确定', status: 'primary' } }
          ]}});
    });
    /** 新增弹窗 */
    const addDialog = () => {
      myData.cllx="xz"
    }
    /** 编辑弹窗 */
    const editDialog = (id) =>{
      myData.dialogVisible=true
      myData.formData.id=id
      myData.cllx="bj"
      myData.title="编辑"
      myData.formItems.forEach(item=>{
        item.visible=true
      })
      for (let i = 12; i < 17; i++) {
        myData.formItems[i].itemRender.props.disabled=true
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
        myData.formData = req.data.obj
      })
    }
    /** 详情弹窗 */
    const detailDialog = (id) =>{
      myData.xsqdan=false
      myData.formItems.forEach(item=>{
        item.visible=true
        item.itemRender.props.disabled =true
      })
      myData.dialogVisible=true
      myData.title="详情"
      getDataById(id)
    }
    const saveAdd = () =>{
      ElMessageBox.confirm("你确定要提交吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          if(myData.czlx==="xz"){
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
        yobj:myData.formData
      }).then(req=>{
        if (req.status) {
          ElMessage.success(req.msg);
          context.emit('updateCallback',true)
        } else {
          ElMessage.success(req.msg ? req.msg : "保存失败");
          context.emit('updateCallback')
        }
      })
    }
    const close = () =>{
      myData.dialogVisible=false
      context.emit('updateCallback')
    }
    return{
      myData,
      xForm,
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
