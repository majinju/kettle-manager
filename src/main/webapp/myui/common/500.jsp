<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=cn.benma666.web.WebUtil.getBasePath(request)%>"></base>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8;">
  <title>500</title>
  <meta http-equiv="X-UA-Compatible" content="IE=9">
  <!--[if lt IE 9]>
    <script src="${serviceAddr}myui/common/js/plugin/html5shiv/html5shiv.min.js"></script>
    <script src="${serviceAddr}myui/common/js/plugin/html5shiv/selectivizr.min.js"></script>
    <script src="${serviceAddr}myui/common/js/plugin/html5shiv/PIE_IE678.js"></script>
  <![endif]-->
  <!--[if IE 9]>
    <script src="${serviceAddr}myui/common/js/plugin/html5shiv/PIE_IE9.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="${serviceAddr}myui/common/style/siencestyle.css">
  <script src="${serviceAddr}myui/common/js/plugin/jquery/jquery-1.9.1.js"></script>
</head>
<body>
  <section>
    <!--[if lt IE 9]>
      <img class="bk-err" src="${serviceAddr}myui/common/img/err_bk.jpg" alt="">
    <![endif]-->
    <div class="bk-err">
      <p>
        <i class="icon icon-500"></i>
      </p>
      <p class="err-tip-500">
        <i class="icon icon-line-l"></i>
        <span class="err-span">${param.msg!=null?param.msg:'系统内部发生错误' }</span>
        <span style="display: none;"><%= exception!=null?exception.getMessage():"" %></span>
        <i class="icon icon-line-r"></i>
      </p>
      <p>
        <a class="err-a" href="javascript:alert('逗你玩呢');">请联系管理员</a>
        <a class="err-a" href="">返回登陆页</a>
      </p>
<!--       <img class="err-man" src="${serviceAddr}myui/common/img/err_man.png" alt=""> -->
    </div>
  </section>
  <script src="${serviceAddr}myui/common/js/err.js"></script>
</body>
</html>