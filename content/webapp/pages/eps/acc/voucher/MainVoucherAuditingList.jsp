<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="user.manage" /></title>
<%@ include file="/common/meta_css.jsp"%>
</head>
<body id="all_title">
<div id="wrapper">
<div id="crash_menu">
<h2 align="center"><s:text name="applyMain.head" /></h2>
</div>
<s:form action="findByLike" method="post" namespace="/mainVoucher" name="fm"
	validate="true" >
	<table class="fix_table" border="0">
			<tr>
			<td class="bgc_tt short"><s:text name="epsMainVoucher.yearMonth" /></td>
			<td class="long"><s:textfield name="epsMainVoucher.yearMonth"
						requiredposition="right" cssClass='input_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="epsMainVoucher.operatorCode" /></td>			
			<td class="long"><s:textfield name="epsMainVoucher.operatorCode"
						requiredposition="right" cssClass='input_w w_15' /></td>
			</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsMainVoucher.voucherNo" /></td>
			<td class="long"><s:textfield name="fromId" requiredposition="right" cssClass='input_w w_15' onblur="checkForm();"/></td>
			<td class="bgc_tt short"><s:text name="prompt.to" /></td>			
			<td class="long"><s:textfield name="toId" requiredposition="right" cssClass='input_w w_15' onblur="checkForm();"/></td>
		</tr>
			<tr>
		<td  colspan="2" align="center">
			<input type="submit" value="<s:text name="prompt.query" />"
				id="queryButton" class="button_ty" >
		</td>
	    <td  colspan="2" align="center">
			<input type="reset" id="addButton" value="<s:text name="common.reset" />" class="button_ty">
	    </td>
	</tr>
	</table>
	</s:form>

</div>
<div id="content_navigation" class="query" align="center"></div>
<div id="content" class="sort"></div>
<div id="content_navigation" class="query" align="center"></div>

<%@ include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>

<script type="text/javascript">
function checkForm(){
var fromId=document.getElementById("fromId").value;
var toId=document.getElementById("toId").value;
if(fromId!="" && toId==""){
alert("<s:text name="voucher.voucherNoError" />");
return false;
}
if(toId!="" && fromId==""){
alert("<s:text name="voucher.voucherNoError1" />");
return false;
}
}
</script>

</body>
</html>
