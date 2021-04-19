<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:sjdxEdit>
<jsp:body>
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel" v-cloak>
      <button type="button" class="btn btn-primary btn-sm" @click="plcl('plsc')">确定删除</button>
</my-edit>
</jsp:body>
</gd:sjdxEdit>