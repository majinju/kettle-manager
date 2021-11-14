<template>
  <vxe-form ref="xForm" :key="myData.timestamp" :data="myData.formData" :rules="myData.formRule"
            :items="myData.formItems">
  </vxe-form>
</template>

<script>
import {defineComponent, nextTick, onMounted, reactive, ref, watch} from 'vue'
import { ElMessage ,ElMessageBox} from "element-plus";
import {options} from "@/plugins/vxe-table";
import axios from "@/axios";
import {zdList,assignDeep} from "@/utils/common";
import {getByPath} from "@/utils/common";

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
       * 表单数据：也表单绑定，用看到的值
       */
      formData:{
      },
      /**
       * 表单数据原始值：外部传入的值
       */
      obj:{

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
    /**
     * 根据对象基础信息进行页面初始化
     * @param dxjcxx 对象基础信息
     * @param cllx 处理类型
     * @param obj 数据
     * @returns {Promise<void>}
     */
    const initPage =async (dxjcxx,cllx,obj) => {
      if(!cllx){
        //外部没传处理类型时，采用基础新中的处理类型
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
          //设置处理类型
          rep.data.sys.cllx = cllx;
          dxjcxx = rep.data;
        });
      }
      myData.dxjcxx=dxjcxx;
      myData.formData={};
      if(obj){
        myData.obj = obj
        //深拷贝数据，避免修改对外部的影响
        myData.formData = JSON.parse(JSON.stringify(obj));
      }
      //重置表单项
      myData.formItems=[]
      const fields = dxjcxx.fields;
      /**
       * 表单项
       */
      let fi;
      for(const key in fields){
        /**
         * 配置字段信息
         */
        const f = fields[key];
        //根据处理类型判断是否展示该字段
        if(f.kzxx.cllxkz[cllx]&&f.kzxx.cllxkz[cllx].show){
          //默认值
          if(!obj){
            myData.formData[f.zddm]=f.kzxx.cllxkz[cllx].default;
          }
          //添加校验规则
          myData.formRule[f.zddm]=[
            {
              validator ({ itemValue, rule, rules, data, property }) {
                //自定义校验规则，跟后台规则一致的前端实现
                console.log(itemValue);
              }
            }
          ]
          if(getByPath(f.kzxx,"yzgz."+cllx+".notNull")){
            //单独处理非空校验，便于在页面给用户红色星号提示必填字段
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
                  zdlb:f.zdzdlb
                }
              };
              break
            case 'ElDatePicker':
              //时间选择器
              fi.itemRender={
                name: 'ElDatePicker',props:{
                  type:'datetimerange',
                  clearable:options.input.clearable,
                  size:options.input.size
                }
              };
              break
            case 'jsoneditor':
            case '$textarea':
              //时间选择器
              fi.itemRender={
                name: '$textarea',props:{
                  maxlength:f.zdcd
                }
              };
              break
            case '$buttons':
              //按钮组
              //按钮不显示描述
              fi.title="";
              let children = [];
              //获取配置的按钮组
              let $buttons = getByPath(f.kzxx,"kjkz.btns");
              for(let i in $buttons){
                //处理类型设置到名称，便于后续按钮事件中使用
                $buttons[i].name=i;
                //按钮点击回调方法
                $buttons[i].click = function(option){
                  plcl(option.props.name,option.props);
                }
                children.push({ props: $buttons[i] })
              }
              fi.itemRender={ name: f.kjlx,children: children,props:{}};
              break
            case 'MySelectGrid':
              //查询表格
              //此场景为直接展示查询列表
              fi.title="";
              //获取配置的对象信息
              let authCode = getByPath(f.kzxx,"kjkz.itemRender.props.dxjcxx.sys.authCode");
              let dxdm = getByPath(f.kzxx,"kjkz.itemRender.props.dxjcxx.sjdx.dxdm");
              if(authCode||dxdm){
                //配置了对象信息则展示配置的对象的查询列表
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
                    }
                  }
                };
              }else{
                //没有配置则展示当前页面对象的查询列表
                fi.itemRender={
                  name: 'MySelectGrid',
                  props:{
                    dxjcxx:dxjcxx
                  }
                };
              }
              break
            default:
              //默认普通输入框
              fi.itemRender={ name: '$input' ,props:{}};
          }
          //合并字段的控件扩展，覆盖默认值
          myData.formItems.push(assignDeep(fi,f.kzxx.kjkz));
          //控件属性统一设置部分
          //是否禁用
          fi.itemRender.props.disabled = f.kzxx.cllxkz[cllx].disabled;
          //是否只读
          fi.itemRender.props.readonly = f.kzxx.cllxkz[cllx].readonly;
          if (fi.itemRender.props.disabled||fi.itemRender.props.readonly){
            fi.itemRender.props.clearable = false
          }
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
