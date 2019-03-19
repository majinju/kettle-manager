<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="依赖关系图">
	<jsp:body>
    <link rel="stylesheet" type="text/css" href="${basicUrl }project/style/relation.css">
		<div class="container">
			<div class="relation-title">
				<p>
					<i></i>
					<span>父级关系</span>
				</p>
				<p>
					<i></i>
					<span>子级关系</span>
				</p>
			</div>
			<div class="relation-charts" id="relation">
			</div>
		</div>
		<script type="text/javascript" src="${basicUrl }myui/jquery/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${basicUrl }myui/echarts/echarts-4.2.1-rc.1.js"></script>
		<script type="text/javascript" src="${basicUrl }project/js/relation.js"></script>
	</jsp:body>
</gd:LayoutVue>