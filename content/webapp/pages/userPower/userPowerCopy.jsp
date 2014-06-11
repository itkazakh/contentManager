<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="userpower.completecopypower"/></title>
<%@include file="/common/meta_css.jsp"%>
<%@include file="/common/i18njs.jsp"%>
</head>
<body id="all_title">
<div id="crash_menu"><h2 align="center"><s:text name="userpower.completecopypower"/></h2></div>
<s:form action="" name="form">
	<table class="fix_table">
		<tr>
			<td class="bgc_tt short" colspan="2" align="center"><s:text name="userpower.sourcestaff"/></td>
			<td class="bgc_tt short" colspan="2" align="center"><s:text name="userpower.goalstaff"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userpower.sourcestaffcode"/></td>
			<td class="long"><s:textfield 	name="userCodeFrom" id="userCodeFrom" cssClass='input_w w_30' readonly="true" /></td>
			<td class="bgc_tt short"><s:text name="userpower.goalstaffcode"/></td>
			<td class="long"><s:textfield  name="userCodeTo" id="userCodeTo" cssClass='input_w w_30' readonly="true" /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userpower.sourcestaffname"/></td>
			<td class="long"><s:textfield id="userNameFrom" cssClass='input_w w_30' readonly="true" /></td>

			<td class="bgc_tt short"><s:text name="userpower.goalstaffname"/></td>
			<td class="long"><s:textfield id="userNameTo" cssClass='input_w w_30' readonly="true" /></td>
		</tr>			
		<tr>
			<td colspan="4">
			<table width="98%" id="anthTable" class="fix_table">
				<tr class="top">
					<td align="center" valign="middle"><s:text name="userpower.chosesourcestaff"/></td>
					<td align="center" valign="middle"><s:text name="userpower.chosegoalstaff"/></td>
				</tr>
				<tr>
					<td align="center" valign="middle">
					<select name="userSelectFrom" id="userSelectFrom"
						class="one" size=8 style="width:100%" onChange="user_selectFrom()" >
						<s:iterator value="saaUserList" status="stuts">
							<option
								value="<s:property
								value="%{saaUserList[#stuts.index].userCode}" />" /><s:property
								value="%{saaUserList[#stuts.index].userCode}" />-<s:property
								value="%{saaUserList[#stuts.index].userName}" />
								</option>
						</s:iterator>
					</select>
					</td>
					<td align="center" valign="middle">
					<select name="userSelectTo" id="userSelectTo" class="one" size=8 style="width:100%"  style="color:green"
					onChange="user_select()">
					</select>
					</td>
				</tr>
			</table>
			</td>
		</tr>		
			<tr>
				<td class="bgc_tt short" colspan="2" align="center"><input
					type="button" class="button_ty" value='<s:text name="button.ok"/>'
					onclick="submitPowerCopy()"></input></td>
				<td class="bgc_tt short" colspan="2" align="center"><input
					type="button" class="button_ty" value='<s:text name="button.cancel"/>'
					onclick="javascript:document.forms.form.reset()"></input></td>
			</tr>
		
</table>
</s:form>
</body>
</html>

<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript"
	src="${ctx}/dwr/interface/dwrInvokeDataAction.js"></script>
<script language="javascript"
	src="${ctx}/widgets/yui/autocomplete/autocomplete-min.js"></script>

<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<script type="text/javascript">
function submitPowerCopy(){
	var userCodeFrom = document.getElementById("userCodeFrom").value;
	var userCodeTo = document.getElementById("userCodeTo").value;
	if(userCodeFrom!=null&&userCodeFrom!=""){
		if(userCodeTo!=null&&userCodeTo!=""){
			if (confirm('<s:text name="userpower.promptpermissioncopy"/>')){
				// form.target="submitFrame";
	           	form.action="${ctx}/saaUserPower/userPowerCopy.do";
	           	form.submit();
			}
			}else{
			alert('<s:text name="userpower.selecttargetstaff"/>');
		}
	}else{
		alert('<s:text name="userpower.selectsourcestaff"/>');
	}
}

</script>
<script type="text/javascript">
function user_select(){
	var userSelect = document.getElementById("userSelectTo");
	var userSelectText = userSelect.options[userSelect.selectedIndex].text;
	var userArray = userSelectText.split('-');
	document.getElementById("userCodeTo").value=userArray[0];
	document.getElementById("userNameTo").value=userArray[1];	
}
</script>

<script type="text/javascript">
	var req;
   function user_selectFrom(){
  		document.getElementById("userCodeTo").value="";
   		document.getElementById("userNameTo").value="";       	
        var userSelect = document.getElementById("userSelectFrom");        
		var userSelectText = userSelect.options[userSelect.selectedIndex].text;
		var userArray = userSelectText.split('-');
		document.getElementById("userCodeFrom").value=userArray[0];
		document.getElementById("userNameFrom").value=userArray[1];         
         var url="${ctx}/saaUser/queryUserJSPByUserCode.do?userCode=" + document.getElementById("userCodeFrom").value;
          if(window.XMLHttpRequest){
                req=new XMLHttpRequest();
            }else if(window.ActiveXObject){
                req=new ActiveXObject("Microsoft.XMLHTTP");
            }            
            if(req){
                req.open("GET",url,true);
                req.onreadystatechange=callback;
                req.send(null);
            }
        }             
        function callback(){
            if(req.readyState == 4){	
                if(req.status == 200){	
                    parseMessage();
                }else{
                    alert("Not able to retrieve description"+req.statusText);
                }
            }
        }               
        function parseMessage(){
            var xmlDoc=req.responseXML.documentElement;
            var xSel=xmlDoc.getElementsByTagName('select');
            var select_root=document.getElementById('userSelectTo');
            select_root.options.length=0;            
            
            for(var i=0;i<xSel.length;i++){
                var xValue=xSel[i].childNodes[0].firstChild.nodeValue;
                var xText=xSel[i].childNodes[1].firstChild.nodeValue;
                var option=new Option(xText,xValue);
                try{
                    select_root.add(option);
                }catch(e){
                }
            }  
        }
</script>



