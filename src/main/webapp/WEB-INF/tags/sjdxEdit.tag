<%@ tag language="java" pageEncoding="UTF-8"  import="cn.benma666.web.WebUtil"%>
<%@ attribute name="css" fragment="true"%>
<%@ attribute name="js" fragment="true"%>
<%@ attribute name="script" fragment="true" %>
<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<c:set var="basicUrl" value="<%=WebUtil.getBasePath(request)%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
     <base href="<%=WebUtil.getBasePath(request)%>"></base>
	 <meta charset="utf-8" />
	 <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	 <!-- <meta http-equiv="cache-control" content="no-cache" /> -->
	 <title>编辑[${sjdx.dxmc }]</title>
     <script type="text/javascript">
	     //设置全局服务地址
	     var serviceAddr = "${serviceAddr}";
	     //设置全局地址
	     var basicUrl = "${basicUrl}";
     </script>
     <!-- jquery -->
     <script type="text/javascript" src="${serviceAddr}myui/jquery/jquery-1.9.1.min.js?time=20200214"></script>
	 <!-- myutils 此脚本会自动引入模板、layer、日期控件等常用js和css-->
     <script type="text/javascript" src="${serviceAddr}myui/myutils/utils-vue.js?time=20200214"></script>
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
			        plcl:function(cllx){
			            this.$children[0].plcl(cllx);
			        }
		        }
		}
		if(typeof(sjdxZdy)=='function'){
		    sjdxZdy(vueParams);
		}
		var dataform = new Vue(vueParams);
		</script>
	  <jsp:invoke fragment="script" />
	</body>
</html>