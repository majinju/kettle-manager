<template>
  <vxe-form ref="xForm" :key="myData.timestamp" :data="myData.formData" :rules="myData.formRule"
            :items="myData.formItems" v-cloak>
  </vxe-form>
</template>

<script>
import {defineComponent, onMounted, reactive, ref} from 'vue'
import { ElMessage ,ElMessageBox} from "element-plus";
import {options} from "@/plugins/vxe-table";
import axios from "@/axios";
import {assignDeep, getByPath,} from "@/utils/common";

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
  emits:["close"],
  /**
   * from组件主要进行页面布局，然后需要展示的都可以以组件形式集成进去
   * @param props
   * @param context
   * @returns {Promise<{xForm: Ref<UnwrapRef<{}>>, tcck: tcck, close: () => void, myData: UnwrapNestedRefs<{formItems: *[], options, formData: {}, formRule: {}, dxjcxx: {}, timestamp: number}>}>}
   */
  setup:async (props,context)=>{
    /**
     * 我的组件数据
     * @type {UnwrapNestedRefs<{formItems: *[], options, formData: {}, formRule: {}, dxjcxx: {}, timestamp: number}>}
     */
    let myData =reactive({
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
     * @param boptions 权限信息
     * @param obj 当前操作的行
     * @param ids 列表选择的id数组
     * @returns {Promise<void>}
     */
    const initPage =async (dxjcxx,cllx,boptions,obj,ids) => {
      if(!cllx){
        //外部没传处理类型时，采用基础新中的处理类型
        cllx = dxjcxx.sys.cllx
      }
      myData.formData={};
      //重置表单项
      myData.formItems=[]
      myData.formRule = {}
      let isObj = obj&&Object.keys(obj).length>0;
      if(!dxjcxx.fields){
        //加载对象基础信息
        await axios.post({
          sjdx:dxjcxx.sjdx,
          sys:{
            authCode: dxjcxx.sys.authCode,
            cllx:"dxjcxx"
          },
          yobj:dxjcxx.yobj
        }).then(async (rep)=>{
          //设置处理类型
          rep.data.sys.cllx = cllx;
          dxjcxx = rep.data;
        });
      }
      myData.dxjcxx=dxjcxx;
      if(isObj){
        myData.obj = obj
        //深拷贝数据，避免修改对外部的影响
        myData.formData = JSON.parse(JSON.stringify(obj));
      }
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
        if(getByPath(f,"kzxx.cllxkz."+cllx)&&f.kzxx.cllxkz[cllx].show){
          //默认值
          if(!isObj){
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
            case 'ElCascader':
            case '$switch':
            case '$select':
              //还要考虑字典树
              if(f.zdfy==='1'){
                //大字典，采用下拉分页搜索框
                fi.itemRender={ name: 'MyDownList'};
                //还要考虑多选
              }else{
                //普通下拉框
                fi.itemRender={ name: 'MySelect'};
                //还要考虑多选
              }
              // fi.itemRender={ name: 'MyDownList'};
              fi.itemRender.props={placeholder:f.zdts,zdlb:f.zdzdlb};
              break
            case 'jsoneditor':
              fi.itemRender={ name: 'MyMarkDown' ,props:{placeholder:f.zdts,codeType:"json"}};
              if(f.kzxx.cllxkz[cllx].disabled||f.kzxx.cllxkz[cllx].readonly){
                fi.itemRender.props.mode="preview";
              }
              break
            case 'MyMarkDown':
              //,height:"250px"
              fi.itemRender={ name: 'MyMarkDown' ,props:{placeholder:f.zdts}};
              if(f.kzxx.cllxkz[cllx].disabled||f.kzxx.cllxkz[cllx].readonly){
                fi.itemRender.props.mode="preview";
              }
              break
            case 'ElDatePicker':
              //时间选择器
              fi.itemRender={
                name: 'ElDatePicker',props:{
                  type:'datetime',
                  clearable:options.input.clearable,
                  size:options.input.size,
                  valueFormat:"YYYYMMDDHHmmss"
                }
              };
              break
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
              fi.itemRender.props.key = new Date().getTime();
              break
            default:
              //默认普通输入框
              fi.itemRender={ name: '$input' ,props:{}};
          }
          //控件属性统一设置部分
          if(!fi.itemRender.props.key){
            fi.itemRender.props.key = cllx+f.id;
          }
          //是否禁用
          fi.itemRender.props.disabled = f.kzxx.cllxkz[cllx].disabled;
          //是否只读
          fi.itemRender.props.readonly = f.kzxx.cllxkz[cllx].readonly;
          if (fi.itemRender.props.disabled||fi.itemRender.props.readonly){
            fi.itemRender.props.clearable = false
          }
          //合并字段的控件扩展，覆盖默认值
          myData.formItems.push(assignDeep(fi,f.kzxx.kjkz));
        }
      }
      //此处再进行一次myData与对象中的该处理类型扩展合并
      myData = assignDeep(myData,getByPath(dxjcxx, "sys.cllxkz."+cllx+".pagekz"))
    }
    //初始进入页面
    if(props.dxjcxx){
      await initPage(props.dxjcxx);
    }
    /**
     * 作为弹窗窗口被调用
     * @param dxjcxx 对象基础信息
     * @param cllx 处理类型
     * @param options 权限信息
     * @param obj 当前操作的行
     * @param ids 列表选择的id数组
     */
    const tcck = (dxjcxx,cllx,options,obj,ids) => {
      initPage(dxjcxx,cllx,options,obj,ids);
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
        if(btnProps.jghbdbd===true){
          //请求结果合并到表单
          myData.formData = assignDeep(myData.formData,req.data);
        }
        if(btnProps.sfgbtc===true){
          context.emit('close',btnProps.sfsxym)
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
          context.emit('close',buttonOptions.sfsxym)
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
    return {
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
