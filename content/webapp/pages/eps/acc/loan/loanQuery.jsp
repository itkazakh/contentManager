<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><s:text name="acc.Query.loan"/></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/meta.jsp"%>

</head>

<body id="all_title">

<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="bankSet.QueryRule" /></h2>
</div>
<s:form name="fm" action="findUser" namespace="/userGrade" method="post">
<s:hidden name="flag" id="flag"></s:hidden>
	<table class="fix_table">	
		<tr>
			<td class="bgc_tt short"><s:text name="acc.epsFeePlan.certiNo" /></td>			
			<td class="long"><input name="epsFeeMain.certiNo" id="epsFeeMain.certiNo" class='input_w w_30'></td>	
			<input name="epsFeeMain.appliUserCode" id="epsFeeMain.appliUserCode" type="hidden"/>
			<td class="bgc_tt short"><s:text name="employee.uName" /></td>
			<td class="long"><input name="epsFeeMain.appliUserName"
				id="epsFeeMain.appliUserName" class='input_y w_p90'
				ondblclick="code_CodeQuery(this, 'userCode', '-1,0', 'Y','')"
				onkeyup="code_CodeQuery(this, 'userCode', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'userCode', '-1,0', 'Y','')"/>
				<s:hidden name="welcome" value="${welcome }"></s:hidden>	
			</td>
		</tr>		
		<tr>
			<input name="epsFeeMain.payCurrency" id="epsFeeMain.payCurrency" type="hidden">
			<td class="bgc_tt short"><s:text name="feeApply.payCurrency"/></td>
			<td class="long"><input name="payCurrecy"
				id="payCurrecy" class='input_y w_p90'
				ondblclick="code_CodeQuery(this, 'payCurrecy', '-1,0', 'Y','')"
				onkeyup="code_CodeQuery(this, 'payCurrecy', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'payCurrecy', '-1,0', 'Y','')"/></td>
			<td class="bgc_tt short"><s:text name="applyHTMain.payWay"/></td>
			<input name="epsFeeMain.opPayWay" id="epsFeeMain.opPayWay" type="hidden">
			<td class="long"><input name="opPayWay"
				id="opPayWay" class='input_y w_p90'
				ondblclick="code_CodeQuery(this, 'OPPayWay', '-1,0', 'Y','')"
				onkeyup="code_CodeQuery(this, 'OPPayWay', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'OPPayWay', '-1,0', 'Y','')"/></td>
		</tr>
		<tr>
		<td class="bgc_tt short"><s:text name="feeApply.appliDate"/></td>
			<td class="long"><input type="text" name="epsFeeMain.appliDate" id="startDate" class='input_w w_30'>
					<img src="${ctx}/pages/image/time/date_icon.gif" alt='<s:text name="bpmFlow.prompt.click.calenderPanel"/>' id="imgBtn1" class="showup" />
					<div id="calContainer" style="position: absolute;"></div>
		</td>
		<td class="bgc_tt short"></td>
		<td class="long"></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="button"
				class="button_ty" value="<s:text name="prompt.query"/>" onclick="executeQuery(1,10);">
				<input type="reset" class="button_ty" value="<s:text name="prompt.reset"/>" >
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
	var contentDataTable;
	var contentColumnHeaders; 
	YAHOO.namespace("query.container");  
	
	function init(){
	init_calendar("calContainer","imgBtn1","startDate");
		var userName_tip = new YAHOO.widget.Tooltip("userName_tip",{text:"请双击选择员工名称",context:"saaUser.userName",zIndex:300});
		var payCurrecy_tip = new YAHOO.widget.Tooltip("payCurrecy_tip",{text:"请双击选择支付币别",context:"payCurrecy",zIndex:300});
		var OPPayWay_tip = new YAHOO.widget.Tooltip("OPPayWay_tip",{text:"请双击选择支付方式",context:"OPPayWay",zIndex:300});
		 YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		    var oId = oRecord.certiNo;
		    var certiType = oRecord.certiType;
		     if(oColumn.key=="edit"){
	    		 //elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/saaUserInstead/checkUserInstead.do?userCode=" + oId+"')\">配置</a>";
		      }
		     if(oColumn.key=="certiType"){
		      	switch(oRecord.certiType){
		      		case '10':elCell.innerHTML="预支";break;
		      		case '20':elCell.innerHTML="差旅费报销";break;
		      		case '21':elCell.innerHTML="招待费报销";break;
		      		case '22':elCell.innerHTML="手续费报销";break;
		      		case '23':elCell.innerHTML="资产购买报销";break;
		      		case '24':elCell.innerHTML="车辆使用报销";break;
		      		case '29':elCell.innerHTML="其他费用报销";break;
		      	}
		      }
		      if(oColumn.key=="opPayWay"){
		      	switch(oRecord.opPayWay){
		      		case '10':elCell.innerHTML="现金";break;
		      		case '20':elCell.innerHTML="银行转账";break;
		      		case '21':elCell.innerHTML="个人转账";break;
		      		case '22':elCell.innerHTML="转账支票";break;
		      		case '23':elCell.innerHTML="现金支票";break;
		      	}
		      }				
		      
		      if (oColumn.key == "certiNo"){
		    	  elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/accPaymentPay/viewFeeMain.do?certiNo=" + oId+"')\">" + oId + "</a>";	
			  }
		      if(oColumn.key=="payEdit"){
		     	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/accPaymentPay/queryDetailsLoan.do?certiNo=" + oId+"')\">还款</a>";
		      }
		 };
		
		contentColumnHeaders =[
<%--			{key:"id",text:"请选择",width:"40em",type:"radio",sortable:true},--%>
			{key:"certiType",text:"<s:text name='acc.oppCenterQuery.certiType' />",width:"40em",sortable:true,type:"link"},
			{key:"certiNo",text:"<s:text name='air.certiNo' />",width:"40em",type:"link",sortable:true},
			{key:"attribute4",text:"<s:text name='applyMain.applyUser' />",width:"50em",sortable:true},
			{key:"opPayWay",text:"<s:text name='applyHTMain.payWay' />",width:"30em",type:"link",sortable:true},
			{key:"payCurrency",text:"<s:text name='applyMain.payCurrency' />",width:"30em",sortable:true},
			{key:"realPayFee",text:"<s:text name='acc.paymentPay.payFee' />",width:"20em",resizeable:true},
			{key:"remainFee",text:"<s:text name='acc.loan.remainFee' />",width:"50em",resizeable:true},
			{key:"payEdit",text:"<s:text name='prompt.process' />",width:"20em",type:"link",resizeable:true}
			]; 
		if(fm.welcome.value=='true'){
			executeQuery(1,10);
		}
	}
	//Query Data
	function executeQuery(pageNo,pageSize){
		if(isNaN(parseInt(pageNo))){ 
			pageNo = 1;
		}
		if(isNaN(parseInt(pageSize))){
			pageSize = 10;
		}
		var myColumnSet = new YAHOO.widget.ColumnSet(contentColumnHeaders);	
		var myDataSource = new YAHOO.util.DataSource("${ctx}/accPaymentPay/queryLoan.do");
		myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		myDataSource.responseSchema = {
		   resultsList: "data",
		   fields: ["certiType", "certiNo", "attribute4", "opPayWay", "payCurrency", "realPayFee", "remainFee"],
		   totalRecords: "totalRecords"
		};
		myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation);	
		myDataSource.connMgr.setForm(fm);
		var initialRequest = "pageSize="+pageSize+"&pageNo="+pageNo;
		var myConfiges ={
			initialRequest:initialRequest,
			paginator:false
		};   
			contentDataTable = new YAHOO.widget.DataTable("content",myColumnSet,myDataSource,myConfiges);
	}
	YAHOO.util.Event.addListener(window,'load',init);
	</script>