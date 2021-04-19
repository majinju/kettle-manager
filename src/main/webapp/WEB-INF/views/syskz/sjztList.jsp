<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
<button class="btn btn-primary btn-sm" onclick="plcl('scjkrw',null,{bxlbh:false})"><i class="icon ion-pull-request"></i> 生成监控任务</button>
<button class="btn btn-primary btn-sm" onclick="plcl('cszt',null,{bxlbh:true})"><i class="icon ion-loop"></i> 测试载体</button>
</span>
</script>
</jsp:body>
</gd:sjdxList>