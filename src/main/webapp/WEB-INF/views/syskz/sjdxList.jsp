<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<!-- 数据对象列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
{{if qxByQxm(user,sjdx,'FZDX')}}
<button class="btn btn-primary btn-sm" onclick="plcl('fzdx')"><i class="icon ion-ios-copy-outline"></i> {{= qxByQxm(user,sjdx,'FZDX').mc}}</button>
{{/if}}
{{if qxByQxm(user,sjdx,'SCDXST')}}
<button class="btn btn-primary btn-sm" onclick="plcl('scdxst')"><i class="icon ion-log-in"></i> {{= qxByQxm(user,sjdx,'SCDXST').mc}}</button>
{{/if}}
</span>
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'CKDX')}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm={{= row.dxdm}}" target="_blank" title="查看对象，查看列表页面"><i class="icon ion-eye"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'PZZD')}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=SYS_SJGL_SJZD&e_sjdx={{= row.id}}" target="_blank" title="配置字段"><i class="icon ion-levels"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'SXDX')}}
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=sxdx&e_ids={{= row[sjdx.zjzd]}}" 
a-oper="dxcl" title="刷新对象,从原始表信息更新字段"><i class="icon ion-ios-refresh"></i></a>
{{/if}}
</span>
</script>
</jsp:body>
</gd:sjdxList>