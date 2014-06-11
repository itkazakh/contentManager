<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><s:text name='acc.pay' /></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script type="text/javascript">
function changeOpPayWay(){
var oppayway = document.getElementById("OpPayWay").value;
if(oppayway=="10"){
fm.accountName.style.display = "none";
}else{
fm.accountName.style.display = "";
}
}
</script>
</head>

<body id="all_title">

<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name='acc.paymentPay'/></h2>
</div>
<s:form name="fm" action="payConfirm" namespace="/accPaymentPay" method="post">
<s:hidden name="hasReduceFee" value="${hasReduceFee}"></s:hidden>
<s:hidden name="hasOppCenter" value="${hasOppCenter}"></s:hidden>
<s:hidden name="certiNo" value="${certiNo}"></s:hidden>
<s:hidden name="certiType" value="${certiType}"></s:hidden>
	<table class="fix_table">	
		<tr>
			<td class="bgc_tt short"><s:text name='acc.paymentPay.payCurrency' /></td>			
			<td class="long">
			<input name="epsFeePlan.payCurrency" value="${epsFeePlan.payCurrency}" type="hidden"">
			<input type="text" class="input_w w_p10" readonly="readonly" id="transPayCurrency" value="<ce:codetag codeType="Currency" codeCode="${epsFeePlan.payCurrency}"/>" />
			</td>
			<td class="bgc_tt short"><s:text name='acc.nowRate' /></td>
			<td class="long"><s:textfield name="rate" /></td>
			<td class="bgc_tt short"><s:text name='acc.paymentPay.payFee' /></td>
			<td class="long"><s:label name="epsFeePlan.realPayFee" /></td>
		</tr>
		<tr>
				<td colspan="1"><h2 align="right"><s:text name='acc.paymentPay.payInfo' />:</h2></td>
		</tr>
		<tr>
			<td colspan="6" align="center">
			<table border="2">
			<tr><td align="center" width="150"><s:text name='acc.paymentPay.payInfo' /></td><td align="center" width="450"><s:text name='acc.paymentPay.payeeBankAccount'/></td><td align="center" width="150"><s:text name='air.itemFee' /></td></tr>
			<c:if test="${hasReduceFee==true}">
			<tr><td align="center" width="150"><s:text name='acc.loanPay' /></td><td align="center" width="450"> </td><td align="center" width="150">${epsFeeMain.reduceFee}</td></tr>
			</c:if>
			<c:if test="${hasOppCenter==true}">
			<s:hidden name="epsFeePlan.opPayWay" value="*" />
			<tr><td align="center" width="150">内部往来</td><td align="center" width="450">${epsFeePlan.oppCenterCode}</td><td align="center" width="150">${epsFeePlan.payFee}</td></tr>
			</c:if>
			<c:if test="${hasOppCenter==false}">
			<tr><td align="center" width="150"><s:select list="epsCodeList" listKey="codeCode" listValue="codeCName" name="epsFeePlan.opPayWay" id="OpPayWay" onchange="changeOpPayWay();" /></td>
			<td align="center" width="450"><input name="epsFeePlan.bankAccountNo"  id="epsFeePlan.bankAccountNo" type="hidden"><input name="epsFeePlan.accountName" id="accountName" style="display:none"
				class='input_y w_p10'
				ondblclick="code_CodeQuery(this, 'bankAccountNo', '-1,0', 'Y','')"
				onkeyup="code_CodeQuery(this, 'bankAccountNo', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'bankAccountNo', '-1,0', 'Y','')"/></td>
			<td align="center" width="150">${epsFeePlan.realPayFee}</td></tr>
			</c:if>
			</table>
			</td>
		</tr>
		<tr>
				<td colspan="1"><h2 align="right"><s:text name='acc.paymentPay.payDepartInfo'/>:</h2></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name='acc.paymentPay.payee'/>：</td>			
			<td class="long" colspan="2"><s:textfield name="epsFeePlan.payee" cssClass="input_w w_p10"></s:textfield></td>
			<td class="bgc_tt short"><s:text name='acc.paymentPay.checkNo'/>：</td>			
			<td class="long" colspan="2"><s:textfield name="epsFeePlan.checkNo" cssClass="input_w w_p10"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name='acc.paymentPay.payeeBankName'/>：</td>			
			<td class="long" colspan="2"><s:textfield name="epsFeePlan.payeeBankName" cssClass="input_w w_p10"/></td>		
			<td class="bgc_tt short"><s:text name='acc.paymentPay.payeeBankAccount'/>：</td>
			<td class="long" colspan="2"><s:textfield name="epsFeePlan.payeeBankAccount" cssClass="input_w w_p10"/></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="button"
				class="button_ty" value="<s:text name='common.ok' />" onclick=" return formsubmit();">
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
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<script type="text/javascript">
function init(){
	changeOpPayWay();
	}
  function formsubmit(url){
  	//if(checkForm()){
   	submitDlg = new YAHOO.widget.Dialog("submitDlg",{iframe:true, visible:true, width:650, height:500, underlay:"shadow", constraintoviewport:true, fixedcenter:true, modal:true,zIndex:302});
	submitDlg.setHeader("提示信息");
	submitDlg.setBody("<iframe name='submitFrame' src='javascript:false;'  frameborder='0' style='margin:0; padding:0; width:100%; height: 100%'></iframe>");
	submitDlg.render(document.body);
	submitDlg.show();
  	fm.action = contextRootPath+'/accPaymentPay/payConfirm.do';
	fm.target = "submitFrame";
	fm.submit();
	//}
  }
  YAHOO.util.Event.addListener(window,'load',init);	
</script>