<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=cn.benma666.web.WebUtil.getBasePath(request)%>"></base>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8;">
  <title>跳转</title>
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
      <img class="bk-err-turn" src="${serviceAddr}aui/common/img/err_turn.jpg" alt="">
    <![endif]-->
    <div class="bk-err-turn">
      <p>
        <a href="${param.turnUrl }">前往></a>
      </p>
    </div>
  </section>
  <script src="${serviceAddr}aui/common/js/err.js"></script>
</body>
</html>