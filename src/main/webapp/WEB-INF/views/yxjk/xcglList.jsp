<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<!-- 监控任务列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
    <button qxm="ZDXC" class="lbplcz btn btn-primary btn-sm"  @click="plcl('zdxc')">
    	<i class="icon ion-pause"></i> 中断线程</button>
    <button qxm="JSXC" class="lbplcz btn btn-primary btn-sm"  @click="plcl('jsxc')">
    	<i class="icon ion-stop"></i> 结束线程</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
</script>
<script>
function sjdxZdy(vp){
}
</script>
</jsp:body>
</gd:sjdxList>