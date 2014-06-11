<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="学习卡管理" /></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
</head>
<body id="all_title">
<div id="wrapper">
<div id="crash_menu">
<h2 align="center"><s:text name="学习卡管理查询" /></h2>
</div>
<s:form action="queryCard" method="post" namespace="/card"
	validate="true" onsubmit="return submitQuery(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short">学习卡代码</td>			
			<td class="long">
				<s:textfield name="learningCard.cardCode" id="learningCard.cardCode"
				cssClass='input_w w_15' />
			</td>	
			<td class="bgc_tt short">学习卡类型</td>
			<td class="long"><s:select list="cardTypeMap" name="learningCard.cardTypeCode"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short">学习卡状态</td>			
			<td class="long">
				<s:select list="learningCardStatusList" name="learningCardStatus"/>
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
					onclick="editRecord('${ctx}/card/prepareAddCard.do')"
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
	// 发送邮件
	YAHOO.widget.Column.formatEmail = function(elCell, oRecord, oColumn, oData) { 
	    var user = oData; 
		elCell.innerHTML = "<a href=\"mailto:" + user + "@sinosoft.com.cn\">" + user + "</a>"; 
	}; 
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		var cardCode = oRecord.cardCode;
		if(oColumn.key=="startDate"){
			if(oData.time){
			   	var date = new Date(oData.time);
			    var value = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
			    elCell.innerHTML = value;
			    }
			}
		if(oColumn.key=="endDate"){
			if(oData.time){
			   	var date = new Date(oData.time);
			    var value = date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日";
			    elCell.innerHTML = value;
			    }
			}
		// 编辑信息
		if(oColumn.key=="edit"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('./prepareUpdateCard.do?cardCode=" + cardCode + "\')\"><s:text name="prompt.edit" /></a>"; 
	    } 
		// 删除信息
	   	if(oColumn.key=="del"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"deleteRecord('./deleteCard.do?cardCode=" + cardCode + "')\"><s:text name="prompt.del" /></a>";
	    }
	}; 
	
	contentColumnHeaders =[
		{key:"cardCode",text:"<s:text name="学习卡代码" />",width:"8em",sortable:true,resizeable:true},
		{key:"cardTypeName",text:"<s:text name="学习卡类型" />",width:"8em",sortable:true,resizeable:true},
		{key:"passWord",text:"<s:text name="密码" />",width:"6em",sortable:true,resizeable:true},
		{key:"cardDeno",text:"<s:text name="金额" />",width:"6em",sortable:true,resizeable:true},
		{key:"phoneNo",text:"<s:text name="电话" />",width:"6em",sortable:true,resizeable:true},
		{key:"startDate",text:"<s:text name="使用起始日期" />",width:"10em",type:"link",sortable:true,resizeable:true},
		{key:"endDate",text:"<s:text name="使用结束日期" />",width:"10em",type:"link",sortable:true,resizeable:true},
		{key:"statusName",text:"<s:text name="状态" />",width:"8em",sortable:true,resizeable:true},		
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
	var myDataSource = new YAHOO.util.DataSource("${ctx}/card/queryCard.do");
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["cardCode","cardTypeName","passWord","cardDeno","phoneNo","startDate","endDate","statusName"],
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
