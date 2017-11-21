<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/base.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		<style>
			.layui-nav {
				background: #FFFFFF;
			}
			
			.layui-nav .layui-nav-item a {
				color: #000;
			}
			
			.layui-nav-tree .layui-nav-bar {
				display: none;
			}
			
			.layui-nav-itemed .layui-nav-child {
				background: #FFFFFF!important;
			}
			
			.layui-nav-tree .layui-nav-item a {
				height: 30px;
				line-height: 30px;
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
			}
			
			.layui-nav-tree .layui-nav-item a:hover {
				color: #000;
				background-color: #FDCF42;
				text-decoration: none;
			}
		</style>
	</head>

	<body style="text-align:centeroverflow-x:hidden;overflow-y:auto;height:400px">

		<ul class="layui-nav layui-nav-tree" lay-filter="">
			<li>
				<h3 class="title">数据类别</h3>
			</li>
			<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
			<s:iterator value="codeRule" status="indexs">
				<li class="layui-nav-item">
					<a href="CodeRule_findCodeRuleById?id=${id }" target="mainFrame">${title }</a>
				</li>
			</s:iterator>
		</ul>

		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="layui/layui.all.js"></script>
	</body>

</html>