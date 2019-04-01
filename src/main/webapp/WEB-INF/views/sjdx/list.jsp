<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<c:if test="${sjdx.cxlbkz==null}">
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid"></my-list>
</c:if>
<c:if test="${sjdx.cxlbkz!=null}">
${sjdx.cxlbkz }
</c:if>
<script type="text/javascript">
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
var vueParams = {
   el : '#listPage',
   data: {
           fromdata:fromdata,
           sjdxid:sjdxid
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