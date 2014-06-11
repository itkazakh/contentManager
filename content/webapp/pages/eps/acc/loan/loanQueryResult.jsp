<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><s:text name="acc.loan" />acc.loan</title>
		<%@ include file="/common/i18njs.jsp"%>
		<%@ include file="/common/meta_css.jsp"%>
		<script type="text/javascript">
function changeOpPayWay(){
var oppayway = document.getElementById("OpPayWay").value;
if(oppayway=="10"){
fm.accountName.style.display = "none";
document.getElementById("gongsizhanghao").style.display = "none";
}else{
fm.accountName.style.display = "";
document.getElementById("gongsizhanghao").style.display = "";
}
}
function checkReturnFee(){
var returnFee = parseInt(document.getElementById("returnFee").value,10);
var remainFee = parseInt(document.getElementById("remainFee").value,10);
if(returnFee>remainFee){
alert("<s:text name='acc.loan.limitRemainFee' />");
document.getElementById("returnFee").value="";
}
}

function submitForm(){
if(document.getElementById("returnFee").value==""){
alert("<s:text name='acc.loan.pleaseLoan' />");
return;
}

// 验证，如果是支票的支付方式，则不允许支票号为空。
		if(document.getElementsByName("epsFeePlan.opPayWay")[0].value != '10'){
  			if(document.getElementsByName("epsFeePlan.bankAccountNo")[0].value == ""){
  				alert("<s:text name="errors.paymentConfirm.bankAccountNo"></s:text>");
  				return;
  			}
  		}
  		var oppayway = document.getElementById("OpPayWay").value;
  		var checkNo = document.getElementById("epsFeePlan.checkNo").value;
  		if((oppayway == "22" || oppayway == "23") && checkNo == ""){
  			alert("<s:text name="acc.paymentPay.checkNoRequired"></s:text>");
  			return;
  		}
  		if(oppayway != "22" && oppayway != "23" && checkNo != ""){
  			alert("<s:text name="acc.paymentPay.checkCheckNo"></s:text>");
  			checkNo = "";
  			return;
  		}
	fm.submit();
}
</script>
	</head>

	<body id="all_title" onload="changeOpPayWay();">

		<div id="wrapper">
			<div id="container">
				<div id="crash_menu">
					<h2 align="center">
						<s:text name='acc.loan.loan' />
					</h2>
				</div>
				<s:form name="fm" action="loanConfirm" namespace="/accPaymentPay"
					method="post">
					<table class="fix_table">
						<tr>
							<td class="bgc_tt short">
								<s:text name='air.contractNo' />
							</td>
							<input name="epsFeeMain.certiNo" type="hidden"
								value="${epsFeeMain.certiNo}">
							<td class="long">
								<s:label name="epsFeeMain.certiNo" />
							</td>
							<td class="bgc_tt short">
								<s:text name='applyMain.payCurrency' />
							</td>
							<td class="long">
								<input name="epsFeeMain.payCurrency"
									value="${epsFeeMain.payCurrency}" type="hidden">
								<input type="text" class="input_w w_p10" readonly="readonly"
									id="transPayCurrency"
									value="<ce:codetag codeType="Currency" codeCode="${epsFeeMain.payCurrency}"/>" />
							</td>
						</tr>
						<tr>
							<td class="bgc_tt short">
								<s:text name='acc.epsFeeMain.realPayFee' />
							</td>
							<input name="epsFeeMain.realPayFee" type="hidden"
								value="${epsFeeMain.realPayFee}">
							<td class="long">
								<s:label name="epsFeeMain.realPayFee" />
							</td>
							<td class="bgc_tt short">
								<s:text name='acc.epsFeeMain.remainFee' />
							</td>
							<input name="epsFeeMain.remainFee" type="hidden"
								value="${epsFeeMain.remainFee}">
							<td class="long">
								<s:label name="epsFeeMain.remainFee" />
							</td>
							<input type="hidden" value="${epsFeeMain.remainFee}"
								id="remainFee" />
						</tr>
						<tr>
							<td class="bgc_tt short" colspan="1">
								<s:text name="acc.paymentPay.checkNo" />
								：
							</td>
							<td class="long" colspan="1">
								<s:textfield name="epsFeePlan.checkNo" id="checkNo"
									cssClass="input_w w_p10"></s:textfield>
							</td>
							<td class="bgc_tt short" colspan="1">
								<s:text name='acc.nowRate' />
							</td>
							<td class="long" colspan="1">
								<s:textfield name="rate" />
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<h2 align="right">
									<s:text name='acc.loan.info' />
									:
								</h2>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<table border="-1" width="800">
									<tr>
										<td align="center">
											<s:text name='acc.loan.payWay' />
											:
										</td>
										<td align="center">
											<div style="display: none;" id="gongsizhanghao">
												<s:text name='acc.loan.comCode' />
												:
											</div>
										</td>
										<td align="center">
											<s:text name='acc.loan.returnFee' />
											:
										</td>
									</tr>
									<tr>
										<td align="center">
											<s:select list="opPayWayS" name="epsFeePlan.opPayWay"
												id="OpPayWay" onchange="changeOpPayWay();" />
										</td>
										<td align="center">
											<input name="epsFeePlan.bankAccountNo"
												id="epsFeePlan.bankAccountNo" type="hidden">
											<input name="epsFeePlan.accountName" id="accountName"
												style="display:none" class='input_y w_p10'
												ondblclick="code_CodeQuery(this, 'bankAccountNo', '-1,0', 'Y','')"
												onkeyup="code_CodeQuery(this, 'bankAccountNo', '-1,0', 'Y','')"
												onchange="code_CodeChange(this, 'bankAccountNo', '-1,0', 'Y','')" />
										</td>
										<td align="center">
											<input name="epsFeeRelation.returnFee"
												onblur="checkReturnFee();" id="returnFee" />
											<font color="red">*</font>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="bgc_tt short">
								<s:text name='area.remark' />
								：
							</td>
							<td colspan="3">
								<s:textarea name="remark" cols="10" rows="8"></s:textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<input type="button" "
				class="button_ty"
									value="<s:text name='acc.loan.voucherCreate'/>"
									onclick="submitForm();">
							</td>
						</tr>
					</table>
				</s:form>
			</div>
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
