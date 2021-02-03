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
<a href="javascript:xzwj('{{= row.id}}','{{= row.sjzt}}','{{= row.wjlx}}');" 
    title="文件下载"><i class="icon ion-arrow-down-a"></i></a>
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
                wjlx:"[\\s\\S]*",
                e_arqfwjj:"0",
                qcwj:'0'
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
    if(row.sjzt=="wywztb"||row.sjzt=="base64"||row.wjlx=="url"
            ||row.wjlx=="basicUrl"){
        val = row.sclj;
    }
    return val;
}
/**
 * 下载文件
 */
function xzwj(id,sjzt,wjlx){
    if(sjzt=="wywztb"){
        alertError("该类型文件不支持下载");
    }else if(sjzt=="base64"||wjlx=="url"
            ||wjlx=="basicUrl"){
        alertInfo("暂不支持该类型文件下载");
    }else{
        download(id);
    }
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
</gd:sjdxList>