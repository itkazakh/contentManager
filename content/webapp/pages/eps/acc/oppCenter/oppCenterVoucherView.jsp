<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<%@ include file="/common/i18njs.jsp"%>
		<%@ include file="/common/meta_css.jsp" %>
		<%@ include file="/common/meta_js.jsp" %>
		<script language="javascript" src="${ctx}/common/js/MulLine.js"></script>
		<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
		<title><s:text name="acc.voucher" /></title>
		<link href="${ctx}/style/query.css" type="text/css" rel="stylesheet">
	</head>
	<body id="all_title">
		<div id="crash_menu">
			<h2>
				<s:text name="acc.voucher.toVoucher" />
			</h2>
			<s:form name="fm" action="" method="post" namespace=""
				validate="true">
				<table class="fix_table" border="1">
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.yearMonth" /></td>
						<td class="long">
							<s:hidden name="certiNos"></s:hidden>
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherOppCe.yearMonth" 
									id="epsMainVoucherOppCe.yearMonth" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.operatorCode" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherOppCe.operatorCode" 
								id="epsMainVoucherOppCe.operatorCode" readonly="true"></s:textfield>
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.centerCode" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherOppCe.centerCode" 
								id="epsMainVoucherOppCe.centerCode" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.voucherDate" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherOppCe.voucherDate" 
								id="epsMainVoucherOppCe.voucherDate" readonly="true">
								<s:param name="value">
									<s:date name="epsMainVoucherOppCe.voucherDate" format="yyyy-MM-dd"/>
								</s:param>
							</s:textfield>
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.voucherNo" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherOppCe.voucherNo" 
								id="epsMainVoucherOppCe.voucherNo" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.auxNumber" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherOppCe.auxNumber" 
								id="epsMainVoucherOppCe.auxNumber" readonly="true"></s:textfield>
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
							<td rowspan="2"><s:text name="acc.voucher.prompt" /></td>
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
									<s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].remark'}" ></s:textfield>
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
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T1'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T2'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T3'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T4'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T5'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T6'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempList['+#status.index+'].T7'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
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
								总计：借:<input type="text" name="sumDebitDest" value="${sumDebitDest}" readonly class="input_w w_5"></input>
							    贷:<input type="text" name="sumCreditDest" value="${sumCreditDest}" readonly class="input_w w_5"></input>
						    </td>
						</tr>
        			</tfoot>
				</table>
				<table class="fix_table" border="1">
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.yearMonth" /></td>
						<td class="long">
							<s:hidden name="certiNos"></s:hidden>
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherCe.yearMonth" 
									id="epsMainVoucherCe.yearMonth" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.operatorCode" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherCe.operatorCode" 
								id="epsMainVoucherCe.operatorCode" readonly="true"></s:textfield>
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.centerCode" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherCe.centerCode" 
								id="epsMainVoucherCe.centerCode" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.voucherDate" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherCe.voucherDate" 
								id="epsMainVoucherCe.voucherDate" readonly="true">
								<s:param name="value">
									<s:date name="epsMainVoucherCe.voucherDate" format="yyyy-MM-dd"/>
								</s:param>
							</s:textfield>
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.voucherNo" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherCe.voucherNo" 
								id="epsMainVoucherCe.voucherNo" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.auxNumber" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucherCe.auxNumber" 
								id="epsMainVoucherCe.auxNumber" readonly="true"></s:textfield>
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
							<td rowspan="2"><s:text name="acc.voucher.prompt" /></td>
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
					<s:set name="sumDebitDestCe" value="debitDest"/>
		            <s:set name="sumCreditDestCe" value="creditDest"/>
					<tbody>
						<s:iterator id="voucherTempCe" value="voucherTempListCe" status="status">
							<tr>
								<s:set name="readStatus" value="true" />
								<td>
									<s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].remark'}" ></s:textfield>
								</td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].itemCode'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].itemName'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].currency'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].exchangeRate'}" 
									readonly="${readStatus}" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].debitSource'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].debitDest'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].creditSource'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempListCe['+#status.index+'].creditDest'}" 
									readonly="${readStatus}" onchange="sumDebitCredit();"></s:textfield></td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T1'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T2'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T3'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T4'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T5'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T6'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
									<s:textfield cssClass='input_w w_6' name="%{'voucherTempListCe['+#status.index+'].T7'}" 
										readonly="${readStatus}" ></s:textfield>
								</td>
								<td>
								</td>
							</tr>
							<s:set name="sumDebitDestCe" value="${sumDebitDestCe + debitDest}"/>
		              	  	<s:set name="sumCreditDestCe" value="${sumCreditDestCe + creditDest}"/>
							<c:set var="index" value="${index+1}" />
						</s:iterator>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="17" align="center">
								总计：借:<input type="text" name="sumDebitDestCe" value="${sumDebitDestCe}" readonly class="input_w w_5"></input>
							    贷:<input type="text" name="sumDebitDestCe" value="${sumCreditDestCe}" readonly class="input_w w_5"></input>
						    </td>
						</tr>
        			</tfoot>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center"><input type="button"
							class="button_ty" value="<s:text name="prompt.ok" />" onclick="onClose();"></td>
					</tr>		
				</table>
			</s:form>
		</div>
	</body>
</html>
<script type="text/javascript">
function onClose(){
		window.opener.executeQuery(1,10);
 	try{
		if(parent.window!=null && parent.window!=undefined){
			if(parent.window._pageClose){
				parent.window._pageClose();
			}else{
				parent.window.close();
			}
		}
	}catch(E){
	}	
	if (parent.window.opener!=undefined && parent.window.opener.editRecordOverCustom!=undefined) {
		parent.window.opener.editRecordOverCustom();
	}
}
</script>