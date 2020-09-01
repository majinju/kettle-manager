<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${obj.bt }-文档管理平台">
<jsp:attribute name="css">
   <link rel="stylesheet" href="myui/editor.md/examples/css/style.css" />
   <link rel="stylesheet" href="myui/editor.md/css/editormd.preview.css" />
</jsp:attribute>
<jsp:body>
	<style>
	ol {
	    list-style-type: decimal;
	}
	#layout > header, .btns {
	    width: auto;
	}
	
	#sidebar {
	    width: 250px;
	    position: fixed;
	    right: 0;
	    overflow: hidden;
	    background: #fff;
	    z-index: 100;
	    border: 1px solid #ddd;
	    border-top: none;
	    border-bottom: none;
	}
	
	#sidebar:hover {
	    overflow: auto;
	}
	
	#sidebar h1 {
	    font-size: 16px;
	}
	
	#custom-toc-container {
	    padding-left: 0;
	}
	
	</style>
    <div id="dataform"  v-cloak>
    <div class="cdkj" :style="'width: 100%;height: 100vh;cursor: pointer;'">
    <div v-if="isTree" class="top" style="height: 40px; width: 100%;border-bottom: solid #c9bdf6;">
		<div style="float:left;margin-left: 10px;">
		    <img :src="fileUrl('1D52A72F3B90409A8CAC65ACDE8605AE')" style="height: 40px;">
			<span style="font-size: 1.5em;vertical-align: middle;">数据世界-文档管理平台</span>
		</div>
        <span style="font-size: 1.5em;vertical-align: middle;color: sienna;" @click="wdqh(dqwd.id)">{{dqwd.bt}}</span>
        <div style="float:right;margin-right: 10px;margin-top: 20px;">
            <div style="text-align: right;">
                <span>
                                                        阅读次数：{{dqwd.ydcs }}，发布人：{{dqwd.cjrxm }}，发布单位：{{dqwd.cjrdwmc }}
                </span>
            </div>
        </div>
	</div>
	<div :style="'height: calc( 100vh - '+((isTree?70:0))+'px );width: 100%;'">
		<div v-if="isTree" style="height: 100%; width: 150px;float: left;border-right: solid #c9bdf6;">
			<div style="text-align: center;font-size: large;height: 30px;border-bottom: solid #c9bdf6;color: darkmagenta;">
				<i class="icon ion-ios-list-outline" style="vertical-align: baseline;"></i> 文档目录
			</div>
			<ul :id="'leftTree-'+sjdxid" class="ztree" style="overflow-y: auto; height: calc(( 100% - 30px));background-color: lightyellow;"></ul>
		</div>
		<div :style="'height: 100%;float: left;overflow-y: auto;padding: 10px;width: calc(( 100% - '+((isTree?150:0)+(isMl?250:0))+'px ));'">
		    <div>
			   	<div style="text-align: center;padding: 5px;">
			    	<h1 :title="obj.bq" :style="kzxx.markdown['标题样式']">{{obj.bt }}</h1>
			   	</div>
			   	<div style="text-align: left;">
			   		<span>更新时间：{{ dateFormat(obj.gxsj,'yyyy-MM-dd HH:mm:ss') }}，阅读次数：{{obj.ydcs }}，文档字数：{{obj.nr.length }}</span>
			   		<span style="float: right;">发布人：{{obj.cjrxm }}，发布单位：{{obj.cjrdwmc }}</span>
			   	</div>
			   	<hr/>
			   <div id="editormd-view">
		          <textarea style="display:none;" name="editormd-markdown-doc">###Hello world!</textarea>
		       </div>
			   <span v-if="obj.fj">附件：<a style='width:100%;' :href='fjdz(obj)' target='_blank'>查看附件</a></span>
		    </div>
		</div>
        <div :style="(isMl?'':'display:none;')+'height: calc(100% - '+((isTree?40:0)+30)+'px);'" id="sidebar">
            <h1>目录</h1>
            <div class="markdown-body editormd-preview-container" id="custom-toc-container">#目录</div>
        </div>
	</div>
    <div v-if="isTree" class="bottom" style="height: 30px;width: 100%;text-align: center;border-top: solid #c9bdf6;">
        <span style="font-size: initial;vertical-align: text-top;">系统软件版权所有@马进举</span>
    </div>
   </div>
   </div>
<script>
function sjdxZdy(vp){
    vp.data.obj = {};
    vp.data.kzxx = {};
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
  			    _this.user=data.user = rd.user;
  			    _this.obj=data.obj = rd.obj;
                _this.dqwd = rd.obj;
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
    vp.computed = {
         isMl:function(){
             return this.kzxx.markdown['显示目录'];
         },
         isTree:function(){
             return this.dqwd.parent>0;
         }
    };
    vp.methods = {
        dateFormat:function(dateStr,fmt){
            return dateFormat(dateStr,fmt);
        },
        fileUrl:function(key){
            return getDownloadUrl()+'?id='+key;
        },
        fjdz:function(obj){
            return getDownloadUrl()+"?xzms=false&id="+obj.fj;
        },
        wdqh:function(wdid,_this){
            _this = this;
            var data = _this._data;
            var params = {id:_this.sjdxid};
            fromdata.yd=1;
            fromdata.id = wdid;
            params.myparams = JSON.stringify(fromdata);
            var centerLoadingId = layer.load(0,{
                shade: [0.3]
            });
            $.ajax({url : "sjdx/jcxx.do",
              type : "post",
              async : false,
              data : params,
              success:function(result){
                if(result.status){
                    var rd = result.data;
                    data.kzxx = rd.kzxx;
                    _this.obj=data.obj = rd.obj;
                    eval("_this.kzxx="+rd.obj.kzxx);
                    if(!_this.kzxx.markdown){
                        _this.kzxx.markdown = {"显示目录":true};
                    }
                    _this.options.markdown = rd.obj.nr;
                    if(_this.isMl){
                        _this.options.tocContainer = "#custom-toc-container";
                    }else{
                        _this.options.tocContainer = "";
                    }
                    $("#editormd-view").html("");
                    $("#custom-toc-container").html("");
                    _this.editormdView = editormd.markdownToHTML("editormd-view", _this.options);
                    layer.close(centerLoadingId);
                }else{
                    redict(result);
                  }
                }
              });
        },
        initTree:function(){
            var _this = this;
            var setting = {
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                view:{
                    fontCss: setNode,
                    showLine:true,
                    showIcon:true,
                    nameIsHTML:true
                },
                async: {
                    enable: true,
                    url:"sjdx/getdata.do?id="+_this.sjdxid,
                    autoParam:["dm=e_sjbj"],
                    otherParam:{
                        "e_cllx":"getTreeCN",
                        //菜单树根节点
                        "e_treeRoot":_this.obj.id
                        },
                    dataFilter: treefilter
                },
                callback: {
                    onClick: treeClick
                }
            };
            //树节点的单击事件
            function treeClick(event, treeId, treeNode, clickFlag) {
                _this.wdqh(treeNode.dm);
            }
            //处理后台返回的数据
            function treefilter(treeId, parentNode, rep) {
                if (!rep.status){
                    alertError("获取文档目录失败："+rep.msg);
                    return null;
                }
                var list = rep.data.list;
                var cdList = [];
                for (var i=0, l=list.length; i<l; i++) {
                    list[i].isParent=(list[i].parent>0);
                    cdList.push(list[i]);
                }
                return cdList;
            }
            //节点展示前的处理
            function setNode(treeId, node) {
                if(node.myIcon){
                    node.name='<i class="icon '+node.myIcon+'" style="color:red;"></i> '+node.name;
                }
                if(node.icon){
                    node.icon=getDownloadUrl()+"?id="+node.icon;
                }
                return {};
            }
            $.fn.zTree.init($('#leftTree-'+this.sjdxid), setting);
        }
    };
    vp.mounted = function () {
        var _this = this;
        //水印
        watermark({"watermark_txt":_this.user.yhxm+","+_this.user.sfzh}); 
        _this.initTree();
        _this.options = {
		     markdown        : _this.obj.nr ,//+ "\r\n" + $("#append-test").text(),
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
        if(this.isMl){
            _this.options.tocContainer = "#custom-toc-container";
        }
		_this.editormdView = editormd.markdownToHTML("editormd-view", _this.options);
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