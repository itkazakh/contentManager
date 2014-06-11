<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><s:text name="applyMain.title"/></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/meta.jsp"%>
</head>

<body id="all_title">
<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="applyMain.head"/></h2>
</div>
	<s:form name="fm" action="findApplyMain" namespace="/apply" method="post">
	<s:hidden name="flag" id="flag"></s:hidden>
		<table class="fix_table">	
			<tr>
				<td class="bgc_tt short"><s:text name="bpmFlow.businessType"/></td>
				<td class="long">
					<s:select list="epsCodeListForCertiType" name="wbusinessCmain.businessType" listKey="codeCode" listValue="codeCName"></s:select>
				</td>
				<td class="bgc_tt short"><s:text name="bpmFlow.businessNo"/></td>			
				<td class="long">
					<input name="wbusinessCmain.businessNo" id="certiNo" class='input_w'/><span class="required">*</span>
					<s:hidden name="welcome" value="${welcome}"></s:hidden>
				</td>				
			</tr>
			
			<tr>
				<td class="bgc_tt short"><s:text name="bpmFlow.inDate"/></td>
				<td class="long">
					<input type="text" name="wbusinessCmain.inDate" id="inDate" class='input_w w_10'>
					<img src="${ctx}/pages/image/time/date_icon.gif" alt='<s:text name="bpmFlow.prompt.click.calenderPanel"/>' id="imgBtn" class="showup" />
					<span class="calender-panel"><div id="calContainer" style="position:absolute;"></div></span>
				</td>
				<td class="bgc_tt short"></td> 
				<td class="long">
				</td>
			</tr>		
			<tr>
				<td colspan="2" align="center">
					<input type="button" class="button_ty" value="<s:text name="prompt.query"/>" onclick="executeQuery(1,10);">
				</td>
				<td colspan="2" align="center">
						<input type="reset"	id="addButton" class="button_ty" value='<s:text name="bpmFlow.reset"/>' />
					</td>
			</tr>
		</table>
	</s:form>
</div>
<div id="content_navigation" class="query" align="center"></div>
<div id="content" class="sort"></div>
<div id="content_navigation" class="query" align="center"></div>
</div>
</body>
</html>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<script type="text/javascript">
	var contentDataTable;
	var contentColumnHeaders;	
	YAHOO.namespace("query.container");  	
	function init(){
		init_calendar("calContainer","imgBtn","inDate"); 
		 YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
		    var oId = oRecord.businessNo;

		    var innerUrl = "${ctx}/bpmFlow/viewFlowChart.do?businessNo=" + oId ;
		    
		    if(oColumn.key=="businessNo"){
				elCell.innerHTML = "<a href=\"#\" onclick=\"showRecord('" + innerUrl + "')\">"+oData+"</a>";;
	      	}
				
		 };	
		YAHOO.widget.Column.formatDate = function(elCell, oRecord, oColumn, oData) { 
			  var value = oData;
			  var date = new Date(oData.time);
			  if(oColumn.key=="inDate"){			
				  value = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
		      }else{
				  value = date.toLocaleString();
			  }
			  elCell.innerHTML = value; 
		}; 

		contentColumnHeaders =[
			{key:"businessType",text:'<s:text name="bpmFlow.businessType"/>',width:"40em",sortable:true,resizeable:true},
			{key:"businessNo",text:'<s:text name="bpmFlow.businessNo"/>',type:"link",width:"40em",sortable:true},
		    {key:"inDate",text:'<s:text name="bpmFlow.inDate"/>',type:"date",width:"50em",sortable:true},
		    {key:"comCode",text:'<s:text name="bpmFlow.centerCode"/>',width:"50em",sortable:true}
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
		var myColumnSet = new YAHOO.widget.ColumnSet(contentColumnHeaders);
		var myDataSource = new YAHOO.util.DataSource("${ctx}/bpmFlow/findWbusinessCMain.do");
		myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		myDataSource.responseSchema = {
		   resultsList: "data",
		   fields: ["businessType","businessNo", "inDate" , "comCode" ],
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