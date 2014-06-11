<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:fielderror></s:fielderror>
<html>
	<head>
		<%@ include file="/common/i18njs.jsp"%>
		<%@ include file="/common/meta_css.jsp"%>
		<%@ include file="/common/meta_js.jsp"%>
		<script language="javascript" src="${ctx}/common/js/MulLine.js"></script>
		<title><s:text name="acc.voucher" /></title>
		<link href="${ctx}/style/query.css" type="text/css" rel="stylesheet">
	</head>
	<body id="all_title">
		<div id="crash_menu">
			<h2>
				<s:text name="acc.voucher" />
			</h2>
			<s:form name="fm" action="voucherVerify" method="post"
				namespace="/accPaymentPay" >
				<input name="oPPayWay" type="hidden" value="${oPPayWay}"/>
				<input name="bankAccountNo" type="hidden" value="${bankAccountNo}"/>
				<input name="accountName" type="hidden" value="${accountName}"/>
				<input name="retrunFee" type="hidden" value="${retrunFee}"/>
				<input name="certiNo" type="hidden" value="${certiNo}"/>
				<input name="remark" type="hidden" value="${remark}"/>
				<input name="payCurrency" type="hidden" value="${payCurrency}"/>
				<input name="realPayFee" type="hidden" value="${realPayFee}"/>
				<input name="remainFee" type="hidden" value="${remainFee}"/>
				<input name="rate" type="hidden" value="${rate}"/>
				<table class="fix_table" border="1">
					<tr>
						<td class="bgc_tt short">
							<s:text name="acc.voucher.yearMonth" />
						</td>
						<td class="long">
						<input type="hidden" name="epsMainVoucher.yearMonth" value="${yearMonth}"/>
							<s:label name="epsMainVoucher.yearMonth"
								value="${yearMonth}" id="epsMainVoucher.yearMonth"
								cssClass='input_w w_15' />
						</td>
						<td class="bgc_tt short">
							<s:text name="epsMainVoucher.operatorCode" />
						</td>
						<td class="long">
						<s:hidden name="epsMainVoucher.operatorCode" value="${session.UserCode }"/>
							<s:label name="epsMainVoucher.operatorCode"
								value="${session.UserCode }" id="epsMainVoucher.operatorCode"
								cssClass='input_w w_15' />
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short">
							<s:text name="currency.centerCode" />
						</td>
						<td class="long">
						<s:hidden name="epsMainVoucher.centerCode" value="${session.CenterCode }"/>
							<s:label name="epsMainVoucher.centerCode"
								value="${session.CenterCode }" id="epsMainVoucher.centerCode"
								cssClass='input_w w_15' />
						</td>
						<td class="bgc_tt short">
							<s:text name="epsMainVoucher.voucherDate" />
						</td>
						<td class="long">
						<s:hidden name="operaterTime" value="${operaterTime}"/>
							<s:label name="epsMainVoucher.voucherDate" value="${operaterTime}"
								id="epsMainVoucher.voucherDate" cssClass='input_w w_15' />
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short">
							<s:text name="epsMainVoucher.auxNumber" />
						</td>
						<td class="long">
						<s:hidden name="epsMainVoucher.auxNumber" value="${auxNumber}"/>
							<s:label name="epsMainVoucher.auxNumber" value="${auxNumber}"
								id="epsMainVoucher.auxNumber" cssClass='input_w w_15' />
						</td>
						<td class="bgc_tt short">
						</td>
						<td class="long">
						</td>
					</tr>
				</table>
				<!-- 主体显示的table -->
				<table id="voucherDetailTemp" class="fix_table" border="1">
					<thead>
						<tr>
							<td rowspan="2"><s:text name="acc.voucher.remark" /></td>
							<td rowspan="2"><s:text name="acc.voucher.itemCode" /></td>
							<td rowspan="2"><s:text name="acc.voucher.itemName" /></td>
							<td rowspan="2"><s:text name="acc.voucher.currency" /></td>
							<td rowspan="2"><s:text name="acc.voucher.exchangeRate" /></td>
							<td colspan="2" rowspan="1" align="center"><s:text name="acc.voucher.debit" /></td>
							<td colspan="2" rowspan="1" align="center"><s:text name="acc.voucher.credit" /></td>
							<td colspan="7" rowspan="1" align="center"><s:text name="acc.voucher.articleCode" /></td> 
						</tr>
						<tr>
							<td rowspan="1"><s:text name="acc.voucher.Source" /></td>
							<td rowspan="1"><s:text name="acc.voucher.dest" /></td>
							<td rowspan="1"><s:text name="acc.voucher.Source" /></td>
							<td rowspan="1"><s:text name="acc.voucher.dest" /></td>
							<td rowspan="1">T1</td>
							<td rowspan="1">T2</td>
							<td rowspan="1">T3</td>
							<td rowspan="1">T4</td>
							<td rowspan="1">T5</td>
							<td rowspan="1">T6</td>
							<td rowspan="1">T7</td>
						</tr>
					</thead>
					<c:set var="index" value="0" />
					<s:set name="sumDebitDest" value="debitDest"/>
		            <s:set name="sumCreditDest" value="creditDest"/>
					<tbody>
						<s:iterator id="voucherTemp" value="voucherTempList" status="status">
							<tr>
								<s:set name="readStatus" value="true" />
								<td>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].remark'}" required="true"></s:textfield>
									<s:hidden name="size"></s:hidden>
								</td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].itemCode'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].itemName'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].currency'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].exchangeRate'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].debitSource'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].debitDest'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].creditSource'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].creditDest'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td>
									<s:hidden name="voucherTempList_[0].T1Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T1'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:hidden name="voucherTempList_[0].T2Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T2'}" 
										readonly="${readStatus}" ></s:textfield>	
								</td>
								<td>
									<s:hidden name="voucherTempList_[0].T3Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T3'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:hidden name="voucherTempList_[0].T4Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T4'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:hidden name="voucherTempList_[0].T5Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T5'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:hidden name="voucherTempList_[0].T6Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T6'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:hidden name="voucherTempList_[0].T7Code"></s:hidden>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T7'}" 
										readonly="${readStatus}" ></s:textfield>
									<s:hidden name="%{'voucherTempList['+#status.index+'].checkNo'}" />
								</td>
							</tr>
							<s:set name="sumDebitDest" value="${sumDebitDest + debitDest}"/>
		              	  	<s:set name="sumCreditDest" value="${sumCreditDest + creditDest}"/>
							<c:set var="index" value="${index+1}" />
						</s:iterator>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="17" align="center">
								<s:text name='common.total' />：<s:text name='common.debit' />:<input type="text" name="sumDebitDest" value="${sumDebitDest}" readonly class="input_w w_5"></input>
							    <s:text name='common.borrow' />:<input type="text" name="sumCreditDest" value="${sumCreditDest}" readonly class="input_w w_5"></input>
						    </td>
						</tr>
        			</tfoot>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center">
							<input type="button" class="button_ty" value="<s:text name='acc.loan.confirm' />"
								onclick="submitForm();">
						</td>
					</tr>
				</table>
			</s:form>
		</div>
	</body>
</html>
<script type="text/javascript">
	function submitForm(){
		// 判断借贷是否相等
		var sumDebitDest = fm.sumDebitDest.value;
		var sumCreditDest = fm.sumCreditDest.value;
		var length = document.getElementsByName("size").length - 1;	// 得到页面上已经显示的列表的个数
		if(sumDebitDest != sumCreditDest){
			alert("<s:text name="errors.paymentConfirm.debitUnequalCredit"></s:text>");
			return;
		}
		// 计算累计值
		for(var i=0;i<length;i++){
			var remark = "voucherTempList["+i+"].remark";
			if(document.getElementsByName(remark)[0].value == ""){
				alert("<s:text name="errors.paymentConfirm.remarkRequired"></s:text>");
				return;
			}
		}
		fm.submit();
	}
</script>