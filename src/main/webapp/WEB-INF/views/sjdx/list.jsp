<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<c:if test="${sjdx.cxlbkz==null}">
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid" v-cloak></my-list>
</c:if>
<c:if test="${sjdx.cxlbkz!=null}">
${sjdx.cxlbkz }
</c:if>
</jsp:body>
</gd:sjdxList>