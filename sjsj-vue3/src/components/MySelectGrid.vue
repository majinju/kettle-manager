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
          :edit-config="myData.editCofnig" :edit-rules="myData.tableRule"
          :pager-config="myData.pagerConfig" :checkbox-config="myData.checkboxConfig"
          @page-change="pageChange"
          @sort-change="sortChange"
        >
<!--          工具栏左侧-->
          <template #toolbar_left>
            <span class="page-main-header-title">数据展示</span>
<!--            <vxe-checkbox content="操作全部"></vxe-checkbox>-->
            <el-button-group>
              <template v-for="(qx,cllx) in hqqxlb(qxpz.plclLeft,qxpz.plclLeftZdans,false)">
                <el-button v-bind="qx" @click="plcl(cllx,qx)" :size="myData.options.size">
                  {{qx.content}}
                </el-button>
              </template>
              <el-dropdown v-if="Object.keys(hqqxlb(qxpz.plclLeft,qxpz.plclLeftZdans,true)).length>0">
                <el-button type="primary" :size="myData.options.size">
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
                <el-button v-bind="qx" @click="plcl(cllx,qx)" :size="myData.options.size">
                  {{qx.content}}
                </el-button>
              </template>
              <el-dropdown v-if="Object.keys(hqqxlb(qxpz.plclRight,qxpz.plclRightZdans,true)).length>0">
                <el-button :size="myData.options.size">
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
    <vxe-modal ref="xModal" v-model="myData.tcckShow" :title="myData.tcckTitle"
               :before-hide-method="close">
      <my-form ref="xUpdate" @close="fromClose"></my-form>
    </vxe-modal>
  </div>
</template>

<script>
import { defineComponent, reactive ,onMounted,ref,nextTick,computed,watch} from 'vue'
import {ElMessage, ElMessageBox} from "element-plus";
import { VXETable } from '@majinju/vxe-table';
import axios from "@/axios";
import {dayjsMethod, zdList, hasAuth, setByPath} from "@/utils/common";
import {options} from "@/plugins/vxe-table";
import MyForm from "./MyForm";
import {getByPath,assignDeep} from "@/utils/common";

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
    let myData = reactive({
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
       * 表格编辑配置
       */
      editCofnig:{
        enabled: false,
        trigger: 'click',
        mode: 'cell',
        showStatus: true
      },
      /**
       * 列表复选框配置
       */
      checkboxConfig:{

      },
      /**
       * 表格字段验证规则
       */
      tableRule:{},
      /**
       * 弹出窗口是否展示
       */
      tcckShow:false,
      /**
       * 弹出窗口标题
       */
      tcckTitle:''
    })
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
     * 弹窗
     * @type {Ref<UnwrapRef<{}>>}
     */
    const xModal = ref({});

    /**
     * 初始化基础信息
     * @param dxjcxx 外部提供的基础信息
     * @returns {Promise<{fields}|*>}
     */
    async function initJcxx(dxjcxx) {
      if (!dxjcxx.fields) {
        //加载对象基础信息
        await axios.post({
          sjdx: dxjcxx.sjdx,
          sys: {
            authCode: dxjcxx.sys.authCode,
            cllx: "dxjcxx"
          }
        }).then(async (rep) => {
          dxjcxx = rep.data;
        });
      }
      myData.dxjcxx = dxjcxx;
      return dxjcxx;
    }

    /**
     * 初始化字段的表格验证规则
     * @param f 对应的字段
     */
    function initTableRule(f) {
      myData.tableRule[f.zddm] = [
        {
          validator({itemValue, rule, rules, data, property}) {
            //自定义校验规则，跟后台规则一致的前端实现
            console.log(itemValue);
          }
        }
      ]
      if (getByPath(f.kzxx, "yzgz.update.notNull")) {
        //单独处理非空校验，便于在页面给用户红色星号提示必填字段
        myData.tableRule[f.zddm].push({required: true, message: f.zdmc + '必填', trigger: 'blur'});
      }
    }

    /**
     * 初始化表复选框相关配置
     * @param dxjcxx 对象基础信息
     */
    function initTableCheckbox(dxjcxx) {
      if (getByPath(dxjcxx, "sys.cllxkz.select.checkboxConfig")) {
        myData.checkboxConfig = getByPath(dxjcxx, "sys.cllxkz.select.checkboxConfig")
        //设置判断复选框选中的字段
        myData.checkboxConfig.checkField = myData.checkboxConfig.checkFieldOld+"_boolean"
      }
    }
    /**
     * 初始化表格树相关配置
     * @param dxjcxx 对象基础信息
     */
    function initTableTree(dxjcxx) {
      if (!getByPath(dxjcxx, "sys.cllxkz.select.tree.parentField")) {
        //没有配置树
        return
      }
      //树形结构采用默认序号方法
      delete myData.seqConfig.seqMethod;
      //树形结构
      myData.treeConfig = getByPath(dxjcxx, "sys.cllxkz.select.tree")
      if(myData.treeConfig.lazy===false){
        //不是懒加载
        return;
      }
      myData.treeConfig.lazy = true
      myData.treeConfig.loadMethod = function ({row}) {
        return new Promise((resolve, reject) => {
          // let yobj = assignDeep({},myData.selectReqData.yobj);
          let yobj = {};
          if (myData.dxjcxx.sjdx.yxxzd) {
            //加载树还是要考虑有效性
            yobj[myData.dxjcxx.sjdx.yxxzd] = myData.formData[myData.dxjcxx.sjdx.yxxzd];
          }
          yobj[myData.treeConfig.parentField] = row[myData.treeConfig.rowField]
          //树形结构请求数据
          const treeQqsj = {
            sjdx:{
              "dxdm":myData.dxjcxx.sjdx.dxdm,
              "id":myData.dxjcxx.sjdx.id
            },
            sys: {
              authCode: dxjcxx.sys.authCode,
              cllx: "select"
            },
            yobj: yobj,
            page: {
              pageSize: 500
            }
          }
          if(myData.treeConfig.treeQqsjkz){
            const treeQqsjkz = myData.treeConfig.treeQqsjkz;
            //请求数据扩展
            for(const key in treeQqsjkz){
              //根据当前页面的参数设置新页面的参数
              setByPath(treeQqsj,key,getByPath(myData,treeQqsjkz[key]))
            }
          }
          axios.post(treeQqsj).then(req => {
            resolve(req.data.list)
          }).catch((e) => {
            reject(null);
            console.log("查询失败：" + e);
          })
        })
      }
    }

    /**
     * 初始查询项
     * @param f 字段配置
     * @returns {{field: *, title: *, span: number}}
     */
    function initCxx(f) {
      if (f.cxzs === '1') {
        //查询默认值
        if (f.cxmrz) {
          //不管查询是否展示，查询默认值都要生效，这样可以生成一些隐藏查询条件
          myData.formData[f.zddm] = f.cxmrz;
        }
        //配置查询项
        const fi = {field: f.zddm, title: f.zdmc, span: 8}
        switch (f.kjlx) {
          case '$switch':
          case '$select':
            //还要考虑字典树
            if (f.zdfy === '1') {
              //大字典，采用下拉分页搜索框
              fi.itemRender = {name: 'MyDownList'};
              //还要考虑多选
            } else {
              //普通下拉框
              fi.itemRender = {name: 'MySelect'};
              //还要考虑多选
            }
            fi.itemRender.props = {placeholder: f.zdts, zdlb: f.zdzdlb};
            break
          case 'ElDatePicker':
            //时间选择器
            fi.itemRender = {
              name: 'ElDatePicker',
              props: {
                type: 'datetimerange',
                clearable: options.input.clearable,
                size: options.input.size,
                defaultTime: [
                  new Date(2000, 1, 1, 0, 0, 0),
                  new Date(2000, 2, 1, 23, 59, 59)
                ],
                valueFormat: "YYYYMMDDHHmmss"
              }
            };
            if (f.cxmrz) {
              const times = JSON.parse(f.cxmrz);
              let val1 = "";
              let val2 = "";
              if (times.start) {
                val1 = dayjsMethod(times.start)
              }
              if (times.end) {
                val2 = dayjsMethod(times.end)
              }
              myData.formData[f.zddm] = [val1, val2];
            }
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
              //TODO 按钮点击回调方法,以后再按表单页面扩展
              // $buttons[i].click = function(option){
              //   plcl(option.props.name,option.props);
              // }
              children.push({ props: $buttons[i] })
            }
            fi.itemRender={ name: f.kjlx,children: children,props:{}};
            break
          default:
            //默认普通输入框
            fi.itemRender = {name: '$input', props: {}};
        }
        myData.formItems.push(assignDeep(fi, f.kzxx.kjkz));
      }
    }

    /**
     * 初始化表格列信息
     * @param f 对应字段配置
     */
    function initTableColumn(f) {
      if (f.lbzs === '1') {
        //配置列表字段
        const fi = {field: f.zddm, title: f.zdmc, align: 'center', editRender: {props: {}}}
        if (f.zdkd > 10) {
          fi.width = f.zdkd + "px";
        }
        if (f.yxpx === '1') {
          fi.sortable = true;
        }
        switch (f.kjlx) {
          case 'checkbox':
            //列表选择
            fi.title = '';
            fi.type = 'checkbox';
            break
          case 'seq':
            //列表序号
            fi.type = 'seq';
            break
          case '$switch':
            //开关控件
            fi.formatter = 'formatterZd';
            fi.editRender={ name: 'MySwitch' ,
              props:{placeholder:f.zdts, zdlb: f.zdzdlb,openValue:"1",closeValue:"0"}
            };
            break
          case '$select':
            //下拉字典
            fi.formatter = 'formatterZd';
            //还要考虑字典树
            if (f.zdfy === '1') {
              //大字典，采用下拉分页搜索框
              fi.editRender = {name: 'MyDownList'};
              //还要考虑多选
            } else {
              //普通下拉框
              fi.editRender = {name: 'MySelect'};
              //还要考虑多选
            }
            fi.editRender.props = {placeholder: f.zdts, zdlb: f.zdzdlb};
            break
          case 'ElDatePicker':
            //时间控件
            fi.formatter = 'formatDate';
            fi.editRender = {
              name: 'ElDatePicker', props: {
                type: 'datetime',
                clearable: options.input.clearable,
                size: options.input.size,
                valueFormat: "YYYYMMDDHHmmss"
              }
            };
            break
          case '$textarea':
            //时间选择器
            fi.editRender = {
              name: 'textarea',
              props: {
                maxlength: f.zdcd
              }
            };
            break
          case '$buttons':
            //按钮组
            fi.params = getByPath(f.kzxx, "kjkz")
            fi.slots = {default: 'lbcz'}
            break
          default:
            fi.editRender = {name: '$input', props: {}};
        }
        //是否禁用
        fi.editRender.props.disabled = getByPath(f.kzxx, "cllxkz.update.disabled");
        //是否只读
        fi.editRender.props.readonly = getByPath(f.kzxx, "cllxkz.update.readonly");
        if (fi.editRender.props.disabled || fi.editRender.props.readonly) {
          fi.editRender.enabled = false
        }
        myData.tableColumn.push(assignDeep(fi, f.kzxx.kjkz));
      }
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
    /**
     * 获取权限列表
     * @param qxz 权限组
     * @param gdczSize 区分更多操作的按钮数
     * @param gdcz 本次是否获取更多操作
     */
    const hqqxlb = (qxz,gdczSize,gdcz=false) => {
      let qxlb = {}
      let qxlb1 = {}
      const authCode = myData.dxjcxx.sys.authCode;
      for(const cllx in qxz){
        if(hasAuth(authCode+"_"+cllx)&&!(qxz[cllx].buttonOptions.isshow===false)){
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
    const fromClose = (isFlush) =>{
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
        if(myData.selectReqData.page.totalRequired){
          myData.pagerConfig.total=req.data.totalRow;
        }
        myData.tableData=req.data.list
        xGrid.value.reloadData(req.data.list)
      }).catch((e)=>{
        console.log("查询失败："+e);
      })
    }
    /**
     * 通用后台请求
     * @param cllx 处理类型
     * @param buttonOptions 按钮参数
     * @param ids 操作id数组
     * @param row 操作行
     * @param ur 表格编辑的数据列表
     * @param changeCheckData 变化的选择数据
     */
    const htqq = (cllx,buttonOptions,ids,row,ur,changeCheckData) => {
      if(row){
        ids = [row[myData.dxjcxx.sjdx.zjzd]];
      }
      //后台请求参数
      const htqqcs = {
        sys:{
          authCode:myData.dxjcxx.sys.authCode,
          cllx:cllx,
          ids:ids,
          editTableData:ur,
          changeCheckData:changeCheckData
        }
      }
      if(buttonOptions.htqqcskz){
        //基础扩展
        for(const key in buttonOptions.htqqcskz){
          //根据当前页面的参数设置新页面的参数
          setByPath(htqqcs,key,getByPath(myData,buttonOptions.htqqcskz[key]))
        }
      }
      axios.post(assignDeep(htqqcs,buttonOptions.params)).then(req=>{
        ElMessage.success(req.msg);
        if(buttonOptions.sfsxym!==false){
          //修改数据的场景要重新统计总量
          myData.selectReqData.page.totalRequired=true
          getList()
        }
      }).catch((req)=>{
      });
    }

    /**
     * 获取列表复选框变化的数据
     * @param changeData 存储变化的数据
     * @param tableData 表格数据
     */
    function getChangeCheck(changeData, tableData) {
      const checkFieldOld = myData.checkboxConfig.checkFieldOld
      if(!checkFieldOld){
        //没有配置选中状态字段，无法区分状态变化
        return
      }
      const checkFieldNew = checkFieldOld+"_boolean"
      for(const i in tableData){
        const row = tableData[i];
        if((row[checkFieldOld] == 1) !== row[checkFieldNew]){
          //原始值不等于新值则表示变化了
          changeData[row[myData.dxjcxx.sjdx.zjzd]] = {
            "checked":row[checkFieldNew],
            "expand":xGrid.value.isTreeExpandLoaded(row),
            "obj":row
          }
        }
        if(row.children){
          //子元素迭代获取
          getChangeCheck(changeData, row.children)
        }
      }
    }

    /**
     * 批量处理<br/>
     * 考虑场景：直接后台调用、弹窗
     */
    const plcl = async (cllx,btnProps,row) =>{
      const buttonOptions = btnProps.buttonOptions;
      //操作的行数据设置为obj，便于后续使用
      myData.dxjcxx.obj = row
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
      //计算树形复选场景的选中取消情况
      //获取当前列表数据
      const tableData = xGrid.value.getTableData().tableData
      //存储复选框变化的数据
      const changeCheckData = {}
      getChangeCheck(changeCheckData,tableData);

      switch (clfs) {
        //后台请求
        case "htqq":
          if(buttonOptions.htqqts){
            ElMessageBox.confirm("你确定"+content+"吗?", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              htqq(cllx,buttonOptions,ids,row,null,changeCheckData)
            }).catch(function (){
              console.info("用户取消操作："+content)
            })
          }else{
            htqq(cllx,buttonOptions,ids,row,null,changeCheckData)
          }
          break
        //批量保存
        case "plbc":
          const ur = xGrid.value.getUpdateRecords()
          if(ur.length===0){
            ElMessage.error("没有编辑待保存的数据");
            return
          }
          const errMap = await xGrid.value.validate()
          if (errMap) {
            ElMessage.error("数据校验不通过，请检查编辑的数据！");
            return
          }
          if(buttonOptions.htqqts){
            ElMessageBox.confirm("你确定"+content+"吗?", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              htqq(cllx,buttonOptions,ids,row,ur)
            }).catch(function (){
              console.info("用户取消操作："+content)
            })
          }else{
            htqq(cllx,buttonOptions,ids,row,ur)
          }
          break
        //弹出窗口
        case "tcck":
          //窗口标题
          myData.tcckTitle=content+"【"+myData.dxjcxx.sjdx.dxmc+"】"
          //窗口显示
          myData.tcckShow=true
          if(buttonOptions.tcqp){
            //最大化
            xModal.value.maximize()
          }else{
            //还原
            xModal.value.revert()
          }
          let tdxjcxx = myData.dxjcxx;
          if(buttonOptions.dxjcxx){
            //加载对象基础信息，该按钮设置了处理其他数据对象
            let jcxxqqcs={
              sjdx:buttonOptions.dxjcxx.sjdx,
              sys:{
                authCode: buttonOptions.dxjcxx.sys.authCode,
                cllx:"dxjcxx"
              }
            }
            if(buttonOptions.jcxxqqcskz){
              //基础扩展
              for(const key in buttonOptions.jcxxqqcskz){
                //根据当前页面的参数设置新页面的参数
                setByPath(jcxxqqcs,key,getByPath(myData,buttonOptions.jcxxqqcskz[key]))
              }
            }
            await axios.post(jcxxqqcs).then((rep)=>{
              tdxjcxx = rep.data;
            });
            if(buttonOptions.dxjcxx.obj){
              //该按钮设置了数据
              tdxjcxx.obj = buttonOptions.dxjcxx.obj;
            }
            tdxjcxx.sys.cllx = getByPath(buttonOptions,"dxjcxx.sys.cllx");
            if(!tdxjcxx.sys.cllx){
              //按钮没有设置处理类型时，采用按钮的处理类型
              tdxjcxx.sys.cllx = cllx
            }
          }else{
            //默认采用按钮的处理类型
            tdxjcxx.sys.cllx = cllx
          }
          tdxjcxx.obj = row||{};
          if(buttonOptions.jcxxkz){
            //基础扩展
            for(const key in buttonOptions.jcxxkz){
              //根据当前页面的参数设置新页面的参数
              setByPath(tdxjcxx,key,getByPath(myData,buttonOptions.jcxxkz[key]))
            }
          }
          await nextTick()
          await nextTick()
          xUpdate.value.tcck(tdxjcxx, tdxjcxx.sys.cllx, buttonOptions, tdxjcxx.obj, ids);
          break
        //文件下载
        case "wjxz":
          let params = JSON.parse(JSON.stringify(myData.selectReqData));
          params.sys.cllx = cllx;
          params.sys.ids = ids;
          if(buttonOptions.dcwjm){
            //后台定制了文件名称
            params.sys.dcwjm = buttonOptions.dcwjm
          }else{
            params.sys.dcwjm = myData.dxjcxx.sjdx.dxmc+"-"+content+".xlsx";
          }
          axios.download(assignDeep(params,buttonOptions.params));
          break
        //文件上传
        case "wjsc":
          //调用文件上传接口后，再拿着返回的文件对象信息请求设置的处理类型。
          const { file,files } = await VXETable.readFile({
            multiple: true
          })
          const formBody = new FormData();
          formBody.append("sys.authCode", myData.dxjcxx.sys.authCode);
          formBody.append("sys.cllx", "upload");
          for(let i=0;i<files.length;i++){
            formBody.append("files", files[i]);
          }
          axios.upload(formBody).then((res) => {
            if (res.status) {
              axios.post({
                sys: {
                  authCode: myData.dxjcxx.sys.authCode,
                  cllx: cllx,
                  files: res.data,
                },
              }).then((response) => {
                if (response.status) {
                  ElMessage.info(response.msg?response.msg:"操作成功")
                  if(buttonOptions.sfsxym!==false){
                    //修改数据的场景要重新统计总量
                    myData.selectReqData.page.totalRequired=true
                    getList()
                  }
                }else{
                  //TODO 需要展示错误数据信息

                }
              });
            }
          });
          break
        //页面参数替换
        case "ymcsth":
          myData = assignDeep(myData,buttonOptions.params)
          break
        default:
          ElMessage.error("暂不支持该处理方式");
      }
    }
    /**
     * 批量处理后的
     * @param buttonOptions
     */
    const hxcz = (buttonOptions) => {

    }

    /**
     * 页面初始化
     * @param dxjcxx 外部提供的基础信息
     * @returns {Promise<void>}
     */
    const initPage = async (dxjcxx)=>{
      dxjcxx = await initJcxx(dxjcxx);
      initTableTree(dxjcxx);
      initTableCheckbox(dxjcxx)
      myData.formItems=[]
      myData.tableColumn=[]
      myData.tableData=[]
      myData.formData={}
      const fields = myData.dxjcxx.fields;
      for(const key in fields){
        const f = fields[key];
        initTableRule(f);
        initCxx(f);
        initTableColumn(f);
      }
      /**
       * 查询请求数据
       */
      myData.selectReqData = {
        sjdx:{
          "dxdm":myData.dxjcxx.sjdx.dxdm,
          "id":myData.dxjcxx.sjdx.id
        },
        sys:{
          authCode:myData.dxjcxx.sys.authCode,
          cllx:"select",
          dcwjm:myData.dxjcxx.sjdx.dxmc
        },
        page:{
          totalRequired:true,
          pageSize: myData.pagerConfig.pageSize
        }
      }
      //此处再进行一次myData与对象中的该处理类型扩展合并,便于对页面其他参数的设置
      myData = assignDeep(myData,getByPath(dxjcxx, "sys.cllxkz.select.pagekz"))
      //初始化查询
      await getList();
    }
    await initPage(props.dxjcxx)
    watch(()=>props.dxjcxx,function (newJcxx){
      initPage(newJcxx);
    })
    /**
     * 页面挂载后执行
     */
    onMounted(()=>{
    })
    return{
      myData,
      qxpz,
      xFrom,
      xGrid,
      xUpdate,
      xModal,
      search,
      pageChange,
      sortChange,
      close,
      hqqxlb,
      plcl,
      fromClose
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
