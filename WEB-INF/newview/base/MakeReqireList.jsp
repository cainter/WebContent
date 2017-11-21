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
				var url = "base/MakeRequireNew.html";
				ShowIframeNoScroll("制作要求", url, 500, 340, "refreshWin()");
			}

			function refreshWin() {
				window.location.reload(true);
			}

			function doEdit(id) {
				var url = "base/MakeRequireEdit.html?id=" + id;
				ShowIframeNoScroll("制作要求", url, 500, 340, "refreshWin()");
			}

			function doDelete(id) {
				ShowConfirm('确认框', '确定删除吗？', 340, 80, "doDelAct(" + id + ")");
			}

			function doDelAct(id) {
				if(popRetVal != null) {
					window.location = "base/MakeRequireDelete.html?id=" + id;
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
					<h2>制作要求</h2>
					<div class="pull-right">
						<a type="button " class="layui-btn " href="MakeRequire_toMakeReqireNew">新 增</a>
					</div>
				</div>
			</div>
			<div class="sheet-list ">
				<div class="search-business ">
					<div class="blank24 "></div>

					<div class="table-list ">
						<table width="100% ">
							<tbody>
								<tr>
									<th width="10% ">序号</th>
									<th width="15% ">编号</th>
									<th width="45% ">要求内容</th>
									<th width="15% ">附加单价</th>
									<th width="15% ">操作</th>
								</tr>

								<s:iterator value="makeRequires" status="indexs">
									<tr>
										<td>${sequenceCode }</td>
										<td>${code }</td>
										<td>${requireContent }</td>
										<td>${price  }</td>
										<td>
											<a href="MakeRequire_toMakeReqireEdit?id=${id }">编辑</a>
											<a href="MakeRequire_delMakeReqire?id=${id }">删除</a>
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