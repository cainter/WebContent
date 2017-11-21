<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title></title>
		<!-- Bootstrap -->
		<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-table.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/base.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
   	  <![endif]-->
    
    		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-3.0.0.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="js/bootstrap-table.js"></script>
		<script src="js/bootstrap-table-zh-CN.min.js"></script>
		
		<script src="layer/layer.js"></script>
		<script>
			function doEdit(id) {

				var url = "UserRole_toUserEdit?id=" + id;

				var json = {
					type: 2,
					title: false,
					content: '',
					area: ['370px', '397px'],
					shadeClose: true,
					closeBtn: 0, //关闭按钮
					resize: false, //是否允许拉伸
					scrollbar: false, //是否允许浏览器出现滚动条
					moveOut: true
				};
				json['content'] = url;
				layer.open(json);
			}
			
			function doSearch() {
				var searchKey = $('#search_key').val();
				window.location = "UserRole_findUser?userName="+searchKey;
			}
			
			function doNew() {
				layer.open({
					type: 2,
					title: false,
					content: 'UserRole_toUserNew',
					area: ['600px', '530px'],
					shadeClose: true,
					closeBtn: 0, //关闭按钮
					resize: false, //是否允许拉伸
					scrollbar: false, //是否允许浏览器出现滚动条
					moveOut: true
				});
			}
		</script>
	</head>

	<body class="sheet">
		<div class="sheet-main">
			<div class="sheet-top">
				<div class="content">
					<h2>用户管理</h2>
					<div class="pull-right">
						<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" style="width:100px" value="" title="以员工姓名进行模糊查询">
						<a type="button" class="buttom btn btn-default" href="javascript:doSearch()">查 询</a>
						<a type="button" class="buttom btn btn-default" href="javascript:doNew()">新 增</a>
					</div>
				</div>
			</div>
			<div class="sheet-list">
				<div class="search-business">
					<div class="blank24"></div>

					<table data-toggle="table" data-click-to-select="true">
						<thead>
							<tr>
								<th>登录帐号</th>
								<th>职员姓名</th>
								<th>设置有效期</th>
								<th>有效期至</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						  <s:iterator value="users" status="indexs">
							<tr>
								<td>${user.userName }</td>
								<td>${staffer.stafferName }</td>
								<td>
									<c:if test="${user.useValidity == 'Y'}">
										是
									</c:if>
									<c:if test="${user.useValidity == 'N'}">
										否
									</c:if>
								</td>
								<td>
									${user.validity }
								</td>
								<td>
									<c:if test="${user.enabled == 'Y'}">
										正常
									</c:if>
									<c:if test="${user.enabled == 'N'}">
										<font color="#ff0000">停用</font>
									</c:if>
								</td>
								<td>
									<a href="javascript:doEdit(${user.id });">编辑</a>
									<c:if test="${user.enabled == 'Y'}">
										<a href="UserRole_stopAbled?id=${user.id }">停用</a>
									</c:if>
									<c:if test="${user.enabled == 'N'}">
										<a href="UserRole_openAbled?id=${user.id }">启用</a>
									</c:if>
									
									<a href="">授权</a>
									<a href="UserRole_deletcUser?id=${user.id }">删除</a>
								</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>

					<!-- 底栏 分页、操作等 -->
					<div class="BottomToolBar ClearFix">
						<div class="pull-right">
							<a type="button" class="buttom btn btn-default" style="width: 100px;" href="#">返回主菜单</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</body>

</html>