<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
	<my-file qxm="WJSC" class="lbplcz" :id="'wjsc-'+sjdxid" 
		edit="true" :field="field" @setval="setWjsc">文件上传</my-file>
	<span :id="'lbplcz-'+sjdxid"></span>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'WJXZ')}}
<span class="divider"></span>
<a href="javascript:download('{{= row.id}}');" title="文件下载"><i class="icon ion-arrow-down-a"></i></a>
{{/if}}
</span>
</script>
<script>
function sjdxZdy(vp){
    vp.data.field={
        kzxx:{
            file:{
                sjzt:"default",
                ywdm:"common",
                wjlb:"wjgl",
                e_arqfwjj:"0"
            }
        }
    };
    vp.methods={
        setWjsc:function(field,event) {
            alertInfo("上传成功！");
            this.$root.listPage.refreshPage();
      	}
    }
}
function wjnrGsh(value,_this){
    var row = _this.$parent.$parent.row;
    _this.kzxxObj.file.zsxs = row.wjlx;
    var val = row.id;
    if(row.wjlx=="icon"){
        val = row.sclj;
    }
    return val;
}
</script>
</jsp:body>
</gd:sjdxList>