<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:sjdxEdit>
<jsp:body>
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel" v-cloak>
</my-edit>
<script>
function sjdxZdy(vp){
    vp.data.fromdata.qdzdyFun=function(data,_this){
        if(!data.status&&data.code=='sjnrcw'){
            popUpFullWinLayer({"url":"sjdx/list.do?dxdm=SYS_LOG_SJSCCW&e_sjwj="+_this._data.updatedata.sjwj,
                "name":"数据上传错误信息列表"});
        }else{
            if(parent.listFrom&&parent.listFrom.listPage){
                parent.listFrom.listPage.refreshPage();
            }
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }
    }
}

</script>
</jsp:body>
</gd:sjdxEdit>