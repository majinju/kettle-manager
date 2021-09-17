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
{{if qxByQxm(user,sjdx,'JSGL')}}
<span class="divider"></span>
<a href='sjdx/list.do?dxdm=SYS_QX_YHJSGL&e_yh={{= row.id}}' 
a-oper="other" title="【{{= row.yhxm }}】用户角色管理"><i class="icon ion-toggle-filled"></i></a>
{{/if}}
</span>
</script>
<script>
function sjdxZdy(vp){
}
</script>
</jsp:body>
</gd:sjdxList>