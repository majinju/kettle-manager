<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<div id="sjdx">
<c:if test="${sjdx.cxlbkz==null}">
<my-list v-if="pagemodel == 'list'" id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<my-edit v-else-if="pagemodel == 'add'" id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-edit>
<my-edit v-else-if="pagemodel == 'edit'" id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-edit>
<my-echarts v-else-if="pagemodel == 'echarts'" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-echarts>
<div v-else>
<div style="width: 600px;height:400px;"></div>
</div>
</c:if>
<c:if test="${sjdx.cxlbkz!=null}">
${sjdx.cxlbkz }
</c:if>
</div>
<script type="text/javascript">
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
var pagemodel = "${param.pagemodel}";
var vueParams = {
   el : '#sjdx',
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
var listFrom = new Vue(vueParams);
</script>
</jsp:body>
</gd:LayoutVue>