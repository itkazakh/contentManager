<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="title.paymentConfirm"/></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
</head>

<body id="all_title">
<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="acc.title.queryapply"/></h2>
</div>
<s:form name="fm" action="queryFeePlan" namespace="/accPaymentConfirm" method="post">
<s:hidden name="flag" id="flag"></s:hidden>
	<table class="fix_table">	
		<tr>
			<td class="bgc_tt short"><s:text name="acc.epsFeePlan.certiNo"/></td>			
			<td class="long"><input name="epsFeePlan.certiNo"
				id="epsFeePlan.certiNo" class='input_w w_15'"/></td>			
			<td class="bgc_tt short"><s:text name="acc.epsFeePlan.appliUserCode"/></td>
			<td class="long"><input name="epsFeePlan.appliUserCode"
				id="epsFeePlan.appliUserCode" class='input_w w_15'></td>
		</tr>		
		<tr>
			<td class="bgc_tt short"><s:text name="acc.epsFeePlan.payCurrency"/></td>
			<td class="long">
				<input name="epsFeePlan.payCurrency" type="hidden" id="epsFeePlan.payCurrency"/>
				<input name="payCurrencyName"
					id="payCurrencyName" class='input_y w_p60'
					ondblclick="code_CodeSelect(this, 'payCurrecy', '-1,0', 'Y','')"
					onkeyup="code_CodeSelect(this, 'payCurrecy', '-1,0', 'Y','')"
					onchange="code_CodeChange(this, 'payCurrecy', '-1,0', 'Y','')"
					/>
			</td>
			<td class="bgc_tt short"><s:text name="acc.epsFeePlan.payWay"/></td>
			<td class="long">
				<input name="epsFeePlan.opPayWay" id="epsFeePlan.opPayWay" type="hidden"/>
				<input name="payWayName"
				id="payWayName" class='input_y w_p60'
					ondblclick="code_CodeSelect(this, 'payWayCode', '-1,0', 'Y','')"
					onkeyup="code_CodeSelect(this, 'payWayCode', '-1,0', 'Y','')"
					onchange="code_CodeChange(this, 'payWayCode', '-1,0', 'Y','')"></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="acc.epsFeePlan.certiType"/></td>
			<td class="long">
			<input name="epsFeePlan.certiType" id="epsFeePlan.certiType" type="hidden"/>
			<input name="certiTypeName"
				id="certiTypeName" class='input_y w_p60'
					ondblclick="code_CodeSelect(this, 'CertiType', '-1,0', 'Y','')"
					onkeyup="code_CodeSelect(this, 'CertiType', '-1,0', 'Y','')"
					onchange="code_CodeChange(this, 'CertiType', '-1,0', 'Y','')"/></td>
			<td class="bgc_tt short"></td>
			<td class="long"></td>
		</tr>
		<tr>
			<td colspan="1" align="center">
			</td>
			<td colspan="1" align="center"><input type="button"
				class="button_ty" value="<s:text name="prompt.query"/>" onclick="submitForm();">
			</td>
			<td colspan="1" align="center"><input type="reset"
				class="button_ty" value="<s:text name="prompt.reset"/>">
			</td>
			<td colspan="1" align="center">
			</td>
		</tr>
	</table>
</s:form></div>
<div id="content_navigation" class="query" align="center"></div>
<div id="content" class="sort"></div>
<div id="content_navigation" class="query" align="center"></div>
</div>
</body>
</html>
<%@ include file="/common/meta_js.jsp"%>
<script type="text/javascript">
	function submitForm(){
		fm.target = "page";
      	fm.submit();
	}
	</script>