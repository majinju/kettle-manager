<template>
<div :key="timestamp" class="page-warp" v-cloak>
    <div class="page-title"><i class="el-icon-s-home"> / {{dxjcxx.sjdx.dxmc}}</i></div>
    <div class="page-header">
      <vxe-form ref="xForm" :data="formData" :items="formItems" :rules="formRule" @submit="search">
      </vxe-form>
    </div>
    <div class="page-main">
      <div class="custom-table">
        <vxe-grid
          ref="xGrid" :toolbar-config="tableToolbar" :columns="tableColumn"
          :data="tableData" :export-config="exportConfig" :tree-config="treeConfig"
          :seq-config="seqConfig" :row-id="dxjcxx.sjdx.zjzd"
          :pager-config="pagerConfig" :edit-rules="tableRule"
          @page-change="pageChange"
          @sort-change="sortChange"
        >
          <!--          :edit-config="editCofnig"-->
<!--          工具栏左侧-->
          <template #toolbar_left>
            <span class="page-main-header-title">数据展示</span>
            <el-button-group>
              <template v-for="(qx,cllx) in hqqxlb(qxpz.plclLeft,qxpz.plclLeftZdans,false)">
                <el-button v-bind="qx" @click="plcl(cllx,qx)" :size="options.size">
                  {{qx.content}}
                </el-button>
              </template>
              <el-dropdown v-if="Object.keys(hqqxlb(qxpz.plclLeft,qxpz.plclLeftZdans,true)).length>0">
                <el-button type="primary" :size="options.size">
                  更多操作<i class="el-icon-arrow-down el-icon--right"></i>
                </el-button>
                <template #dropdown>
                  <el-dropdown-menu>
                    <template v-for="(qx,cllx) in hqqxlb(qxpz.plclLeft,qxpz.plclLeftZdans,true)">
                      <el-dropdown-item v-bind="qx" @click="plcl(cllx,qx)">
                        {{qx.content}}
                      </el-dropdown-item>
                    </template>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </el-button-group>
          </template>
<!--          工具栏右侧-->
          <template #toolbar_right>
            <el-button-group>
              <template v-for="(qx,cllx) in hqqxlb(qxpz.plclRight,qxpz.plclRightZdans,false)">
                <el-button v-bind="qx" @click="plcl(cllx,qx)" :size="options.size">
                  {{qx.content}}
                </el-button>
              </template>
              <el-dropdown v-if="Object.keys(hqqxlb(qxpz.plclRight,qxpz.plclRightZdans,true)).length>0">
                <el-button :size="options.size">
                  更多操作<el-icon class="el-icon--right"><arrow-down /></el-icon>
                </el-button>
                <template #dropdown>
                  <el-dropdown-menu>
                    <template v-for="(qx,cllx) in hqqxlb(qxpz.plclRight,qxpz.plclRightZdans,true)">
                      <el-dropdown-item @click="plcl(cllx,qx)" v-bind="qx">
                        {{qx.content}}
                      </el-dropdown-item>
                    </template>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </el-button-group>
          </template>
<!--          列表操作-->
          <template #lbcz="{row,column}">
            <template v-for="(qx,cllx) in hqqxlb(column.params.btns,column.params.zdans,false)">
              <vxe-button v-bind="qx" @click="plcl(cllx,qx,row)"/>
            </template>
            <vxe-button v-if="Object.keys(hqqxlb(column.params.btns,column.params.zdans,true)).length>0"
                        type="text" status="primary" transfer content="更多操作">
              <template #dropdowns>
                <template v-for="(qx,cllx) in hqqxlb(column.params.btns,column.params.zdans,true)">
                  <vxe-button v-bind="qx" @click="plcl(cllx,qx,row)"/>
                </template>
              </template>
            </vxe-button>
          </template>
        </vxe-grid>
      </div>
    </div>
    <vxe-modal v-model="tcckShow" :title="tcckTitle"
               :before-hide-method="close">
        <my-form ref="xUpdate" @updateCallback="updateCallback"></my-form>
      <suspense>
      </suspense>
    </vxe-modal>
  </div>
</template>

<script>
import {defineComponent, nextTick, ref} from 'vue'
import {ElMessage, ElMessageBox} from "element-plus";
import { VXETable } from '@majinju/vxe-table';
import axios from "@/axios";
import {dayjsMethod, zdList} from "@/utils/common";
import {options} from "@/plugins/vxe-table";
import MyForm from "@/views/sjdx1/MyForm1";
import {getByPath,assignDeep} from "@/utils/common";

export default defineComponent({
  name: "MySelectGrid1",
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
  data:function (){
    return {
      /**
       * 对象基础信息
       */
      myDxjcxx:{
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
      editCofnig:{
        trigger: 'click',
        mode: 'cell',
        showStatus: true
      },
      /**
       * 表格字段验证规则
       */
      tableRule:{},
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
      },
      /**
       * 分页配置
       */
      pagerConfig:{
        pageSize: options.pager.pageSize,
        currentPage:1,
        total: null
      },
      selectReqData:{},
      /**
       * 弹出窗口是否展示
       */
      tcckShow:false,
      /**
       * 弹出窗口标题
       */
      tcckTitle:'',
      xFrom:{},
      xGrid:{},
      xUpdate:{}
    }
  },
  computed:{
    /**
     * 获取查询权限的子权限配置
     */
    qxpz : function(){
      let qxpz = getByPath(this.myDxjcxx,"sys.cllxkz.select.qxpz");
      if(!qxpz){
        qxpz = {}
      }
      return qxpz
    }
  },
  methods:{
    idx:function({ rowIndex }) {
      return this.pagerConfig.pageSize*(this.pagerConfig.currentPage-1)+rowIndex+1;
    },
    initPage : async function(dxjcxx){
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
      this.myDxjcxx=dxjcxx;
      if(getByPath(dxjcxx,"sys.cllxkz.select.tree.parentField")){
        //树形结构
        this.treeConfig=getByPath(dxjcxx,"sys.cllxkz.select.tree")
        this.treeConfig.lazy = true
        this.treeConfig.loadMethod=function ({row}){
          return new Promise((resolve, reject) => {
            let yobj = {
            }
            yobj[this.treeConfig.parentField]=row[this.myDxjcxx.sjdx.zjzd]
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
        delete this.seqConfig.seqMethod;
      }
      const fields = this.myDxjcxx.fields;
      this.formItems=[]
      this.tableColumn=[]
      let fi;
      for(const key in fields){
        const f = fields[key];
        if(f.cxzs==='1'){
          //查询默认值
          if(f.cxmrz){
            this.formData[f.zddm]=f.cxmrz;
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
                this.formData[f.zddm]=[val1,val2];
              }
              break
            default:
              //默认普通输入框
              fi.itemRender={ name: '$input' ,props:{}};
          }
          this.formItems.push(assignDeep(fi,f.kzxx.kjkz));
        }
        if(f.lbzs==='1'){
          //配置列表字段
          fi = {field: f.zddm, title: f.zdmc,align:'center'}
          if(f.zdkd>10){
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
              //还要考虑字典树
              if(f.zdfy==='1'){
                //大字典，采用下拉分页搜索框
                fi.editRender={ name: 'MyDownList' ,props:{placeholder:f.zdts,zdlb:f.zdzdlb}};
                //还要考虑多选
              }else{
                //普通下拉框
                fi.editRender={ name: '$select' ,props:{placeholder:f.zdts}};
                await zdList(f.zdzdlb).then((data)=>{
                  fi.editRender.options=data;
                })
                //还要考虑多选
              }
              break
            case 'ElDatePicker':
              //时间控件
              fi.formatter='formatDate';
              fi.editRender={
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
              fi.editRender={
                name: '$textarea',
                props:{
                  maxlength:f.zdcd
                }
              };
              break
            case '$buttons':
              //按钮组
              fi.params=getByPath(f.kzxx,"kjkz")
              fi.slots={default:'lbcz'}
              break
            default:
              fi.editRender={name: '$input' ,props:{}};
          }
          this.tableColumn.push(assignDeep(fi,f.kzxx.kjkz));
        }
      }
      //添加查询按钮
      this.formItems.push({
        align: 'right',
        span: 24,
        itemRender: {
          name: '$buttons',
          children: [
            { props: { type: 'submit', content: '查询', status: 'primary' } }
          ]
        }
      });
      this.formItems = ref(this.formItems)
      this.tableColumn = ref(this.tableColumn)
      //TODO 此处再进行一次myData与对象中的该处理类型扩展合并
    },
    /**
     * 获取权限列表
     * @param qxz 权限组
     * @param gdczSize 区分更多操作的按钮数
     * @param gdcz 本次是否获取更多操作
     */
    hqqxlb : function(qxz,gdczSize,gdcz=false) {
      let qxlb = {}
      let qxlb1 = {}
      const qxMap = this.$store.state.user.qxMap;
      const authCode = this.myDxjcxx.sys.authCode;
      for(const cllx in qxz){
        if(qxMap[authCode+"_"+cllx]){
          qxlb[cllx]=qxz[cllx];
        }
      }
      let count = 0;
      if(gdcz){
        //获取更多操作
        if(Object.keys(qxlb).length>gdczSize){
          for(const cllx in qxlb){
            if(count>=gdczSize-1){
              qxlb1[cllx]=qxlb[cllx];
            }
            count++
          }
        }else{
          return {}
        }
      }else{
        //获取默认展示的操作
        const size = Object.keys(qxlb).length>gdczSize?gdczSize-1:gdczSize;
        for(const cllx in qxlb){
          if(count<size){
            qxlb1[cllx]=qxlb[cllx];
          }
          count++
        }
      }
      return qxlb1;
    },
    /**
     * 设置页大小
     * @param pageSize 页大小
     */
    setPageSize : function (pageSize){
      this.selectReqData.page.pageSize=pageSize;
      this.pagerConfig.pageSize=pageSize
    },
    /**
     * 设置当前页
     * @param currentPage 页大小
     */
    setPageNumber: function(currentPage) {
      this.selectReqData.page.pageNumber=currentPage;
      this.pagerConfig.currentPage=currentPage
    },
    /**
     * 分页切换事件
     * @param currentPage 当前页
     * @param pageSize 页大小
     */
    pageChange : function( {currentPage, pageSize} ){
      this.setPageSize(pageSize);
      this.setPageNumber(currentPage);
      this.selectReqData.page.totalRequired=false
      this.getList();
    },
    /**
     * 自定义字段排序
     * @param column
     */
    sortChange : function({column}){
      this.selectReqData.page.orderBy = column.order?(column.property+" "+column.order):"";
      this.selectReqData.page.totalRequired=false
      this.getList();
    },
    /**
     * 修改页面回调
     * @param isFlush 是否刷新页面
     */
    updateCallback : function(isFlush){
      this.tcckShow=false
      if(isFlush!==false){
        this.selectReqData.page.totalRequired=true
        this.getList()
      }
    },
    /**
     * 搜索按钮
     */
    search : function(){
      console.log('进入查询页面')
      //点击搜索按钮，恢复为第一页
      this.setPageNumber(1);
      this.selectReqData.page.totalRequired=true
      this.getList()
    },
    /**
     * 执行分页查询
     */
    getList :async function(){
      console.log('进入查询页面')
      this.selectReqData.yobj = this.formData;
      await axios.post(this.selectReqData).then(req=>{
        this.tableData= req.data.list;
        if(this.selectReqData.page.totalRequired){
          this.pagerConfig.total=req.data.totalRow;
        }
      }).catch((e)=>{
        console.log("查询失败："+e);
      })
    },
    /**
     * 通用后台请求
     * @param cllx 处理类型
     * @param buttonOptions 按钮参数
     * @param ids 操作id数组
     * @param row 操作行
     */
    htqq : function(cllx,buttonOptions,ids,row){
      if(row){
        ids = [row[this.myDxjcxx.sjdx.zjzd]];
      }
      axios.post({
        sys:{
          authCode:this.myDxjcxx.sys.authCode,
          cllx:cllx,
          ids:ids
        }
      }).then(req=>{
        ElMessage.success(req.msg);
        if(buttonOptions.sfsxym!==false){
          //修改数据的场景要重新统计总量
          this.selectReqData.page.totalRequired=true
          this.getList()
        }
      }).catch((req)=>{
      });
    },
    /**
     * 批量处理<br/>
     * 考虑场景：直接后台调用、弹窗
     */
    plcl : async function(cllx,btnProps,row){
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
              this.htqq(cllx,buttonOptions,ids,row)
            }).catch(function (){
              console.info("用户取消操作："+content)
            })
          }else{
            this.htqq(cllx,buttonOptions,ids,row)
          }
          break
        //弹出窗口
        case "tcck":
          //窗口标题
          this.tcckTitle=content+"【"+this.myDxjcxx.sjdx.dxmc+"】"
          //窗口显示
          this.tcckShow=true
          await nextTick()
          await nextTick()
          xUpdate.value.tcck(this.myDxjcxx, cllx, buttonOptions, row, ids);
          break
        //文件下载
        case "wjxz":
          let params = JSON.parse(JSON.stringify(this.selectReqData));
          params.sys.cllx = cllx;
          params.sys.ids = ids;
          params.sys.dcwjm = this.myDxjcxx.sjdx.dxmc+"-"+content+".xlsx";
          axios.download(assignDeep(params,buttonOptions.params));
          break
        //文件上传
        case "wjsc":
          //调用文件上传接口后，再拿着返回的文件对象信息请求设置的处理类型。
          const { file,files } = await VXETable.readFile({
            multiple: true
          })
          const formBody = new FormData();
          formBody.append("sys.authCode", this.myDxjcxx.sys.authCode);
          formBody.append("sys.cllx", "upload");
          for(let i=0;i<files.length;i++){
            formBody.append("files", files[i]);
          }
          axios.upload(formBody).then((res) => {
            if (res.status) {
              axios.post({
                sys: {
                  authCode: this.myDxjcxx.sys.authCode,
                  cllx: cllx,
                  files: res.data,
                },
              }).then((response) => {
                if (response.status) {
                  ElMessage.info(response.msg?response.msg:"操作成功")
                  if(buttonOptions.sfsxym!==false){
                    //修改数据的场景要重新统计总量
                    this.selectReqData.page.totalRequired=true
                    this.getList()
                  }
                }else{
                  //TODO 需要展示错误数据信息

                }
              });
            }
          });
          break
        //编辑模式
        case "bjms":
          ElMessage.error("编辑模式暂未实现");
          break
        default:
          ElMessage.error("暂不支持该处理方式");
      }
    },
    /**
     * 批量处理后的
     * @param buttonOptions
     */
    hxcz : function (buttonOptions)  {

    }
  },
  created:async function() {
    await this.initPage(this.dxjcxx)
    this.seqConfig.seqMethod=this.idx
    /**
     * 查询请求数据
     */
    this.selectReqData = ref({
      sys:{
        authCode:this.myDxjcxx.sys.authCode,
        cllx:"select",
        dcwjm:this.myDxjcxx.sjdx.dxmc
      },
      page:{
        totalRequired:true
      }
    })
  },
  mounted() {
    //初始化查询
    // this.getList();
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
