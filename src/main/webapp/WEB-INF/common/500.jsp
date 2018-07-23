<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.log4j.Logger"%>

<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");

	//记录日志
	Logger logger = Logger.getLogger("500.jsp");
	logger.error(ex.getMessage(), ex);
	pageContext.setAttribute("myError", ex.getMessage());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>系统内部错误</title>
</head>

<body>
<form id="form0" name="form0" action="" method="post">
	<div class="module f_left width_100 margin_t10" style="width: 99%;">
	       <div class="listtitle">提醒</div>    
	       <ul class="newlist">
	           <h1>系统发生内部错误.</h1><br/>
	           <h1>
	           		${myError }
	           </h1>
	       </ul>   
	</div>
</form>
</body>
</html>
