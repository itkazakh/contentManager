<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><s:text name="acc.paymentPay.oppCenterCom" /></title>
		<%@ include file="/common/i18njs.jsp"%>
		<%@ include file="/common/meta_css.jsp"%>
<script type="text/javascript">
	
</script>
	</head>
	<body id="all_title">
		<div id="wrapper">
			<div id="container">
				<div id="crash_menu">
					<h2 align="center">
						<s:text name="acc.paymentPay.oppCenterPro" />
					</h2>
				</div>
				<s:form name="fm" action="payConfirm" namespace="/accPaymentPay"
					method="post">
					<table class="fix_table">
						<tr>
							<td class="bgc_tt short">
								<s:text name="acc.paymentPay.payCurrency" />
							</td>
							<td class="long">
								<input name="epsFeePlan.payCurrency"
									value="${epsFeePlan.payCurrency}" type="hidden"">
								<input type="text" class="input_w w_p10" readonly
									id="transPayCurrency"
									value="<ce:codetag codeType="Currency" codeCode="${epsFeePlan.payCurrency}"/>" />
							</td>
							<td class="bgc_tt short">
								<s:text name="acc.paymentPay.payFee" />
							</td>
							<td class="long">
								<s:label name="epsFeePlan.realPayFee" />
								<s:hidden name="epsFeePlan.certiNo"></s:hidden>
							</td>
						</tr>
						<tr>
							<td class="bgc_tt short">
								<s:text name="acc.oppCenterQuery.ExchangeRate" />
							</td>
							<td class="long">
								<s:textfield name="epsFeePlan.payExchangeRate" id="epsFeePlan.payExchangeRate" cssClass="input_w w_p10"></s:textfield>
							</td>
							<td class="bgc_tt short">
							</td>
							<td class="long">
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<h2 align="right">
									<s:text name="acc.paymentPay.payInfo" />:
								</h2>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<table border="2">
									<tr>
										<td align="center" width="150">
											<s:text name="acc.paymentPay.payInfo" />
										</td>
										<td align="center" width="450">
											<s:text name="acc.oppCenterQuery.BusinessNo" />
										</td>
										<td align="center" width="150">
											<s:text name="acc.paymentPay.fee" />
										</td>
									</tr>
									<tr>
										<td align="center" width="150">
											<s:text name="acc.paymentPay.innerToCenter" />
										</td>
										<td align="center" width="450">
											${epsFeePlan.oppCenterCode}
										</td>
										<td align="center" width="150">
											${epsFeePlan.payFee}
										</td>
									</tr>
									<tr>
										<td align="center" width="150">
											<s:select list="opPayWayS"
												name="epsFeePlan.opPayWay" id="OpPayWay"
												onchange="changeOpPayWay();" />
										</td>
										<td align="center" width="450">
											<input name="epsFeePlan.bankAccountNo"
												id="epsFeePlan.bankAccountNo" type="hidden">
											<input name="epsFeePlan.accountName" id="accountName"
												style="display:none" class='input_y w_p10'
												ondblclick="code_CodeSelect(this, 'bankAccountNo', '-1,0', 'Y','')"
												onkeyup="code_CodeSelect(this, 'bankAccountNo', '-1,0', 'Y','')"
												onchange="code_CodeChange(this, 'bankAccountNo', '-1,0', 'Y','')" />
										</td>
										<td align="center" width="150">
											${epsFeePlan.realPayFee}
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<h2 align="right">
									<s:text name="acc.paymentPay.payDepartInfo" />:
								</h2>
							</td>
						</tr>
						<tr>
							<td class="bgc_tt short">
								<s:text name="acc.paymentPay.checkNo" />：
							</td>
							<td class="long">
								<s:textfield name="epsFeePlan.checkNo" id="checkNo" cssClass="input_w w_p10"></s:textfield>
							</td>
							<td class="bgc_tt short">
								<s:text name="acc.paymentPay.payeeBankName" />：
							</td>
							<td class="long">
								<s:label name="epsFeePlan.payeeBankName" />
							</td>
						</tr>
						<tr>
							<td class="bgc_tt short">
								<s:text name="acc.paymentPay.payeeBankName" />：
							</td>
							<td class="long">
								<s:label name="epsFeePlan.payeeBankName" />
							</td>
							<td class="bgc_tt short">
								<s:text name="acc.paymentPay.payeeBankAccount" />：
							</td>
							<td class="long">
								<s:label name="epsFeePlan.payeeBankAccount" />
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<input type="button" name="paymentPaySubmit" class="button_ty" value="<s:text name="acc.paymentPay.submit" />"
									onclick=" return formsubmit();">
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
<script type="text/javascript">
	function init(){
		changeOpPayWay();
	}
  	function formsubmit(){
  	// 加入银行不能为空的验证
  		if(document.getElementsByName("epsFeePlan.opPayWay")[0].value != '10'){
  			if(document.getElementsByName("epsFeePlan.bankAccountNo")[0].value == ""){
  				alert("<s:text name="errors.paymentConfirm.bankAccountNo"></s:text>");
  				return;
  			}
  		}
  		// 验证，如果是支票的支付方式，则不允许支票号为空。
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
  		fm.action = contextRootPath+'/accPaymentPay/oppCenterConfirm.do';
		fm.submit();
		// 提交之后使按钮无效
		fm.paymentPaySubmit.disabled = "true";
  	}
  
	function changeOpPayWay(){
		var oppayway = document.getElementById("OpPayWay").value;
		if(oppayway=="10"){
			fm.accountName.style.display = "none";
		}else{
			fm.accountName.style.display = "";
		}
	}
  	YAHOO.util.Event.addListener(window,'load',init);	
</script>
