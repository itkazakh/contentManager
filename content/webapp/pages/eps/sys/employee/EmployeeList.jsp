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
<h2 align="center"><s:text name="employee.manage" /></h2>
</div>
<s:form name="fm" action="findEmployee.do" namespace="/employee" method="post">
	<table class="fix_table">
			<tr>
			<td class="bgc_tt short"><s:text name="employee.userCode"/></td>
			<td class="long"><s:textfield name="epsUser.userCode"
				id="epsUser.userCode" cssClass='input_y w_p30'
				ondblclick="code_CodeSelect(this, 'userCode', '0,1', 'Y');"
				onkeyup="code_CodeSelect(this, 'userCode', '0,1', 'Y')"
				onchange="code_CodeChange(this, 'userCode', '0,1', 'Y')" 
				/>
				</td>
			<td class="bgc_tt short"><s:text name="employee.userName"/></td>
			<td class="long" ><s:textfield name="epsUser.userName"
				id="epsUser.userName" cssClass='input_w w_15' /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comCode" /></td>
			<td class="long"><s:textfield name="epsCompany.comCode"
				id="epsCompany.comCode" cssClass='input_y w_p30'
				ondblclick="code_CodeSelect(this, 'comCode', '0', 'Y');"
				onkeyup="code_CodeSelect(this, 'comCode', '0', 'Y')"
				onchange="code_CodeChange(this, 'comCode', '0', 'Y')" 
				/>
			</td>
			<td class="bgc_tt short"><s:text name="validStatus" /></td>
			<td class="long"><s:select list="#{'':'所有','1':'有效','0':'无效'}" name="epsUser.validStatus"/>

			</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button"
				class="button_ty" value="<s:text name="prompt.query" />" onclick="executeQuery(1,10);" />
			</td>
			<td colspan="3" align="center">
			<input type="button" class="button_ty" value="<s:text name="prompt.add" />"
				onclick="editRecord('${ctx}/employee/prepareAddEmployee.do');">
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
	   var userCode_tip = new YAHOO.widget.Tooltip("userCode_tip",{text:"<s:text name="employee.dcUserCode"/>",context:"epsUser.userCode",zIndex:300});
		
		YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		      if(oColumn.key=="edit"){
	    		elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/employee/prepareUpdateEmployee.do?userCode=" + oRecord.userCode+"')\"><s:text name="prompt.edit" /></a>";
	    	}else if(oColumn.key == "del"){
	    		elCell.innerHTML =  "<a href=\"#\" onclick=\"editRecord('${ctx}/employee/deleteEmployee.do?userCode=" + oRecord.userCode+"')\"><s:text name="prompt.del" /></a>";
	  		}else if(oColumn.key=="validStatus"){
		    	switch(oRecord.validStatus){
		    		case '0': elCell.innerHTML="<s:text name='validStatus.false'/>" ;break;
		    		case '1': elCell.innerHTML="<s:text name='validStatus.true'/>" ;break;
		    	}
		    }else if(oColumn.key=="queryPermission"){
		    	switch(oRecord.queryPermission){
		    		case '1': elCell.innerHTML="本人" ;break;
		    		case '2': elCell.innerHTML="本机构" ;break;
		    		case '3': elCell.innerHTML="本机构及其下属机构" ;break;
		    	}
		    }else if(oColumn.key=="draftPermission"){
		    	switch(oRecord.draftPermission){
		    		case '1': elCell.innerHTML="有" ;break;
		    		case '0': elCell.innerHTML="无" ;break;
		    	}
		    }else if(oColumn.key=="userCode"){
		    	elCell.innerHTML = "<a href=\"#\" onclick=\"editRecord('${ctx}/employee/viewEmployee.do?userCode=" + oRecord.userCode+"')\">"+ oData +"</a>";
		    }else{
		    	elCell.innerHTML = oData;
		    }
		};
		contentColumnHeaders =[
			{key:"userCode",text:"<s:text name="employee.userCode"/>",width:"30em",sortable:true,type:"link"},
			{key:"userName",text:"<s:text name="employee.userName"/>",width:"40em",sortable:true},
			{key:"epsCompany.comCName",text:"<s:text name="epsCompany.comCName"/>",width:"50em",sortable:true},
			{key:"userEName",text:"<s:text name="employee.userEName"/>",width:"40em",sortable:true},
			{key:"queryPermission",text:"<s:text name="employee.queryPermission"/>",width:"50em",sortable:true,type:"link"},
			{key:"draftPermission",text:"<s:text name="employee.draftPermission"/>",width:"50em",sortable:true,type:"link"},
			{key:"email",text:"<s:text name="employee.email"/>",width:"40em",sortable:true},
			{key:"validStatus",text:"<s:text name="validStatus"/>",width:"40em",sortable:true,type:"link"},
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
		var myDataSource = new YAHOO.util.DataSource("${ctx}/employee/findEmployee.do");
		myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		myDataSource.responseSchema = {
		   resultsList: "data",
		   fields: [ "userCode", "userName","epsCompany.comCName","userEName","queryPermission","draftPermission","email","validStatus"],
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