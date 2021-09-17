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
{{if qxByQxm(user,sjdx,'QXS')}}
<span class="divider"></span>
<a href='sjdx/list.do?dxdm=SYS_QX_JSQXGL_SQS&myparams={{= encodeURI(JSON.stringify({"dqjs":row.dm}))}}' 
a-oper="other" title="【{{= row.mc }}】角色权限管理"><i class="icon ion-toggle-filled"></i></a>
{{/if}}
</span>
</script>
<script>
function sjdxZdy(vp){
}
</script>
</jsp:body>
</gd:sjdxList>