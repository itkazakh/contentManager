<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="留言管理" /></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
</head>
<body id="all_title">
<div id="wrapper">
<div id="crash_menu">
<h2 align="center"><s:text name="留言查询" /></h2>
</div>
<s:form action="queryJionInfo" method="post" namespace="/jionInfo"
	validate="true" onsubmit="return submitQuery(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short">用户名称</td>			
			<td class="long">
				<s:textfield name="jionInfo.userName" id="jionInfo.userName"
				cssClass='input_w w_15' />
			</td>	
			<td class="bgc_tt short">电话号码</td>
			<td class="long"><s:textfield name="jionInfo.phoneNo"
				id="jionInfo.phoneNo" cssClass='input_w w_15'/></td>
		</tr>
		<tr>
			<td  colspan="1" align="center"></td>
			<td  colspan="1" align="center">
				<input type="submit" value="<s:text name="prompt.query" />"
					id="queryButton" class="button_ty">
			</td>
		    <td  colspan="1" align="center">
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
	// 发送邮件
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		var infoNo = oRecord.infoNo;
		
		// 删除信息
	   	if(oColumn.key=="del"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"deleteRecord('./deleteJionInfo.do?infoNo=" + infoNo + "')\"><s:text name="prompt.del" /></a>";
	    }
	}; 
	
	contentColumnHeaders =[
		{key:"infoNo",text:"<s:text name="序号" />",width:"4em",sortable:true,resizeable:true},
		{key:"userName",text:"<s:text name="用户名称" />",width:"6em",sortable:true,resizeable:true},
		{key:"phoneNo",text:"<s:text name="电话号码" />",width:"6em",sortable:true,resizeable:true},
		{key:"postCode",text:"<s:text name="邮编" />",width:"4em",sortable:true,resizeable:true},
		{key:"email",text:"<s:text name="电子邮箱" />",width:"6em",sortable:true,resizeable:true},		
		{key:"address",text:"<s:text name="地址" />",width:"8em",sortable:true,resizeable:true},
	   	{key:"message",text:"<s:text name="留言信息" />",width:"8em",sortable:true,resizeable:true},
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
	var myDataSource = new YAHOO.util.DataSource("${ctx}/jionInfo/queryJionInfo.do");
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["infoNo","userName","phoneNo","postCode","email","address","message"],
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
