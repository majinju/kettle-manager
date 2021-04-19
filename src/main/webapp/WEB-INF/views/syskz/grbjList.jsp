<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/edit.do?pagemodel=details&dxdm=SYS_SJGL_GRBJ_ZS&e_id={{= row.id}}" target="_blank" title="预览"><i class="icon ion-eye"></i></a>
</span>
</script>
</jsp:body>
</gd:sjdxList>