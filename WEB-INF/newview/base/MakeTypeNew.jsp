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
		<script language="javascript">
			function doSave(flag) {
				document.getElementById("buttonDiv").style.display = "none";
				document.getElementById("waitDiv").style.display = "";
				document.getElementById("continue_flag").value = flag;
				frm.submit();
			}

			function doCancel() {
				parent.ClosePop();
			}

			function showMe() {
				showFormErrorMsg();
				document.getElementById("makeType.typeName").focus();
			}

			function changeAutoStoc(val) {
				document.getElementById("makeType.autoStoc").value = val;
			}
		</script>
	</head>

	<body onload="showMe();" class="sheet modal-dialog">
		<div class="sheet-main" id="bodyDiv">
			<form class="layui-form" action="MakeType_saveMakeTypeNew" method="post">
				<div class="sheet-list" style="width:100%">
					<div class="modal-main search-business">
						<div style="width:100%;">

							<script language="javascript">
								var formErrorIndex = 0;
								var formErrorMsg = "";
								var formErrorObjId = "";

								function setFormErrorMsg(msg, index, objId) {
									if(formErrorIndex == 0 || formErrorIndex > index) {
										if(msg != null && msg != "") {
											formErrorIndex = index;
											formErrorMsg = msg;
											formErrorObjId = objId;
										}
									}
								}

								function showFormErrorMsg() {
									if(formErrorIndex != 0) {
										document.getElementById("errorMsgTr").style.display = "";
										document.getElementById("errorMsgDiv").innerHTML = formErrorMsg;
										if(formErrorObjId != null && formErrorObjId != "") {
											document.getElementById(formErrorObjId).focus();
										}
									}
								}

								function goNextInput(objId) {
									var obj = null;
									if(objId != null && objId != '') {
										obj = document.getElementById(objId);
									}
									if(window.event.keyCode == 13) {
										if(obj != null) {
											obj.focus();
										} else if(window.doSave) {
											doSave();
										}
									}
								}
							</script>
							<h3>新增项目类型</h3>

							<div class="blank24"></div>
							<div style="margin: 0 auto; width: 440px;">
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="MustInput">*</span>名称：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="15" onkeyup="goNextInput(&#39;oldPassword&#39;);" id="makeType.typeName" name="typeName" value="">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">成品计量单位：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="15" onkeyup="goNextInput(&#39;oldPassword&#39;);" id="makeType.unit" name="unit" value="">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">上级类别：</label>
									<div class="layui-input-inline">
										<select id="makeType.parentId" name="parentId" style="width:140px">
											<option value="0">==请选择==</option>
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
								<div class="layui-form-item">
									<label class="layui-form-label">类型：</label>
									<div class="layui-input-inline">
										<select id="makeType.type" name="type">
												<option value="1" selected="">自制</option>
												<option value="2">外协</option>
											</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">工作中心：</label>
									<div class="layui-input-inline">
										<select id="makeType.workCenterId" name="workCenterId">
												<option value="0">==请选择==</option>

												<option value="1">默认工作中心</option>

												<option value="10">型材仓库</option>

												<option value="12">标识部</option>

												<option value="13">标牌部</option>

											</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">自动扣库存：</label>
									<div class="layui-input-inline">
										<input type="radio" name="r_autoStoc" id="r_autoStoc2" onclick="changeAutoStoc(&#39;Y&#39;);" value="0" title="是">
										<input type="radio" name="r_autoStoc" id="r_autoStoc1"  onclick="changeAutoStoc(&#39;N&#39;);" value="1" title="否" checked="">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">损耗率：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="5" onkeyup="goNextInput(&#39;makeType.sequCode&#39;);" id="lossRateStr" name="lossRateStr" value="">
									</div>
									<div class="layui-form-mid">%</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="MustInput">*</span>序号：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="20" onkeyup="goNextInput(&#39;&#39;);" id="makeType.sequCode" name="sequCode" value="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-buttom" id="buttonDiv">
					<input type="submit" class="buttom-a" value=" 保 存 " onclick="doSave(&#39;0&#39;);">
					<input type="button" class="buttom-a" value="保存并新增" onclick="doSave(&#39;1&#39;);">
					<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
					<input type="hidden" name="continue_flag" id="continue_flag" value="0">
				</div>
				<div class="modal-buttom" id="waitDiv" style="display:none">
					<span style="color:#ffffff">请稍候...</span>
				</div>
			</form>
		</div>
			<script src="js/jquery-3.0.0.min.js"></script>
			<script src="layui/layui.all.js"></script>
	</body>

</html>