<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<html>
<head>
<title><s:text name="userpower.importpowerdata"/></title>
</head>
<body id="all_title">
<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="userpower.importpowerdata"/></h2>
</div>
<s:form name="fm" method="POST" enctype ="multipart/form-data">

	<table align="center" class="fix_table">
		<tr align="center">
			<td class="bgc_tt short"><s:text name="userpower.importdata"/></td>
			<td class="bgc_tt_endcase short"><s:file name="powerImportExcel" 
				title='<s:text name="userpower.chosefilepath"/>' cssClass="button_ty"></s:file>
			</td>
		</tr>
		<tr align="center">
			<td class="bgc_tt_endcase short"><a
				href="${ctx}/pages/downloadFiles/PowerModel.xls"><s:text name="userpower.permissionstemplatedownload"/></a></td>
			<td class="bgc_tt_endcase short"><a
				href="${ctx}/generate/generateRiskCodes.do"><s:text name="userpower.productcodesimulator"/></a></td>
		</tr>
	</table>
	<table align="center" class="fix_table">
		<tr>
			<td align="center"><input type="button" align="top" 
				name="submitImportButton" value='<s:text name="<s:text name="userpower.importdata"/>"/>' onclick="submitImportData()"
				class="button_ty"></td>
		</tr>
	</table>
</s:form></div>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script language="javascript">
function submitImportData(){
	alert('<s:text name="userpower.importprompt"/>');
	fm.submitImportButton.disabled=true;
 	fm.action="${ctx}/saaUserPower/userPowerImport.do";
    fm.submit();
    return true;
}
</script>
