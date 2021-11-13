<template>
  <div :key="myData.timestamp" class="page-warp" v-cloak>
    <div class="page-title"><i class="el-icon-s-home"> / {{myData.dxjcxx.sjdx.dxmc}}</i></div>
    <div class="page-header">
      <vxe-form ref="xForm" :data="myData.formData" :items="myData.formItems" :rules="myData.formRule" @submit="getList">
      </vxe-form>
    </div>
    <div class="page-main">
      <div class="custom-table">
        <vxe-grid
          ref="xGrid" :toolbar-config="myData.tableToolbar" :columns="myData.tableColumn"
          :data="myData.tableData" :export-config="myData.exportConfig"
          :seq-config="myData.seqConfig"
          :pager-config="myData.pagerConfig"
          @page-change="pageChange"
          @sort-change="sortChange"
        >
          <template #toolbar_buttons>
            <span class="page-main-header-title">数据展示</span>
            <el-button-group>
              <el-button type="primary" @click="addButton" :size="myData.options.size">新建</el-button>
              <el-button type="primary" @click="deteleButton" :size="myData.options.size">批量删除</el-button>
            </el-button-group>
          </template>
          <template #toolbar_right>
            <el-button plain @click="exportHandle" icon="fa fa-download" size="mini">导出当前页</el-button>
            <el-button plain @click="exportAllHandle" icon="fa fa-download" size="mini">导出全部 </el-button>
          </template>
          <template #operate="{ row }">
            <vxe-button status="primary" type="text" title="编辑"  @click="editButton(row)">编辑</vxe-button>
            <vxe-button status="primary" type="text" title="删除"  @click="deteleButton(row)">删除</vxe-button>
            <vxe-button status="primary" type="text" title="详情"  @click="detailButton(row)">详情</vxe-button>
          </template>
        </vxe-grid>
      </div>
    </div>
    <vxe-modal v-model="myData.updateShow" :title="myData.updateTitle"
               :before-hide-method="close">
      <suspense>
        <my-update ref="xUpdate" @updateCallback="updateCallback"></my-update>
      </suspense>
    </vxe-modal>
  </div>
</template>
<script>
import {defineComponent, reactive, onMounted, ref, nextTick, watch} from 'vue'
import { ElMessage ,ElMessageBox} from "element-plus";
import { useStore } from "vuex";
import axios from "@/axios";
import {zdList} from "../../utils/common";
import {options} from "@/plugins/vxe-table";
import MyUpdate from '@/views/common/MyUpdate'
import router from "../../router";
import {useRoute} from "vue-router";

export default defineComponent({
  name: "MySelect",
  components:{MyUpdate},
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
  setup:async (props)=>{
    const route = useRoute();
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
        export: false,
        custom: false,
        size:'mini',
        slots: {
          buttons: 'toolbar_buttons',
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
       * 列表字段信息
       */
      tableColumn: [],
      /**
       * 列表序号配置
       */
      seqConfig:{
        seqMethod ({ rowIndex }) {
          return myData.pagerConfig.pageSize*(myData.pagerConfig.currentPage-1)+rowIndex+1;
        }
      },
      /**
       * 列表数据
       */
      tableData:[],
      /**
       * 分页配置
       */
      pagerConfig:{
        pageSize: options.pager.pageSize,
        currentPage:1,
        total: null
      },
      /**
       * 修改弹窗是否展示
       */
      updateShow:false,
      /**
       * 弹窗标题
       */
      updateTitle:''
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
    })
    //加载对象基础信息
    await axios.post({
      sjdx:props.sjdx,
      sys:{
        authCode: props.sys.authCode,
        cllx: "dxjcxx"
      }
    }).then(async (rep)=>{
      myData.dxjcxx=rep.data;
      const fields = rep.data.fields;
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
          switch (f.kjlx){
            case '$switch':
            // fi.itemRender={ name: '$switch' ,props:{placeholder:f.zdts}};
            // break
            case '$select':
              if(f.zdfy==='1'){
                //大字典，采用下拉分页搜索框
                fi.itemRender={ name: 'MyDownList' ,props:{placeholder:f.zdts,zdlb:f.zdzdlb}};
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
        if(f.lbzs==='1'){
          //配置列表字段
          fi = {field: f.zddm, title: f.zdmc,align:'center'}
          if(f.zdkd>10&&f.zdkd<=200){
            fi.width = f.zdkd;
          }
          if(f.yxpx==='1'){
            fi.sortable = true;
          }
          //特殊字段处理
          if(f.zddm==='myLbxz'){
            fi.title='';
            fi.type='checkbox';
          }else if(f.zddm==='myLbxh'){
            fi.type='seq';
          }else if(f.zddm==='dxcz'){
            fi.slots={default:'operate'}
          }else{
            //通用处理
            switch (f.kjlx){
              case '$switch':
              case '$select':
                fi.formatter='formatterZd';
                fi.cellRender={ };
                break
              case 'ElDatePicker':
                fi.formatter='formatDate';
                fi.cellRender={ };
                break
              default:
                fi.cellRender={ };
            }
          }
          myData.tableColumn.push(fi);
        }
      }
      myData.formItems.push({ align: 'right', span: 24, itemRender: { name: '$buttons', children: [
            { props: { type: 'submit', content: '查询', status: 'primary' } }
          ]}});
    });
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
      getList();
    }
    /**
     * 自定义字段排序
     * @param column
     */
    const sortChange = ({column})=>{
      myData.selectReqData.page.orderBy = column.order?(column.property+" "+column.order):"";
      getList();
    }
    /**
     * 执行分页查询
     */
    const getList = () =>{
      myData.selectReqData.yobj = myData.formData;
      axios.post(myData.selectReqData).then(req=>{
        myData.tableData= req.data.list;
        myData.pagerConfig.total=req.data.totalRow;
      })
    }
    /**
     * 新建
     */
    const addButton = () =>{
      myData.updateShow=true
      myData.updateTitle="新增【"+myData.dxjcxx.sjdx.dxmc+"】"
      nextTick(()=>{
        xUpdate.value.addDialog()
      })
    }
    /**
     * 编辑
     * @param row 这行数据
     */
    const editButton = (row) =>{
      myData.updateShow=true
      myData.updateTitle="编辑【"+myData.dxjcxx.sjdx.dxmc+"】"
      nextTick(()=>{
        xUpdate.value.editDialog(row[myData.dxjcxx.sjdx.zjzd])
      })
    }
    /**
     * 详情
     * @param row 这行数据
     */
    const detailButton = (row) =>{
      myData.updateShow=true
      myData.updateTitle="详情【"+myData.dxjcxx.sjdx.dxmc+"】"
      nextTick(()=>{
        xUpdate.value.detailDialog(row[myData.dxjcxx.sjdx.zjzd])
      })
    }
    /**
     * 修改页面回调
     * @param isFlush 是否刷新页面
     */
    const updateCallback = (isFlush) =>{
      myData.updateShow=false
      if(isFlush){
        getList()
      }
    }
    /**
     * 删除
     * @param row 这行数据
     */
    const deteleButton = (row) =>{
      let id=row.id
      let ids = [];
      if (id) {
        ids = [id];
      } else {
        const cr = xGrid.value.getCheckboxRecords(true);
        if (cr.length === 0) {
          ElMessage.warning("请选择要操作的数据");
          return;
        }
        cr.forEach(item => {
          ids.push(item.id);
        });
      }
      ElMessageBox.confirm("你确定删除这个"+ids.length+"行数据吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        axios.post({
          sys:{
            authCode:myData.dxjcxx.sys.authCode,
            cllx:"plsc",
            ids:ids
          }
        }).then(req=>{
          ElMessage.success(req.msg);
          getList()
        })
      }).catch(()=>{
        ElMessage.error(req.msg ? req.msg : "删除失败");
      });
    }
    const exportHandle = () =>{
      let data = JSON.parse(JSON.stringify(myData.selectReqData));
      data.sys.cllx='dcdqysj';
      data.sys.dcwjm += ".xlsx";
      axios.download(data);
    }
    const exportAllHandle =() =>{
      let data = JSON.parse(JSON.stringify(myData.selectReqData));
      data.sys.cllx='dcsj';
      data.sys.dcwjm += "-全部.xlsx";
      data.page.pageSize=5000;
      data.page.pageNumber=1;
      axios.download(data);
    }
    //初始化查询
    getList();
    // watch(()=>route.query.authCode,(to,old)=>{
    //   console.log('路由发生了变化')
    //   console.log(to)
    //   console.log('传递过来的props')
    //   console.log(props.sys)
    //   console.log(props.sjdx)
    //   myData.dxjcxx.sys.authCode=to
    //   props.sys.authCode=to
    // })
    return{
      myData,
      xFrom,
      xGrid,
      xUpdate,
      getList,
      pageChange,
      sortChange,
      close,
      addButton,
      editButton,
      detailButton,
      deteleButton,
      exportHandle,
      exportAllHandle,
      updateCallback
    }
  }
})
</script>

<style scoped lang="scss">
.vxe-grid{
  .vxe-cell{
    .vxe-button{
      padding: 0;
      margin-left: 5px;
    }
  }
}
</style>
