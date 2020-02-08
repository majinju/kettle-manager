<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
{{if qxByQxm(user,sjdx,'QCHC')}}
<button class="btn btn-primary btn-sm" onclick="plcl('qchc',null,{bxlbh:false,qrts:false})"><i class="icon ion-ios-copy-outline"></i> {{= qxByQxm(user,sjdx,'QCHC').mc}}</button>
{{/if}}
</span>
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'HQZDX')&&(row.zdlb == 'SYS_COMMON_ZDLB') }}
<span class="divider"></span>
<a href="common/zdList.do?jsongsh=true&zdlb={{= row.dm}}" a-oper="other" title="获取字典项，只对类别为字典类别的项生效"><i class="icon ion-eye"></i></a>
{{/if}}
</span>
</script>
</jsp:body>
</gd:sjdxList>