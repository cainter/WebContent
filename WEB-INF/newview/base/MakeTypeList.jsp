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
				var url = "base/MakeTypeNew.html?parent_id=0";
				ShowIframeNoScroll("项目类型", url, 360, 400, "refreshWin()");
			}

			function refreshWin() {
				window.location.reload(true);
			}

			function doEdit(id) {
				var url = "base/MakeTypeEdit.html?id=" + id;
				ShowIframeNoScroll("项目类型", url, 360, 400, "refreshWin()");
			}

			function doDelete(id) {
				ShowConfirm('确认框', '确定删除吗？', 340, 80, "doDelAct(" + id + ")");
			}

			function doDelAct(id) {
				if(popRetVal != null) {
					window.location = "base/MakeTypeDelete.html?id=" + id + "&from_url=" + encodeURIComponent(window.location);
				}
			}

			function doCancel() {
				window.close();
			}

			function doSearch() {
				var parentId = document.getElementById("parent_id").value;
				window.location = "base/MakeTypeList.html?parent_id=" + parentId;
			}

			function doBack() {
				window.location = "base/MakeTypeList.html?parent_id=";
			}

			function goChildren(parentId) {
				window.location = "base/MakeTypeList.html?parent_id=" + parentId;
			}

			function doDownload() {
				window.location = "base/MakeTypeList.html?content_type=EXCEL&parent_id=0";
			}
		</script>
	</head>

	<body oncontextmenu="return false" scrol="yes" class="sheet">
		<div class="sheet-main">
			<div class="sheet-top">
				<div class="content">
					<h2>项目类型</h2>
					<div class="pull-right">
						<div class="layui-form" style=" display: inline-block;">
							<div class="layui-inline">
								<label class="layui-form-label">上级类别</label>
								<div class="layui-input-inline">
									<select name="parent_id" id="parent_id" style="width:140px">
										<option value="0" selected="selected">（无）</option>

										<option value="10">标牌</option>
										<option value="103">喷绘</option>
										<option value="104">&nbsp;|--挂画</option>
										<option value="105">&nbsp;|--灯箱画片</option>
										<option value="106">&nbsp;|--高精图像片</option>
										<option value="107">&nbsp;|--户外彩喷</option>
										<option value="108">&nbsp;|--车身彩绘</option>
										<option value="11">标识</option>
										<option value="109">标识标牌</option>
										<option value="110">&nbsp;|--指示牌</option>
										<option value="111">&nbsp;|--警示牌</option>
										<option value="112">&nbsp;|--桌牌</option>
										<option value="113">&nbsp;|--立牌</option>
										<option value="114">&nbsp;|--展示牌</option>
										<option value="115">&nbsp;|--户外标识</option>
										<option value="116">广告字</option>
										<option value="117">&nbsp;|--不发光立体字</option>
										<option value="118">&nbsp;|--背光立体字</option>
										<option value="119">&nbsp;|--发光立体字</option>
										<option value="120">&nbsp;|--光树脂发光立体字</option>
										<option value="121">&nbsp;|--立体发光立体字</option>
										<option value="13">型材销售</option>
										<option value="17">&nbsp;|--画框型材</option>
										<option value="18">&nbsp;|--画框配件</option>
										<option value="34">灯箱</option>
										<option value="122">&nbsp;|--吸塑灯箱</option>
										<option value="123">&nbsp;|--超薄灯箱</option>
										<option value="124">&nbsp;|--落地式灯箱</option>
										<option value="125">&nbsp;|--软膜灯箱</option>
										<option value="126">&nbsp;|--动态灯箱</option>
										<option value="127">&nbsp;|--LED灯箱</option>
										<option value="128">门头店招</option>
										<option value="129">&nbsp;|--彩条店招</option>
										<option value="130">&nbsp;|--模组店招</option>
										<option value="131">&nbsp;|--拉布内光店招</option>
										<option value="132">&nbsp;|--异形店招</option>
										<option value="97">标牌配件</option>
										<option value="98">东厂</option>
										<option value="133">快展器材</option>
										<option value="134">&nbsp;|--快展背景墙</option>
										<option value="135">&nbsp;|--X展架</option>
										<option value="136">&nbsp;|--易拉宝</option>
										<option value="137">&nbsp;|--注水旗杆</option>
										<option value="138">&nbsp;|--快展套装</option>
										<option value="99">成品标牌</option>
										<option value="139">展柜展架</option>
										<option value="140">&nbsp;|--靠墙柜</option>
										<option value="141">&nbsp;|--中岛柜</option>
										<option value="142">&nbsp;|--平柜</option>
										<option value="143">&nbsp;|--收银台</option>
										<option value="144">&nbsp;|--挂架</option>
										<option value="145">&nbsp;|--端架</option>
										<option value="146">&nbsp;|--地台</option>
										<option value="147">印刷</option>
										<option value="148">&nbsp;|--名片</option>
										<option value="149">&nbsp;|--宣传单</option>
										<option value="150">&nbsp;|--画册</option>
										<option value="151">&nbsp;|--手提袋</option>
										<option value="152">&nbsp;|--台挂历</option>
										<option value="153">促销用品</option>
										<option value="154">&nbsp;|--吊旗</option>
										<option value="155">&nbsp;|--太阳伞</option>
										<option value="156">&nbsp;|--条幅横幅</option>
										<option value="157">&nbsp;|--挂墙展板</option>
										<option value="158">&nbsp;|--拱门气球</option>
										<option value="159">&nbsp;|--礼品</option>
									</select>
								</div>
							</div>
							<a type="button" class="layui-btn" href="javascript:doSearch();">查 询</a>
							<a type="button" class="layui-btn" href="MakeType_toMakeTypeNew">新 增</a>
							<button class="layui-btn layui-btn-disabled" onclick="" href="javascript:doBack();">回上级</button>
							<a type="button" class="layui-btn" href="javascript:doDownload();">导 出</a>
						</div>
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
									<th width="8%">序号</th>
									<th width="16%">名称</th>
									<th width="12%">成品单位</th>
									<th width="10%">类型</th>
									<th width="16%">工作中心</th>
									<th width="14%">自动扣库存</th>
									<th width="24%">操作</th>
								</tr>

								<s:iterator value="makeTypes" status="indexs">
									<c:if test="${id != 1 }">
										<tr>
											<td>${indexs.index }</td>
											<td>${typeName }</td>
											<td>${unit }</td>
											<td>
												<c:if test="${type == 1 }">
													自制
												</c:if>
												<c:if test="${type == 2 }">
													<font color="#ff0000">外协</font>
												</c:if>
											</td>
											
											<td>
												<s:iterator value="workCenters" status="indexs">
													<c:if test="${workCenterId == id }">
														${wcName }
													</c:if>
												</s:iterator> 
											</td>
											<td>
												<c:if test="${enabled == 'Y' }">
													是
												</c:if>
												<c:if test="${enabled == 'N' }">
													否
												</c:if>
											</td>
											<td>
												<a href="MakeType_findCildrenType?id=${id }">进入子分类</a>
												<a href="MakeType_toMakeTypeEdit?id=${id }">编辑</a>
												<a href="MakeType_delMakeType?id=${id }">删除</a>
											</td>
										</tr>
									</c:if>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="layui/layui.all.js"></script>
	</body>

</html>