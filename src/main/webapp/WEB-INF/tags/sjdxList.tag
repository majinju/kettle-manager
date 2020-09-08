<%@ tag language="java" pageEncoding="UTF-8"  import="cn.benma666.web.WebUtil"%>
<%@ attribute name="css" fragment="true"%>
<%@ attribute name="js" fragment="true"%>
<%@ attribute name="script" fragment="true" %>
<%@ attribute name="title"%>
<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<c:set var="basicUrl" value="<%=WebUtil.getBasePath(request)%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
     <base href="<%=WebUtil.getBasePath(request)%>"></base>
	 <meta charset="utf-8" />
	 <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	 <!-- <meta http-equiv="cache-control" content="no-cache" /> -->
	 <title>${title==null?sjdx.dxmc:title }</title>
     <script type="text/javascript">
	     //设置全局服务地址
	     var serviceAddr = "${serviceAddr}";
	     //设置全局地址
	     var basicUrl = "${basicUrl}";
     </script>
     <!-- jquery -->
     <script type="text/javascript" src="${serviceAddr}myui/jquery/jquery-1.9.1.min.js?time=20200214"></script>
	 <!-- myutils 此脚本会自动引入模板、layer、日期控件等常用js和css-->
     <script type="text/javascript" src='${serviceAddr}myui/myutils/utils-vue.js?time=${gdf:getDateTimeStr('yyyyMMddHH')}'></script>
	 <!-- 自定义引入CSS -->
	 <jsp:invoke fragment="css" />
     <!-- 自定义引入JS -->     					        			
	 <jsp:invoke fragment="js" />
</head>
   	<body>
   	  <div id="tp" data-src="${serviceAddr}myui/myutils/my-tp.html?time=20200214"></div>
   	  <script type="text/javascript">
   	  	$("#tp").includePage({});
   	  </script>
	  <jsp:doBody></jsp:doBody>
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
		           plcl:function(cllx,_this,options){
		               this.$children[0].plcl(cllx,_this,options);
		         }
		       },
		       mounted:function(){
		           lbplcz(this);
		       }
		}
		if(typeof(sjdxZdy)=='function'){
		    sjdxZdy(vueParams);
		}
		var listFrom = new Vue(vueParams);

		function plcl(cllx,_this,options){
		    listFrom.plcl(cllx,_this,options);
		}
		function lbplcz(_this){
		    $(".lbplcz").hide();
		    $(".lbplcz").each(
				function() {
				    var qxm = $(this).attr("qxm");
			    	if(qxByQxm(_this.user,_this.sjdx,qxm)){
			    	    $(this).show();
			    	}
				}
			);
		    if($("#my-sjdx-lbplcz-tp").length==0){
		        return;
		    }
		    var qtcz = $("#my-sjdx-lbplcz-tp").tmpl({sjdx:_this.sjdx,
		        user:_this.$children[0]._data.user}).html();
		    $('#lbplcz-'+_this.sjdxid).before(qtcz);
		}
		function sjdxlbcz(value,_this) {
		    return defaultLbcz(value,_this);
		}
		</script>
	  <jsp:invoke fragment="script" />
	</body>
</html>