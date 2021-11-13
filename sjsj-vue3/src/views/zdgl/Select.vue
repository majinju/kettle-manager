<template>
  <div class="page-warp">
    <div class="page-title"><i class="el-icon-s-home"> /  系统-数据世界-字典管理</i></div>
    <header class="page-header">
      <vxe-form :data="parames.formData" :items="parames.formItems"
                :rules="parames.formRule" @submit="searchHandle" ref="xFrom">
        <template #button>
          <vxe-button type="button" icon="vxe-icon--search" status="primary" @click="searchHandle" content="查询" size="small"></vxe-button>
          <vxe-button   @click="$refs.xFrom.toggleCollapse(parames.collapsable=!parames.collapsable)" size="small">更多
            <i :class="parames.collapsable ? 'vxe-icon--arrow-top' : 'vxe-icon--arrow-bottom'"></i>
          </vxe-button>
        </template>
      </vxe-form>
    </header>
    <div class="page-main">
      <div class="custom-table">
        <vxe-grid
          ref="xGrid"
          :data="parames.tableDate"
          :export-config="parames.exportConfig"
          :toolbar-config="parames.tableToolbar"
          :columns="parames.tableColumn"
          :pager-config="parames.pagerConfig"
          @checkbox-all="checkboxChangeEvent"
          @checkbox-change="checkboxChangeEvent"
          @sort-change="sortChange"
        >
          <template #toolbar_buttons>
            <span class="page-main-header-title">数据展示</span>
            <vxe-button status="primary" @click="addButton">新增</vxe-button>
            <vxe-button status="primary" @click="deteleButton">批量删除</vxe-button>
          </template>
          <template #toolbar_right>
            <el-button plain @click="exportHandle" icon="fa fa-download" size="mini">导出当前页</el-button>
            <el-button plain @click="exportAllHandle" icon="fa fa-download" size="mini">导出全部 </el-button>
          </template>
          <template #operate="{ row }">
            <el-button type="text" title="编辑"  @click="editButton(row)">编辑</el-button>
            <el-button type="text" title="删除"  @click="deteleButton(row)">删除</el-button>
            <el-button type="text" title="详情"  @click="detailButton(row)">详情</el-button>
          </template>
          <template #pager>
            <vxe-pager
              :layouts="['Sizes', 'PrevJump', 'PrevPage', 'Number', 'NextPage', 'NextJump', 'FullJump', 'Total']"
              v-model:current-page="parames.pager.currentPage"
              v-model:page-size="parames.pager.pageSize"
              v-model:page-sizes="parames.pager.pageSizes"
              :total="parames.pager.total"
              @page-change="handlePageChange">
            </vxe-pager>
          </template>
        </vxe-grid>
      </div>
    </div>
    <update ref="zdlbAdd" @upnode="upnode" v-if="parames.dioShow"></update>
  </div>
</template>
<script>
import {defineComponent, reactive, onMounted, ref, nextTick,toRaw} from 'vue'
import { ElMessage ,ElMessageBox} from "element-plus";
import axios from "@/axios";
import Update from '@/views/zdgl/Update'
import {options} from "@/plugins/vxe-table";
import {zdTree,zdList} from "@/utils/common"

export default defineComponent({
  name:'Select',
  components:{Update},
  setup:async ()=>{
    const zdlbAdd = ref();
    let orgTree = null;
    await zdTree("SYS_COMMON_ORG").then(function (tree){
      orgTree = tree;
    });
    let zdLjpd = null;
    await zdList("SYS_COMMON_LJPD").then(function (tree){
      zdLjpd = tree;
    });
    const parames = reactive({
      dioShow:false,
      collapsable:false,
      //查询项初始数据
      formData:{
        zdlb:'SYS_COMMON_ZDLB',
        yxx:'1',
      },
      //列表字段
      tableColumn: [
        {type:'checkbox',width:50},
        { type: 'seq', width: 50,title: '序号',align:'center'},
        { field: 'dm', title: '代码',align:'center' ,sortable:true},
        { field: 'px', title: '排序' ,align:'center',sortable:true},
        { field:'zdlb', title: '字典类别',align:'center',formatter: "formatterZd"},
        { field: 'mc', title: '名称' ,align:'center'},
        { field: 'ms', title: '描述' ,align:'center'},
        { field: 'gxsj', title: '更新时间' ,align:'center',formatter: "formatDate"},
        { field: 'upnode', title: '父节点' ,align:'center',formatter: "formatterZd"},
        {title: '操作',align: 'center',width: '170',slots:{default:'operate'}}
      ],
      //查询条件字段
      formItems:[
        { field: 'dm', title: '代码', span: 8, itemRender: { name: '$input' ,props:{}}},
        {field: 'zdlb',title: '字典类别',span: 8,itemRender: { name: 'MyDownList',props:{zdlb:'SYS_COMMON_ZDLB'}}},
        { field: 'mc', title: '名称', span: 8, itemRender: { name: '$input',props:{}}},
        { field: 'ms', title: '描述', span: 8, itemRender: { name: '$input' ,props:{}}},
        { field: 'lbsql', title: '类别sql', span: 8, itemRender:{ name: '$input' ,props:{}}},
        { field: 'gxsj', title: '更新时间',folding:true, span: 8, itemRender: { name: 'ElDatePicker',props:{type:'daterange',clearable:options.input.clearable,size:options.input.size} }},
        {field: 'upnode',title: '父节点',folding:true,span: 8,itemRender:  { name: 'ElCascader',props:
              {props: {value:options.select.optionProps.value,label:options.select.optionProps.label},
                options:orgTree,filterable:true,clearable:options.input.clearable,size:options.input.size}}},
        { field: 'yxx', title: '有效性',folding:true, span: 8, itemRender:
            { name: '$select' ,props:{placeholder:'请选择',clearable:true},options: zdLjpd}},
        { field: 'cache', title: '是否缓存',span: 8, itemRender:
            { name: '$select' ,props:{placeholder:'请选择',clearable:true}, options: zdLjpd}},
        {align:'right',span: 24,slots:{default: 'button'}}
      ],
      //查询条件验证规则
      formRule:{
      },

      //导出配置
      exportConfig: {
      },
      pagerConfig:{
      },
      tableToolbar: {
        export: false,
        size:'mini',
        slots: {
          buttons: 'toolbar_buttons',
          tools:'toolbar_right'
        },
      },
      tableDate:[],
      pager:{
        currentPage: 1,
        pageSize: 10,
        total: 0,
        pageSizes: [2,5, 10, 50, 100]
      },
      activeData:[],
    })
    const xGrid = ref({});
    onMounted(() =>{
      //初始化查询
      getList();
    })
    /**
     * 自定义字段排序
     * @param column
     */
    const sortChange = ({column})=>{
      getList(column.property,column.order)
    }

    const getList = (sort,order) =>{
      axios.post({
        sjdx:{
          dxdm:"SYS_SJGL_TYZD_DEMO"
        },
        page:{
          totalRequired:true,
          pageSize: parames.pager.pageSize,
          pageNumber:parames.pager.currentPage,
          orderBy:order ? sort+" "+order : ""
        },
        sys:{
          cllx:"select"
        },
        yobj:parames.formData
      }).then(req=>{
        if(req.status){
          parames.tableDate= req.data.list;
          parames.pager.total=req.data.totalRow;
        }else {
          ElMessage.success(req.msg ? req.msg : "查询错误")
        }
      })
    }
    const handlePageChange = ( {currentPage, pageSize} )=>{
      parames.pager.currentPage=currentPage
      parames.pager.pageSize=pageSize
      getList();
    }
    const searchHandle = () =>{
      parames.pager.currentPage=1
      getList()
    }
    const addButton = () =>{
      parames.dioShow=true
      nextTick(()=>{
        zdlbAdd.value.addDialog()
      })
    }
    const checkboxChangeEvent = (val) =>{
      parames.activeData=val
    }
    const deteleButton = (val) =>{
      let id=val.id
      let ids = [];
      if (id) {
        ids = [id];
      } else {
        if (parames.activeData.length === 0) {
          ElMessage.warning("请选择要操作的数据");
          return;
        }
        parames.activeData.records.forEach(item => {
          ids.push(item.id);
        });
      }
      ElMessageBox.confirm("你确定执行此操作吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        axios.post({
          sjdx:{
            dxdm:'SYS_SJGL_TYZD_DEMO'
          },
          sys:{
            cllx:"plsc",
            ids:ids,
          },
        }).then(req=>{
          if (req.status) {
            ElMessage.success(req.msg);
            getList()
          } else {
            ElMessage.success(req.msg ? req.msg : "删除失败");
          }
        })
      }).catch(()=>{});
    }
    const editButton = (row) =>{
      parames.dioShow=true
      nextTick(()=>{
        zdlbAdd.value.editDialog(row.id)
      })
    }
    const detailButton = (row) =>{
      parames.dioShow=true
      nextTick(()=>{
        zdlbAdd.value.detailDialog(row.id)
      })
    }
    const upnode = (val) =>{
      parames.dioShow=false
      if(val===true){
        getList()
      }
    }
    const exportHandle = (pageSize, pageIndex, title,cllx) =>{
      title = title ? title : "系统-字典管理-当前页";
      let czlx= cllx===undefined ? "dcdqysj" : cllx
      if(cllx===undefined){
        let data = {
          sjdx:{dxdm:"SYS_SJGL_TYZD_DEMO"},
          sys:{cllx:czlx,dcwjm:title+".xlsx"},
          page:{
            pageSize:parames.pager.pageSize,
            pageNumber: parames.pager.currentPage,
          },
          yobj:parames.formData
        };
        axios.download(data)
      }else {
        let data = {
          sjdx:{dxdm:"SYS_SJGL_TYZD_DEMO"},
          sys:{cllx:czlx,dcwjm:title+".xlsx"},
          page:{
            pageSize:pageSize,
            pageNumber: pageIndex,
          },
          yobj:parames.formData
        };
        axios.download(data)
      }
    }
    const exportAllHandle =() =>{
      exportHandle(5000, 1, "系统-字典管理-全部","dcsj");
    }
    return{
      xGrid,
      parames,
      searchHandle,
      close,
      addButton,
      deteleButton,
      editButton,
      detailButton,
      handlePageChange,
      zdlbAdd,
      upnode,
      checkboxChangeEvent,
      exportHandle,
      exportAllHandle,
      sortChange,
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

