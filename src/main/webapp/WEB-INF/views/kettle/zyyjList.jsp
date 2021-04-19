<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="javascript:downloadRz('{{= row.oid}}');" title="日志下载"><i class="icon ion-arrow-down-a"></i></a>
</span>
</script>
<script>
/**
 * 下载
 */
function downloadRz(id){
    $.download("sjdx/getFile.do?id="+sjdxid+"&e_cllx=getfile",{e_oid:id});
}
</script>
</jsp:body>
</gd:sjdxList>