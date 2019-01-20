<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<base href="<%=cn.benma666.web.WebUtil.getBasePath(request)%>"></base>
<title>${param.title==null?projectTitle:param.title }</title>
<link href="project/style/index.css" rel="stylesheet">
</head>
<body>
    <div class="hy-iframe-container">
    	<iframe id="iframetop" src="project/topmenu.jsp?title=${param.title==null?projectTitle:param.title }" frameborder="0" scrolling="no"></iframe>
    	<div class="hy-iframe-container-area">
    		<iframe id="iframeleft" src="${param.trunUrl }leftcontent.jsp" frameborder="0"></iframe>
	    	<iframe id="iframemiddle" name="mainFrame" src="${serviceAddr}myui/editor.md/other/projectStandard/projectStandard.html" frameborder="0"></iframe>
    	</div>
    </div>
    <script type="text/javascript">
    </script>
</body>
</html>