<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<%@ include file="/common/i18njs.jsp"%>
		<%@ include file="/common/meta_css.jsp" %>
		<%@ include file="/common/meta_js.jsp" %>
		<script language="javascript" src="${ctx}/common/js/MulLine.js"></script>
		<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
		<script language="javascript" src="${ctx}/pages/eps/acc/accconfirm/js/accConfirm.js"></script>
		<script type="text/javascript">
			// 提交并判断借贷是否相等，借贷是否等于原来的金额。
			// 验证必须输入项
			function checkRequird(){
				var length = document.getElementsByName("size").length - 1;	// 得到页面上已经显示的列表的个数
				for(var i=0;i<length;i++){
					var remarkName = "voucherTempList["+i+"].remark";
					var itemCodeName = "voucherTempList["+i+"].itemCode";
					var currencyName = "voucherTempList["+i+"].currency";
					var exchangeRateName = "voucherTempList["+i+"].exchangeRate";
					var debitSourceName = "voucherTempList["+i+"].debitSource";
					var creditSourceName = "voucherTempList["+i+"].creditSource";
					var debitDestName = "voucherTempList["+i+"].debitDest";
					var creditDestName = "voucherTempList["+i+"].creditDest";
					if(document.getElementsByName(remarkName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.remarkRequired"></s:text>");
						return false;
					}
					if(document.getElementsByName(itemCodeName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.itemCodeRequired"></s:text>");
						return false;
					}
					if(document.getElementsByName(currencyName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.currencyRequired"></s:text>");
						return false;
					}
					if(document.getElementsByName(exchangeRateName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.exchRequried"></s:text>");
						return false;
					}
					if(document.getElementsByName(debitSourceName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.debitSourceRequried"></s:text>");
						return false;
					}
					if(document.getElementsByName(creditSourceName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.creditSourceRequried"></s:text>");
						return false;
					}
					if(document.getElementsByName(debitDestName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.debitDestRequried"></s:text>");
						return false;
					}
					if(document.getElementsByName(creditDestName)[0].value == ""){
						alert("<s:text name="errors.paymentConfirm.creditDestRequried"></s:text>");
						return false;
					}
					
				}
				return true;
			}
			function submitForm(){
				// 判断借贷是否相等
				var sumDebitDest = fm.sumDebitDest.value;
				var sumCreditDest = fm.sumCreditDest.value;
				if(!checkRequird()){
					return;
				}
				if(sumDebitDest - sumCreditDest != 0){
					alert("<s:text name="errors.paymentConfirm.debitUnequalCredit"></s:text>");
					return;
				}
				// 判断是否跟原始金额相等
				var originalSumCreditDest = fm.originalSumCreditDest.value;
				if(sumCreditDest - originalSumCreditDest != 0){
					alert("<s:text name="errors.paymentConfirm.sumCreditUnequalOriginal"></s:text>");
					return;
				}
				fm.target = "page";
		      	fm.submit();
		      	fm.voucherSubmit.disabled = "true";
			}
			
		</script>
		<title><s:text name="acc.voucher" /></title>
		<link href="${ctx}/style/query.css" type="text/css" rel="stylesheet">
	</head>
	<body id="all_title">
		<div id="crash_menu">
			<h2>
				<s:text name="acc.voucher" />
			</h2>
			<s:form name="fm" action="voucherVerify" method="post" namespace="/accPaymentConfirm">
				<table class="fix_table" border="1">
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.yearMonth" /></td>
						<td class="long">
							<s:hidden name="certiNos"></s:hidden>
							<s:textfield cssClass='input_w w_15' name="epsMainVoucher.yearMonth" 
									id="epsMainVoucher.yearMonth" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.operatorCode" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucher.operatorCode" 
								id="epsMainVoucher.operatorCode" readonly="true"></s:textfield>
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.centerCode" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucher.centerCode" 
								id="centerCode" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"><s:text name="acc.voucher.voucherDate" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucher.voucherDate" 
								id="epsMainVoucher.voucherDate" readonly="true">
								<s:param name="value">
									<s:date name="epsMainVoucher.voucherDate" format="yyyy-MM-dd"/>
								</s:param>
							</s:textfield>
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short"><s:text name="acc.voucher.auxNumber" /></td>
						<td class="long">
							<s:textfield cssClass='input_w w_15' name="epsMainVoucher.auxNumber" 
								id="epsMainVoucher.auxNumber" readonly="true"></s:textfield>
						</td>
						<td class="bgc_tt short"></td>
						<td class="long">
						</td>
					</tr>
				</table>
				<!-- 用于复制的table -->
				<table style="display:none" border='1'>
					<tbody>
						<s:iterator id="resetVoucherNo" value="resetVoucherNoList" status="status">
							<tr>
								<td>
									<s:hidden name="%{'resetVoucherNoList['+#status.index+'].businessNo'}" />
								</td>
								<td><s:hidden name="%{'resetVoucherNoList['+#status.index+'].serialNo'}" /></td>
								<td><s:hidden name="%{'resetVoucherNoList['+#status.index+'].tableName'}" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<!-- 用于复制的table -->
				<table id="voucherDetailTemp_Data" style="display:none" border='1'>
					<tbody>
						<tr>
							<td><s:textfield cssClass='input_w w_7' name="voucherTempList_[0].remark" required="true" ></s:textfield>
								<s:hidden name="size"></s:hidden>
							</td>
							<td><s:textfield cssClass='input_y w_p90' name="voucherTempList_[0].itemCode"
										ondblclick="codeSelect(this);"
				                 		onkeyup="codeSelect(this);"
										id="voucherTempList_[0].itemCode"></s:textfield></td>
							<td><s:textfield cssClass='input_w w_p90' name="voucherTempList_[0].itemName" readonly="true"></s:textfield></td>
							<td><s:textfield cssClass='input_y w_p90' name="voucherTempList_[0].currency" value="CNY"
										ondblclick="code_CodeSelect(this, 'exchCurrency', '0', 'Y');"
				                 		onkeyup="code_CodeSelect(this, 'exchCurrency', '0', 'Y')"
				                 		onchange="code_CodeChange(this, 'exchCurrency', '0', 'Y')"></s:textfield></td>
							<td><s:textfield cssClass='input_w w_p90' name="voucherTempList_[0].exchangeRate" value="1.00"
										onchange="reCalDest();sumDebitCredit();testListener();"></s:textfield></td>
							<td><s:textfield cssClass='input_w w_p90' name="voucherTempList_[0].debitSource" value="0.00" 
										onchange="reCalDest();sumDebitCredit();testListener();"></s:textfield></td>
							<td><s:textfield cssClass='input_w w_p90' name="voucherTempList_[0].debitDest" value="0.00"
										onchange="sumDebitCredit();"></s:textfield></td>
							<td><s:textfield cssClass='input_w w_p90' name="voucherTempList_[0].creditSource" value="0.00"
										onchange="reCalDest();sumDebitCredit();"></s:textfield></td>
							<td><s:textfield cssClass='input_w w_p90' name="voucherTempList_[0].creditDest" value="0.00"
										onchange="sumDebitCredit();"></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T1Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T1" 
										id="voucherTempList_[0].T1" ></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T2Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T2"
										id="voucherTempList_[0].T2"></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T3Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T3" 
										id="voucherTempList_[0].T3"></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T4Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T4"
										id="voucherTempList_[0].T4"></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T5Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T5"
										id="voucherTempList_[0].T5"></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T6Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T6"
										id="voucherTempList_[0].T6"></s:textfield></td>
							<td>
							<s:hidden name="voucherTempList_[0].T7Code"></s:hidden>
							<s:textfield cssClass='input_w w_7' name="voucherTempList_[0].T7"
										id="voucherTempList_[0].T7"></s:textfield></td>
							<td>
								<input type="button" name="Address_button_Delete" class="button_ty"
									onclick="deleteRow(this,'voucherDetailTemp');" value="-"/>
							</td>			
						</tr>
					</tbody>
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
								<td>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].remark'}" required="true"
										id="%{'voucherTempList['+#status.index+'].remark'}"></s:textfield>
									<s:hidden name="size"></s:hidden>
								</td>
								<td>
									<s:textfield cssClass='input_y w_p90' name="%{'voucherTempList['+#status.index+'].itemCode'}" 
											ondblclick="codeSelect(this);"
				                 			onkeyup="codeSelect(this);"
				                 			id="%{'voucherTempList['+#status.index+'].itemCode'}"></s:textfield>
								</td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].itemName'}" 
									readonly="true" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].currency'}" 
									readonly="true" ></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].exchangeRate'}" 
									onchange="reCalDest();;sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].debitSource'}" 
									onchange="reCalDest();sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].debitDest'}" 
									onchange="sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].creditSource'}" 
									onchange="reCalDest();sumDebitCredit();"></s:textfield></td>
								<td><s:textfield cssClass='input_w w_p90' name="%{'voucherTempList['+#status.index+'].creditDest'}" 
									onchange="sumDebitCredit();"></s:textfield></td>
								<td>
									<s:hidden name="%{'voucherTempList['+#status.index+'].T1Code'}"></s:hidden>
								<s:set name="T1Name" value="%{'voucherTempList['+#status.index+'].T1'}"/>
								<s:set name="T1" value="${T1Name}"/>
								<s:if test="${T1!=null && T1!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T1'}" 
										ondblclick="code_CodeSelect(this, 'T1', '-1,0', 'Y','fm.centerCode.value');"
				                 		onkeyup="code_CodeSelect(this, 'T1', '-1,0', 'Y','fm.centerCode.value')"
				                 		onchange="code_CodeChange(this, 'T1', '-1,0', 'Y','fm.centerCode.value')"
				                 		id="%{'voucherTempList['+#status.index+'].T1'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T1'}" 
										readonly="true" ></s:textfield>
								</s:else>
								</td>
								<td>
								<s:hidden name="%{'voucherTempList['+#status.index+'].T2Code'}"></s:hidden>
								<s:set name="T2Name" value="%{'voucherTempList['+#status.index+'].T2'}"/>
								<s:set name="T2" value="${T2Name}"/>
								<s:if test="${T2!=null && T2!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T2'}" 
										ondblclick="code_CodeSelect(this, 'T2', '-1,0', 'Y','fm.centerCode.value');"
		                				onkeyup="code_CodeSelect(this, 'T2', '-1,0', 'Y','fm.centerCode.value')"
		                				onchange="code_CodeChange(this, 'T2', '-1,0', 'Y','fm.centerCode.value')"
		                				id="%{'voucherTempList['+#status.index+'].T2'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T2'}" 
										readonly="true" ></s:textfield>
								</s:else>	
								</td>
								<td>
								<s:hidden name="%{'voucherTempList['+#status.index+'].T3Code'}"></s:hidden>
								<s:set name="T3Name" value="%{'voucherTempList['+#status.index+'].T3'}"/>
								<s:set name="T3" value="${T3Name}"/>
								<s:if test="${T3!=null && T3!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T3'}" 
										ondblclick="code_CodeSelect(this, 'T3', '-1,0', 'Y','fm.centerCode.value');"
				                 		onkeyup="code_CodeSelect(this, 'T3', '-1,0', 'Y','fm.centerCode.value')"
				                 		onchange="code_CodeChange(this, 'T3', '-1,0', 'Y','fm.centerCode.value')"
				                 		id="%{'voucherTempList['+#status.index+'].T3'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T3'}" 
										readonly="true" ></s:textfield>
								</s:else>
								
								</td>
								<td>
								<s:hidden name="%{'voucherTempList['+#status.index+'].T4Code'}"></s:hidden>
								<s:set name="T4Name" value="%{'voucherTempList['+#status.index+'].T4'}"/>
								<s:set name="T4" value="${T4Name}"/>
								<s:if test="${T4!=null && T4!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T4'}" 
										ondblclick="code_CodeSelect(this, 'T4', '-1,0', 'Y','fm.centerCode.value');"
			                			onkeyup="code_CodeSelect(this, 'T4', '-1,0', 'Y','fm.centerCode.value')"
			                 			onchange="code_CodeChange(this, 'T4', '-1,0', 'Y','fm.centerCode.value')"
			                 			id="%{'voucherTempList['+#status.index+'].T4'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T4'}" 
										readonly="true" ></s:textfield>
								</s:else>
								</td>
								<td>
								<s:hidden name="%{'voucherTempList['+#status.index+'].T5Code'}"></s:hidden>
								<s:set name="T5Name" value="%{'voucherTempList['+#status.index+'].T5'}"/>
								<s:set name="T5" value="${T5Name}"/>
								<s:if test="${T5!=null && T5!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T5'}" 
										ondblclick="code_CodeSelect(this, 'T5', '-1,0', 'Y','fm.centerCode.value');"
				                 		onkeyup="code_CodeSelect(this, 'T5', '-1,0', 'Y','fm.centerCode.value')"
				                 		onchange="code_CodeChange(this, 'T5', '-1,0', 'Y','fm.centerCode.value')"
				                 		id="%{'voucherTempList['+#status.index+'].T5'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T5'}" 
										readonly="true" ></s:textfield>
								</s:else>
								</td>
								<td>
								<s:hidden name="%{'voucherTempList['+#status.index+'].T6Code'}"></s:hidden>
								<s:set name="T6Name" value="%{'voucherTempList['+#status.index+'].T6'}"/>
								<s:set name="T6" value="${T6Name}"/>
								<s:if test="${T6!=null && T6!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T6'}" 
										ondblclick="code_CodeSelect(this, 'T6', '-1,0', 'Y','fm.centerCode.value');"
				                 		onkeyup="code_CodeSelect(this, 'T6', '-1,0', 'Y','fm.centerCode.value')"
				                 		onchange="code_CodeChange(this, 'T6', '-1,0', 'Y','fm.centerCode.value')"
				                 		id="%{'voucherTempList['+#status.index+'].T6'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T6'}" 
										readonly="true" ></s:textfield>
								</s:else>
								</td>
								<td>
								<s:hidden name="%{'voucherTempList['+#status.index+'].T7Code'}"></s:hidden>
								<s:set name="T7Name" value="%{'voucherTempList['+#status.index+'].T7'}"/>
								<s:set name="T7" value="${T7Name}"/>
								<s:if test="${T7!=null && T7!=''}">
									<s:textfield cssClass='input_y w_7' name="%{'voucherTempList['+#status.index+'].T7'}" 
										ondblclick="code_CodeSelect(this, 'T7', '-1,0', 'Y','fm.centerCode.value');"
			                 			onkeyup="code_CodeSelect(this, 'T7', '-1,0', 'Y','fm.centerCode.value')"
			                 			onchange="code_CodeChange(this, 'T7', '-1,0', 'Y','fm.centerCode.value')"
			                 			id="%{'voucherTempList['+#status.index+'].T7'}"></s:textfield>
								</s:if>
								<s:else>
									<s:textfield cssClass='input_w w_7' name="%{'voucherTempList['+#status.index+'].T7'}" 
										readonly="true" ></s:textfield>
								</s:else>
									<s:hidden name="%{'voucherTempList['+#status.index+'].checkNo'}" />
								</td>
								<td>
									<input type="button" class="button_ty" name="Address_button_Delete" value="-"
											onclick="deleteRow(this,'voucherDetailTemp');" value="-" />
								</td>
							</tr>
							<s:set name="sumDebitDest" value="${sumDebitDest + debitDest}"/>
		              	  	<s:set name="sumCreditDest" value="${sumCreditDest + creditDest}"/>
							<c:set var="index" value="${index+1}" />
						</s:iterator>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="16"></td>
							<td>
								<s:hidden name="index" value="${index}"/>
            					<input type="button" value="+" name="voucherDetailTemp_Insert_Row" class="button_ty"
            						onclick="insertRowForStruts2('voucherDetailTemp',this,fm.index.value);"/>
            				</td>
						</tr>
						<tr>
							<td colspan="17" align="center">
								<s:text name="acc.voucher.Sumdebit" /><input type="text" name="sumDebitDest" value="${sumDebitDest}" readonly class="input_w w_5"></input>
							    <s:text name="acc.voucher.Sumcredit" /><input type="text" name="sumCreditDest" value="${sumCreditDest}" readonly class="input_w w_5"></input>
							    <s:hidden name="originalSumCreditDest" value="${sumCreditDest}"></s:hidden>
						    </td>
						</tr>
        			</tfoot>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center"><input type="button" name="voucherSubmit"
							class="button_ty" value="<s:text name="prompt.ok" />" onclick="submitForm();">	
						</td>
					</tr>		
				</table>
			</s:form>
		</div>
	</body>
</html>
