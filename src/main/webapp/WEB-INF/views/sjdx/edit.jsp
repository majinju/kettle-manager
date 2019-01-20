<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<c:if test="${sjdx.bjymkz==null}">
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-edit>
</c:if>
<c:if test="${sjdx.bjymkz!=null}">
${sjdx.bjymkz }
</c:if>
<script>
var fromdata = ${myparams};
var sjdxid = "${param.id}";
var pagemodel = "${param.pagemodel}";
var vueParams = {
        el : '#dataform',
        data: {
                fromdata:fromdata,
                sjdxid:sjdxid,
                pagemodel:pagemodel
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