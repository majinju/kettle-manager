<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:sjdxEdit>
<jsp:body>
<c:if test="${sjdx.bjymkz==null}">
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel" v-cloak>
</my-edit>
</c:if>
<c:if test="${sjdx.bjymkz!=null}">
${sjdx.bjymkz }
</c:if>
</jsp:body>
</gd:sjdxEdit>