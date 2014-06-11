<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="userpower.adminpowerscope"/></title>
<%@include file="/common/meta_css.jsp"%>
<%@include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>
</head>
<body>
<s:form name="fm">
	<div id="crash_menu"><h2 align="center"><s:text name="userpower.adminpowerscope"/></h2></div>
	<table class="fix_table" width="100%">
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.usercode"/></td>
			<td class="long"><s:textfield name="saaUser.userCode" readonly="true"/></td>
			<td class="bgc_tt short"><s:text name="userinstead.username"/></td>
			<td class="long"><s:textfield name="saaUser.userName" readonly="true"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.comcode"/></td>
			<td class="long"><s:textfield name="saaUser.comCode" readonly="true"/></td>
			<td class="bgc_tt short"><s:text name="userinstead.validflag"/></td>
			<td class="long"><s:select name="saaUser.validStatus" list="#{'1':'有效','0':'无效'}"/></td>
		</tr>
	</table>
</s:form>
</body>
</html>

