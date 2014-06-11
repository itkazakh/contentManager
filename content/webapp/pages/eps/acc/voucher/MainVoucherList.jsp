<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="user.manage" /></title>
<%@ include file="/common/meta_css.jsp"%>
</head>
<body id="all_title">
<div id="wrapper">
<div id="crash_menu">
<h2 align="center"><s:text name="applyMain.head" /></h2>
</div>
<s:form action="findMainVoucher" method="post" namespace="/mainVoucher" name="fm"
	validate="true" onsubmit="return submitQuery(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="epsMainVoucher.yearMonth" /></td>
			<td class="long"><s:textfield name="epsMainVoucher.yearMonth"
						requiredposition="right" cssClass='input_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="epsMainVoucher.operatorCode" /></td>			
			<td class="long"><s:textfield name="epsMainVoucher.operatorCode"
					requiredposition="right" cssClass='input_w w_15' /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsMainVoucher.voucherNo" /></td>
			<td class="long"><s:textfield name="fromId" requiredposition="right" cssClass='input_w w_15'/></td>
			<td class="bgc_tt short"><s:text name="prompt.to" /></td>			
			<td class="long"><s:textfield name="toId" requiredposition="right" cssClass='input_w w_15'/></td>
		</tr>
		<tr>
			<td  colspan="2" align="center">
				<input type="submit" value="<s:text name="prompt.query" />"
					id="queryButton" class="button_ty" >
			</td>
		    <td  colspan="2" align="center">
				<input type="reset" id="addButton" value="<s:text name="prompt.reset" />" class="button_ty" >
		    </td>
	</tr>
	</table>
</s:form>
</div>
<div id="content_navigation" class="query" align="center"></div>
<div id="content" class="sort"></div>
<div id="content_navigation" class="query" align="center"></div>

<%@ include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript">
var isFirstLoad = true;
var contentDataTable;
var contentColumnHeaders;
var queryForm;
YAHOO.namespace("query.container");
//Page Init
function init(){
YAHOO.widget.Column.formatEmail = function(elCell, oRecord, oColumn, oData) { 
	    var user = oData; 
		elCell.innerHTML = "<a href=\"mailto:" + user + "@sinosoft.com.cn\">" + user + "</a>"; 
	}; 
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
	    var oId = oRecord.id;
	    if(oColumn.key=="voucherNo"){
	  elCell.innerHTML = "<a href=\"#\" onclick=\"showRecord('./viewMainVoucher.do?id=" + oId + "')\">"+oData+"</a>";
	    }else{
	   	elCell.innerHTML = oData
	    }
	    if(oColumn.key=="voucherFlag"){
	    switch(oRecord.voucherFlag){
		      		case '1':elCell.innerHTML="未复核";break;
		      		case '2':elCell.innerHTML="下发修改";break;
		      		case '3':elCell.innerHTML="已修改";break;
		      		case '4':elCell.innerHTML="已复核";break;
	    }
	    }
	}; 
 	YAHOO.widget.Column.formatDate = function(elCell, oRecord, oColumn, oData) { 
		var value = oData;
		var date = new Date(oData.time);
		if(oColumn.key=="regDate"){			
			value = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
		}else{
			value = date.toLocaleString();
		}
		elCell.innerHTML = value; 
	}; 
	contentColumnHeaders =[
	    {key:"id",text:"<s:text name="ID" />",width:"10em",sortable:true,resizeable:true},
		{key:"yearMonth",text:"<s:text name="epsMainVoucher.yearMonth" />",width:"10em",sortable:true,resizeable:true},
		{key:"voucherNo",text:"<s:text name="epsMainVoucher.voucherNo" />",width:"10em",sortable:true,type:"link",resizeable:true},
		{key:"centerCode",text:"<s:text name="epsMainVoucher.centerCode" />",width:"10em",sortable:true,resizeable:true},
		{key:"operatorCode",text:"<s:text name="epsMainVoucher.operatorCode" />",width:"10em",sortable:true,resizeable:true},			
	    {key:"voucherFlag",text:"<s:text name="epsMainVoucher.voucherFlag" />",width:"10em",sortable:true,type:"link",resizeable:true}		
		];
}

//Query Data
function executeQuery(pageNo,pageSize){ 
	if(isNaN(parseInt(pageNo))){
		pageNo = 1;
	}
	if(isNaN(parseInt(pageSize))){
		pageSize = 10;
	}
   var initialRequest = "pageSize="+pageSize+"&pageNo="+pageNo; 	
	var myColumnSet = new YAHOO.widget.ColumnSet(contentColumnHeaders);
	var myDataSource = new YAHOO.util.DataSource("./findMainVoucher.do");
    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["id","yearMonth","voucherNo","centerCode","operatorCode","voucherFlag"],
	   totalRecords: "totalRecords"
	};

myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation);
	myDataSource.connMgr.setForm(queryForm);	
	var myConfiges ={
		initialRequest:initialRequest,
		paginator:false
	};

	if (isFirstLoad==true){
		contentDataTable = new YAHOO.widget.DataTable("content",myColumnSet,myDataSource,myConfiges);
		isFirstLoad = false;
	}else{
		contentDataTable._oRecordSet = new YAHOO.widget.RecordSet();
		contentDataTable.initialRequest = initialRequest;
		contentDataTable.dataSource = myDataSource;
		contentDataTable.dataSource.sendRequest(contentDataTable.initialRequest, contentDataTable.onDataReturnPopulateTable, contentDataTable);
	}
}
YAHOO.util.Event.addListener(window,'load',init);
function submitQuery(form){ 
	var fromId=document.getElementById("fromId").value;
	var toId=document.getElementById("toId").value;
	queryForm = form; 
	if(fromId!="" && toId==""){
		alert("<s:text name="voucher.voucherNoError" />");
		return false;
	}else if(toId!="" && fromId==""){
		alert("<s:text name="voucher.voucherNoError1" />");
		return false;
	}else{
		executeQuery(1,10);	
	}
	return false;
}

</script>
</body>
</html>
