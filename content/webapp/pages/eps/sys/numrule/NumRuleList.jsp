<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title><s:text name="单号配置查询" />
		</title>
	<%@ include file="/common/meta_css.jsp"%>
	<%@ include file="/common/meta.jsp"%>
	</head>
	<body id="all_title">
		<div id="wrapper">
			<div id="crash_menu">
				<h2 align="center">
					请输入查询条件
				</h2>
			</div>

			<s:form action="findNumRule" method="post" namespace="/numRule"
				validate="true" onsubmit="return submitQuery(this)">
				<table class="fix_table" border="0">
					<tr>
						<td class="bgc_tt short">
							<s:text name="单号类型代码" />
						</td>
						<td class="long">
							<s:textfield name="epsNumRule.numType" required="true"
								cssClass='input_w w_15' 
								ondblclick="code_CodeSelect(this, 'EpsNumType', '0,1', 'Y');"
								onkeyup="code_CodeSelect(this, 'EpsNumType', '0,1', 'Y')"
								onchange="code_CodeChange(this, 'EpsNumType', '0,1', 'Y')" />
						</td>
						<td class="bgc_tt short">
							<s:text name="单号类型名称" />
						</td>
						<td class="long">
							<s:textfield name="epsNumRule.numTypeName" required="true"
								cssClass='input_w w_15' />
						</td>
					</tr>
					<tr>
						<td class="bgc_tt short" colspan="1" align="center">
							<input type="submit" value="<s:text name="查询" />"
								id="queryButton" class="button_ty">
						</td>
						<td class="bgc_tt short" colspan="1" align="center">
							<input type="button" id="addButton"
								onclick="editRecord('${ctx}/numRule/prepareAddNumRule.do')"
								class="button_ty" value="<s:text name="新增" />">
						</td>
					</tr>
				</table>
			</s:form>
		</div>
		<div></div>
		<div id="content" class="sort"></div>
		<div id="content_navigation" class="query"></div>
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
	    var oId = oRecord.numType;
	    if(oColumn.key=="edit"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('./prepareUpdateNumRule.do?numType=" + oId + "\')\"><s:text name="编辑" /></a>"; 
	    }else if(oColumn.key=="del"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"deleteRecord('./deleteNumRule.do?numType=" + oId + "')\"><s:text name="删除" /></a>";
	    }else if(oColumn.key=="numType"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"showRecord('./viewNumRule.do?numType=" + oId + "')\">"+oData+"</a>";
	    }else{
	    	elCell.innerHTML = oData
	    }
        if(oColumn.key=="status"){
	      	switch(oRecord.status){
	      		case '0':elCell.innerHTML="无效";break;
	      		case '1':elCell.innerHTML="有效";break;
	      	}
	    }
	}; 
	contentColumnHeaders =[
		{key:"numType",text:"<s:text name="单号类型代码" />",width:"16em",sortable:true,type:"link",resizeable:true},
		{key:"numTypeName",text:"<s:text name="单号类型名称" />",width:"16em",sortable:true},
		{key:"numPre",text:"<s:text name="单号前缀" />",width:"10em",sortable:true,resizeable:true},		
		{key:"status",text:"<s:text name="状态" />",width:"6em",sortable:true,type:"link",resizeable:true},		
		{key:"edit",text:"<s:text name="编辑" />",width:"5em",type:"link",resizeable:true},
		{key:"del",text:"<s:text name="删除" />",width:"5em",type:"link",resizeable:true}
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
	var myDataSource = new YAHOO.util.DataSource("./findNumRule.do");
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["numType", "numTypeName", "numPre" , "status","edit","del"],
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
