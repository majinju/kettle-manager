<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:sjdxEdit>
<jsp:body>
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel" v-cloak>
</my-edit>
<script>
function sjdxZdyjy(data,_this){
    if(_this.pagemodel!='add'){
        return true;
    }
    var wjnr = _this.fields.wjnr;
    if(wjnr.ajaxUpload._input.files.length==0){
        return true;
    }else{
        wjnr.ajaxUpload.mydata = data;
        wjnr.ajaxUpload.callback = function(file, data){
	   	    parent.listFrom.listPage.refreshPage();
  			var index = parent.layer.getFrameIndex(window.name);
   			parent.layer.close(index);
            alertInfo("上传成功");
        };
        wjnr.ajaxUpload.submit();
    }
    return false;
}
function wjnrGsh(value,_this){
    var row = _this.$root.$children[0].editdata;
    _this.kzxxObj.file.zsxs = row.wjlx;
    var val = row.id;
    if(row.wjlx=="icon"){
        val = row.sclj;
    }
    return val;
}
</script>
</jsp:body>
</gd:sjdxEdit>