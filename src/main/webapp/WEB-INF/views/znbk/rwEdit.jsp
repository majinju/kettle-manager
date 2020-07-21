<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:sjdxEdit>
<jsp:body>
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel" v-cloak>
</my-edit>

<script>
function sjdxZdy(vp){
    vp.mounted=function () {
		if(pagemodel=='add'){
	        $("[name='sjwj']").after('<a target="_blank" style="margin-left: 20px;text-decoration: underline;'
    			+'font-size: larger;vertical-align: bottom;" href="sjdx/getMb.do?dxdm=SYS_ZNBK_HM">模板下载</a>');
		}
    }
}
</script>
</jsp:body>
</gd:sjdxEdit>