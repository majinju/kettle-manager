<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<!-- 转换列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
        <button class="btn btn-primary btn-sm" @click="plcl('drzh',null,{bxlbh:false,qrts:false})">
        	<i class="icon ion-upload"></i> 导入转换</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=ml&e_ids={{= row[sjdx.zjzd]}}" 
a-oper="dxcl" qrts='false' title="【{{= row.name}}】目录"><i class="icon ion-ios-folder"></i></a>
<span class="divider"></span>
<a href="sjdx/getFile.do?id={{= sjdx.id}}&e_cllx=zht&e_ids={{= row[sjdx.zjzd]}}" 
a-oper="other" title="【{{= row.name}}】转换图"><i class="icon ion-network"></i></a>
</span>
</script>
<script>
</script>
</jsp:body>
</gd:sjdxList>