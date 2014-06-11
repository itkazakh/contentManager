<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<html>
<head>
<title><s:text name="userinstead.usertoauthorize"/></title>
</head>
<body id="all_title">
<div id="crash_menu">
<h2 align="center"><s:text name="userinstead.usertoauthorize"/></h2>
</div>
<s:form action="/saaUserInstead/updateUserInstead.do" name="frm">
	<s:hidden name="saaUserInstead.validStatus" id="saaUserInsteadValidStatus" value='0' />
	<s:hidden name="saaUserInstead.id"/>
	<s:hidden name="saaUserInstead.userGrades"/>
	<table class="fix_table">	 	
		<tr>
			<td class="bgc_tt short" colspan="2" align="center"><s:text name="userinstead.grantuser"/></td>
			<td class="bgc_tt short" colspan="2" align="center"><s:text name="userinstead.accpetuser"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.usercode"/></td>
			<td class="long"><s:textfield name="saaUserInstead.authUserCode"
				 cssClass='input_w w_30' readonly="true" /></td>
			<td class="bgc_tt short"><s:text name="userinstead.usercode"/></td>
			<td class="long"><s:textfield name="saaUserInstead.userCode"
				cssClass='input_w w_30' readonly="true" /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.username"/></td>
			<td class="long"><s:textfield name="saaUserInstead.authUserName"
				 cssClass='input_w w_30' readonly="true" /></td>
			<td class="bgc_tt short"><s:text name="userinstead.username"/></td>
			<td class="long"><s:textfield name="saaUserInstead.userName" cssClass='input_w w_30' readonly="true" /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.grantstarttime"/></td>
			<td><s:textfield name="saaUserInstead.authBeginTime" readonly="true" /> </td>
			<td class="bgc_tt short"><s:text name="userinstead.grantenddate"/></td>
			<td><s:textfield name="saaUserInstead.authEndTime" readonly="true" /> </td>
		</tr>	
		<tr>		
		<tr>
			<td class="bgc_tt short" colspan="2" align="center"><input type="button" class="button_ty" value='<s:text name="button.regain"/>' onclick="javascript:frm_Submit()"></td>					
			<td class="bgc_tt short" colspan="2" align="center"><input type="button" class="button_ty" value='<s:text name="button.ok"/>'	onclick="javascript:window.close()"></td>
		</tr>		
</table>
</s:form>
</body>
</html>
<script language="javascript">
function frm_Submit(){
	if(confirm('<s:text name="userinstead.suretoregain"/>')){
	frm.submit();
	}else{
	}
}
</script>
<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript"
	src="${ctx}/dwr/interface/dwrInvokeDataAction.js"></script>
<script language="javascript"
	src="${ctx}/widgets/yui/autocomplete/autocomplete-min.js"></script>

<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>



