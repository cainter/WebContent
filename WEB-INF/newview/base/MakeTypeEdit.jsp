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
			<form class="layui-form" action="MakeType_updateMakeType" method="post">
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
							<input value="${makeType.id }" name="id" hidden />
							<h3>编辑项目类型</h3>
							<div class="blank24"></div>
							<div style="margin: 0 auto; width: 440px;">
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="MustInput">*</span>名称：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="15" onkeyup="goNextInput(&#39;oldPassword&#39;);" id="makeType.typeName" name="typeName" value="${makeType.typeName }">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">成品计量单位：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="15" onkeyup="goNextInput(&#39;oldPassword&#39;);" id="makeType.unit" name="unit" value="${makeType.unit }">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">上级类别：</label>
									<div class="layui-input-inline">
										<select id="makeType.parentId" name="parentId" style="width:140px">
											<option value="0">==请选择==</option>
											<option value="10">标牌</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">类型：</label>
									<div class="layui-input-inline">
										<select id="makeType.type" name="type">
										
											<option value="1" 
											<c:if test="${makeType.type == 1 }">
											 selected=""
											</c:if>
											 >自制</option>
											 
											<option value="2"
											<c:if test="${makeType.type == 2 }">
											 selected=""
											</c:if>
											
											>外协</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">工作中心：</label>
									<div class="layui-input-inline">
										<select id="makeType.workCenterId" name="workCenterId">
											<option value="0">==请选择==</option>

											<s:iterator value="woekCenters" status="index">
												<option value="${id }">${wcName }</option>
							      			</s:iterator>

										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">自动扣库存：</label>
									<div class="layui-input-inline">
										<input type="radio" name="r_autoStoc" id="r_autoStoc2" onclick="changeAutoStoc(&#39;Y&#39;);" value="0" title="是">
										<input type="radio" name="r_autoStoc" id="r_autoStoc1" onclick="changeAutoStoc(&#39;N&#39;);" value="1" title="否" checked="">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">损耗率：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="5" onkeyup="goNextInput(&#39;makeType.sequCode&#39;);" id="lossRateStr" name="lossRateStr" value="0.00">
									</div>
									<div class="layui-form-mid">%</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="MustInput">*</span>序号：</label>
									<div class="layui-input-inline">
										<input class="layui-input" placeholder="" type="text" maxlength="20" onkeyup="goNextInput(&#39;&#39;);" id="makeType.sequCode" name="sequCode" value="1">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-buttom" id="buttonDiv">
					<input type="submit" class="buttom-a" value=" 保 存 ">
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