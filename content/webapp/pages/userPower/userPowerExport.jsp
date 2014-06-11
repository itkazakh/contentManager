<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<html>
<head>
<title><s:text name="userpower.dataexportpermissions"/></title>
</head>
<body id="all_title">
<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="userpower.dataexportpermissions"/></h2>
</div>
<s:form name="fm" method="post" enctype ="multipart/form-data">
	<table align="center" class="fix_table">
		<tr align="center">
            <td class="bgc_tt short"><s:text name="userpower.agencycode"/></td>
			<td class="long">
                <s:textarea  name="comCodes" cols="30" rows="3"
				cssClass="input_y w_p90"
				ondblclick="code_CodeQuery(this, 'ComCode', '0,1', 'Y','')"
				onkeyup="code_CodeQuery(this, 'ComCode', '0,1', 'Y','')"
				onchange="code_CodeChange(this, 'ComCode', '0,1', 'Y','')" />
			</td>
			<td class="bgc_tt short"><s:text name="userpower.nameofOrganization"/></td>
			<td class="long">
                <s:textarea name="comNames" cols="30" rows="3"
				cssClass="w_p90" readonly="true"/>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4"><input type="button" align="top" 
				name="submitImportButton" value='<s:text name="userpower.dataexport"/>' onclick="submitImportData()"
				class="button_ty"></td>
		</tr>
	</table>
</s:form></div>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script language="javascript">
function submitImportData(){
	if(fm.comCodes.value==""){
		alert('<s:text name="userpower.exportcompanynotempty"/>');
		return false;
	}
	alert('<s:text name="userpower.importprompt"/>');
	fm.submitImportButton.disabled=true;
 	fm.action="${ctx}/saaUserPower/userPowerExport.do";
    fm.submit();
    return true;
}
</script>
