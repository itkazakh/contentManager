<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="广告信息添加" /></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
</head>
<body id="all_title">
<div id="wrapper">
<div id="crash_menu">
<h2 align="center"><s:text name="广告信息查询" /></h2>
</div>
<s:form action="queryAdInfo" method="post" namespace="/adInfo"
	validate="true" onsubmit="return submitQuery(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short">资源名称</td>			
			<td class="long">
				<s:textfield name="adInfo.resourceName" id="adInfo.resourceName"
				cssClass='input_w w_15' />
			</td>	
			<td class="bgc_tt short"></td>
			<td class="long"></td>
		</tr>
		<tr>
			<td  colspan="1" align="center"></td>
			<td  colspan="1" align="center">
				<input type="submit" value="<s:text name="prompt.query" />"
					id="queryButton" class="button_ty">
			</td>
		    <td  colspan="1" align="center">
				<input type="button" id="addButton"
					onclick="editRecord('${ctx}/adInfo/prepareAddAdInfo.do')"
					class="button_ty" value="<s:text name="prompt.add" />">
		    </td>
		    <td  colspan="1" align="center"></td>
		</tr>
	</table>
</s:form>
</div>
<div id="content_navigation" class="query" align="center"></div>
<div id="content" class="sort"></div>
<div id="content_navigation" class="query" align="center"></div>

<%@ include file="/common/meta_js.jsp"%>
<script type="text/javascript">
var isFirstLoad = true;
var contentDataTable;
var contentColumnHeaders;
var queryForm;
YAHOO.namespace("query.container");
//Page Init
function init(){
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		var adNo = oRecord.adNo;
		
		// 编辑信息
		if(oColumn.key=="edit"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('./prepareUpdateAdInfo.do?adNo=" + adNo + "\')\"><s:text name="prompt.edit" /></a>"; 
	    } 
		// 删除信息
	   	if(oColumn.key=="del"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"deleteRecord('./deleteAdInfo.do?adNo=" + adNo + "')\"><s:text name="prompt.del" /></a>";
	    }
	}; 
	
	contentColumnHeaders =[
		{key:"adNo",text:"<s:text name="序号" />",width:"8em",sortable:true,resizeable:true},
		{key:"resourceName",text:"<s:text name="资源名称" />",width:"8em",sortable:true,resizeable:true},
		{key:"areaName",text:"<s:text name="地区" />",width:"6em",sortable:true,resizeable:true},
		{key:"adInfo",text:"<s:text name="广告信息" />",width:"10em",sortable:true,resizeable:true},	
		{key:"adLink",text:"<s:text name="广告链接" />",width:"10em",sortable:true,resizeable:true},		
	   	{key:"edit",text:"<s:text name="prompt.edit" />",width:"4em",type:"link",resizeable:true},
	    {key:"del",text:"<s:text name="prompt.del" />",width:"4em",type:"link",resizeable:true}
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
	var myDataSource = new YAHOO.util.DataSource("${ctx}/adInfo/queryAdInfo.do");
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["adNo","resourceName","areaName","adInfo","adLink"],
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
	queryForm = form; 
	executeQuery(1,10);	
	return false;
}
</script>
</body>
</html>
