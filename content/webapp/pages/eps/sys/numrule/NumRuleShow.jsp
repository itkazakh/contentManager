<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title><s:text name="user.manage" /></title>
<link href="${ctx}/style/query.css" type="text/css" rel="stylesheet">
</head>
<body id="all_title"> 
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="单号信息"/></h2>
</div>
<s:form action="viewNumRule" method="post" namespace="/numRule" validate="true">
	<table class="fix_table" >
		<tr>
			<td class="bgc_tt short"><s:text name="单号类型代码" /></td>
			<td class="long"><s:label name="epsNumRule.numType"
				cssClass='view_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="单号类型名称" /></td>
			<td class="long"><s:label name="epsNumRule.numTypeName"
				cssClass='view_w w_15' /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="单号前缀" /></td>
			<td class="long"><s:label name="epsNumRule.numPre"
				cssClass='view_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="有效状态" /></td>
			<td class="long"><s:label name="epsNumRule.status"
				cssClass='view_w w_40' /></td>
		</tr>
	</table>
	<table class="fix_table" >
		<tr align="center">
			<td align="center"><input align="center" type="button" class="button_ty" name="return" value="关  闭" onclick="javacript:window.close()"></td>
		</tr>
	</table>
</s:form></div>
</body>
</html>
