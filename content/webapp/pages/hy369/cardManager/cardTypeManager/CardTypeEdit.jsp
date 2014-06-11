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
<c:if test="${actionType == 'update'}">
	<c:set var="url" value="updateCardType.do"></c:set>
	<c:set var="readStatus" value="true"></c:set>
</c:if>
<c:if test="${actionType == 'add'}">
   	<c:set var="url" value="addCardType.do"></c:set>
    <c:set var="readStatus" value="false"></c:set>
</c:if>
<h2 align="center"><s:text name="新用户增加" /></h2>
</div>

<s:form action="${url}" method="post" namespace="/cardType" onsubmit="return submitValidate(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="卡类型代码" /></td>			
			<td class="long">
				<s:textfield name="learningCardType.cardTypeCode" id="learningCardType.cardTypeCode" maxlength="10" readonly="${readStatus}"
				cssClass='input_w w_15'/>
			</td>			
			<td class="bgc_tt short"><s:text name="卡类型名称" /></td>
			<td class="long">
				<s:textfield name="learningCardType.cardTypeName" id="learningCardType.cardTypeName" readonly="${readStatus}"
				cssClass='input_w w_15'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="金额" /></td>
			<td class="long"><s:textfield name="learningCardType.cardDeno"
				cssClass='input_w w_15' id="learningCardType.cardDeno" />
			</td>
			<td class="bgc_tt short"><s:text name="默认有效天数" /></td>
			<td class="long"><s:textfield name="learningCardType.defalutTime" id="learningCardType.defalutTime"
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