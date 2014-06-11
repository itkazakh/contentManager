 <!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title><s:text name="sys.payway.title" /></title>
		<%@ include file="/common/i18njs.jsp"%>
		<%@ include file="/common/meta_css.jsp"%>
		<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
	</head>
	<body id="all_title">
		<div id="wrapper">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="welcome">
				<tr>
		<td align="left"><img src="${ctx}/pages/login_images/imgWelcome.gif"></td>

				</tr>
			</table>
			<div id="crash_menu">
				<h2>
					<s:text name="prompt" />
				</h2>
			</div>
			<table class="fix_table" border="0">
				<tr>
					<td width="50%">
						<table class="fix_table" border="0">
							<thead>
								<tr>
									<td>
										<h3 align="center">
											<s:text name="prompt.AccountManager" />
										</h3>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
										<s:if test="${prompt.claimsToPay==0}">
											${prompt.claimsToPay}
										</s:if>
										<s:else>
											<s:url id="claimsToPayURL" action="prepareQueryPrePay" namespace="/accPaymentPay">
												<s:param name="welcome" value="true"></s:param>
											</s:url>
											<s:a href="%{claimsToPayURL}" cssClass="ul.menu">${prompt.claimsToPay}</s:a>
										</s:else>
										<s:text name="prompt.Claims.Payment" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
										<s:if test="${prompt.advanceToRepayment==0}">
											${prompt.advanceToRepayment}
										</s:if>
										<s:else>
											<s:url id="advanceToRepaymentURL" action="prepareQueryLoan" namespace="/accPaymentPay">
												<s:param name="welcome" value="true"></s:param>
											</s:url>
											<s:a href="%{advanceToRepaymentURL}" cssClass="ul.menu">${prompt.advanceToRepayment}</s:a>
										</s:else>
										<s:text name="prompt.Advance.Repayment" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
										<s:if test="${prompt.oppCenterToProcess==0}">
											${prompt.oppCenterToProcess}
										</s:if>
										<s:else>
											<s:url id="oppCenterToProcessURL" action="prepareQueryOppCenterCom" namespace="/accPaymentPay">
												<s:param name="welcome" value="true"></s:param>
											</s:url>
											<s:a href="%{oppCenterToProcessURL}" cssClass="ul.menu">${prompt.oppCenterToProcess}</s:a>
										</s:else>
										<s:text name="prompt.Claims.toCenter" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
										<s:if test="${prompt.claimsToConfirm==0}">
											${prompt.claimsToConfirm}
										</s:if>
										<s:else>
											<s:url id="claimsToConfirmURL" action="queryFeePlan" namespace="/accPaymentConfirm">
												<s:param name="welcome" value="true"></s:param>
											</s:url>
											<s:a href="%{claimsToConfirmURL}" cssClass="ul.menu">${prompt.claimsToConfirm}</s:a>
										</s:else>
										<s:text name="prompt.Claims.Confirm" />
									</td>
								</tr>
								<tr>
									<td align="center"></td>

								</tr>
							</tbody>
						</table>
					</td>
					<td width="50%">
						<table class="fix_table" border="0">
							<thead>
								<tr>
									<td >
										<h3 align="center">
											<s:text name="prompt.Audit" />
										</h3>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
											<s:if test="${prompt.evectionApplysToAudit==0}">
												${prompt.evectionApplysToAudit}
											</s:if>
											<s:else>
												<s:url id="evectionApplysToAuditURL" action="prepareFindAuditApply" namespace="/bpm">
													<s:param name="welcome" value="true"></s:param>
													<s:param name="certiType">apply</s:param>
												</s:url>
												<s:a href="%{evectionApplysToAuditURL}" cssClass="ul.menu">${prompt.evectionApplysToAudit}</s:a>
											</s:else>
										<s:text name="prompt.Audit.TravelApplication" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
											<s:if test="${prompt.assetApplysToAudit==0}">
												${prompt.assetApplysToAudit}
											</s:if>
											<s:else>
												<s:url id="assetApplysToAuditURL" action="prepareFindAuditApply" namespace="/bpm">
													<s:param name="welcome" value="true"></s:param>
													<s:param name="certiType">faApply</s:param>
												</s:url>
												<s:a href="%{assetApplysToAuditURL}" cssClass="ul.menu">${prompt.assetApplysToAudit}</s:a>
											</s:else>
										<s:text name="prompt.Audit.AssetsApplication" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
											<s:if test="${prompt.compactApplysToAudit==0}">
												${prompt.compactApplysToAudit}
											</s:if>
											<s:else>
												<s:url id="compactApplysToAuditURL" action="prepareFindAuditHT" namespace="/bpm">
													<s:param name="welcome" value="true"></s:param>
												</s:url>
												<s:a href="%{compactApplysToAuditURL}" cssClass="ul.menu">${prompt.compactApplysToAudit}</s:a>
											</s:else>
										<s:text name="prompt.Audit.ContractApplication" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
											<s:if test="${prompt.expenseAccountToAudit==0}">
												${prompt.expenseAccountToAudit}
											</s:if>
											<s:else>
												<s:url id="expenseAccountToAuditURL" action="prepareFindAudit" namespace="/bpm">
													<s:param name="welcome" value="true"></s:param>
												</s:url>
												<s:a href="%{expenseAccountToAuditURL}" cssClass="ul.menu">${prompt.expenseAccountToAudit}</s:a>
											</s:else>
										<s:text name="prompt.Audit.Claims" />
									</td>
								</tr>
								<tr>
									<td align="center">
										<s:text name="prompt.Claims.have" />
											<s:if test="${prompt.advanceToAudit==0}">
												${prompt.advanceToAudit}
											</s:if>
											<s:else>
												<s:url id="advanceToAuditURL" action="prepareFindAudit" namespace="/bpm">
													<s:param name="welcome" value="true"></s:param>
													<s:param name="certiType">BA</s:param>
												</s:url>
												<s:a href="%{advanceToAuditURL}" cssClass="ul.menu">${prompt.advanceToAudit}</s:a>
											</s:else>
										<s:text name="prompt.Advance.Audit" />
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div id="content" class="sort"></div>
		<div id="content_navigation" class="query" align="center"></div>

		<%@ include file="/common/meta_js.jsp"%>
<script type="text/javascript">
var isFirstLoad = true;
var contentDataTable;
var contentColumnHeaders;
var queryForm;
YAHOO.namespace("query.container");
</script>
	</body>
</html>
