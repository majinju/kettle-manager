<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<!-- 复制平台编辑扩展 -->
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
      <button type="button" class="btn btn-primary btn-sm" @click="plcl('plsc')">确定删除</button>
</my-edit>
<script>
function sjdxZdy(vp){
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
//     vp.data.fromdata.qdzdyFun=function(data,_this){
//     }
}
</script>
<script>
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
var pagemodel = "${param.pagemodel}";
var vueParams = {
        el : '#dataform',
        data: {
                fromdata:fromdata,
                sjdxid:sjdxid,
                pagemodel:pagemodel,
                frommap:{}
        },
        methods:{
        }
}
if(typeof(sjdxZdy)=='function'){
    sjdxZdy(vueParams);
}
var dataform = new Vue(vueParams);
</script>
</jsp:body>
</gd:LayoutVue>