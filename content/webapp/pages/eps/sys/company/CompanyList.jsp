<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<html>
<head>
<title></title>
</head>
<body id="all_title">
<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="company.manage" /></h2>
</div>
<s:form name="fm" action="findEpsCompany.do" namespace="/epsCompany" method="post">
	<table class="fix_table">
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comCode"/></td>
			<td class="long"><s:textfield name="epsCompany.comCode"
				id="epsCompany.comCode" cssClass='input_y w_p30'
				ondblclick="code_CodeSelect(this, 'comCode', '0,1', 'Y');"
				onkeyup="code_CodeSelect(this, 'comCode', '0,1', 'Y')"
				onchange="code_CodeChange(this, 'comCode', '0,1', 'Y')" 
				/>
				</td>
			<td class="bgc_tt short"><s:text name="epsCompany.comCName"/></td>
			<td class="long" ><s:textfield name="epsCompany.comCName"
				id="epsCompany.comCName" cssClass='input_w w_15' /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comLevel" /></td>
			<td class="long"><s:select list="#{'':'所有','1':'总公司','2':'省公司','3':'市公司','4':'区县' }" name="epsCompany.comLevel" cssClass='input_w w_15' ></s:select>
			</td>
			<td class="bgc_tt short"><s:text name="epsCompany.validStatus" /></td>
			<td class="long"><s:select list="#{'':'所有','1':'有效','0':'无效'}" name="epsCompany.validStatus" cssClass='input_w w_15'></s:select>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button"
				class="button_ty" value="<s:text name="prompt.query" />" onclick="executeQuery(1,10);" />
			</td>
			<td colspan="3" align="center">
			<input type="button" class="button_ty" value="<s:text name="prompt.add" />"
				onclick="editRecord('${ctx}/epsCompany/prepareAddEpsCompany.do');">
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
<script type="text/javascript">
	var contentDataTable;
	var contentColumnHeaders; 	
	YAHOO.namespace("query.container");  	
	//Page Init
	function init(){
	  var comCode_tip = new YAHOO.widget.Tooltip("comCode_tip",{text:"<s:text name="epsCompany.dcComCode"/>",context:"epsCompany.comCode",zIndex:300});
		YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		    if(oColumn.key=="edit"){
	    		elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/epsCompany/prepareUpdateEpsCompany.do?comCode=" + oRecord.comCode+"')\"><s:text name="prompt.edit" /></a>";
	    	}else if(oColumn.key=="del"){
	    		elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/epsCompany/deleteEpsCompany.do?comCode=" + oRecord.comCode+"')\"><s:text name="prompt.del" /></a>";
	  		}else if(oColumn.key=="validStatus"){
		    	switch(oRecord.validStatus){
		    		case '0': elCell.innerHTML="<s:text name='validStatus.false' />" ;break;
		    		case '1': elCell.innerHTML="<s:text name='validStatus.true' />" ;break;
		    	}
		    }else if(oColumn.key=="comLevel"){
		    	switch(oRecord.comLevel){
		    		case '1': elCell.innerHTML="总公司"; break;
		    		case '2': elCell.innerHTML="省公司"; break;
		    		case '3': elCell.innerHTML="市公司"; break;
		    		case '4': elCell.innerHTML="区县"; break;
		    	}
	  		}else if(oColumn.key=="comCode"){
		    	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/epsCompany/viewEpsCompany.do?comCode=" + oRecord.comCode+"')\">"+ oData +"</a>";
		    }else{
		    	elCell.innerHTML = oData;
		    }
		};
		contentColumnHeaders =[
			{key:"comCode",text:"<s:text name="epsCompany.comCode"/>",width:"30em",sortable:true,type:"link"},
			{key:"comCName",text:"<s:text name="epsCompany.comCName"/>",width:"40em",sortable:true},
			{key:"comLevel",text:"<s:text name="epsCompany.comLevel"/>",width:"40em",sortable:true,type:"link"},
			{key:"validStatus",text:"<s:text name="epsCompany.validStatus"/>",width:"40em",sortable:true,type:"link"},
			{key:"edit",text:"<s:text name="prompt.edit" />",width:"20em",type:"link",resizeable:true},
			{key:"del",text:"<s:text name="prompt.del" />",width:"20em",type:"link",resizeable:true}
			];
		//initAllSelectUi();
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
		var myDataSource = new YAHOO.util.DataSource("${ctx}/epsCompany/findEpsCompany.do");
		myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		myDataSource.responseSchema = {
		   resultsList: "data",
		   fields: ["comCode", "comCName", "comEName", "upperComCode", "comLevel", "centerFlag", 
				"validStatus"],
		   totalRecords: "totalRecords"
		};
		myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation);	
		myDataSource.connMgr.setForm(fm);
		var initialRequest = "pageSize="+pageSize+"&pageNo="+pageNo;
		var myConfiges ={
			initialRequest:initialRequest,
			paginator:false
		};   
		//if (isFirstLoad==true){
			contentDataTable = new YAHOO.widget.DataTable("content",myColumnSet,myDataSource,myConfiges);
	
		//	isFirstLoad = false;	 
		//}else{
		//	contentDataTable._oRecordSet = new YAHOO.widget.RecordSet();
		//	contentDataTable.initialRequest = initialRequest;
		//	contentDataTable.dataSource = myDataSource;
		//	contentDataTable.dataSource.sendRequest(contentDataTable.initialRequest, contentDataTable.onDataReturnPopulateTable, contentDataTable);
		//} 
	}	
	//init on load
	YAHOO.util.Event.addListener(window,'load',init);		
	</script>
	
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript" src="${ctx}/dwr/interface/dwrInvokeDataAction.js"></script>
<script language="javascript" src="${ctx}/widgets/yui/autocomplete/autocomplete-min.js"></script>

<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>