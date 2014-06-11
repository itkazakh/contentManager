<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<title></title>
<s:head/>
</head>
<body>
<div id="container">
<div id="case_detail" class="query">
<div id="crash_menu">
<h2 align="center"><s:text name="资源添加" /></h2>
</div>

<s:form action="addResourceHand" method="post" namespace="/resource" onsubmit="return submitValidate(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt_left w_p30"><s:text name="资源类型名称" /></td>			
			<td class="w_p70">
				<s:hidden name="resource.typeID" id="resource.typeID"></s:hidden>
				<s:textfield name="resource.typeCName" id="resource.typeCName" maxlength="50" readonly="true"
				cssClass='input_w w_15'/>
			</td>			
		</tr>
		<tr>
			<td class="bgc_tt_left w_p30"><s:text name="添加方式:" /></td>			
			<td class="w_p70">
				<s:radio list="addTypeRadio" name="addType" onclick="checkAddType(this);"></s:radio>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt_left w_p30"><s:text name="资源类型:" /></td>			
			<td class="w_p70">
				<s:radio list="vedioTypeRadioMap" name="vedioType"></s:radio>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt_left w_p30"><s:text name="资源目录:(资源文件夹目录)" /><s:label cssClass="errorLabel" value="以/结束"></s:label></td>			
			<td class="w_p70">
				<s:textfield name="resourceURL" id="resourceURL" maxlength="200"
				cssClass='input_w w_p90'/>
			</td>
		</tr>
		<tr id="resourceName">
			<td class="bgc_tt_left w_p30"><s:text name="资源名称:(资源在前台的显示名称)" /></td>
			<td class="w_p70">
				<s:textfield name="resource.resourceName" id="resource.resourceName" maxlength="50"
				cssClass='input_w w_p90'/>
			</td>
		</tr>
		<tr id="resourceAddress">
			<td class="bgc_tt_left w_p30"><s:text name="资源文件:(资源文件的文件名称)" /></td>			
			<td class="w_p70">
				<s:textfield name="resource.resourceAddress" id="resource.resourceAddress" maxlength="255"
				cssClass='input_w w_p90'/>
			</td>
		</tr>
		<tr id="resourceInfo">
			<td class="bgc_tt_left w_p30"><s:text name="资源描述:" /></td>			
			<td class="w_p70">
				<s:textfield name="resource.resourceInfo" id="resource.resourceInfo" maxlength="255"
				cssClass='input_w w_p90'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt3" colspan="2">
			批量输入：<br>
			格式文本：请参照每行一条资源信息，每条信息按照如"资源名称+分隔符+资源文件"的格式输入<br>
			例：<s:label cssClass="errorLabel" value="101#淘气蓝猫(#号为分隔符)"></s:label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<s:textarea rows="15" cols="30" name="resourceList" ></s:textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" class="bgc_tt short"><input type="submit" class="button_ty" value="<s:text name="prompt.add"/>"/> </td>
		</tr>
	</table>
	<br>
</s:form></div>
</div>
</body>
<%@include file="/common/meta_js.jsp" %>
<script type="text/javascript">
YAHOO.namespace("query.container");  
function init(){
}
YAHOO.util.Event.addListener(window,'load',init);
function submitValidate(form){ 
	// 判断必须选择了添加方式
	var radios = document.getElementsByName("addType");
	var radiochecked = true;
	for(var i=0;i<radios.length;i++){
		var radio = radios[i];
		if(radio.checked){
			radiochecked = false;
			var radioValue = radio.value;
			if(radioValue == '0'){
				var cardCodeTemp = document.getElementById("resource.typeCName").value;
				if(cardCodeTemp == ""){
						alert("单条增加资源时资源名称不能为空");
						return false;
				}
					var passWordTemp = document.getElementById("resource.resourceAddress").value;
					if(passWordTemp == ""){
						alert("单条增加资源时资源地址不能为空");
						return false;
					}
			}
		}
	}
	// 提交的时候必须选择资源类型
	var radiosVedio = document.getElementsByName("vedioType");
	var radioVedioChecked = true;
	for(var i=0;i<radiosVedio.length;i++){
		var radioVedio = radiosVedio[i];
		if(radioVedio.checked){
			radioVedioChecked = false;
		}
	}
	if(radiochecked){
			alert("请选择添加方式");
			return false;
	}
	if(radioVedioChecked){
		alert("请选择文件类型");
		return false;
	}
	if(validate()){
		return true;
	}else{
		return false;
	}
	
}

function validate(){
	
	return true;
}

function checkAddType(field){
	var addType = field.value;
	if(addType == "0"){
		document.getElementById("resourceName").style.display="";
		document.getElementById("resourceAddress").style.display="";
		document.getElementById("resourceInfo").style.display="";
	}else{
		document.getElementById("resourceName").style.display="none";
		document.getElementById("resourceAddress").style.display="none";
		document.getElementById("resourceInfo").style.display="none";
	}
}
</script>
</html>