<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=cn.benma666.web.WebUtil.getBasePath(request)%>"></base>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8;">
  <title>403</title>
  <meta http-equiv="X-UA-Compatible" content="IE=9">
  <!--[if lt IE 9]>
    <script src="${serviceAddr}aui/common/js/plugin/html5shiv/html5shiv.min.js"></script>
    <script src="${serviceAddr}aui/common/js/plugin/html5shiv/selectivizr.min.js"></script>
    <script src="${serviceAddr}aui/common/js/plugin/html5shiv/PIE_IE678.js"></script>
  <![endif]-->
  <!--[if IE 9]>
    <script src="${serviceAddr}aui/common/js/plugin/html5shiv/PIE_IE9.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="${serviceAddr}aui/common/style/siencestyle.css">
  <script src="${serviceAddr}aui/common/js/plugin/jquery/jquery-1.9.1.js"></script>
</head>
<body>
  <section>
    <!--[if lt IE 9]>
      <img class="bk-err" src="${serviceAddr}aui/common/img/err_bk.jpg" alt="">
    <![endif]-->
    <div class="bk-err">
      <p>
        <i class="icon icon-4"></i>
        <i class="icon icon-0"></i>
        <i class="icon icon-3"></i>
      </p>
      <p class="err-tip">
        <i class="icon icon-line-l"></i>
        <span class="err-span">您访问的地址受权限控制</span>
        <i class="icon icon-line-r"></i>
      </p>
      <p>
        <a class="err-a" href="#">请联系管理员</a>
      </p>
<!--       <img class="err-man" src="${serviceAddr}aui/common/img/err_man.png" alt=""> -->
    </div>
  </section>
  <script src="${serviceAddr}aui/common/js/err.js"></script>
</body>
</html>