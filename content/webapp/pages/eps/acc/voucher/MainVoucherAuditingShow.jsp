<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title><s:text name="voucher.message" /></title>
<link href="${ctx}/style/query.css" type="text/css" rel="stylesheet">
<script>
//判断当选择通过与下发修改时对于打回理由和指定修改人的不同状态
    function bo(){
	      if(document.getElementById("sh").checked){
		        document.getElementById("te1").value="";
		        document.getElementById("te1").readOnly="readOnly";
				document.getElementById("te2").readOnly="readOnly";
				alert("<s:text name="voucher.auditing" />");
		  }else{
		        document.getElementById("te1").readOnly="";
			    document.getElementById("te2").readOnly="";
	
		  }
	
	}
	function init(){
	init_calendar("calContainer","imgBtn","user.regDate","toSecond");
	init_calendar("calContainer1","imgBtn1","user.loginTime","toSecond");
	}
	YAHOO.util.Event.addListener(window,'load',init);

function checkForm(){
    var flag=document.getElementsByName("flag");
    var reason=document.getElementById("te1").value;
    var biao=0;
    for(var i=0;i<flag.length;i++){
      if(flag[i].checked)
       {biao++;
    }
    }
    if(biao==0){
    alert("<s:text name="voucher.flag" />");
       return false;
    }
    if(document.getElementById("sh1").checked){
      if(reason==""){
      alert("<s:text name="voucher.error" />");
        return false;
      }
    }
 
}
</script>

</head>
<body id="all_title"> 
  <div id="crash_menu">
<h2>
<s:text name="mainVoucher.message" />
</h2>
<s:form action="updateAuditingVoucher" method="post" namespace="/mainVoucher" validate="true" onsubmit="return checkForm();" >
<s:hidden name="voucherNo" value="${epsMainVoucher.voucherNo}" ></s:hidden>
<s:hidden name="id" value="${epsMainVoucher.id}" ></s:hidden>
	<table class="fix_table" border="0">
	<tr>
	<td class="bgc_tt short"><s:text name="epsMainVoucher.yearMonth" /></td>
	<td class="long"><s:label name="epsMainVoucher.yearMonth" id="epsMainVoucher.yearMonth" 
			cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.operatorCode" /></td>
	<td class="long"><s:label name="epsMainVoucher.operatorCode" id="epsMainVoucher.operatorCode" 
			cssClass='input_w w_15' /></td>
	</tr>
	<tr>
	<td class="bgc_tt short"><s:text name="epsMainVoucher.centerCode" /></td>
	<td class="long"><s:label name="epsMainVoucher.centerCode" id="epsMainVoucher.centerCode" 
			cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.voucherDate" /></td>
	<td class="long"><s:textfield name="epsMainVoucher.voucherDate" id="epsMainVoucher.voucherDate" 
			cssClass='input_w w_15' readonly="true">
			<s:param name="value">
			<s:date name="epsMainVoucher.voucherDate" format="yyyy-MM-dd"/>
			</s:param>
			</s:textfield>
			</td>
	</tr>
	<tr>
	<td class="bgc_tt short"><s:text name="epsMainVoucher.voucherNo" /></td>
	<td class="long"><s:label name="epsMainVoucher.voucherNo" id="epsMainVoucher.voucherNo" 
			cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.auxNumber" /></td>
	<td class="long"><s:label name="epsMainVoucher.auxNumber" id="epsMainVoucher.auxNumber" 
			cssClass='input_w w_15' /></td>
	</tr>
	<tr>
	<td></td><td></td><td></td><td></td>
	</tr>
	</table>
	<table class="fix_table" border="1"  id="voucherDetailTemp">
	<tr>
	<th rowspan="2"><s:text name="acc.voucher.remark" /></th>
	<th rowspan="2"><s:text name="acc.voucher.itemCode" /></th>
	<th rowspan="2"><s:text name="acc.voucher.itemName" /></th>
	<th rowspan="2"><s:text name="common.Currency" /></th>
	<th rowspan="2"><s:text name="common.rate" /></th>
	<th colspan="2" rowspan="1" align="center"><s:text name="acc.voucher.debit" /></th>
	<th colspan="2" rowspan="1" align="center"><s:text name="acc.voucher.credit" /></th>
	<th colspan="7" rowspan="1" align="center"><s:text name="acc.voucher.articleCode" /></th>
	</tr>
	<tr>
	<th rowspan="1"><s:text name="acc.voucher.Source" /></th>
	<th rowspan="1"><s:text name="acc.voucher.dest" /></th>
	<th rowspan="1"><s:text name="acc.voucher.Source" /></th>
	<th rowspan="1"><s:text name="acc.voucher.dest" /></th>
	<th rowspan="1">T1</th>
	<th rowspan="1">T2</th>
	<th rowspan="1">T3</th>
	<th rowspan="1">T4</th>
	<th rowspan="1">T5</th>
	<th rowspan="1">T6</th>
	<th rowspan="1">T7</th>
	</tr>
                    <s:set name="sum" value="debitDest"/>
		            <s:set name="sum1" value="creditDest"/>
<s:iterator value="list" id="voucherTemp">
		<tr>
								<td><s:property id="voucherTemp" value="remark"/></td>
								<td><s:property id="voucherTemp" value="itemCode"/></td>
								<td><s:property id="voucherTemp" value="itemName"/></td>
								<td><s:property id="voucherTemp" value="currency"/></td>
								<td><s:property id="voucherTemp" value="exchangeRate"/></td>
								<td><s:property id="voucherTemp" value="debitSource"/></td>
								<td><s:property id="voucherTemp" value="debitDest"/></td>
								<td><s:property id="voucherTemp" value="creditSource"/></td>
								<td><s:property id="voucherTemp" value="creditDest"/></td>
								<td><s:property id="voucherTemp" value="T1"/></td>
								<td><s:property id="voucherTemp" value="T2"/></td>
								<td><s:property id="voucherTemp" value="T3"/></td>
								<td><s:property id="voucherTemp" value="T4"/></td>
								<td><s:property id="voucherTemp" value="T5"/></td>
								<td><s:property id="voucherTemp" value="T6"/></td>
								<td><s:property id="voucherTemp" value="T7"/></td>
		</tr>
		<s:set name="sum" value="${sum+debitDest}"/>
		<s:set name="sum1" value="${sum1+creditDest }"/>
		</s:iterator>
	<tr>
	<td colspan="6" align="right"><s:text name="common.total" />：</td>
	<td colspan="2"><s:text name="common.debit" /><input type="text" name="sumDebitDest" value="${sum}" readonly class="input_w w_5"></input></td>
	<td colspan="2"><s:text name="common.borrow" /><input type="text" name="sumCreditDest" value="${sum1}" readonly class="input_w w_5"></input></td>
	<td colspan="7"></td>
	</tr>
	<tr><td colspan="17"></td></tr>
	</table>

	<table class="fix_table" border="1">
	<tr>
		<td class="bgc_tt short"> <s:text name="common.thing" /> </td>
		<td>
		 <input type="radio" name="flag" value="1" id="sh" onClick="bo();" >
          <s:text name="common.passto" /> 
       <input type="radio" name="flag" value="2" id="sh1" onClick="bo();">
            <s:text name="common.update" />  
		</td>
		</tr>
	<tr>
	    <td class="bgc_tt short"><s:text name="reason" /></td>
	    <td width="70%"><s:textarea name="reason" cols="50"   id="te1"/></td>
	</tr>
		<tr>
	    <td class="bgc_tt short"><s:text name="epsMainVoucher.operatorCodes" /></td>
		<td><s:textfield name="appoingPeople"   id="te2" cssClass='input_y w_p30'
          ondblclick="code_CodeSelect(this,'UpdateCode' ,'0','Y','${ComCode}')"
		  onkeyup="code_CodeSelect(this,'UpdateCode' ,'0','Y','${ComCode}')"
		  onchange="code_CodeSelect(this,'UpdateCode' ,'0','Y','${ComCode}')"/></td>
	</tr>
	</table>
			<tr>
		<td><input type="submit" class="button_ty" value="<s:text name="common.btn" />" /></td>
			</tr>		
  
</s:form></div>
</body>
</html>
