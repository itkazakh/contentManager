var userCodeValue="";
var userPowerFlag="";
var userPowerID="";
var userPowerAuthID="";
/**************************Ա��Ȩ�޲�ѯ�б�ĵײ��б�����У�������ť*********************************/
SINOSOFT.util.navigation_button = function(oRequest,oParsedResponse,oCallback,oCaller){ 
    if(userPowerFlag=='userPower'){
		var argsUserPower = new SINOSOFT.util.QueryString( oRequest.request );
		var pageSizeUserPower = parseInt(argsUserPower["pageSize"],10);
		var pageNoUserPower = parseInt(argsUserPower["pageNo"],10);
		var totalRecordsUserPower = contentUserPowerDataTable.dataSource.totalRecords;
		var navigationUserPower = document.getElementsByName(contentUserPowerDataTable._elContainer.id+"_navigation_button");
		var pageCountUserPower = parseInt(Math.ceil( totalRecordsUserPower * 1.0 / pageSizeUserPower));
    	var markup_buttonUserPower="<input type='button' name='userPowerAdd' class='button_ty' value='����' onclick='return addUserPowerMethod()'>";
    	markup_buttonUserPower += "<input type='button' name='userPowerUpdate' class='button_ty' value='�޸�' onclick='return updateUserPowerMethod()'>";
    	markup_buttonUserPower += "<br>" ;
    	var markupUserPower =markup_buttonUserPower+"["+ i18n.navigator.page +" "+pageNoUserPower +" / "+ pageCountUserPower +"]&nbsp;&nbsp;["+ totalRecordsUserPower +" "+i18n.navigator.records+"]&nbsp;&nbsp;";	    	
    	var isFirstPageUserPower = (pageNoUserPower == 1) ? true : false;
	    var isLastPageUserPower = (pageNoUserPower == pageCountUserPower) ? true : false;
	    var firstPageLinkUserPower = (isFirstPageUserPower) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_FIRSTPAGE + "\">["+ i18n.navigator.first +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerQuery(1,"+pageSizeUserPower+")\" class=\"" + YAHOO.widget.DataTable.CLASS_FIRSTLINK + "\">["+ i18n.navigator.first +"]</a> ";
	    var prevPageLinkUserPower = (isFirstPageUserPower) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_PREVPAGE + "\">["+ i18n.navigator.prev +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerQuery("+ (pageNoUserPower-1) +","+pageSizeUserPower+")\" class=\"" + YAHOO.widget.DataTable.CLASS_PREVLINK + "\">["+ i18n.navigator.prev +"]</a> " ;
	    var nextPageLinkUserPower = (isLastPageUserPower) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_NEXTPAGE + "\">["+ i18n.navigator.next +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerQuery("+ (pageNoUserPower+1) +","+pageSizeUserPower+")\" class=\"" + YAHOO.widget.DataTable.CLASS_NEXTLINK + "\">["+ i18n.navigator.next +"]</a> " ;
	    var lastPageLinkUserPower = (isLastPageUserPower) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_LASTPAGE + "\">["+ i18n.navigator.last +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerQuery("+ pageCountUserPower +","+pageSizeUserPower+")\" class=\"" + YAHOO.widget.DataTable.CLASS_LASTLINK + "\">["+ i18n.navigator.last +"]</a> ";
	    var selectOptionUserPower = " <select class=\""+ YAHOO.widget.DataTable.CLASS_PAGESELECT +"\" onchange=\"executeUserPowerQuery(1,this.value)\">";
	    var arrOptionsUserPower = [10,20,50];
	    for(var i=0; i<arrOptionsUserPower.length; i++){
		    var optionIUserPower = (pageSizeUserPower==arrOptionsUserPower[i])?
		    		"<option value="+arrOptionsUserPower[i]+" selected>"+arrOptionsUserPower[i]+"</option>":
		    		"<option value="+arrOptionsUserPower[i]+">"+arrOptionsUserPower[i]+"</option>";
		    selectOptionUserPower += optionIUserPower;
	    }
	    selectOptionUserPower += "</select>";
	    markupUserPower += firstPageLinkUserPower + prevPageLinkUserPower;
	    markupUserPower += nextPageLinkUserPower + lastPageLinkUserPower;
	    markupUserPower += selectOptionUserPower;
	  
	    for(var i=0;i<navigationUserPower.length;i++)
	    {
		    if(totalRecordsUserPower>0){
			    navigationUserPower[i].innerHTML = markupUserPower; 
			}else{
	
		        var elBodyUserPower = contentUserPowerDataTable._elBody;
		        var elRowsUserPower = contentUserPowerDataTable._elBody.rows;
		        while(elBodyUserPower.hasChildNodes() && (elRowsUserPower.length > 0)) {
		            elBodyUserPower.deleteRow(elRowsUserPower.length-1);
		        }
				navigationUserPower[i].innerHTML = markup_buttonUserPower;
			}
		}
    }else if(userPowerFlag=='userPowerAuth'){
    	var argsUserPowerAuth = new SINOSOFT.util.QueryString( oRequest.request );
		var pageSizeUserPowerAuth = parseInt(argsUserPowerAuth["pageSize"],10);
		var pageNoUserPowerAuth = parseInt(argsUserPowerAuth["pageNo"],10);
		var totalRecordsUserPowerAuth = contentUserPowerAuthDataTable.dataSource.totalRecords;
		var navigationUserPowerAuth = document.getElementsByName(contentUserPowerAuthDataTable._elContainer.id+"_navigation_button");
		var pageCountUserPowerAuth = parseInt(Math.ceil( totalRecordsUserPowerAuth * 1.0 / pageSizeUserPowerAuth));
    	var markup_buttonUserPowerAuth="<input type='button' name='UserPowerAuthAdd' class='button_ty' value='����' onclick='return addUserPowerAuthMethod()'>";
    	markup_buttonUserPowerAuth += "<input type='button' name='UserPowerAuthUpdate' class='button_ty' value='�޸�' onclick='return updateUserPowerAuthMethod()'>";
    	markup_buttonUserPowerAuth += "<br>" ;
    	var markupUserPowerAuth =markup_buttonUserPowerAuth+"["+ i18n.navigator.page +" "+pageNoUserPowerAuth +" / "+ pageCountUserPowerAuth +"]&nbsp;&nbsp;["+ totalRecordsUserPowerAuth +" "+i18n.navigator.records+"]&nbsp;&nbsp;";	    	
    	var isFirstPageUserPowerAuth = (pageNoUserPowerAuth == 1) ? true : false;
	    var isLastPageUserPowerAuth = (pageNoUserPowerAuth == pageCountUserPowerAuth) ? true : false;
	    var firstPageLinkUserPowerAuth = (isFirstPageUserPowerAuth) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_FIRSTPAGE + "\">["+ i18n.navigator.first +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerAuthQuery(1,"+pageSizeUserPowerAuth+")\" class=\"" + YAHOO.widget.DataTable.CLASS_FIRSTLINK + "\">["+ i18n.navigator.first +"]</a> ";
	    var prevPageLinkUserPowerAuth = (isFirstPageUserPowerAuth) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_PREVPAGE + "\">["+ i18n.navigator.prev +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerAuthQuery("+ (pageNoUserPowerAuth-1) +","+pageSizeUserPowerAuth+")\" class=\"" + YAHOO.widget.DataTable.CLASS_PREVLINK + "\">["+ i18n.navigator.prev +"]</a> " ;
	    var nextPageLinkUserPowerAuth = (isLastPageUserPowerAuth) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_NEXTPAGE + "\">["+ i18n.navigator.next +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerAuthQuery("+ (pageNoUserPowerAuth+1) +","+pageSizeUserPowerAuth+")\" class=\"" + YAHOO.widget.DataTable.CLASS_NEXTLINK + "\">["+ i18n.navigator.next +"]</a> " ;
	    var lastPageLinkUserPowerAuth = (isLastPageUserPowerAuth) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_LASTPAGE + "\">["+ i18n.navigator.last +"]</span> " :
	            " <a href=\"#\" onclick=\"executeUserPowerAuthQuery("+ pageCountUserPowerAuth +","+pageSizeUserPowerAuth+")\" class=\"" + YAHOO.widget.DataTable.CLASS_LASTLINK + "\">["+ i18n.navigator.last +"]</a> ";
	    var selectOptionUserPowerAuth = " <select class=\""+ YAHOO.widget.DataTable.CLASS_PAGESELECT +"\" onchange=\"executeUserPowerAuthQuery(1,this.value)\">";
	    var arrOptionsUserPowerAuth = [10,20,50];
	    for(var i=0; i<arrOptionsUserPowerAuth.length; i++){
		    var optionIUserPowerAuth = (pageSizeUserPowerAuth==arrOptionsUserPowerAuth[i])?
		    		"<option value="+arrOptionsUserPowerAuth[i]+" selected>"+arrOptionsUserPowerAuth[i]+"</option>":
		    		"<option value="+arrOptionsUserPowerAuth[i]+">"+arrOptionsUserPowerAuth[i]+"</option>";
		    selectOptionUserPowerAuth += optionIUserPowerAuth;
	    }
	    selectOptionUserPowerAuth += "</select>";
	    markupUserPowerAuth += firstPageLinkUserPowerAuth + prevPageLinkUserPowerAuth;
	    markupUserPowerAuth += nextPageLinkUserPowerAuth + lastPageLinkUserPowerAuth;
	    markupUserPowerAuth += selectOptionUserPowerAuth;
	  
	    for(var i=0;i<navigationUserPowerAuth.length;i++)
	    {
		    if(totalRecordsUserPowerAuth>0){
			    navigationUserPowerAuth[i].innerHTML = markupUserPowerAuth; 
			}else{
	
		        var elBodyUserPowerAuth = contentUserPowerAuthDataTable._elBody;
		        var elRowsUserPowerAuth = contentUserPowerAuthDataTable._elBody.rows;
		        while(elBodyUserPowerAuth.hasChildNodes() && (elRowsUserPowerAuth.length > 0)) {
		            elBodyUserPowerAuth.deleteRow(elRowsUserPowerAuth.length-1);
		        }
				navigationUserPowerAuth[i].innerHTML = markup_buttonUserPowerAuth;
			}
		}
    }else{
    	var args = new SINOSOFT.util.QueryString( oRequest.request );
		var pageSize = parseInt(args["pageSize"],10);
		var pageNo = parseInt(args["pageNo"],10);
		var totalRecords = contentDataTable.dataSource.totalRecords;
		var navigation = document.getElementsByName(contentDataTable._elContainer.id+"_navigation_button");
		var pageCount = parseInt(Math.ceil( totalRecords * 1.0 / pageSize));
    	var markup_button="<input type='button' name='userGrade' class='button_ty' value='��λ����' onclick='return userGradeMethod()'>";
    	markup_button += "<input type='button' name='userTask' class='button_ty' value='����Ȩ����Ȩ' onclick='return userTaskMethod()'>";
    	markup_button += "<input type='button' name='userPower' class='button_ty' value='ҵ��Ȩ������' onclick='return userPowerMethod();'>";
    	markup_button += "<input type='button' name='userPowerAuth' class='button_ty' value='ҵ��Ȩ����Ȩ' onclick='return userPowerAuthMethod()'>";
    	markup_button += "<input type='button' name='interfPower' class='button_ty' value='������Ȩ��ά��' onclick='return interfPowerMethod()'>";
    	markup_button += "<br>" ;
		var markup =markup_button+ "["+ i18n.navigator.page +" "+pageNo +" / "+ pageCount +"]&nbsp;&nbsp;["+ totalRecords +" "+i18n.navigator.records+"]&nbsp;&nbsp;";	    	
	    var isFirstPage = (pageNo == 1) ? true : false;
	    var isLastPage = (pageNo == pageCount) ? true : false;
	    var firstPageLink = (isFirstPage) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_FIRSTPAGE + "\">["+ i18n.navigator.first +"]</span> " :
	            " <a href=\"#\" onclick=\"executeQuery(1,"+pageSize+")\" class=\"" + YAHOO.widget.DataTable.CLASS_FIRSTLINK + "\">["+ i18n.navigator.first +"]</a> ";
	    var prevPageLink = (isFirstPage) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_PREVPAGE + "\">["+ i18n.navigator.prev +"]</span> " :
	            " <a href=\"#\" onclick=\"executeQuery("+ (pageNo-1) +","+pageSize+")\" class=\"" + YAHOO.widget.DataTable.CLASS_PREVLINK + "\">["+ i18n.navigator.prev +"]</a> " ;
	    var nextPageLink = (isLastPage) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_NEXTPAGE + "\">["+ i18n.navigator.next +"]</span> " :
	            " <a href=\"#\" onclick=\"executeQuery("+ (pageNo+1) +","+pageSize+")\" class=\"" + YAHOO.widget.DataTable.CLASS_NEXTLINK + "\">["+ i18n.navigator.next +"]</a> " ;
	    var lastPageLink = (isLastPage) ?
	            " <span class=\"" + YAHOO.widget.DataTable.CLASS_LASTPAGE + "\">["+ i18n.navigator.last +"]</span> " :
	            " <a href=\"#\" onclick=\"executeQuery("+ pageCount +","+pageSize+")\" class=\"" + YAHOO.widget.DataTable.CLASS_LASTLINK + "\">["+ i18n.navigator.last +"]</a> ";
	    var selectOption = " <select class=\""+ YAHOO.widget.DataTable.CLASS_PAGESELECT +"\" onchange=\"executeQuery(1,this.value)\">";
	    var arrOptions = [10,20,50];
	    for(var i=0; i<arrOptions.length; i++){
		    var optionI = (pageSize==arrOptions[i])?
		    		"<option value="+arrOptions[i]+" selected>"+arrOptions[i]+"</option>":
		    		"<option value="+arrOptions[i]+">"+arrOptions[i]+"</option>";
		    selectOption += optionI;
	    }
	    selectOption += "</select>";
	    markup += firstPageLink + prevPageLink;
	    markup += nextPageLink + lastPageLink;
	    markup += selectOption;
	  
	    for(var i=0;i<navigation.length;i++)
	    {
		    if(totalRecords>0){
			    navigation[i].innerHTML = markup; 
			}else{
	
		        var elBody = contentDataTable._elBody;
		        var elRows = contentDataTable._elBody.rows;
		        while(elBody.hasChildNodes() && (elRows.length > 0)) {
		            elBody.deleteRow(elRows.length-1);
		        }
				navigation[i].innerHTML = markup_button;
			}
		}
	    }
    
};
/**************************Ա��Ȩ�޲�ѯ�б�ĵײ��б�����У�������ť*********************************/



/********************************Ա��Ȩ�޲�ѯ�б�ĵײ㰴ť����*************************************/
function userGradeMethod(){
	if(userCodeValue==null||userCodeValue==""){
		alert("��ѡ��һ����¼");
		return false;
	}
    editRecord("${ctx}/userPower/prepareUpdateUserGrade.do?userCode="+userCodeValue);
	userCodeValue==""
    return true;
}

function userTaskMethod(){
	if(userCodeValue==null||userCodeValue==""){
		alert("��ѡ��һ����¼");
		return false;
	}
    editRecord("${ctx}/userPower/prepareUpdateUserTask.do?userCode="+userCodeValue);
	userCodeValue==""
    return true;
}
function userPowerMethod(){
	if(userCodeValue==null||userCodeValue==""){
		alert("��ѡ��һ����¼");
		return false;
	}

	editRecord("${ctx}/userPower/queryUserPowerList.do?userCode="+userCodeValue);

//    userPowerFlag="userPower";
//	executeUserPowerQuery(1,10);
	
}
function userPowerAuthMethod(){
	if(userCodeValue==null||userCodeValue==""){
		alert("��ѡ��һ����¼");
		return false;
	}
	editRecord("${ctx}/userPower/queryUserPowerAuthList.do?userCode="+userCodeValue);
//	userPowerFlag="userPowerAuth";
//	executeUserPowerAuthQuery(1,10);
	
}
function interfPowerMethod(){
	if(userCodeValue==null||userCodeValue==""){
		alert("��ѡ��һ����¼");
		return false;
	}
	 
	var url=contextRootPath+"/interfPower/configUserpower.do?userCode="+userCodeValue;
	showRecord(url);
	//fm.action=url;
   // fm.submit();
	
	
}
/********************************Ա��Ȩ�޲�ѯ�б�ĵײ㰴ť����*************************************/

/********************************Ա��ҵ��Ȩ�����÷���*************************************/
function addUserPowerMethod(){
	userPowerID="";
	editRecord("${ctx}/userPower/viewUserPower.do?userCode="+userCodeValue);
//	userPowerID==""
    return true;
}

function updateUserPowerMethod(){
	if(userPowerID==null||userPowerID==""){
		alert("��ѡ��һ����¼");
		return false;
	}
	editRecord("${ctx}/userPower/viewUserPower.do?userPowerID="+userPowerID+"&userCode="+userCodeValue);
//	userPowerID==""
    return true;
}

/********************************Ա��ҵ��Ȩ�����÷���*************************************/

/********************************Ա��ҵ��Ȩ����Ȩ����*************************************/
function addUserPowerAuthMethod(){
	userPowerAuthID="";
	editRecord("${ctx}/userPower/viewUserPowerAuth.do?userCode="+userCodeValue);
	userCodeValue="";
    return true;
}

function updateUserPowerAuthMethod(){
	if(userPowerAuthID==null||userPowerAuthID==""){
		alert("��ѡ��һ����¼");
		return false;
	}
	editRecord("${ctx}/userPower/viewUserPowerAuth.do?userPowerAuthID="+userPowerAuthID+"&userCode="+userCodeValue);
	userPowerAuthID="";
    return true;
}

/********************************Ա��ҵ��Ȩ����Ȩ����*************************************/


/************************ҵ��Ȩ������*****************************************/
var isFirstLoadUserPower = true;  
var contentUserPowerDataTable;
var contentUserPowerColumnHeaders; 
YAHOO.namespace("userPowerQuery.container");  

//Page Init
function initUserPower(){
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
	    var oId = oRecord.userPowerID;
	    if(oColumn.key=="radio"){
	    	elCell.innerHTML ="<input type='radio' name='userPowerRadio' value='"+oId+"' onclick='radioUserPowerID(this.value);'>";
	    }else if(oColumn.key=="validInd"){
	    	if(oData=="1"){
	    		elCell.innerHTML ="��Ч";
	    	}else{
	    		elCell.innerHTML ="��Ч";
	    	}
	    }else{
	    	elCell.innerHTML = oData;
	    }
	};
	contentUserPowerColumnHeaders =[{text:"Ա��ҵ��Ȩ�����ü�¼" ,children:[
		{key:"radio",text:" ",width:"10em",sortable:true,type:"link"},
		{key:"userCode",text:"Ա������",width:"50em",sortable:true,type:"link"},
		{key:"taskCode",text:"���ܴ���",width:"50em",sortable:true,type:"link"},
		{key:"taskCName",text:"��������",width:"50em",sortable:true,type:"link"},
		{key:"permitCompanyCode",text:"ҵ��Ȩ�޻�������",width:"50em",sortable:true},
		{key:"exceptCompanyCode",text:"ҵ��Ȩ�޳����������",width:"50em",sortable:true},
		{key:"permitUserCode",text:"����Ա������",width:"50em",sortable:true},
		{key:"permitRiskCode",text:"�������ִ���",width:"50em",sortable:true},
		{key:"validInd",text:"��Ч��־",width:"50em",sortable:true,type:"link"}]}
		]; 
}
function executeUserPowerQuery(pageNo,pageSize){
	initUserPower();
	if(isNaN(parseInt(pageNo))){ 
		pageNo = 1;
	}
	if(isNaN(parseInt(pageSize))){
		pageSize = 10;
	}
	var myColumnSet = new YAHOO.widget.ColumnSet(contentUserPowerColumnHeaders);	
	var myDataSource = new YAHOO.util.DataSource("${ctx}/userPower/prepareUpdateUserPower.do?userCode="+userCodeValue);
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["radio","userCode", "taskCode","taskCName", "permitCompanyCode",
				"exceptCompanyCode", "permitUserCode", "permitRiskCode",
				"validInd","userPowerID"],
	   totalRecords: "totalRecords"
	};
//	myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation);
	myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation_button);		
	myDataSource.connMgr.setForm(fm);	
	var initialRequest = "pageSize="+pageSize+"&pageNo="+pageNo;
	var myConfiges ={
		initialRequest:initialRequest,
		paginator:false
	};   
	if (isFirstLoadUserPower==true){
		contentUserPowerDataTable = new YAHOO.widget.DataTable("content",myColumnSet,myDataSource,myConfiges);
		isFirstLoadUserPower = true;	 
	}else{
		contentUserPowerDataTable._oRecordSet = new YAHOO.widget.RecordSet();
		contentUserPowerDataTable.initialRequest = initialRequest;
		contentUserPowerDataTable.dataSource = myDataSource;
		contentUserPowerDataTable.dataSource.sendRequest(contentUserPowerDataTable.initialRequest, contentUserPowerDataTable.onDataReturnPopulateTable, contentUserPowerDataTable);
	} 
	
}
/************************ҵ��Ȩ������*****************************************/

/************************ҵ��Ȩ����Ȩ*************************************************/
var isFirstLoadUserPowerAuth = true;  
var contentUserPowerAuthDataTable;
var contentUserPowerAuthColumnHeaders; 
YAHOO.namespace("userPowerAuthQuery.container");  

//Page Init
function initUserPowerAuth(){
	YAHOO.widget.Column.formatLink = function(elCell, oRecord, oColumn, oData) { 
	    var oId = oRecord.userPowerAuthID;
	    if(oColumn.key=="radio"){
	    	elCell.innerHTML ="<input type='radio' name='userPowerAuthRadio' value='"+oId+"' onclick='radioUserPowerAuthID(this.value);'>";
	    }else if(oColumn.key=="validInd"){
	    	if(oData=="1"){
	    		elCell.innerHTML ="��Ч";
	    	}else{
	    		elCell.innerHTML ="��Ч";
	    	}
	    }else{
	    	elCell.innerHTML = oData;
	    }
	};
	contentUserPowerAuthColumnHeaders =[{text:"Ա��ҵ��Ȩ��Ȩ��¼" ,children:[
		{key:"radio",text:" ",width:"10em",sortable:true,type:"link"},
		{key:"userCode",text:"Ա������",width:"50em",sortable:true,type:"link"},
		{key:"taskCode",text:"���ܴ���",width:"50em",sortable:true,type:"link"},
		{key:"taskCName",text:"��������",width:"50em",sortable:true,type:"link"},
		{key:"permitCompanyCode",text:"ҵ��Ȩ�޻�������",width:"50em",sortable:true},
		{key:"exceptCompanyCode",text:"ҵ��Ȩ�޳����������",width:"50em",sortable:true},
		{key:"permitUserCode",text:"����Ա������",width:"50em",sortable:true},
		{key:"permitRiskCode",text:"�������ִ���",width:"50em",sortable:true},
		{key:"validInd",text:"��Ч��־",width:"50em",sortable:true,type:"link"}]}
		]; 
}
function executeUserPowerAuthQuery(pageNo,pageSize){
	initUserPowerAuth();
	if(isNaN(parseInt(pageNo))){ 
		pageNo = 1;
	}
	if(isNaN(parseInt(pageSize))){
		pageSize = 10;
	}
	var myColumnSet = new YAHOO.widget.ColumnSet(contentUserPowerAuthColumnHeaders);	
	var myDataSource = new YAHOO.util.DataSource("${ctx}/userPower/prepareUpdateUserPowerAuth.do?userCode="+userCodeValue);
	myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
	myDataSource.responseSchema = {
	   resultsList: "data",
	   fields: ["radio","userCode", "taskCode","taskCName", "permitCompanyCode",
				"exceptCompanyCode", "permitUserCode", "permitRiskCode",
				"validInd","userPowerAuthID"],
	   totalRecords: "totalRecords"
	};
//	myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation);
	myDataSource.subscribe("responseParseEvent",SINOSOFT.util.navigation_button);		
	myDataSource.connMgr.setForm(fm);	
	var initialRequest = "pageSize="+pageSize+"&pageNo="+pageNo;
	var myConfiges ={
		initialRequest:initialRequest,
		paginator:false
	};   
	if (isFirstLoadUserPowerAuth==true){
		contentUserPowerAuthDataTable = new YAHOO.widget.DataTable("content",myColumnSet,myDataSource,myConfiges);
		isFirstLoadUserPowerAuth = true;	 
	}else{
		contentUserPowerAuthDataTable._oRecordSet = new YAHOO.widget.RecordSet();
		contentUserPowerAuthDataTable.initialRequest = initialRequest;
		contentUserPowerAuthDataTable.dataSource = myDataSource;
		contentUserPowerAuthDataTable.dataSource.sendRequest(contentUserPowerAuthDataTable.initialRequest, contentUserPowerAuthDataTable.onDataReturnPopulateTable, contentUserPowerAuthDataTable);
	} 
	
}
/************************ҵ��Ȩ����Ȩ*************************************************/



/*************************��������******************************************************/
function radioValue(value){
	userCodeValue=value;
}
function radioUserPowerID(value){
	userPowerID=value;
}
function radioUserPowerAuthID(value){
	userPowerAuthID=value;
}
/*************************��������******************************************************/
