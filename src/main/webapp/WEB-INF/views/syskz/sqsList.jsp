<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<!-- 授权树 -->
<div id="qxs" class="left" style="height: 100vh; width: 100%;">
	<ul :id="'leftTree-'+sjdxid" class="ztree" style="overflow-y: auto;height: calc(( 100% - 40px ));"></ul>
	<div style="text-align: center;font-size: large;height: 30px;border-top: solid #c9bdf6;">
		<button type="button" class="btn btn-default btn-sm" @click="allZk">全部展开</button>
		<button type="button" class="btn btn-default btn-sm" @click="allSq">全部收起</button>
		<button type="button" class="btn btn-default btn-sm" @click="saveSqxx">保存</button>
		<button type="button" class="btn btn-default btn-sm" a-oper="allColse">关闭</button>
	</div>
</div>
<script>
function sjdxZdy(vp){
	vp.el="#qxs";
	vp.mounted=function(){
		this.initTree();
	};
	vp.methods.saveSqxx=function(){
		var _this = this;
		var sqs = _this.sqs;
		var cns = sqs.getChangeCheckedNodes();
		var changeNodes = [];
		for(var idx in cns){
		    var cn = cns[idx];
		    changeNodes.push({checked:cn.checked,zAsync:cn.zAsync,dm:cn.dm,id:cn.id});
		}
		var fromdata = {};
        fromdata.id=_this.sjdxid;
        fromdata['e_cllx']="saveJsSqxx";
        fromdata.myparams=JSON.stringify({"changeNodes":changeNodes,dqjs:this.fromdata.dqjs});
        ajax('sjdx/plcl.do',{fromdata:fromdata,
            success:function(result){
				 var index = parent.layer.getFrameIndex(window.name);
				 parent.layer.close(index);
			}
        });
	}
	vp.methods.allZk=function(){
		var _this = this;
		var sqs = _this.sqs;
		nodes = sqs.getSelectedNodes();
		if (nodes.length == 0) {
		    sqs.expandAll(true);
		}else{
		    for (var i=0, l=nodes.length; i<l; i++) {
		        sqs.expandNode(nodes[i], true, null, null, false);
			}
		}
	}
	vp.methods.allSq=function(){
		var _this = this;
		var sqs = _this.sqs;
		nodes = sqs.getSelectedNodes();
		if (nodes.length == 0) {
		    sqs.expandAll(false);
		}else{
		    for (var i=0, l=nodes.length; i<l; i++) {
		        sqs.expandNode(nodes[i], false, null, null, false);
			}
		}
	}
	vp.methods.initTree=function(){
		var _this = this;
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			check: {
				enable: true
			},
			view:{
				fontCss: setNode,
				showLine:true,
				showIcon:true,
				nameIsHTML:true
			},
			async: {
				enable: true,
				url:"sjdx/getdata.do?dxdm=SYS_QX_QXXX",
				autoParam:["dm=map['fqx']"],
				otherParam:{"map['cllx']":"getTreeCN","map['dqjs']":this.fromdata.dqjs},
				dataFilter: treefilter
			},
			callback: {
				onClick: treeClick
			}
		};
		//树节点的单击事件
		function treeClick(event, treeId, treeNode, clickFlag) {
		}
		//处理后台返回的数据
		function treefilter(treeId, parentNode, rep) {
			if (!rep.status) return null;
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
				node.icon="common/download.do?id="+node.icon;
			}
			return {};
		}
		this.sqs = $.fn.zTree.init($('#leftTree-'+this.sjdxid), setting);
	 }
}
</script>
<script type="text/javascript">
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
fromdata.userInfo = "${param.userInfo}";
var vueParams = {
   el : '#listPage',
   data: {
           fromdata:fromdata,
           sjdxid:sjdxid,
           frommap:{}
       },
       methods:{
       }
}
if(typeof(sjdxZdy)=='function'){
    sjdxZdy(vueParams);
}
var listFrom = new Vue(vueParams);
</script>
</jsp:body>
</gd:LayoutVue>