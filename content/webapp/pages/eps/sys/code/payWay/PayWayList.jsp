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
<div id="crash_menu">
<h2 align="center"><s:text name="sys.payway.headquery" /></h2>
</div>
<s:form action="findPayWay" method="post" namespace="/payWay"
	validate="true" onsubmit="return submitQuery(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.paywaycode" /></td>			
			<td class="long">
				<s:textfield name="epsPayWay.payWayCode"
				cssClass='input_y w_p60'
				ondblclick="code_CodeSelect(this, 'payWayCode', '0,1', 'Y')"
				onkeyup="code_CodeSelect(this, 'payWayCode', '0,1', 'Y')"
				onchange="code_CodeChange(this, 'payWayCode', '0,1', 'Y')" />
			</td>	
			<td class="bgc_tt short"><s:text name="sys.payway.paywayname" /></td>
			<td class="long"><input name="epsPayWay.payWayCName"
				id="epsPayWay.payWayCName" class='input_w w_15'></td>
		</tr>
		<tr>
			<td class="bgc_tt short">
				<s:text name="sys.payway.paywaytype" />
			</td>
			<td class="long">
				<select name="epsPayWay.payWayType">
					<option selected="selected" value="1">
						收
					</option>
					<option value="2">
						付
					</option>
					<option value="*">
						收付
					</option>
				</select>
			</td>
			<td class="bgc_tt short">
				<s:text name="sys.payway.validStatus" />
			</td>
			<td class="long">
				<select name="epsPayWay.validStatus">
					<option selected="selected" value="9">
						全部
					</option>
					<option value="0">
						无效
					</option>
					<option value="1">
						有效
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td  colspan="1" align="center"></td>
			<td  colspan="1" align="center">
				<input type="submit" value="<s:text name="prompt.query" />"
					id="queryButton" class="button_ty">
			</td>
		    <td  colspan="1" align="center">
				<input type="button" id="addButton"
					onclick="editRecord('${ctx}/payWay/prepareAddPayWay.do')"
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
	// 添加双击域提示语言
	var payWayCode_tip = new YAHOO.widget.Tooltip("payWayCode_tip",{text:"请双击选择收付方式",context:"epsPayWay.payWayCode",zIndex:250});
	// 发送邮件
	YAHOO.widget.Column.formatEmail = function(elCell, oRecord, oColumn, oData) { 
	    var user = oData; 
		elCell.innerHTML = "<a href=\"mailto:" + user + "@sinosoft.com.cn\">" + user + "</a>"; 
	}; 
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		var oPayWayCode = oRecord.payWayCode;
		// 给对应的字段进行代码转换
		// 有效标志
		if(oColumn.key=="validStatus"){
			switch(oRecord.validStatus){
				case '0':elCell.innerHTML="无效";break;
				case '1':elCell.innerHTML="有效";break;
			}
	 	}
	 	// 收付属性
	 	if(oColumn.key=="payWayType"){
			switch(oRecord.payWayType){
				case '*':elCell.innerHTML="收付";break;
		      	case '1':elCell.innerHTML="收";break;
		      	case '2':elCell.innerHTML="付";break;
		 	}
	 	}
	 	// 借贷标志
 	 	if(oColumn.key=="dcInd"){
		   	switch(oRecord.dcInd){
		      	case '0':elCell.innerHTML="借";break;
		      	case '1':elCell.innerHTML="贷";break;
		  	}
		}
		
		// 编辑信息
		if(oColumn.key=="edit"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('./prepareUpdatePayWay.do?payWayCode=" + oPayWayCode + "\')\"><s:text name="prompt.edit" /></a>"; 
	    } 
		// 删除信息
	   	if(oColumn.key=="del"){
	    	elCell.innerHTML = "<a href=\"#\" onclick=\"deleteRecord('./deletePayWay.do?payWayCode=" + oPayWayCode + "')\"><s:text name="prompt.del" /></a>";
	    }
	}; 
	
	contentColumnHeaders =[
		{key:"payWayCode",text:"<s:text name="sys.payway.paywaycode" />",width:"8em",sortable:true,resizeable:true},
		{key:"payWayCName",text:"<s:text name="sys.payway.paywayname" />",width:"8em",sortable:true,resizeable:true},
		{key:"payWayType",text:"<s:text name="sys.payway.paywaytype" />",width:"6em",type:"link",sortable:true,resizeable:true},
		{key:"dcInd",text:"<s:text name="sys.payway.debitOrCredit" />",width:"6em",type:"link",sortable:true,resizeable:true},		
	    {key:"permitCenterCode",text:"<s:text name="sys.payway.permitCenterCode" />",width:"6em",sortable:true,resizeable:true},		
	    {key:"validStatus",text:"<s:text name="sys.payway.validStatus" />",width:"6em",type:"link",sortable:true,resizeable:true},
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
	var myDataSource = new YAHOO.util.DataSource("${ctx}/payWay/findPayWay.do");
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["payWayCode","payWayCName","payWayType","dcInd","permitCenterCode","validStatus"],
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
