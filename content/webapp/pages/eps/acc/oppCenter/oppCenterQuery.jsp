<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><s:text name="acc.oppCenterQuery.title" /></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<script language="javascript" src="${ctx}/common/js/newCalendar.js"></script>
<script language="javascript" src="${ctx}/common/js/PopCalendar.js"></script>
</head>

<body id="all_title">

<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="acc.oppCenterQuery.inputCondition" /></h2>
</div>
<s:form name="fm" action="findUser" namespace="/userGrade" method="post">
<s:hidden name="flag" id="flag"></s:hidden>
	<table class="fix_table">	
		<tr>
			<td class="bgc_tt short"><s:text name="acc.oppCenterQuery.certiNo" /></td>			
			<td class="long"><input name="epsFeePlan.certiNo" id="epsFeePlan.certiNo" class='input_w w_30'>
				<s:hidden name="centerCode" value="%{#session.CenterCode}"/>
			</td>
			<td class="bgc_tt short"><s:text name="acc.oppCenterQuery.appliUserName" /></td>
			<td class="long"><input name="epsFeePlan.appliUserName"
				id="epsFeePlan.appliUserName" class='input_y w_p90'
				ondblclick="code_CodeSelect(this, 'userCode', '-1,0', 'Y','')"
				onkeyup="code_CodeSelect(this, 'userCode', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'userCode', '-1,0', 'Y','')"/>
				<s:hidden name="welcome" value="${welcome }"></s:hidden>
			</td>
		</tr>		
		<tr>
			
			<td class="bgc_tt short"><s:text name="acc.oppCenterQuery.payCurrency" /></td>
			<td class="long">
			<input name="epsFeePlan.payCurrency" id="epsFeePlan.payCurrency" type="hidden">
			<input name="payCurrecy"
				id="payCurrecy" class='input_y w_p90'
				ondblclick="code_CodeSelect(this, 'payCurrecy', '-1,0', 'Y','')"
				onkeyup="code_CodeSelect(this, 'payCurrecy', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'payCurrecy', '-1,0', 'Y','')"/></td>
			<td class="bgc_tt short"><s:text name="acc.oppCenterQuery.opPayWay" /></td>
			<td class="long">
			<input name="epsFeePlan.opPayWay" id="epsFeePlan.opPayWay" type="hidden">
			<input name="opPayWay"
				id="opPayWay" class='input_y w_p90'
				ondblclick="code_CodeSelect(this, 'OPPayWay', '-1,0', 'Y','')"
				onkeyup="code_CodeSelect(this, 'OPPayWay', '-1,0', 'Y','')"
				onchange="code_CodeChange(this, 'OPPayWay', '-1,0', 'Y','')"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="acc.oppCenterQuery.oppCenterCode" /></td>
			<td class="long"><input name="epsFeePlan.oppCenterCode"
				id="epsFeePlan.oppCenterCode" class='input_y w_p90'
				ondblclick="code_CodeSelect(this, 'oppCenterCode', '0,1', 'Y','fm.centerCode.value')"
				onkeyup="code_CodeSelect(this, 'oppCenterCode', '0,1', 'Y','fm.centerCode.value')"
				onchange="code_CodeChange(this, 'oppCenterCode', '0,1', 'Y','fm.centerCode.value')"/></td>
			<td class="bgc_tt short"><s:text name="acc.oppCenterQuery.oppCenterName" /></td>
			<td class="long"><input name="oppCenterName"
				id="oppCenterName" class='input_w w_p90' readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="feeApply.appliDate"/></td>
			<td class="long">
				<input type="text" name="epsFeePlan.appliDate" id="startDate" class='input_w w_p90'>
				<img src="${ctx}/pages/image/time/date_icon.gif" alt='<s:text name="bpmFlow.prompt.click.calenderPanel"/>' id="imgBtn1" class="showup" />
				<div id="calContainer" style="position: absolute;"></div>	
			</td>
			<td class="bgc_tt short"></td>
			<td class="long"></td>
		</tr>		
		<tr>
			<td colspan="4" align="center"><input type="button"
				class="button_ty" value="<s:text name="prompt.query" />" onclick="executeQuery(1,10);">
				<input type="reset" class="button_ty" value="<s:text name="prompt.reset" />" >
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
		      if(oColumn.key=="payCurrency"){
		      	switch(oRecord.payCurrency){
		      		case 'CNY':elCell.innerHTML="人民币";break;
		      		case 'USD':elCell.innerHTML="美元";break;
		      	}
		      }
		      if(oColumn.key=="payEdit"){
		     	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/accPaymentPay/queryDetailsOppCenterCom.do?certiNo=" + oId+"')\"><s:text name="acc.oppCenterQuery.pay" /></a>";
		      }
		      if(oColumn.key=="certiNo"){
		      	elCell.innerHTML = "<a href=\"#\" onclick=\"showRecord('${ctx}/feeMain/viewFeeMain.do?certiNo=" + oId+"')\">"+oData+"</a>";
		      }
		 };
		
		contentColumnHeaders =[
			{key:"certiType",text:"<s:text name="acc.oppCenterQuery.certiType" />",width:"40em",sortable:true,type:"link"},
			{key:"certiNo",text:"<s:text name="acc.oppCenterQuery.certiNo" />",width:"40em",type:"link",sortable:true},
			{key:"attribute4",text:"<s:text name="acc.oppCenterQuery.appliUser" />",width:"50em",sortable:true},
			{key:"opPayWay",text:"<s:text name="acc.oppCenterQuery.opPayWay" />",width:"30em",type:"link",sortable:true},
			{key:"payCurrency",text:"<s:text name="acc.oppCenterQuery.payCurrency" />",width:"30em",type:"link",sortable:true},
			{key:"realPayFee",text:"<s:text name="acc.oppCenterQuery.payFee" />",width:"20em",resizeable:true},
			{key:"payEdit",text:"<s:text name="prompt.process" />",width:"20em",type:"link",resizeable:true}
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
		var myDataSource = new YAHOO.util.DataSource("${ctx}/accPaymentPay/queryOppCenterCom.do");
		myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		myDataSource.responseSchema = {
		   resultsList: "data",
		   fields: ["certiType", "certiNo", "attribute4", "opPayWay", "payCurrency", "realPayFee"],
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