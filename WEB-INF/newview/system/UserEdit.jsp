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

		<link rel="stylesheet" type="text/css" href="css/base.css">
		<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    		<script src="js/jquery-3.0.0.min.js"></script>
			<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
			<script>
				function changeTl() {
					var val = $('input:radio[name="timeLimit"]:checked').val();
					if (val == 'Y') {
						$('#tlStartHour').removeAttr('disabled');
						$('#tlStartMinute').removeAttr('disabled');
						$('#tlEndHour').removeAttr('disabled');
						$('#tlEndMinute').removeAttr('disabled');
					} else {
						$('#tlStartHour').attr('disabled','true');
						$('#tlStartMinute').attr('disabled','true');
						$('#tlEndHour').attr('disabled','true');
						$('#tlEndMinute').attr('disabled','true');
					}
				}
			</script>
			
		<style>
			.form-control {
				display: inline-block;
				width: auto;
				height: 30px;
				padding: 5px 10px;
				font-size: 12px;
				line-height: 1.5;
				border-radius: 0;
			}
			
			.radio-inline {
				padding-top: 6px;
				padding-bottom: 6px;
			}
		</style>
	</head>

	<body class="sheet modal-dialog">
		<div class="sheet-main" id="bodyDiv">
			<form action="UserRole_UserEdit" method="post">
			<input name="id" value="${user.id }" hidden>
				<div class="sheet-list">
					<div class="modal-main search-business">
						<div style="width:100%;">
							<h3>编辑用户</h3>
							<div class="blank24"></div>
							<table align="center" class="table-a">
								<tbody>
									<tr>
										<th><span class="MustInput">*</span>登录帐号：</th>
										<td>
											<input type="text" class="form-control" maxlength="15" onkeyup="goNextInput(&#39;currentPassword&#39;);" id="user.userName" name="userName" value="${user.userName }">
										</td>
									</tr>
									<tr>
										<th><span class="MustInput">*</span>密码：</th>
										<td>
											<input type="text" class="form-control" maxlength="15" id="currentPassword" name="password" value="">

										</td>

									</tr>
									<tr>
										<th><span class="MustInput">*</span>职员：</th>
										<td>

											<input type="text" class="form-control" readonly id="stafferName" name="stafferName" value="${staffer.stafferName }">
											<img class="make-a" src="images/make-a.gif" style="cursor:pointer;" onclick="selectStaffer();">

											<input type="hidden" id="user.stafferId" name="stafferId" value="0">

										</td>
									</tr>
									<tr>
										<th>状态：</th>
										<td>
											<label class="radio-inline"><input type="radio" name="enabled" id="inlineRadio1" value="Y" 
												<c:if test="${user.enabled == 'Y' }">
													checked
												</c:if>
											>正常</label>
											<label class="radio-inline"><input type="radio" name="enabled" id="inlineRadio2" value="N"
												<c:if test="${user.enabled == 'N' }">
													checked
												</c:if>
											>停用</label>

										</td>
									</tr>
									<tr>
										<th>设置有效期：</th>
										<td>
											<label class="radio-inline"><input type="radio" name="useValidity" id="inlineRadio1" value="Y"
												<c:if test="${user.useValidity == 'Y' }">
													checked
												</c:if>
											 >是</label>
											<label class="radio-inline"><input type="radio" name="useValidity" id="inlineRadio2" value="N"
												<c:if test="${user.useValidity == 'N' }">
													checked
												</c:if>
											>否</label>
										</td>
									</tr>
									<tr>
										<th>有效期至：</th>

										<td>
											<input type="text" class="form-control Datetime" maxlength="15" onkeyup="goNextInput();" id="validityStr" name="validityStr" value="${user.validity }">
											<img src="images/calendar.gif" style="cursor:pointer" onclick="displayCalendar(document.getElementById(&#39;validityStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;validityStr&#39;));">
										</td>

									</tr>
									<tr>
										<th>使用时间控制：</th>
										<td>
											<label class="radio-inline"><input type="radio" name="timeLimit" id="inlineRadio1" value="Y" 
												<c:if test="${user.timeLimit == 'Y' }">
													checked
												</c:if>
											 onclick="changeTl();">是</label>
											<label class="radio-inline"><input type="radio" name="timeLimit" id="inlineRadio2" value="N"
												<c:if test="${user.timeLimit == 'N' }">
													checked
												</c:if>
											 onclick="changeTl();" checked>否</label>
										</td>
									</tr>
									<tr>
										<th>使用时间范围：</th>
										<td>

											<select class="form-control" id="tlStartHour" name="tlStartHour" disabled="true">
												<option value="00">00</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08" selected="">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
											</select>

											<select class="form-control" id="tlStartMinute" name="tlStartMinute" disabled="true">
												<option value="00" selected="">00</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
												<option value="32">32</option>
												<option value="33">33</option>
												<option value="34">34</option>
												<option value="35">35</option>
												<option value="36">36</option>
												<option value="37">37</option>
												<option value="38">38</option>
												<option value="39">39</option>
												<option value="40">40</option>
												<option value="41">41</option>
												<option value="42">42</option>
												<option value="43">43</option>
												<option value="44">44</option>
												<option value="45">45</option>
												<option value="46">46</option>
												<option value="47">47</option>
												<option value="48">48</option>
												<option value="49">49</option>
												<option value="50">50</option>
												<option value="51">51</option>
												<option value="52">52</option>
												<option value="53">53</option>
												<option value="54">54</option>
												<option value="55">55</option>
												<option value="56">56</option>
												<option value="57">57</option>
												<option value="58">58</option>
												<option value="59">59</option>
											</select>

											-

											<select class="form-control" id="tlEndHour" name="tlEndHour" disabled="true">
												<option value="00">00</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19" selected="">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
											</select>

											<select class="form-control" id="tlEndMinute" name="tlEndMinute" disabled="true">
												<option value="00" selected="">00</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
												<option value="32">32</option>
												<option value="33">33</option>
												<option value="34">34</option>
												<option value="35">35</option>
												<option value="36">36</option>
												<option value="37">37</option>
												<option value="38">38</option>
												<option value="39">39</option>
												<option value="40">40</option>
												<option value="41">41</option>
												<option value="42">42</option>
												<option value="43">43</option>
												<option value="44">44</option>
												<option value="45">45</option>
												<option value="46">46</option>
												<option value="47">47</option>
												<option value="48">48</option>
												<option value="49">49</option>
												<option value="50">50</option>
												<option value="51">51</option>
												<option value="52">52</option>
												<option value="53">53</option>
												<option value="54">54</option>
												<option value="55">55</option>
												<option value="56">56</option>
												<option value="57">57</option>
												<option value="58">58</option>
												<option value="59">59</option>
											</select>

										</td>
									</tr>
									<tr>
										<th>允许外网访问：</th>
										<td>
											<label class="radio-inline"><input type="radio" name="allowInternet" id="inlineRadio1" value="Y"
											 	<c:if test="${user.allowInternet == 'Y' }">
													checked
												</c:if>
											 >是</label>
											<label class="radio-inline"><input type="radio" name="allowInternet" id="inlineRadio2" value="N"
												<c:if test="${user.allowInternet == 'N' }">
													checked
												</c:if>
											>否</label>
										</td>
									</tr>
									<tr>
										<th>使用手机APP：</th>
										<td>
											<label class="radio-inline"><input type="radio" name="useApp" id="inlineRadio1" value="Y"
												<c:if test="${user.useApp == 'Y' }">
													checked
												</c:if>
											 >是</label>
											<label class="radio-inline"><input type="radio" name="useApp" id="inlineRadio2" value="N"
												<c:if test="${user.useApp == 'N' }">
													checked
												</c:if>
											>否</label>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-buttom" id="buttonDiv">
					<input type="button" class="buttom-a" value=" 保 存 " onclick="doSave(&#39;0&#39;);">
					<input type="submit" class="buttom-a" value="保存并新增">
					<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
					<input type="hidden" name="continue_flag" id="continue_flag" value="0">
				</div>
			</form>
		</div>
	</body>
</html>