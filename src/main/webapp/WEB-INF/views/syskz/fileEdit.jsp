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
/**
 * 文件内容
 */
function wjnrGsh(value,_this){
    var row = _this.$root.$children[0].editdata;
    _this.kzxxObj.file.zsxs = row.wjlx;
    var val = row.id;
    if(row.wjlx=="icon"){
        val = row.sclj;
    }
    return val;
}
/**
 * 文件大小
 */
function wjdxGsh(value,_this){
    if(null==value||value==''){
        return "未知";
    }
    var unitArr = new Array("Bytes","KB","MB","GB","TB","PB","EB","ZB","YB");
    var index=0;
    var srcsize = parseFloat(value);
    index=Math.floor(Math.log(srcsize)/Math.log(1024));
    var size =srcsize/Math.pow(1024,index);
    size=size.toFixed(2);//保留的小数位数
    return size+unitArr[index];
    return val;
}
</script>
</jsp:body>
</gd:sjdxEdit>