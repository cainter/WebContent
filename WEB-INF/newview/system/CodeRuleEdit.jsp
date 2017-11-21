<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0064)http://115.28.87.22:8888/system/AccountEdit.ihtm?alert_type=SHOW -->
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="Expires" content="0">
		<title>修改密码 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/base.css">
	</head>

	<body scroll="no">
		<div class="sheet-main" id="bodyDiv" style="height:400px;">
			<form class="layui-form" action="CodeRule_updateCodeRule" method="post">
			<input name="id" value="${id }" hidden />
				<div class="sheet-list">
					<div class="blank24"></div>
					<div style="margin: 0 auto; width: 330px;">
						<div class="layui-form-item">
							<label class="layui-form-label">名称：</label>
							<div class="layui-form-mid">${codeRule.title }</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">方式：</label>
							<div class="layui-input-inline">
								<select id="generateRule" name="generateRule" onchange="doChangeGenerateRule(this);">
									<option value="MANUAL"
										<c:if test="${codeRule.generateRule == 'MANUAL'}">
											selected="selected"
										</c:if>
									>手工录入</option>
									
									<c:if test="${codeRule.dataCode == 'PRODUCT'}">
										<option value="AUTO_TYPE_CODE" selected="selected">使用类别代码自动生成</option>
									</c:if>
									<c:if test="${codeRule.tallySetRule != 'INDEPENDENCE' && codeRule.tallySetRule != 'UNIFY'}">
										<option value="AUTO_PREFIX" 
											<c:if test="${codeRule.generateRule == 'AUTO_PREFIX'}">
												selected="selected"
											</c:if>
										>使用前缀自动产生</option>
									</c:if>
									
									<c:if test="${codeRule.tallySetRule == 'INDEPENDENCE' || codeRule.tallySetRule == 'UNIFY' }">
										<option value="AUTO_YEAR" 
											<c:if test="${codeRule.generateRule == 'AUTO_YEAR'}">
												selected="selected"
											</c:if>
										>按年自动产生</option>
										
										<option value="AUTO_MONTH" 
											<c:if test="${codeRule.generateRule == 'AUTO_MONTH'}">
												selected="selected"
											</c:if>
										>按月自动产生</option>
										
										<option value="AUTO_DATE" 
											<c:if test="${codeRule.generateRule == 'AUTO_DATE'}">
												selected="selected"
											</c:if>
										>按日自动产生</option>
									</c:if>
									
								</select>
							</div>
						</div>
						
						
						<div class="layui-form-item"
						<c:if test="${codeRule.dataCode == 'PRODUCT'}">
							hidden
						</c:if>
						>
							<label class="layui-form-label">前缀：</label>
							<div class="layui-input-inline">
								<input class="layui-input" placeholder="" type="text" maxlength="10" onkeyup="goNextInput(&#39;confirmPassword&#39;);" onkeyup="goNextInput(&#39;separator&#39;);" id="prefix" name="prefix" value="${codeRule.prefix }">
							</div>
						</div>
						
						<div class="layui-form-item"
							<c:if test="${codeRule.tallySetRule != 'INDEPENDENCE' && codeRule.tallySetRule != 'UNIFY'}">
								hidden
							</c:if>
						>
							<label class="layui-form-label">账套规则:</label>
							<div class="layui-input-inline">
								<select id="tallySetRule" name="tallySetRule">
											<option value="UNIFY"
												<c:if test="${codeRule.tallySetRule == 'UNIFY' }">
													selected="selected"
												</c:if>
											>所有帐套统一编码</option>
											<option value="INDEPENDENCE"
												<c:if test="${codeRule.tallySetRule == 'INDEPENDENCE' }">
												selected="selected"
												</c:if>
											>不同帐套独立编码（系统自动增加前缀扩展）</option>
											
								</select>
							</div>
						</div>
						
						<div class="layui-form-item">
							<label class="layui-form-label">分隔符：</label>
							<div class="layui-input-inline">
								<input class="layui-input" placeholder="" type="text" maxlength="1" onkeyup="goNextInput(&#39;numberLength&#39;);" id="separator" name="separator" value="${codeRule.separator }">
							</div>
						</div>
						
						<div class="layui-form-item">
							<label class="layui-form-label">流水号长度：</label>
							<div class="layui-input-inline">
								<input class="layui-input" placeholder="" type="text" maxlength="1" onkeyup="goNextInput(&#39;printFoot&#39;);" id="numberLength" name="numberLength" value="${codeRule.numberLength }">
							</div>
						</div>
						
						<div class="layui-form-item"
							<c:if test="${codeRule.tallySetRule != 'INDEPENDENCE' && codeRule.tallySetRule != 'UNIFY'}">
								hidden
							</c:if>
						>
							<label class="layui-form-label">打印页脚:</label>
							<div class="layui-input-inline">
								<textarea placeholder="" name="printFoot" style="width:300px;height:80px" class="layui-textarea" title="将出现在打印单据的页脚上。">${codeRule.printFoot }</textarea>
							</div>
						</div>
						
					</div>

				</div>
				<div class="modal-buttom" id="buttonDiv">
					<input type="submit" class="buttom-a" value=" 保 存 " onclick="doSave();">
				</div>
				<div class="modal-buttom" id="waitDiv" style="display:none">
					<span>请稍候...</span>
				</div>
			</form>
		</div>

		<audio controls="controls" style="display: none;"></audio>

		<script src="layui/layui.all.js"></script>

	</body>

</html>