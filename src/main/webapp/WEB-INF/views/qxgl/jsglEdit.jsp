<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:sjdxEdit>
<jsp:body>
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-edit>
<script>
/**
 * 父角色设值回调
 */
function fjsSzhd(value,_this,event){
    var from = _this.$root.$children[0];
    from.editdata=$.extend({},from.editdata,{"dm":value+"_"});
}
</script>
</jsp:body>
</gd:sjdxEdit>