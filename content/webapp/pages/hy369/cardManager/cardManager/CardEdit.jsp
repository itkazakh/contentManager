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
<h2 align="center"><s:text name="学习卡信息修改" /></h2>
</div>

<s:form action="updateCard" method="post" namespace="/card" onsubmit="return submitValidate(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="学习卡卡号" /></td>			
			<td class="long">
				<s:textfield name="learningCard.cardCode" id="learningCard.cardCode" maxlength="10" readonly="true"
				cssClass='input_w w_15'/>
			</td>			
			<td class="bgc_tt short"><s:text name="学习卡类型" /></td>
			<td class="long">
				<s:select list="cardTypeMap" name="learningCard.cardTypeCode" disabled="true"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="学习卡密码:" /></td>
			<td class="long"><s:textfield name="learningCard.passWord" id="learningCard.passWord"
				cssClass='input_w w_15'/>
			</td>
			<td class="bgc_tt short"><s:text name="电话号码" /></td>
			<td class="long"><s:textfield name="learningCard.phoneNo" id="learningCard.phoneNo"
				cssClass='input_w w_15'/></td>
		</tr>
		<tr>
			<td colspan="4" align="center" class="bgc_tt short"><input type="submit" class="button_ty" value="<s:text name="prompt.add"/>"/> </td>
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