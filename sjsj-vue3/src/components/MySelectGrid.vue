<template>
  <div :key="myData.timestamp" class="page-warp" v-cloak>
    <div class="page-title"><i class="el-icon-s-home"> / {{myData.dxjcxx.sjdx.dxmc}}</i></div>
    <div class="page-header">
      <vxe-form ref="xForm" :data="myData.formData" :items="myData.formItems" :rules="myData.formRule" @submit="search">
      </vxe-form>
    </div>
    <div class="page-main">
      <div class="custom-table">
        <vxe-grid
          ref="xGrid" :toolbar-config="myData.tableToolbar" :columns="myData.tableColumn"
          :data="myData.tableData" :export-config="myData.exportConfig" :tree-config="myData.treeConfig"
          :seq-config="myData.seqConfig" :row-id="myData.dxjcxx.sjdx.zjzd"
          :pager-config="myData.pagerConfig"
          @page-change="pageChange"
          @sort-change="sortChange"
        >
<!--          工具栏左侧-->
          <template #toolbar_left>
            <span class="page-main-header-title">数据展示</span>
            <el-button-group>
              <el-button v-for="(qx,cllx) in qxpz.plclLeft" v-bind="qx"
                          @click="plcl(cllx,qx)"
                         :size="myData.options.size">{{qx.content}}</el-button>
            </el-button-group>
          </template>
<!--          工具栏右侧-->
          <template #toolbar_right>
            <el-button-group>
              <el-button v-for="(qx,cllx) in qxpz.plclRight" v-bind="qx"
                         @click="plcl(cllx,qx)"
                         :size="myData.options.size">{{qx.content}}</el-button>
            </el-button-group>
          </template>
<!--          列表操作-->
          <template #lbcz="{row,column}">
            <vxe-button v-for="(qx,cllx,idx) in column.params.btns" v-bind="qx"
                        v-show="idx<(Object.keys(column.params.btns).length>3?2:3)"
                        @click="plcl(cllx,qx,row)"/>
            <vxe-button v-if="Object.keys(column.params.btns).length>3"
                        type="text" status="primary" transfer content="其他操作">
              <template #dropdowns>
                <vxe-button v-for="(qx,cllx,idx) in column.params.btns" v-bind="qx"
                            v-show="idx>=2" @click="plcl(cllx,qx,row)"/>
              </template>
            </vxe-button>
          </template>
        </vxe-grid>
      </div>
    </div>
    <vxe-modal v-model="myData.tcckShow" :title="myData.tcckTitle"
               :before-hide-method="close">
        <my-form ref="xUpdate" @updateCallback="updateCallback"></my-form>
      <suspense>
      </suspense>
    </vxe-modal>
  </div>
</template>

<script>
import { defineComponent, reactive ,onMounted,ref,nextTick,watch,computed} from 'vue'
import {ElLoading, ElMessage, ElMessageBox} from "element-plus";
import { useStore } from "vuex";
import axios from "@/axios";
import {dateFormat, dayjsMethod, zdList} from "@/utils/common";
import {options} from "@/plugins/vxe-table";
import MyForm from "./MyForm";
import {getByPath,assignDeep} from "../utils/common";

export default defineComponent({
  name: "MySelectGrid",
  components:{MyForm},
  props:{
    /**
     * 输入值
     */
    modelValue:{
      type: String
    },
    /**
     * 父页面传入对象基础信息
     */
    dxjcxx:{
      type: Object,
      required: true
    }
  },
  emits:["update:modelValue"],
  setup:async (props,context)=>{
    const myData = reactive({
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
       * 列表批量操作栏
       */
      tableToolbar: {
        slots: {
          buttons: 'toolbar_left',
          tools:'toolbar_right'
        }
      },
      /**
       * 导出配置
       */
      exportConfig: {
        remote: true,
        // 默认选中类型
        // 局部自定义类型
        types: [ 'csv', 'html', 'xml', 'txt'],
        // 自定义数据量列表
        modes: ['current', 'all']
      },
      /**
       * 树形结构配置
       */
      treeConfig:{},
      /**
       * 列表字段信息
       */
      tableColumn: [],
      /**
       * 列表数据
       */
      tableData:[],
      /**
       * 列表序号配置
       */
      seqConfig:{
        seqMethod ({ rowIndex }) {
          return myData.pagerConfig.pageSize*(myData.pagerConfig.currentPage-1)+rowIndex+1;
        }
      },
      /**
       * 分页配置
       */
      pagerConfig:{
        pageSize: options.pager.pageSize,
        currentPage:1,
        total: null
      },
      /**
       * 弹出窗口是否展示
       */
      tcckShow:false,
      /**
       * 弹出窗口标题
       */
      tcckTitle:''
    })
    const store = useStore();
    /**
     * 查询表单引用
     * @type {Ref<UnwrapRef<{}>>}
     */
    const xFrom = ref({});
    /**
     * 表格引用
     * @type {Ref<UnwrapRef<{}>>}
     */
    const xGrid = ref({});
    /**
     * 修改页面引用
     * @type {Ref<UnwrapRef<{}>>}
     */
    const xUpdate = ref({});
    /**
     * 页面挂载后执行
     */
    onMounted(()=>{
      //初始化查询
      getList();
    })
    const initPage = async (dxjcxx)=>{
      if(!dxjcxx.fields){
        //加载对象基础信息
        await axios.post({
          sjdx:dxjcxx.sjdx,
          sys:{
            authCode: dxjcxx.sys.authCode,
            cllx:"dxjcxx"
          }
        }).then(async (rep)=>{
          dxjcxx = rep.data;
        });
      }
      myData.dxjcxx=dxjcxx;
      if(getByPath(dxjcxx,"sys.cllxkz.select.tree.parentField")){
        //树形结构
        myData.treeConfig=getByPath(dxjcxx,"sys.cllxkz.select.tree")
        myData.treeConfig.lazy = true
        myData.treeConfig.loadMethod=function ({row}){
          return new Promise((resolve, reject) => {
            let yobj = {
            }
            yobj[myData.treeConfig.parentField]=row[myData.dxjcxx.sjdx.zjzd]
            axios.post({
              sys:{
                authCode:dxjcxx.sys.authCode,
                cllx: "select"
              },
              yobj:yobj
            }).then(req=>{
              resolve(req.data.list)
            }).catch((e)=>{
              reject(null);
              console.log("查询失败："+e);
            })
          })
        }
        delete myData.seqConfig.seqMethod;
      }
      const fields = myData.dxjcxx.fields;
      myData.formItems=[]
      myData.tableColumn=[]
      let fi;
      for(const key in fields){
        const f = fields[key];
        if(f.cxzs==='1'){
          //查询默认值
          if(f.cxmrz){
            myData.formData[f.zddm]=f.cxmrz;
          }
          //配置查询项
          fi = {field: f.zddm, title: f.zdmc, span: 8}
          // if(f.zdkd<10||f.zdkd>200){
          //   fi.span = 24;
          // }
          switch (f.kjlx){
            case '$switch':
            // fi.itemRender={ name: '$switch' ,props:{placeholder:f.zdts}};
            // break
            case '$select':
              //还要考虑字典树
              if(f.zdfy==='1'){
                //大字典，采用下拉分页搜索框
                fi.itemRender={ name: 'MyDownList' ,props:{placeholder:f.zdts,zdlb:f.zdzdlb}};
                //还要考虑多选
              }else{
                //普通下拉框
                fi.itemRender={ name: '$select' ,props:{placeholder:f.zdts}};
                await zdList(f.zdzdlb).then((data)=>{
                  fi.itemRender.options=data;
                })
                //还要考虑多选
              }
              break
            case 'ElDatePicker':
              //时间选择器
              fi.itemRender={
                name: 'ElDatePicker',
                props:{
                  type:'datetimerange',
                  clearable:options.input.clearable,
                  size:options.input.size,
                  defaultTime:[
                    new Date(2000, 1, 1, 0, 0, 0),
                    new Date(2000, 2, 1, 23, 59, 59)
                  ],
                  valueFormat:"YYYYMMDDHHmmss"
                }
              };
              if(f.cxmrz){
                const times = JSON.parse(f.cxmrz);
                let val1 = "";
                let val2 = "";
                if(times.start){
                  val1 = dayjsMethod(times.start)
                }
                if(times.end){
                  val2 = dayjsMethod(times.end)
                }
                myData.formData[f.zddm]=[val1,val2];
              }
              break
            default:
              //默认普通输入框
              fi.itemRender={ name: '$input' ,props:{}};
          }
          myData.formItems.push(fi);
        }
        if(f.lbzs==='1'){
          //配置列表字段
          fi = {field: f.zddm, title: f.zdmc,align:'center'}
          if(f.zdkd>10&&f.zdkd<=200){
            fi.width = f.zdkd;
          }
          if(f.yxpx==='1'){
            fi.sortable = true;
          }
          switch (f.kjlx){
            case 'checkbox':
              //列表选择
              fi.title='';
              fi.type='checkbox';
              break
            case 'seq':
              //列表序号
              fi.type='seq';
              break
            case '$switch':
              //开关控件
            case '$select':
              //下拉字典
              fi.formatter='formatterZd';
              fi.cellRender={ };
              break
            case 'ElDatePicker':
              //时间控件
              fi.formatter='formatDate';
              fi.cellRender={ };
              break
            case '$buttons':
              //按钮组
              fi.params={
                "btns":getByPath(f.kzxx,"kjkz.btns")
              }
              fi.slots={default:'lbcz'}
              break
            default:
              fi.cellRender={};
          }
          myData.tableColumn.push(assignDeep(fi,f.kzxx.kjkz));
        }
      }
      myData.formItems.push({ align: 'right', span: 24, itemRender: { name: '$buttons', children: [
            { props: { type: 'submit', content: '查询', status: 'primary' } }
          ]}});
      //TODO 此处再进行一次myData与对象中的该处理类型扩展合并
    }
    /**
     * 获取查询权限的子权限配置
     * @type {ComputedRef<unknown>}
     */
    const qxpz = computed(()=>{
      let qxpz = getByPath(myData,"dxjcxx.sys.cllxkz.select.qxpz");
      if(!qxpz){
        qxpz = {}
      }
      return qxpz
    })
    // watch(()=>props.dxjcxx,newDxjcxx=>{
    //   initPage(newDxjcxx)
    // })
    await initPage(props.dxjcxx)
    /**
     * 查询请求数据
     */
    myData.selectReqData = {
      sys:{
        authCode:myData.dxjcxx.sys.authCode,
        cllx:"select",
        dcwjm:myData.dxjcxx.sjdx.dxmc
      },
      page:{
        totalRequired:true
      }
    }
    /**
     * 设置页大小
     * @param pageSize 页大小
     */
    const setPageSize = (pageSize) => {
      myData.selectReqData.page.pageSize=pageSize;
      myData.pagerConfig.pageSize=pageSize
    }
    /**
     * 设置当前页
     * @param currentPage 页大小
     */
    const setPageNumber = (currentPage) => {
      myData.selectReqData.page.pageNumber=currentPage;
      myData.pagerConfig.currentPage=currentPage
    }
    /**
     * 分页切换事件
     * @param currentPage 当前页
     * @param pageSize 页大小
     */
    const pageChange = ( {currentPage, pageSize} )=>{
      setPageSize(pageSize);
      setPageNumber(currentPage);
      myData.selectReqData.page.totalRequired=false
      getList();
    }
    /**
     * 自定义字段排序
     * @param column
     */
    const sortChange = ({column})=>{
      myData.selectReqData.page.orderBy = column.order?(column.property+" "+column.order):"";
      myData.selectReqData.page.totalRequired=false
      getList();
    }
    /**
     * 修改页面回调
     * @param isFlush 是否刷新页面
     */
    const updateCallback = (isFlush) =>{
      myData.tcckShow=false
      if(isFlush!==false){
        myData.selectReqData.page.totalRequired=true
        getList()
      }
    }
    /**
     * 搜索按钮
     */
    const search = ()=>{
      //点击搜索按钮，恢复为第一页
      setPageNumber(1);
      myData.selectReqData.page.totalRequired=true
      getList()
    }
    /**
     * 执行分页查询
     */
    const getList =async () =>{
      myData.selectReqData.yobj = myData.formData;
      await axios.post(myData.selectReqData).then(req=>{
        myData.tableData= req.data.list;
        myData.pagerConfig.total=req.data.totalRow;
      }).catch((e)=>{
        console.log("查询失败："+e);
      })
    }
    /**
     * 通用后台请求
     * @param cllx 处理类型
     * @param btnProps 按钮参数
     * @param ids 操作id数组
     * @param row 操作行
     */
    const htqq = (cllx,btnProps,ids,row) => {
      if(row){
        ids = [row[myData.dxjcxx.sjdx.zjzd]];
      }
      axios.post({
        sys:{
          authCode:myData.dxjcxx.sys.authCode,
          cllx:cllx,
          ids:ids
        }
      }).then(req=>{
        ElMessage.success(req.msg);
        if(btnProps.sfsxym!==false){
          //修改数据的场景要重新统计总量
          myData.selectReqData.page.totalRequired=true
          getList()
        }
      }).catch((req)=>{
      });
    }
    /**
     * 批量处理<br/>
     * 考虑场景：直接后台调用、弹窗
     */
    const plcl = async (cllx,btnProps,row) =>{
      const buttonOptions = btnProps.buttonOptions;
      //处理方式
      const clfs = buttonOptions.clfs||'htqq';
      let content = btnProps.content;
      let ids = []
      const cr = xGrid.value.getCheckboxRecords(true);
      //TODO 暂时只做列表选择操作，后续支持“操作全部”
      if (cr.length === 0&&(buttonOptions.sfxyxzjl!==false)&&row===undefined) {
        ElMessage.warning("请选择要操作的数据");
        return;
      }
      cr.forEach(item => {
        ids.push(item.id);
      });
      switch (clfs) {
        //后台请求
        case "htqq":
          if(buttonOptions.htqqts){
            ElMessageBox.confirm("你确定"+content+"吗?", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              htqq(cllx,buttonOptions,ids,row)
            }).catch(function (){
              console.info("用户取消操作："+content)
            })
          }else{
            htqq(cllx,buttonOptions,ids,row)
          }
          break
        //弹出窗口
        case "tcck":
          //窗口标题
          myData.tcckTitle=content+"【"+myData.dxjcxx.sjdx.dxmc+"】"
          //窗口显示
          myData.tcckShow=true
          await nextTick()
          await nextTick()
          xUpdate.value.tcck(myData.dxjcxx, cllx, buttonOptions, row, ids);
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
        //文件上传
        case "wjsc":
          ElMessage.error("文件上传暂未实现");
          //调用文件上传接口后，再拿着返回的文件对象信息请求设置的处理类型。
          break
        //编辑模式
        case "bjms":
          ElMessage.error("编辑模式暂未实现");
          break
        default:
          ElMessage.error("暂不支持该处理方式");
      }
    }
    return{
      myData,
      qxpz,
      xFrom,
      xGrid,
      xUpdate,
      search,
      pageChange,
      sortChange,
      close,
      plcl,
      updateCallback
    }
  }
})
</script>

<style scoped lang="scss">
.vxe-grid{
  .vxe-cell{
    .vxe-button,.vxe-button--dropdown{
      padding: 0;
      margin-left: 5px;
    }
  }
}
</style>
