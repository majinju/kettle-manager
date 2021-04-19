<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<!-- 数据对象列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
{{if qxByQxm(user,sjdx,'plsh')}}
<button class="btn btn-primary btn-sm" onclick="plcl('plsh')"><i class="icon ion-ios-copy-outline"></i> {{= qxByQxm(user,sjdx,'plsh').mc}}</button>
{{/if}}
</span>
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'SHTC')&&row.shzt=='0'}}
<span class="divider"></span>
<a href="sjdx/edit.do?pagemodel=edit&dxdm=SYS_ZNBK_RWSH_SHTC&myparams={{= editUrl(sjdx,row)}}"  
width="620px" height="300px"  a-oper="update" title="任务审核"><i class="icon ion-arrow-return-left"></i></a>
</span>
{{/if}}
</span>
</script>
</jsp:body>
</gd:sjdxList>