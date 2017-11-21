<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0067)http://115.28.87.22:8888/storehouse/OutBillNew.ihtm?alert_type=FORM -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>出库单 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link href="css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/BillEdit.css">
<script src="js/popup_ext.js"></script>
<script src="js/jquery.js"></script>
<script src="js/dhtmlgoodies_calendar.js"></script>
<script language="javascript">
	function doSave(flag){
		document.getElementById("buttonDiv").style.display="none";
		document.getElementById("waitDiv").style.display="";
		document.getElementById("continue_flag").value=flag;
		
			ShowConfirm('确认框','是否同时审核？',340,80,"doSaveCallBack()");
		
		
	}
	function doSaveCallBack(){
		if(popRetVal!=null){
			document.getElementById("examine").value="1";
		}
		frm.submit();
	}
	function doCancel(){
		if(window.opener){
			window.close();
		}else{
			parent.ClosePop();
		}
	}
	function elementOnChnage(){
		checkItemChange(this.getAttribute("index"),this.id);
	}
	function productOnChnage(){
		checkProductChange(this.getAttribute("index"));
	}
	function inputOnMouseOver(){
		this.title=this.value;
	}
	function checkProductChange(index){
		if(window.event.keyCode==13){
			selectProduct(index);
		}
	}
	function buttonOnClick(){
		selectProduct(this.getAttribute("index"));
	}
	function selectProduct(index){
		var stoId=document.getElementById("outBill.storehouseId").value;
		var url="/base/ProductMainForSelect.ihtm?stock=Y&sto_id="+stoId;
		ShowIframe("选择材料",url,900,500,"selectProductCallBack("+index+")");
	}
	function selectProductCallBack(index){
		if(popRetVal!=null){
			document.getElementById("product_id_"+index).value=popRetVal[0];
			document.getElementById("product_code_"+index).value=popRetVal[1];
			document.getElementById("product_name_"+index).value=popRetVal[2];
			document.getElementById("product_unit_"+index).value=popRetVal[3];
			document.getElementById("amount_"+index).value=popRetVal[4];
			checkItemChange(index);
		}
	}
	function doMultiSelect(){
		var stoId=document.getElementById("outBill.storehouseId").value;
		var url="/base/ProductMainForSelect.ihtm?type=MULTI&stock=Y&sto_id="+stoId;
		ShowIframe("选择材料",url,900,500,"doMultiSelectCallBack()");
	}
	function doMultiSelectCallBack(){
		if(popRetVal!=null){
			for(i=0;i<popRetVal.length;i++){
				var newIndex=doItemAdd();
				document.getElementById("product_id_"+newIndex).value=popRetVal[i][0];
				document.getElementById("product_code_"+newIndex).value=popRetVal[i][1];
				document.getElementById("product_name_"+newIndex).value=popRetVal[i][2];
				document.getElementById("product_unit_"+newIndex).value=popRetVal[i][3];
				document.getElementById("amount_"+newIndex).value=popRetVal[i][4];
				checkItemChange(newIndex);
			}
		}
	}
	function doItemAdd(){
		var tbl=document.getElementById("itemRowTbl");
		var itemNum=document.getElementById("item_num").value-0;

		var tr=document.createElement("tr");
		tr.setAttribute("className","ListTr");
		tr.setAttribute("class","ListTr");
		tr.setAttribute("id","itemTr"+itemNum);
		
		var td;
		var input;

		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="80px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","product_code_"+itemNum);
		input.setAttribute("id","product_code_"+itemNum);
		input.setAttribute("readOnly",true);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="160px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","product_name_"+itemNum);
		input.setAttribute("id","product_name_"+itemNum);
		input.setAttribute("readOnly",true);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		input.onmouseover=inputOnMouseOver;
		td.appendChild(input);
		
		td.appendChild(document.createTextNode(" "));
		input=document.createElement("img");
		input.setAttribute("src","/images/icon_add.gif");
		input.setAttribute("index",itemNum);
		input.style.cursor="pointer";
		input.onclick=buttonOnClick;
		td.appendChild(input);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","product_id_"+itemNum);
		input.setAttribute("id","product_id_"+itemNum);
		input.setAttribute("value","0");
		td.appendChild(input);
		
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="40px";
		input.setAttribute("index",itemNum);
		input.setAttribute("name","product_unit_"+itemNum);
		input.setAttribute("id","product_unit_"+itemNum);
		input.setAttribute("readOnly",true);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.cssText="text-align:right";
		input.style.width="50px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","amount_"+itemNum);
		input.setAttribute("id","amount_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.setAttribute("value","");
		input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.cssText="text-align:right";
		input.style.width="50px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","unit_price_"+itemNum);
		input.setAttribute("id","unit_price_"+itemNum);
		input.setAttribute("value","0");
		input.setAttribute("readOnly",true);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.cssText="text-align:right";
		input.style.width="50px";
		input.setAttribute("maxLength","10");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","cost_"+itemNum);
		input.setAttribute("id","cost_"+itemNum);
		input.setAttribute("value","0");
		input.setAttribute("readOnly",true);
		input.setAttribute("className","TextBox readonly");
		input.setAttribute("class","TextBox readonly");
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.style.width="150px";
		input.setAttribute("maxLength","200");
		input.setAttribute("index",itemNum);
		input.setAttribute("name","mark_"+itemNum);
		input.setAttribute("id","mark_"+itemNum);
		input.setAttribute("className","TextBox");
		input.setAttribute("class","TextBox");
		input.setAttribute("value","");
		input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		var delLink=document.createElement("a");
		delLink.setAttribute("href","javascript:doItemDelete("+itemNum+");");
		delLink.appendChild(document.createTextNode("删除"));
		td.appendChild(delLink);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","status_"+itemNum);
		input.setAttribute("id","status_"+itemNum);
		input.setAttribute("value","UNCHANGE");
		td.appendChild(input);
		
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","id_"+itemNum);
		input.setAttribute("id","id_"+itemNum);
		input.setAttribute("value","0");
		td.appendChild(input);
		tr.appendChild(td);

		tbl.appendChild(tr);
		document.getElementById("item_num").value=itemNum+1;
		//doCount();
		
		resizePopwin();
		
		return itemNum;//当前行的index
	}
	function doItemDelete(index){
		ShowConfirm('确认框','确定删除吗？',340,80,"doItemDeleteCallBack("+index+")");
	}
	function doItemDeleteCallBack(index){
		if(popRetVal!=null){
			document.getElementById("itemTr"+index).style.display="none";
			document.getElementById("status_"+index).value="DELETE";
			doCount();
			
			resizePopwin();
		}
	}
	function checkItemChange(index,id){
		if(document.getElementById("id_"+index).value=="" || document.getElementById("id_"+index).value=="0"){
			document.getElementById("status_"+index).value="NEW";
		}else{
			document.getElementById("status_"+index).value="EDIT";
		}
		
		if(document.getElementById("cost_"+index)!=null){
			var itemAmount=document.getElementById("amount_"+index).value;
			var itemUnitPrice=document.getElementById("unit_price_"+index).value;
			var itemCost;
			
			//金额
			if(!isNaN(itemAmount) && !isNaN(itemUnitPrice)){
				itemCost=accMul(itemAmount,itemUnitPrice);
				document.getElementById("cost_"+index).value=parseScale(itemCost,2);
			}
		}
		doCount();
	}
	
	function doCount(){
		var itemNum=document.getElementById("item_num").value-0;
		var itemCost;
		var itemAmount;
		var costTotal=0;
		var amountTotal=0;
		for(var i=0;i<itemNum;i++){
			if(document.getElementById("status_"+i).value!="DELETE"){
				if(document.getElementById("cost_"+i)!=null){
					itemCost=document.getElementById("cost_"+i).value;
					if(!isNaN(itemCost)){
						costTotal=addMul(costTotal,itemCost);
					}
				}
				if(document.getElementById("amount_"+i)!=null){
					itemAmount=document.getElementById("amount_"+i).value;
					if(!isNaN(itemAmount)){
						amountTotal=addMul(amountTotal,itemAmount);
					}
				}
			}
		}
		if(document.getElementById("amountSpan")!=null){
			document.getElementById("amountSpan").innerHTML=amountTotal;
		}
		if(document.getElementById("costSpan")!=null){
			document.getElementById("costSpan").innerHTML=costTotal;
		}
	}
	function selectManager(){
		var url="/base/StafferMainForSelect.ihtm";
		ShowIframe("选择员工",url,800,500,"selectManagerCallBack()");
	}
	function selectManagerCallBack(){
		if(popRetVal!=null){
			var arr=popRetVal.split(";");
			document.getElementById("outBill.managerId").value=arr[0];
			document.getElementById("outBill.managerName").value=arr[1];
		}
	}
	function selectEstablishment(type){
		var url="/base/EstablishmentListForSelect.ihtm?type="+type+"&ts_id=1";
		ShowIframe("需方单位",url,900,500,"selectRequirerCallBack()");
	}
	function selectRequirerCallBack(){
		if(popRetVal!=null){
			document.getElementById("outBill.requirerId").value=popRetVal[0];
			document.getElementById("requirerName").value=popRetVal[1];
		}
	}
	function changeTimeSelect(obj,targetName){
		document.getElementById(targetName).value=obj.value;
	}
	function doRequirerTypeChange(){
		document.getElementById("outBill.requirerId").value="0";
		document.getElementById("requirerName").value="";
	}
	function selectRequirer(){
		var requirerType=document.getElementById("outBill.requirerType").value;
		if(requirerType=='CLIENT' || requirerType=='PROVIDER' || requirerType=='COOPERATOR'){
			selectEstablishment(requirerType);
		}else if(requirerType=='DEPARTMENT'){
			var url="/base/DepartmentListForSelect.ihtm";
			ShowIframe("需方单位",url,310,500,"selectRequirerCallBack()");
		}else if(requirerType=='STOREHOUSE'){
			var url="/base/StorehouseListForSelect.ihtm";
			ShowIframe("需方单位",url,300,300,"selectRequirerCallBack()");
		}else if(requirerType=='WORK_CENTER'){
			var url="/base/WorkCenterListForSelect.ihtm";
			ShowIframe("需方单位",url,600,400,"selectRequirerCallBack()");
		}else{
			ShowAlert('提示框','请选择需方类型',200,100);
		}
	}
	function selectBusinessBill(){
		var url="/make/BusinessBillListForSelect.ihtm?search_type=STO&ts_id=1";
		ShowIframe("选择业务单",url,900,500,"selectBusinessBillCallBack()");
	}
	function selectBusinessBillCallBack(){
		if(popRetVal!=null){
			document.getElementById("outBill.businessBillCode").value=popRetVal[1];
			selectBusinessBillCallBackExt("ID",popRetVal[0]);
		}
	}
	function selectBusinessBillCallBackExt(type,key){
		document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("pro_code"))+50+"px";
		document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("pro_code"))+100+"px";
		document.getElementById("LoadProcess").style.display="";
		
		$.post("/business/BusinessBillItemProductSelect.ihtm",{type:type,key:key},function(data,status){
			parseSelectBusinessBillData(data,status);
		});
	}
	function parseSelectBusinessBillData(data,status){
		if(status=="success"){
			var obj=$.parseJSON(data);
			var busiProd="SELECT";
			if(busiProd=="SELECT"){
				$("#outBill\\.requirerType").val("CLIENT");//带点的id加两个斜杠
				$("#outBill\\.requirerId").val(obj.estId);
				$("#requirerName").val(obj.estName);
			}
			
			$.each(obj.items,function(index,item){
				var newIndex=doItemAdd();
				$("#product_id_"+newIndex).val(item.prodId);
				$("#product_code_"+newIndex).val(item.prodCode);
				$("#product_name_"+newIndex).val(item.prodName);
				$("#product_unit_"+newIndex).val(item.unit);
				$("#amount_"+newIndex).val(item.amou);
				checkItemChange(newIndex);
			});
			
		}
		document.getElementById("LoadProcess").style.display="none";
	}
	
	function clearBusinessBill(){
		document.getElementById("outBill.businessBillCode").value="";
	}
	function doPrint(id){
		showWin(900,600,"/storehouse/OutBillPrint.ihtm?id="+id);
	}
	function doIn(id){
		showWin(1024,600,"/storehouse/InBillNew.ihtm?alert_type=FORM&data_type=OUT_BILL&out_bill_id="+id);
	}
	function doInit(){
		showFormErrorMsg();
		resizePopwin();
		//if(document.getElementById("pro_code")){
		//	document.getElementById("pro_code").focus();
		//}
		
		document.getElementById("outBill.businessBillCode").focus();
		
	}
	function checkBbCode(){
		var bbCode=document.getElementById("outBill.businessBillCode").value;
		if(bbCode!=''){
			selectBusinessBillCallBackExt("CODE",bbCode);
		}
	}
	function checkProCode(){
		if(window.event.keyCode==13){
			addProCode();
		}
	}
	function addProCode(){
		var proCode=document.getElementById("pro_code").value.trim();
		if(proCode==""){
			ShowAlert('提示框','请输入条形码',200,100);
		}else{
			document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("pro_code"))+50+"px";
			document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("pro_code"))+100+"px";
			document.getElementById("LoadProcess").style.display="";
			
			$.post("/base/GetProduct.ihtm",{pro_code:proCode},function(data,status){
				parseProData(data,status);
			});
			document.getElementById("pro_code").value="";
		}
	}
	function parseProData(data,status){
		if(status=="success"){
			var obj=$.parseJSON(data);
			if(obj.prodId-0!=0){
  				var found=false;
  				var itemNum=document.getElementById("item_num").value-0;
				for(var i=0;i<itemNum;i++){
					if(document.getElementById("status_"+i).value!="DELETE"){
						if(document.getElementById("product_code_"+i).value==obj.prodCode){
							var amount=document.getElementById("amount_"+i).value;
							if(!isNaN(amount)){
								amount=amount-0+1;
							}else{
								amount=1;
							}
							document.getElementById("amount_"+i).value=amount;
							checkItemChange(i);
							found=true;
							break;
						}
					}
				}
				if(!found){
					var newIndex=doItemAdd();
					document.getElementById("product_id_"+newIndex).value=obj.prodId;
					document.getElementById("product_code_"+newIndex).value=obj.prodCode;
					document.getElementById("product_name_"+newIndex).value=obj.prodName;
					document.getElementById("product_unit_"+newIndex).value=obj.unit;
					document.getElementById("amount_"+newIndex).value="1";
					checkItemChange(newIndex);
				}
  			}
  			$("#LoadProcess").hide();
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}		
	function clearStorehouse(){
		var storId = document.getElementById("outBill.storehouseId").value;
		if(storId=="" || storId=="0"){
			ShowAlert('提示框','请选择仓库',200,100);
		}else{
			document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("all_stor"))+50+"px";
			document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("all_stor"))+100+"px";
			document.getElementById("LoadProcess").style.display="";
			
			$.post("/base/ExistingProduct.ihtm",{stor_id:storId},function(data,status){
				parseExisProData(data,status);
			});
		}
	}
	function parseExisProData(data,status){
		if(status=="success"){
			var obj=$.parseJSON(data);
			var selectedArr = new Array();
			$.each(obj.items,function(index,item){
				// 数组支取需要用到的材料属性值，并且各个属性值与选择材料页所返回的数组中的对应属性值位置相同
      			selectedArr[index] = new Array(item.prodId,item.prodCode,item.prodName,item.prodUnit,item.prodAmou);
			});
      		popRetVal = selectedArr;
      		// 填入明细项
      		doMultiSelectCallBack();
      		$("#LoadProcess").hide();
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
	function doUpload(){
		var storehouseId = document.getElementById("outBill.storehouseId").value;
		//if(storehouseId=="" || storehouseId=="0"){
		//	ShowAlert('提示框','请选择仓库',200,100);
		//}else{
			ShowIframe("导入Excel","/storehouse/OutBillUploadForm.ihtm?storehouse_id="+storehouseId,560,300,"doUploadCallBack()");
		//}
	}
	function doUploadCallBack(){
		if(popRetVal){
			document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("uplo_link"))+50+"px";
			document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("uplo_link"))+100+"px";
			document.getElementById("LoadProcess").style.display="";

			var fileName = popRetVal;
			$.post("/storehouse/ImportOutBillItem.ihtm",{file_name:fileName},function(data,status){
				parseUploadData(data,status);
			});
		}
	}
	function parseUploadData(data,status){
		if(status=="success"){
			var obj=$.parseJSON(data);
			if(obj.status=="ERROR"){
				$("#LoadProcess").hide();
				ShowAlert('提示框',obj.errMsg,200,100);
			}else{
				$.each(obj.items,function(index,item){
					var newIndex=doItemAdd();
					document.getElementById("product_id_"+newIndex).value=item.prodId;
					document.getElementById("product_code_"+newIndex).value=item.prodCode;
					document.getElementById("product_name_"+newIndex).value=item.prodName;
					document.getElementById("product_unit_"+newIndex).value=item.prodUnit;
					document.getElementById("amount_"+newIndex).value=item.prodAmou;
					document.getElementById("mark_"+newIndex).value=item.prodMark;
					checkItemChange(newIndex);
				});
				$("#LoadProcess").hide();
			}
		}else{
			$("#LoadProcess").hide();
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
</script>
</head>
<body onload="doInit();">
<div class="Wrap">
	<form name="frm" method="post">
	<div class="Container">
		<div class="Contnet Paper">
			<!-- 保存按钮是否可点击 -->
			<!-- 编码框是否可点击 -->
			<!-- 编码框颜色 -->
	      	
	      	
	      	
				
			
			
	      	
			
				
				
			
			
			
				
			
			<!-- 是否可以编辑日期 -->
			

			<!-- 提示信息 -->
			
<script language="javascript">
	var formErrorIndex=0;
	var formErrorMsg="";
	var formErrorObjId="";
	function setFormErrorMsg(msg,index,objId){
		if(formErrorIndex==0 || formErrorIndex>index){
			if(msg!=null && msg!=""){
				formErrorIndex=index;
				formErrorMsg=msg;
				formErrorObjId=objId;
			}
		}
	}
	function showFormErrorMsg(){
		if(formErrorIndex!=0){
			document.getElementById("errorMsgTr").style.display="";
			document.getElementById("errorMsgDiv").innerHTML=formErrorMsg;
			if(formErrorObjId!=null && formErrorObjId!=""){
				document.getElementById(formErrorObjId).focus();
			}
		}
	}
	function goNextInput(objId){
		var obj=null;
		if(objId!=null && objId!=''){
			obj=document.getElementById(objId);
		}
		if(window.event.keyCode==13){
			if(obj!=null){
				obj.focus();
			}else if(window.doSave){
				doSave();
			}
		}
	}
</script>
<table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td colspan="2">
	  	<div class="msg-error" id="errorMsgDiv">
      	
      	</div>
	  </td>
	</tr>
</tbody></table>

			<!--单 标题-->
			<br>
	        <table class="BillHeading" cellspacing="0" cellpadding="0">
	        	<tbody><tr>
		            <td width="301px;" rowspan="2"><div class="CorpLogo"><img src="images/1_1456975049379login.gif"></div></td>
		            <td width="301px;" rowspan="2"><h1>新增出库单</h1></td>
		            <td width="301px;" class="tr vb codeTd">
		                <span class="MustInput">*</span>编号：
		                
				    	<input type="text" class="tbBillCode TextBox disabled" readonly="readonly" maxlength="30" onkeyup="goNextInput(&#39;outDateStr&#39;);" id="outBill.billCode" name="outBill.billCode" value="">
				    	<script language="javascript">
							setFormErrorMsg('',1,'outBill.billCode');
						</script>
			     		
		            </td>
	        	</tr>
	        	<tr>
	            	<td class="tr">
	            		<span id="calPosi"></span>
		            	<span class="MustInput">*</span>出库日期：
		            	
	                    <input type="text" class="tbBillDate_sim TextBox " maxlength="15" id="outDateStr" name="outDateStr" value="2017-07-09">
	                    <img src="images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById(&#39;outDateStr&#39;),&#39;yyyy-mm-dd&#39;,document.getElementById(&#39;calPosi&#39;));">
	                    <script language="javascript">
					    	setFormErrorMsg('',2,'outDateStr');
					    </script>
		                
	            	</td>
	        	</tr>
	        </tbody></table>

			<!-- 单 头信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillHeadInfo" cellspacing="0" cellpadding="0">
	        		<tbody><tr>
	            		<td width="280px">
	                		<span class="MustInput">*</span>仓库：
	                		
	                    	<select style="width:174px" id="outBill.storehouseId" name="outBill.storehouseId">
	                    		<option value="0">==请选择==</option>
	                    		<s:iterator value="storehouses" status="indexs">
									<option value="${id }">${stoName }</option>
	                    		</s:iterator>
			  				</select>
				          	<script language="javascript">
				          		setFormErrorMsg('',3);
				          	</script>
	                		
	            		</td>
	            		<th width="80px">需方类型：</th>
	            		<td width="321px">
	                		
	                		<select style="width:100px" id="outBill.requirerType" name="outBill.requirerType" onchange="doRequirerTypeChange();">
								<option value="">==请选择==</option>
								<option value="WORK_CENTER" selected="">工作中心</option>
								<option value="DEPARTMENT">部门</option>
								<option value="CLIENT">客户</option>
								<option value="STOREHOUSE">仓库</option>
								<option value="PROVIDER">供应商</option>
								<option value="COOPERATOR">外协商</option>
					  		</select>
					        <script language="javascript">
					          	setFormErrorMsg('',6);
					        </script>
					        
					        需方：
	                		
	                		<input type="text" class="TextBox readonly" style="width:104px" readonly="readonly" id="requirerName" name="requirerName" value="">
							<img class="make-a" src="images/make-a.gif" style="cursor:pointer;" onclick="selectRequirer();">
							
							
							<input type="hidden" id="outBill.requirerId" name="outBill.requirerId" value="0">
	                    	<script language="javascript">
						    	setFormErrorMsg('',7);
						    </script>
	                		
	            		</td>
	            		<td width="223px;" class="tr">
	            			出库类型：
	                		
	                    	<select style="width:110px" id="outBill.outTypeId" name="outBill.outTypeId">
								<option value="0">==请选择==</option>
								
									<option value="1">销售出库</option>
								
									<option value="2">内部调拨</option>
								
									<option value="3">盘亏出库</option>
								
									<option value="4">加工制作</option>
								
									<option value="5">低值易耗品</option>
								
				  			</select>
					        <script language="javascript">
					        	setFormErrorMsg('',4);
					        </script>
	                		
	            		</td>
	        		</tr>
	        	</tbody></table>
	        </div>
			
			<!-- 明细 -->
	        <input type="hidden" id="item_num" name="item_num" value="0">
	        <table id="BillDetails" class="BillDetails" width="100%" cellspacing="0" cellpadding="0">
	        	<tbody id="itemRowTbl">
	        	<tr>
					<th width="12%">材料编号</th>
					<th width="25%">品名规格</th>
					<th width="8%">单位</th>
					<th width="10%">数量</th>
					<th width="10%">单价(元)</th>
					<th width="10%">金额(元)</th>
					<th width="20%">备注</th>
				</tr>
				<tr>
					<td>
						<select name="inBillItem[0].productId">
							<s:iterator value="products" status="indexs">
								<option value="${id }">${productCode }</option>
							</s:iterator>
						</select>
					</td>
					<td></td>
					<td></td>
					<td> <input name="inBillItem[0].amount" /></td>
					<td><input name="inBillItem[0].unitPrice" /></td>
					<td> <input name="inBillItem[0].cost" /></td>
					<td> <input name="inBillItem[0].mark" /></td>
				</tr>
				</tbody>
			</table>
			<div class="table-bot" style="margin-top:4px">
				<span style="float:right;PADDING-RIGHT:10px;color:#aaa">
					数量小计：<span id="amountSpan">0</span>&nbsp;
					
						金额小计：<span id="costSpan">0</span>元
					
				 </span>
				  
				
				<%-- 	请输入条形码：
					<input type="text" class="TextBox" style="width:120px" id="pro_code" name="pro_code" onkeyup="checkProCode();" title="材料编号作为材料的条形码，可以在这里直接扫描出入库">
					<input type="button" style="font-size:12px;" value="加入" onclick="addProCode();">
					<a href="javascript:doMultiSelect();">增加出库明细</a>
					<span style="color:#aaa">(审核后单价显示为库存单价)</span>
					<a id="uplo_link" href="javascript:doUpload();">从Excel导入</a> --%>
					
				
			</div>
			<br>
			
				<script language="javascript">
					setFormErrorMsg('',8);
				</script>
			
			
			<!-- 附加信息 -->
	        <div class="TopBottom_Border">
	        	<table class="BillElseInfo" cellspacing="0" cellpadding="0">
	        		<tbody><tr>
	            		<th width="80px"><span class="MustInput">*</span>经办人：</th>
	            		<td width="200px">
	            		<select>
								<s:iterator value="staffers" status="indexs">
									<option value="${id }">${stafferName }</option>
								</s:iterator>
				  		</select>
	            		<!-- 	
							<input type="text" class="tbInfo1 TextBox readonly" readonly="readonly" id="outBill.managerName" name="outBill.managerName" value="标识汇">
							<img class="make-a" src="images/make-a.gif" style="cursor:pointer;" onclick="selectManager();">
					      	
					      	
							<input type="hidden" id="outBill.managerId" name="outBill.managerId" value="65"> -->
						    <script language="javascript">
						    	setFormErrorMsg('',8);
						    </script>
							
	            		</td>
	            		<th width="80px">备注：</th>
	            		
	            		<td width="263px">
	            			<input type="text" class="tbInfo2 TextBox" maxlength="50" id="outBill.mark" name="outBill.mark" value="">
				          	<script language="javascript">
				          		setFormErrorMsg('',10,'outBill.mark');
				          	</script>
	            		</td>
	            		
	            		<th width="80px">业务单号：</th>
	            		
            			<td width="201px">
            				<input type="text" class="tbInfo1 TextBox" maxlength="30" id="outBill.businessBillCode" name="outBill.businessBillCode" value="" onchange="checkBbCode();">
							<img src="images/make-a.gif" class="imgIconButton" onclick="selectBusinessBill();">
							<img src="images/icon_del.gif" class="imgIconButton" onclick="clearBusinessBill();">
					        <script language="javascript">
					          	setFormErrorMsg('',9,'outBill.businessBillCode');
					        </script>
            			</td>
            			
	        		</tr>
	        	</tbody></table>
	        </div>
			<br>
			<div class="BillNotes">
                <span>开单人：标识汇 2017-07-09 17:20</span>
        		<span>审核人：</span>
				<span>单据帐套：新异</span>
				
			    	<script language="javascript">
			          	setFormErrorMsg('',1);
			    	</script>
				
			</div>
		</div>
		
		<!-- 底栏按钮 -->
		<div class="Footer">
			<div id="buttonDiv">
				<input type="button" class="buttom-a" value=" 保 存 " onclick="doSave(&#39;0&#39;);">
				
					<input type="button" class="buttom-a" value="保存并新增" onclick="doSave(&#39;1&#39;);">
					<input type="button" class="buttom-a" value="保存并复制" onclick="doSave(&#39;2&#39;);">
				
				
				<input type="button" class="buttom-a" value=" 取 消 " onclick="doCancel();">
				<input type="hidden" name="continue_flag" id="continue_flag" value="0">
				<input type="hidden" id="examine" name="examine" value="0">
				<input type="hidden" id="sychronizeValue" name="sychronizeValue" value="0">
				<input type="hidden" id="outDateHour" name="outDateHour" value="17">
				<input type="hidden" id="outDateMinute" name="outDateMinute" value="20">
			</div>
			<div id="waitDiv" style="display:none">
    			<span>请稍候...</span>
			</div>
		</div>
		
	</div>
	</form>
</div>

<div id="LoadProcess" style="position:absolute; left:50%;top:50%; width:200px; height:100px; margin-top:-50px;margin-left:-100px;z-index:1; border:solid #000 5px;background-color:White;display:none">
	<table border="0" align="center" style="height:100%;">
		<tbody><tr>
			<td style="valign:middle">
				<img src="images/loading.gif">
				请稍候...
			</td>
		</tr>
	</tbody></table>
</div>


<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>