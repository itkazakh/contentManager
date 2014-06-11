<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="usergrade.configusergrade"/></title>
<%@include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
</head>
<body>
<s:form name="fm" action="/saaUserGrade/updateUserGrade.do">
	<table class="fix_table" width="100%">
		<tr>
			<td colspan="4" align="center"><strong><s:text name="usergrade.usergrade"/></strong></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.usercode"/></td>
			<td class="long"><s:property value="saaUser.userCode" /><s:hidden
				name="userCode" value="${saaUser.userCode }" /></td>
			<td class="bgc_tt short"><s:text name="userinstead.username"/></td>
			<td class="long"><s:property value="saaUser.userName" /></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<div><strong><s:text name="usergrade.gradelist"/></strong></div>
			</td>
		</tr>
		<tr>
			<td align="center" class="bgc_tt_center short"><s:text name="usergrade.gradecode"/></td>
			<td align="center" class="bgc_tt_center short"><s:text name="usergrade.gradename"/></td>
			<td align="center" class="bgc_tt_center short"><s:text name="usergrade.isbelongtothisuser"/></td>
			<td align="left" class="bgc_tt_endcase short"><s:text name="usergrade.gradeinvaliddate"/></td>
		</tr>
		<s:iterator value="userGrades" status="stuts">
			<tr>
				<td align="center"><s:property
					value="%{userGrades[#stuts.index].gradeCode}" /><s:hidden
					name="%{'userGrades['+#stuts.index+'].gradeCode'}" /></td>
				<td align="center"><s:property
					value="%{userGrades[#stuts.index].gradeName}" /><s:hidden
					name="%{'userGrades['+#stuts.index+'].gradeName'}" /></td>
				<td align="center"><s:checkbox name="%{'userGrades['+#stuts.index+'].checked'}" /></td>
				<td align="left">
				<s:textfield theme="simple" id="${stuts.index}endDate" name="%{'userGrades['+#stuts.index+'].endDate'}" readonly="true" />  
				<img src="${ctx}/pages/image/time/date_icon.gif" alt='<s:text name="usergrade.clickcalendarforever"/>'
					id="${stuts.index}" width="14" height="14"  onclick="show_time(this.id)"/>
					
					<div id="${stuts.index}container" style="position: absolute;"></div>
				</td>
		</tr>
		</s:iterator>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="top">
			<td align="center"><input type="button" value='<s:text name="button.save"/>'
			name="submitUserGrade" onclick="submitfm()"	class="button_ty"></td>
			<td><input type="button" value='<s:text name="button.close"/>' onclick="window.close();"
				class="button_ty"></td>
		</tr>		
	</table>
</s:form>
<div id="calContainer" style="position: absolute;"></div>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript"
	src="${ctx}/dwr/interface/dwrInvokeDataAction.js"></script>
<script language="javascript"
	src="${ctx}/widgets/yui/autocomplete/autocomplete-min.js"></script>
<script language="javascript" src="${ctx}/common/js/newCalendar.js"></script>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<script type="text/javascript" src="${ctx}/pages/js/userGrade.js"></script>
<script type="text/javascript">
function show_time(id){
	init_calendar(id+"container",id,id+"endDate","toSecond");
}
function submitfm(){
	fm.submitUserGrade.disabled=true;
	fm.submit()
}
</script>
