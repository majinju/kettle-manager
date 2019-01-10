<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Examples</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="project/style/index.css" rel="stylesheet">
</head>
<body>
    <div class="hy-lk-nav-l">
		<ul class="J-level1-nav hy-lk-nav-level1">
			<li>
				<p class="hy-lk-nav-level1-tit active">
				<i class="level1-icon icon1"></i>数据管理<i class="triggle"></i>
				</p>
				<ul class="hy-lk-nav-level2">
					<li><a href='sjdx/list.do?dxdm=SYS_SJGL_SJDX&userInfo=123@admin&myparams={"xjanmc":"导入对象"}' target="mainFrame">
						<i class="circle"></i>数据对象</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_SJGL_SJZD&myparams={"lbkbj":"0"}' target="mainFrame">
						<i class="circle"></i>数据字段</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_ZD_TYZD' target="mainFrame">
						<i class="circle"></i>字典管理</a>
					</li>
					<li><a href="common/dict/list.do" target="mainFrame">
						<i class="circle"></i>统一字典</a>
					</li>
<!-- 					<li><a href="common/file/list.do" target="mainFrame"> -->
<!-- 						<i class="circle"></i>文件管理</a> -->
<!-- 					</li> -->
					<li><a href='sjdx/list.do?dxdm=SYS_SJGL_SJK' target="mainFrame">
						<i class="circle"></i>数据库管理</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_LOG_FWZR' target="mainFrame">
						<i class="circle"></i>访问日志</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_QX_APP' target="mainFrame">
						<i class="circle"></i>应用管理</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_QX_YHXX' target="mainFrame">
						<i class="circle"></i>用户信息</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_QX_JGXX' target="mainFrame">
						<i class="circle"></i>机构信息</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_FILE_RECORD' target="mainFrame">
						<i class="circle"></i>文件管理</a>
					</li>
				</ul>
			</li>
			<li>
				<p class="hy-lk-nav-level1-tit">
				<i class="level1-icon icon1"></i>kettle增强<i class="triggle"></i>
				</p>
				<ul class="hy-lk-nav-level2 hide">
					<li><a href='sjdx/list.do?dxdm=R_JOB' target="mainFrame">
						<i class="circle"></i>作业管理</a>
					</li>
				</ul>
			</li>
			<li>
				<p class="hy-lk-nav-level1-tit">
				<i class="level1-icon icon1"></i>运行监控<i class="triggle"></i>
				</p>
				<ul class="hy-lk-nav-level2 hide">
					<li><a href='sjdx/list.do?dxdm=SYS_YXJK_JKRW' target="mainFrame">
						<i class="circle"></i>监控任务</a>
					</li>
					<li><a href='sjdx/list.do?dxdm=SYS_YXJK_XX' target="mainFrame">
						<i class="circle"></i>监控消息</a>
					</li>
				</ul>
			</li>
			<li>
				<p class="hy-lk-nav-level1-tit">
				<i class="level1-icon icon1"></i>开发工具<i class="triggle"></i>
				</p>
				<ul class="hy-lk-nav-level2 hide">
					<li><a href="${serviceAddr}myui/editor.md/other/projectStandard/projectStandard.html" target="mainFrame">
						<i class="circle"></i>开发规范</a>
					</li>
					<li><a href="${serviceAddr}myui/editor.md/other/authStandard/authStandard.html" target="mainFrame">
						<i class="circle"></i>权限开发规范</a>
					</li>
					<li><a href="${serviceAddr}myui/json/index.htm" target="mainFrame">
						<i class="circle"></i>JSON处理</a>
					</li>
					<li><a href="${serviceAddr}myui/cron/index.htm" target="mainFrame">
						<i class="circle"></i>cron表达式</a>
					</li>
					<li><a href="${serviceAddr}myui/websocket/stomptest.html" target="_blank">
						<i class="circle"></i>ws学习</a>
					</li>
					<li><a href="${serviceAddr}myui/vue/vue.html" target="mainFrame">
						<i class="circle"></i>vue学习</a>
					</li>
					<li><a href="https://cn.vuejs.org/v2/guide/list.html" target="mainFrame">
						<i class="circle"></i>vue文档</a>
					</li>
					<li><a href="https://validator.niceue.com/docs/" target="mainFrame">
						<i class="circle"></i>验证框架</a>
					</li>
					<li><a href="http://120.55.47.26:8090/doc.html" target="mainFrame">
						<i class="circle"></i>BootstrapEase</a>
					</li>
					<li><a href="http://www.my97.net/demo/index.htm" target="mainFrame">
						<i class="circle"></i>my97日期控件</a>
					</li>
					<li><a href="https://terryz.oschina.io/selectpage/demo.html" target="mainFrame">
						<i class="circle"></i>selectPage</a>
					</li>
					<li><a href="myui/zTree_v3/api/API_cn.html" target="mainFrame">
						<i class="circle"></i>zTree api</a>
					</li>
					<li><a href="myui/zTree_v3/demo/cn/index.html" target="mainFrame">
						<i class="circle"></i>zTree demo</a>
					</li>
					<li><a href="myui/layer/test.html" target="mainFrame">
						<i class="circle"></i>layer弹窗</a>
					</li>
					<li><a href="myui/editor.md/examples/index.html" target="mainFrame">
						<i class="circle"></i>md编辑器</a>
					</li>
					<li><a href="myui/ueditor/index.html" target="mainFrame">
						<i class="circle"></i>ueditor编辑器</a>
					</li>
					<li><a href="http://echarts.baidu.com/examples.html" target="mainFrame">
						<i class="circle"></i>Echarts</a>
					</li>
					<li><a href="druid/index.html" target="mainFrame">
						<i class="circle"></i>druid监控</a>
					</li>
				</ul>
			</li>
			<li>
				<p class="hy-lk-nav-level1-tit">
				<i class="level1-icon icon1"></i>项目原型<i class="triggle"></i>
				</p>
				<ul class="hy-lk-nav-level2 hide">
					<li><a href="javascript:void(0);" target="_blank">
						<i class="circle"></i>XXX</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>

	<script src="project/js/jquery.min.js"></script>
	<script src="project/js/index.js"></script>
</body>
</html>