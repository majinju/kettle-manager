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
{{if qxByQxm(user,sjdx,'GZZD')}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=SYS_BDHC_GZZD&e_gz={{= row.id}}" a-oper="other" title="规则字段配置">
<i class="icon ion-levels"></i></a>
{{/if}}
</span>
</script>
</jsp:body>
</gd:sjdxList>