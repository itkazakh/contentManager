<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="acc.title.feePlanList"/></title>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
</head>
<body>
<s:form name="fm" action="recPaymentInfo" namespace="/accPaymentConfirm" method="post">
	<table class="fix_table" width="100%" title="<s:text name="acc.title.applicationToConfirm"/>">
		<thead>
			<tr>
				<td class="bgc_tt short"></td>
				<td class="bgc_tt short"><s:text name="acc.epsFeePlan.certiType"/></td>
				<td class="bgc_tt short"><s:text name="acc.epsFeePlan.certiNo"/></td>
				<td class="bgc_tt short"><s:text name="acc.epsFeePlan.appliUserCode"/></td>
				<td class="bgc_tt short"><s:text name="acc.epsFeePlan.payWay"/></td>
				<td class="bgc_tt short"><s:text name="acc.epsFeePlan.payCurrency"/></td>
				<td class="bgc_tt short"><s:text name="acc.epsFeePlan.realPayFee"/></td>
			</tr>
		</thead>
		<s:iterator value="feePlans" id="feePlan" status="status">
			<tr>
				<td class="bgc_tt2 short"><s:checkbox name="%{'feePlans['+#status.index+'].checked'}" /></td>
				<td class="bgc_tt2 short">
					<s:property id="feePlan" value="certiTypeName"/>
					<s:hidden name="%{'feePlans['+#status.index+'].certiType'}" />
					<s:hidden name="size"></s:hidden>
				</td>
				<td class="bgc_tt2 short">
					<s:hidden name="%{'feePlans['+#status.index+'].certiNo'}" />
					<s:url id="claimsViewURL" action="viewFeeMain" namespace="/feeMain">
						<s:param name="certiNo">${feePlan.certiNo}</s:param>
					</s:url>
					<a target="_blank" href="${claimsViewURL}" class="ul.menu"><s:property id="feePlan" value="certiNo"/></a>
				</td>
				<td class="bgc_tt2 short"><s:property id="feePlan" value="appliUserName"/><s:hidden	
				name="%{'feePlans['+#status.index+'].appliUserName'}" /></td>
				<td class="bgc_tt2 short"><s:property id="feePlan" value="opPayWay"/><s:hidden	
				name="%{'feePlans['+#status.index+'].opPayWay'}" /></td>
				<td class="bgc_tt2 short"><s:property id="feePlan" value="payCurrency"/><s:hidden	
				name="%{'feePlans['+#status.index+'].payCurrency'}" /></td>
				<td class="bgc_tt2 short"><s:property id="feePlan" value="realPayFee"/><s:hidden	
				name="%{'feePlans['+#status.index+'].realPayFee'}" />
				<s:hidden	
				name="%{'feePlans['+#status.index+'].payRefNo'}" />
				<s:hidden name="%{'feePlans['+#status.index+'].auxNumber'}" />
				</td>
			</tr>
		</s:iterator>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center"><input type="button" name="confirmPaySubmit"
				class="button_ty" value="<s:text name="acc.confirmPay"/>" onclick="submitForm();"></td>
		</tr>		
	</table>
</s:form>
<div id="calContainer" style="position: absolute;"></div>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript">
function submitForm(){
		if(validateForm()){
			fm.target = "page";
      		fm.submit();
      		fm.confirmPaySubmit.disabled = "true";
		}
	}
function validateForm(){
	var length = document.getElementsByName("size").length;	// 得到页面上已经显示的列表的个数
	if(length < 1){
		alert("<s:text name="errors.paymentConfirm.unChecked"></s:text>");
		return false;
	}
	// 判断条件，不能一个不选，也不能预支单与报销单同时选择。
	var checkSum = true;
	var certiTypeFirst = "";
	for(var i=0;i<length;i++){
		var isChecked = "feePlans["+i+"].checked";
		var certiTypeName = "feePlans["+i+"].certiType";
		if(document.getElementsByName(isChecked)[0].checked){
			checkSum = false;
			var certiType = document.getElementsByName(certiTypeName)[0].value;
			if(certiTypeFirst == ""){
				certiTypeFirst = certiType;
			}else{
				if(certiTypeFirst == "10" && certiTypeFirst != certiType){
					alert("<s:text name="errors.paymentConfirm.sameCertiType"></s:text>");
					return false;
				}
				if(certiTypeFirst != "10" && certiType=="10"){
					alert("<s:text name="errors.paymentConfirm.sameCertiType"></s:text>");
					return false;
				}
			}
		}
	}
	if(checkSum){
		alert("<s:text name="errors.paymentConfirm.unChecked"></s:text>");
		return false;
	}
	return true;
}
</script>
