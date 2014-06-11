<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<html>
<%
String UserCode=(String)session.getAttribute("UserCode");
String ComCode=(String)session.getAttribute("ComCode");
if(UserCode.equals("nomole")||ComCode.equals("nomole")||UserCode==null||ComCode==null){
	request.getRequestDispatcher("/login.jsp").forward(request, response);
    return; 
}
%>
<head>
</head>
<body id="all_title">
<s:form name="fm" action="/saaUserPower/comPowerGrant.do?userCode=${userCode}">
	<table align="center" class="fix_table">
		<tr align="center">
			<td class="bgc_tt short"><s:text name="userpower.permitcomcode"/></td>
			<td class="long"><s:textarea name="authComCode" cols="30"
				rows="3" cssClass="input_y w_p90"
				ondblclick="code_CodeQuery(this, 'AuthComCode', '0,1', 'Y','')"
				onkeyup="code_CodeQuery(this, 'AuthComCode', '0,1', 'Y','')"
				onchange="code_CodeChange(this, 'AuthComCode', '0,1', 'Y','')" /></td>
			<td class="bgc_tt short"><s:text name="usergrade.permitcompany"/></td>
			<td class="long"><s:textarea name="authComName" cols="30"
				rows="3" cssClass="w_p90" readonly="true" /></td>
		</tr>
		<tr align="center">
			<td class="bgc_tt short"><s:text name="usergrade.prohibitcompanycode"/></td>
			<td class="long"><s:textarea name="authExceptComCode" cols="30"
				rows="3" cssClass="input_y w_p90"
				ondblclick="code_CodeQuery(this, 'AuthExceptComCode', '0,1', 'Y','')"
				onkeyup="code_CodeQuery(this, 'AuthExceptComCode', '0,1', 'Y','')"
				onchange="code_CodeChange(this, 'AuthExceptComCode', '0,1', 'Y','')" />
			</td>
			<td class="bgc_tt short"><s:text name="usergrade.prohibitcompany"/></td>
			<td class="long"><s:textarea name="authExceptComName" cols="30"
				rows="3" cssClass="w_p90" readonly="true" /></td>
		</tr>
	</table>
</s:form>
</body>
</html>

<%@include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>

