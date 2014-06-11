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
<h2 align="center">&nbsp;&nbsp;<s:text name="增加学习卡" /></h2>
</div>

<s:form action="addCardHand" method="post" namespace="/card" onsubmit="return submitValidate(this)">
	<table class="fix_table w_p80" border="0" align="center">
		<tr>
			<td class="bgc_tt_left w_p40"><s:text name="学习卡类型:" /></td>			
			<td class="w_p60">
				<s:select list="cardTypeMap" name="learningCard.cardTypeCode"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt_left w_p40"><s:text name="添加方式:" /></td>			
			<td class="w_p60">
				<s:radio list="addTypeRadio" name="addType"></s:radio>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt_left w_p40"><s:text name="学习卡卡号:" /></td>			
			<td class="w_p60">
				<s:textfield name="learningCard.cardCode" id="learningCard.cardCode" maxlength="10"
				cssClass='input_w w_15'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt_left w_p40"><s:text name="学习卡密码:" /></td>			
			<td class="w_p60">
				<s:password name="learningCard.passWord" id="learningCard.passWord" maxlength="10"
				cssClass='input_w w_15'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt_left w_p40"><s:text name="确认密码:" /></td>			
			<td class="w_p60">
				<s:password name="confirmPassword" id="confirmPassword" maxlength="10"
				cssClass='input_w w_15'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt3" colspan="2">
			批量输入：<br>
			格式文本：请参照每行一张卡，每张卡按照如"卡号+分隔符+密码"的格式输入<br>
			例：<s:label cssClass="errorLabel" value="hb000001#pass00001(#号为分隔符)"></s:label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<s:textarea rows="15" cols="30" name="cardList" ></s:textarea>
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
				var cardCodeTemp = document.getElementById("learningCard.cardCode").value;
				if(cardCodeTemp == ""){
						alert("单条增加学习卡是学习卡号不能为空");
						return false;
				}
					var passWordTemp = document.getElementById("confirmPassword").value;
					if(passWordTemp == ""){
						alert("单条增加学习卡时密码不能为空");	
						return false;
					}
			}
		}
	}
	if(radiochecked){
			alert("请选择添加方式");
			return false;
	}
	// 判断两次输入的密码必须一致
	var confirmPassword = document.getElementById("confirmPassword").value;
	var passWord = document.getElementById("learningCard.passWord").value;
	if(confirmPassword != passWord){
		alert("两次输入的密码不一致，请重新输入");
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
</script>
</html>