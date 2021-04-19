<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=mmjm&e_pw={{= row.password}}" a-oper="dxcl" qrts='false' title="解密密码"><i class="icon ion-scissors"></i></a>
</span>
</script>
<script>
</script>
</jsp:body>
</gd:sjdxList>