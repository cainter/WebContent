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
		<script language="javascript">
			function doNew() {
				var url = "AccessoryMark_toAccessoryNew";
				window.location=url;
			}

			function refreshWin() {
				window.location.reload(true);
			}

			function doEdit(id) {
				var url = "base/AccessoryMarkEdit.html?id=" + id;
				ShowIframeNoScroll("文件说明", url, 500, 260, "refreshWin()");
			}

			function doDelete(id) {
				ShowConfirm('确认框', '确定删除吗？', 340, 80, "doDelAct(" + id + ")");
			}

			function doDelAct(id) {
				if(popRetVal != null) {
					window.location = "base/AccessoryMarkDelete.html?id=" + id;
				}
			}

			function doCancel() {
				window.close();
			}
		</script>
	</head>

	<body oncontextmenu="return false" class="sheet">
		<div class="sheet-main">
			<div class="sheet-top">
				<div class="content">
					<h2>文件说明</h2>
					<div class="pull-right">
						<button class="layui-btn" onclick="doNew();">新 增</button>
					</div>
				</div>
			</div>
			<div class="sheet-list">
				<div class="search-business">
<div class="blank24"></div>
					<div class="table-list">
						<table width="100%">
							<tbody>
								<tr>
									<th width="50">序号</th>
									<th width="420">文件说明</th>
									<th width="150">操作</th>
								</tr>

								<s:iterator value="accessoryMarks" status="indexs">
									<tr>
										<td>${sequenceCode }</td>
										<td>${mark }</td>
										<td>
											<a href="AccessoryMark_toAccessoryEdit?id=${id }">编辑</a>
											<a href="AccessoryMark_delAccessoryMark?id=${id }">删除</a>
										</td>
									</tr>
								</s:iterator>


							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</body>

</html>