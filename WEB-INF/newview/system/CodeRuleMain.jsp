<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</head>

	<body class="sheet">
		<div class="sheet-main">
			<div class="sheet-top">
				<div class="content">
					<h2>主数据编码规则</h2>
				</div>
			</div>
			<div class="blank24"></div>

			<div class="sheet-list" id="mainTd" style="height:400px;margin: 0 auto;">

				<div class="nav" id="navDiv" style="float:left;height:100%;border:1px solid #CCCCCC;">
					<iframe width="100%" height="100%" frameborder="0" scrolling="no" id="leftFrame" src="CodeRule_findCodeRuleList?id=${id }"></iframe>
				</div>
				<div id="mainDiv" class="main search-business" style="float: right; height: 100%; width: 648px;border:1px solid #CCCCCC;">
					<iframe width="100%" height="100%" frameborder="0" scrolling="no" id="mainFrame" name="mainFrame" src="./CodeRuleEdit.html"></iframe>
				</div>
			</div>
		</div>
		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="layui/layui.all.js"></script>
	</body>

</html>