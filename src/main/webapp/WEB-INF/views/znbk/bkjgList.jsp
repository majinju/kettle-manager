<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
    <button qxm="PLQS" class="lbplcz btn btn-primary btn-sm"  @click="plcl('plqs')">
        <i class="icon ion-checkmark-round"></i> 签收</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'FK')}}
{{if row.zlzt=='0'}}
<span class="divider"></span>
<a href="sjdx/plcl.do?dxdm={{= sjdx.dxdm}}&e_cllx=plqs&e_ids={{= row[sjdx.zjzd]}}" 
a-oper="dxcl" title="签收"><i class="icon ion-checkmark-round"></i></a>
{{/if}}
{{if row.zlzt!='0'}}
<span class="divider"></span>
<a href="sjdx/edit.do?pagemodel=add&dxdm=SYS_BDHC_FK&e_bkjg={{= row.id }}"  
 a-oper="update" title="反馈"><i class="icon ion-arrow-return-left"></i></a>
{{/if}}
{{if row.zlzt=='9'}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=SYS_BDHC_FK&e_bkjg={{= row.id }}"  
 a-oper="update" title="反馈记录"><i class="icon ion-ios-list-outline"></i></a>
{{/if}}
{{/if}}
</span>
</script>
</jsp:body>
</gd:sjdxList>