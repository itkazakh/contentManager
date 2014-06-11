<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.commons.lang.builder.ToStringBuilder"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="cn.com.picc.claim.common.service.facade.*"%>
<%@ page import="cn.com.picc.claim.common.vo.*"%>
<%@ page import="cn.com.picc.claim.schema.model.*"%>
<%

	request.setAttribute("codeType","DamageTypeCode");

double d1 = -19.41;
double d2 = -12.144;
double d3 = d1 + d2;



BigDecimal dec = new BigDecimal( d3 ).setScale(2,BigDecimal.ROUND_HALF_UP);


	java.util.ArrayList list = new java.util.ArrayList();
	list.add("001,009");
	list.add("009");
	request.setAttribute("lista","001,009");
	
%>
<%@page import="java.math.BigDecimal"%>
<html>
<head>
<base target="_self">
<title>Code Select</title>

<%@ include file="/pages/common/meta.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/i18njs.jsp"%>

<script language="javascript">
function init(){
	init_calendar("calContainer1","showup1","begindata1");
	init_calendar("calContainer2","showup2","begindata2");
	init_calendar("calContainer3","showup3","begindata3");
}


function testme(){
	alert( document.all("showup").outerHTML );
	alert( document.all("showup3").outerHTML );
}

//init on load
YAHOO.util.Event.addListener(window,'load',init);
</script>
</head>
<body>
<form name="fm">
<br><br><br><br><br><br><br>
<table>

<tr>
		<td class="bgc_tt short">
			流入时间
		</td>
		<td>
			
				<input type="text" name="begindata1" id="begindata1" class="input_w w_10" />
				<img src="${ctx}/pages/image/time/date_icon.gif" alt="点击显示时间面板"  align="absmiddle" id="showup1" class="showup"/>
				<div id="calContainer1"></div> 
			
		</td>
		<td>

		</td>
		<td>

		</td>
</tr>
<tr>
		<td class="bgc_tt short">
			流入时间
		</td>
		<td>
			
			<input type="text" name="begindata2" id="begindata2" class="input_w w_10" />
			<img src="${ctx}/pages/image/time/date_icon.gif" alt="点击显示时间面板" id="showup2" class="showup"/>
			<div id="calContainer2"></div> 
		

		</td>
		<td>

		</td>
		
		<td>
			
			<input type="text" name="begindata3" id="begindata3" class="input_w w_10" />
			<img src="${ctx}/pages/image/time/date_icon.gif" alt="点击显示时间面板" id="showup3" class="showup"/>
			<div id="calContainer3"></div> 
			

		</td>
</tr>
<tr>
	<td colspan="2">ffff</td>
</tr>
<tr>
	<td colspan="2">ffff</td>
</tr>
<tr>
	<td colspan="2">ffff</td>
</tr>
<tr>
	<td colspan="2">ffff</td>
</tr>

</table>

翻页多:
<s:textfield name="test"
	ondblclick="code_CodeQuery(this, 'RiskCode', '0,1', 'Y','DAA');"
	onkeyup="code_CodeQuery(this, 'RiskCode', '0,1', 'Y','DAA')"
	onchange="code_CodeChange(this, 'RiskCode', '0,1', 'Y','DAA')">
</s:textfield>
<s:textfield name="testname" />
<hr>
翻页单:
<s:textfield name="test"
	ondblclick="code_CodeSelect(this, 'RiskCode', '0,1', 'Y','DAA');"
	onkeyup="code_CodeSelect(this, 'RiskCode', '0,1', 'Y','DAA')"
	onchange="code_CodeChange(this, 'RiskCode', '0,1', 'Y','DAA')">
</s:textfield>
<s:textfield name="testname" />


<hr>
双击域(多选):
<s:textfield name="test"
	ondblclick="code_CodeQuery(this, '${codeType}', '0,1', 'Y','DAA');"
	onkeyup="code_CodeQuery(this, '${codeType}', '0,1', 'Y','DAA')"
	onchange="code_CodeChange(this, '${codeType}', '0,1', 'Y','DAA')">
</s:textfield>
<s:textfield name="testname" />
<br>
<br><app:select riskCode="" codeType=""></app:select>
<hr/>
空的下拉菜单(单选)：
<app:select riskCode="" codeType=""></app:select>
<hr/>
双击域(单选):
<s:textfield name="test"
	ondblclick="code_CodeSelect(this, 'SexCode', '0,1', 'Y','DAA');"
	onchange="code_CodeChange(this, 'SexCode', '0,1', 'Y','DAA')">
</s:textfield>
<s:textfield name="testname" />

下拉菜单(单选)：
<app:select name="XXX.XXXX" riskCode="DAA" codeType="SexCode" value="'9'"></app:select>
<hr/>
下拉菜单(多选):  {${lista}}
<app:select  multiple="true"  riskCode="DAA" codeType="${codeType}"   value="#{%{lista}}"/>
<hr/>
<hr/>
双击域(多选):
<s:textfield name="test"
	ondblclick="code_CodeQuery(this, '${codeType}', '0,1', 'Y','DAA');"
	onkeyup="code_CodeQuery(this, '${codeType}', '0,1', 'Y','DAA')"
	onchange="code_CodeChange(this, '${codeType}', '0,1', 'Y','DAA')">
</s:textfield>
<s:textfield name="testname" />
<hr/>
</form>
taskId=${taskId}
<%

/*

WebApplicationContext wac = WebApplicationContextUtils
.getRequiredWebApplicationContext(pageContext
		.getServletContext());

//BillNoService billNoService = (BillNoService) wac.getBean("billNoService");
//Long l = billNoService.getBusinessId(PrpLcompensate.class,"");
//out.println("l="+l);


PolicyInfoService policyInfoService = (PolicyInfoService) wac.getBean("policyInfoService");
java.util.List<String> policyNos = policyInfoService.findMultiPolicyNo("RDAA200711010800534605");


//policyInfoService.savePrpLcMain("PDAA200711010800000001","aaaaaa",new java.util.Date(),0,"");

policyInfoService.savePrpLcMain("PDAA200711010800000001","aaaaaa",new java.util.Date(),0,"");



SummaryCondition cond = new SummaryCondition();
cond.setPolicyNo("PDAA200711010800000002");
java.util.List<PolicySummary> list2 = policyInfoService.findPolicySummaryList(cond);

for(PolicySummary sum : list2){
	out.println( ToStringBuilder.reflectionToString(sum) );
}

out.println("<hr>");

PrpLcMain prpLcMain = policyInfoService.findPolicyInfo("PDAA200642050300000232",new java.util.Date(),0,"");

for(PrpLcItemKind itemkind: prpLcMain.getPrpLcItemKinds() ){
	out.println( ToStringBuilder.reflectionToString(itemkind) );
	out.println("<hr>");
}
*/
%>

taskId=${taskId}
inkey=${inkey}
processId=${processId}

<input type="button" value="test"  onclick="testme()">
</body>
</html>
