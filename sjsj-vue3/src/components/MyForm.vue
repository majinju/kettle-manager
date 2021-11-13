<template>
  <vxe-form ref="xForm" :data="myData.formData" :rules="myData.formRule"
            :items="myData.formItems">
    <!--          列表操作-->
<!--    <template #butns="{ data, property }">-->
<!--      <vxe-button v-for="(qx,cllx) in column.params.btns" v-bind="qx"-->
<!--                  @click="plcl(cllx,qx.buttonOptions,row)"/>-->
<!--    </template>-->
  </vxe-form>
</template>

<script>
import {defineComponent, nextTick, onMounted, reactive, ref, watch} from 'vue'
import { ElMessage ,ElMessageBox} from "element-plus";
import {options} from "@/plugins/vxe-table";
import axios from "@/axios";
import {zdList,assignDeep} from "@/utils/common";
import {getByPath} from "../utils/common";

export default defineComponent({
  name: "MyForm",
  components:{},
  props:{
    /**
     * 父页面传入对象基础信息时，本页面将不再重复请求
     */
    dxjcxx:{
      type: Object
    }
  },
  /**
   * from组件主要进行页面布局，然后需要展示的都可以以组件形式集成进去
   * @param props
   * @param context
   * @returns {Promise<{xForm: Ref<UnwrapRef<{}>>, saveAdd: saveAdd, getDataById: getDataById, close: close, myData: UnwrapNestedRefs<{formItems: *[], options, formData: {}, formRule: {}, dxjcxx: {}, timestamp: number}>}>}
   */
  setup:async (props,context)=>{
    /**
     * 我的组件数据
     * @type {UnwrapNestedRefs<{formItems: *[], options, formData: {}, formRule: {}, dxjcxx: {}, timestamp: number}>}
     */
    const myData =reactive({
      /**
       * 全局统一配置
       */
      options: options,
      /**
       * 当前时间作为id
       */
      timestamp:new Date().getTime(),
      /**
       * 对象基础信息
       */
      dxjcxx:{
      },
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
      formRule:{}
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
    const initPage =async (dxjcxx,cllx,row) => {
      if(!cllx){
        cllx = dxjcxx.sys.cllx
      }
      if(!dxjcxx.fields){
        //加载对象基础信息
        await axios.post({
          sjdx:dxjcxx.sjdx,
          sys:{
            authCode: dxjcxx.sys.authCode,
            cllx:"dxjcxx"
          }
        }).then(async (rep)=>{
          rep.data.sys.cllx = cllx;
          dxjcxx = rep.data;
        });
      }
      myData.dxjcxx=dxjcxx;
      myData.formData={};
      if(row){
        myData.formData = JSON.parse(JSON.stringify(row));
      }
      myData.formItems=[]
      const fields = dxjcxx.fields;
      let fi;
      for(const key in fields){
        const f = fields[key];
        if(f.kzxx.cllxkz[cllx]&&f.kzxx.cllxkz[cllx].show){
          //默认值
          if(!row){
            myData.formData[f.zddm]=f.kzxx.cllxkz[cllx].default;
          }
          //是否禁用
          let disabled = f.kzxx.cllxkz[cllx].yxbj!==true
          //添加校验规则
          myData.formRule[f.zddm]=[
            {
              validator ({ cellValue }) {
                //自定义校验规则
                console.log(cellValue);
              }
            }
          ]
          if(getByPath(f.kzxx,"yzgz."+cllx+".notNull")){
            myData.formRule[f.zddm].push({ required: true, message: f.zdmc+'必填',trigger: 'blur'});
          }
          fi = {field: f.zddm, title: f.zdmc, span: 8}
          let zdkd = f.kzxx.cllxkz[cllx].zdkd;
          if(zdkd<10||zdkd>200){
            fi.span=24;
          }
          switch (f.kjlx){
            case '$switch':
            case '$select':
              //大字典，采用下拉分页搜索框
              fi.itemRender={
                name: 'MyDownList' ,
                props:{
                  placeholder:f.zdts,
                  zdlb:f.zdzdlb,
                  disabled:disabled
                }
              };
              // if(f.zdfy==='1'){
              // }else{
              //   //普通下拉框
              //   fi.itemRender={ name: '$select' ,props:{placeholder:f.zdts}};
              //   await zdList(f.zdzdlb).then((data)=>{
              //     fi.itemRender.options=data;
              //   }).catch(function (r){
              //     console.log("获取字典错误："+r)
              //   })
              // }
              break
            case 'ElDatePicker':
              //时间选择器
              fi.itemRender={ name: 'ElDatePicker',props:{type:'datetimerange',clearable:options.input.clearable,
                  size:options.input.size,
                  disabled:disabled} };
              break
            case 'jsoneditor':
            case '$textarea':
              //时间选择器
              fi.itemRender={ name: '$textarea',props:{maxlength:f.zdcd,
                  disabled:disabled} };
              break
            case '$buttons':
              //按钮组
              //按钮不显示描述
              fi.title="";
              // fi.params={
              //   "btns":getByPath(f.kzxx,"kjkz.btns")
              // }
              // fi.slots={default:'butns'}
              let children = [];
              let $buttons = getByPath(f.kzxx,"kjkz.btns");
              for(let i in $buttons){
                $buttons[i].name=i;
                $buttons[i].click = function(option){
                  plcl(option.props.name,option.props);
                }
                children.push({ props: $buttons[i] })
              }
              fi.itemRender={ name: f.kjlx,children: children};
              break
            case 'MySelectGrid':
              //查询表格
              if(fi.title==='查询表格'){
                //此场景为直接展示查询列表
                fi.title="";
              }
              let authCode = getByPath(f.kzxx,"kjkz.itemRender.props.dxjcxx.sys.authCode");
              let dxdm = getByPath(f.kzxx,"kjkz.itemRender.props.dxjcxx.sjdx.dxdm");
              if(authCode||dxdm){
                fi.itemRender={
                  name: 'MySelectGrid',
                  props:{
                    dxjcxx: {
                      sjdx:{
                        dxdm:dxdm
                      },
                      sys:{
                        authCode: authCode,
                        cllx: "select"
                      }
                    },
                    disabled:disabled
                  }
                };
              }else{
                fi.itemRender={
                  name: 'MySelectGrid',
                  props:{
                    dxjcxx:dxjcxx,
                    disabled:disabled
                  }
                };
              }
              break
            default:
              //默认普通输入框
              fi.itemRender={ name: '$input' ,props:{disabled:disabled}};
          }
          myData.formItems.push(assignDeep(fi,f.kzxx.kjkz));
        }
      }
      //TODO 此处再进行一次myData与对象中的该处理类型扩展合并
    }
    //初始进入页面
    if(props.dxjcxx){
      await initPage(props.dxjcxx);
    }
    /**
     * 作为弹窗窗口被调用
     * @param dxjcxx 对象基础信息
     * @param cllx 处理类型
     * @param row 当前操作的行
     * @param qx 权限信息
     * @param ids 列表选择的id数组
     */
    const tcck = (dxjcxx,cllx,row,qx,ids) => {
      initPage(dxjcxx,cllx,row);
    }
    /**
     * 通用后台请求
     * @param cllx 处理类型
     * @param btnProps 按钮参数
     * @param fromData 表单数据
     */
    const htqq = (cllx,btnProps,fromData) => {
      axios.post({
        sys:{
          authCode:myData.dxjcxx.sys.authCode,
          cllx:cllx
        },
        yobj:fromData
      }).then(req=>{
        ElMessage.success(req.msg);
        if(btnProps.sfgbtc===true){
          context.emit('updateCallback',btnProps.sfsxym)
        }
      });
    }
    /**
     * 表单中的按钮事件
     * @param cllx 处理类型
     * @param btnProps 按钮参数
     */
    const plcl = async (cllx,btnProps) => {
      const buttonOptions = btnProps.buttonOptions;
      //处理方式
      const clfs = buttonOptions.clfs||'htqq';
      let content = btnProps.content;
      if(!(buttonOptions.sfjybd===false)){
        //表单校验
        let jyjg = true
        await xForm.value.validate().then(function (errMap){
          if(errMap!==undefined&&Object.keys(errMap).length>0){
            jyjg = false
          }
        })
        if(!jyjg){
          return
        }
      }
      switch (clfs) {
        //后台请求
        case "htqq":
          if(buttonOptions.htqqts){
            ElMessageBox.confirm("你确定"+content+"吗?", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              htqq(cllx,buttonOptions,myData.formData)
            }).catch(function (){})
          }else{
            htqq(cllx,buttonOptions,myData.formData)
          }
          break
        //弹出窗口
        case "tcck":
          //窗口显示
          myData.tcckShow=true
          //窗口标题
          myData.tcckTitle=content+"【"+myData.dxjcxx.sjdx.dxmc+"】"
          // nextTick(()=>{
          //   nextTick(()=>{
          //     xUpdate.value.tcck(myData.dxjcxx,cllx,row,buttonOptions,ids);
          //   })
          // })
          break
        //关闭弹窗
        case "gbtc":
          context.emit('updateCallback',buttonOptions.sfsxym)
          break
        //文件下载
        case "wjxz":
          axios.download({
            sys:{
              authCode:myData.dxjcxx.sys.authCode,
              cllx:cllx,
              ids:ids
            }
          })
          break
        default:
          ElMessage.error("暂不支持该处理方式");
      }
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
    return{
      myData,
      xForm,
      tcck,
      close
    }
  }
})
</script>

<style scoped>

</style>
