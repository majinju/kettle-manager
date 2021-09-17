<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
<button class="btn btn-primary btn-sm" onclick="plcl('scjkrw',null,{bxlbh:false})"><i class="icon ion-pull-request"></i> 生成监控任务</button>
</span>
</script>
<script>
function yydz(value,_this) {
    if(value&&_this.$root.fromdata["my-lbkbj"]!='1'){
    	return "<a href='"+value+"' target='_blank'>"+value+"</a>";
 	}else{
 	    return value;
 	}
}
</script>
</jsp:body>
</gd:sjdxList>