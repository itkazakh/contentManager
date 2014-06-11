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
<h2 align="center"><s:text name="数据库备份" /></h2>
</div>

<s:form action="" method="post" namespace="/common" onsubmit="">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="数据库备份" /></td>			
			<td class="long">
			</td>			
			<td class="bgc_tt short"></td>
			<td class="long">
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"></td>			
			<td class="long"><input type="button" class="button_ty" value="<s:text name="数据库备份"/>" onclick="backUp()"/>
			</td>			
			<td class="bgc_tt short"></td>
			<td class="long">
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="数据库还原" /></td>			
			<td class="long">
			</td>			
			<td class="bgc_tt short"></td>
			<td class="long">
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"></td>			
			<td class="long"><input type="button" class="button_ty" value="<s:text name="数据库还原"/>" onclick="restoreDateBase()"/>
			</td>			
			<td class="bgc_tt short"></td>
			<td class="long">
			</td>
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
function backUp(){
	editRecord('${ctx}/common/backUpDateBase.do');
}
function restoreDateBase(){
	editRecord('${ctx}/common/restoreDateBase.do');
}
</script>
</html>