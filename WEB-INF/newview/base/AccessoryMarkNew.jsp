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
				document.getElementById("mark").focus();
			}
		</script>
	</head>

	<body oncontextmenu="return false" onload="showMe();" class="sheet modal-dialog">
		<div class="sheet-main" id="bodyDiv">
			<form action="AccessoryMark_saveAccessoryMark" method="post">
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
							<h3>新增文件说明</h3>
							<div class="blank24"></div>
							<div style="margin: 0 auto; width: 440px;">
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="MustInput">*</span>文件说明：</label>
									<div class="layui-input-inline">
										<input class="layui-input" style="width:260px" placeholder="" type="text" maxlength="50" onkeyup="goNextInput(&#39;sequenceCode&#39;);" id="mark" name="mark" value="">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="MustInput">*</span>序号：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="15" onkeyup="goNextInput(&#39;&#39;);" id="sequenceCode" name="sequenceCode" value="">
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

	</body>
</html>