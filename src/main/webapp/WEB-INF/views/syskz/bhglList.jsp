<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/getdata.do?id={{= sjdx.id}}&e_cllx=nextVal&e_bhlb={{= row['bhlb']}}" a-oper="dxcl" qrts='false' title="下一个编号"><i class="icon ion-forward"></i></a>
</span>
</script>
</jsp:body>
</gd:sjdxList>