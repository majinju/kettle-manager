<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${obj.bt }">
<jsp:attribute name="css">
   <link rel="stylesheet" href="myui/editor.md/examples/css/style.css" />
   <link rel="stylesheet" href="myui/editor.md/css/editormd.preview.css" />
   <link rel="stylesheet" href="myui/editor.md/other/css/style.css" />
</jsp:attribute>
<jsp:body>
<style>
ol {
    list-style-type: decimal;
}
</style>
   <div id="dataform">
    <div id="test-editormd-view" :style="isMl()?'padding-right: 260px;':'padding-right: 0px;'">
	   	<div style="text-align: center;">
	    	<h1 :title="obj.bq" :style="kzxx.markdown['标题样式']">{{obj.bt }}</h1>
	   	</div>
	   	<div>
	   		<span>更新时间：{{ dateFormat(obj.gxsj,'yyyy-MM-dd HH:mm:ss') }}，阅读次数：{{obj.ydcs }}</span>
	   		<span style="float: right;">发布人：{{obj.cjrxm }}，发布单位：{{obj.cjrdwmc }}</span>
	   	</div>
	   	<hr/>
       <textarea style="display:none;" name="test-editormd-markdown-doc">###Hello world!</textarea>
	   <span v-if="obj.fj">附件：<a style='width:100%;' :href='fjdz(obj)' target='_blank'>查看附件</a></span>
    </div>
    <div v-if="isMl()" id="sidebar">
        <h1>目录</h1>
        <div class="markdown-body editormd-preview-container" id="custom-toc-container">#目录</div>
    </div>
   </div>
<script>
function sjdxZdy(vp){
    vp.created = function(){
        var _this = this;
        var data = _this._data;
        var params = {id:_this.sjdxid};
        fromdata.yd=1;
        params.myparams = JSON.stringify(fromdata);
 		$.ajax({url : "sjdx/jcxx.do",
	      type : "post",
          async : false,
          data : params,
          success:function(result){
  			if(result.status){
  			    var rd = result.data;
			    _this.$root.sjdx = data.sjdx = rd.sjdx;
			    data.kzxx = rd.kzxx;
  			    data.fields = rd.fields;
  			    data.user = rd.user;
  			    _this.obj = rd.obj;
  			    eval("_this.kzxx="+rd.obj.kzxx);
  			    if(!_this.kzxx.markdown){
  			    	_this.kzxx.markdown = {"显示目录":true};
  			    }
  			}else{
	        	redict(result);
  			  }
 			}
          });
    };
    vp.methods = {
        dateFormat:function(dateStr,fmt){
            return dateFormat(dateStr,fmt);
        },
        isMl:function(){
            return this.kzxx.markdown['显示目录'];
        },
        fjdz:function(obj){
            return getDownloadUrl()+"?xzms=false&id="+obj.fj;
        }
    };
    vp.mounted = function () {
        var options = {
		     markdown        : this.obj.nr ,//+ "\r\n" + $("#append-test").text(),
		     //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
		     htmlDecode      : "style,script,iframe",  // you can filter tags decode
		     //toc             : false,
		     tocm            : true,    // Using [TOCM]
		     //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
		     //gfm             : false,
		     //tocDropdown     : true,
		     //markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
		     emoji           : true,
		     taskList        : true,
		     tex             : true,  // 默认不解析
		     flowChart       : true,  // 默认不解析
		     sequenceDiagram : true,  // 默认不解析
		};
        if(this.isMl()){
            options.tocContainer = "#custom-toc-container";
        }
		testEditormdView = editormd.markdownToHTML("test-editormd-view", options);
    };
}
</script>
<script>
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
var pagemodel = "${param.pagemodel}";
var vueParams = {
        el : '#dataform',
        data: {
                fromdata:fromdata,
                sjdxid:sjdxid,
                pagemodel:pagemodel,
                frommap:{}
        },
        methods:{
        }
}
if(typeof(sjdxZdy)=='function'){
    sjdxZdy(vueParams);
}
var dataform = new Vue(vueParams);
</script>
</jsp:body>
</gd:LayoutVue>