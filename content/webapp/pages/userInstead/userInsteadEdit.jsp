<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="userinstead.usertoauthorize"/></title>
<%@include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
</head>
<body id="all_title">
<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="userinstead.usertoauthorize"/></h2>
</div>
<s:form action="/saaUserInstead/insteadUser.do" name="form">
	<s:hidden name="saaUserInstead.validStatus" value="1" />
	<s:hidden name="saaUserInstead.authUserCode" value="%{saaUser.userCode}" />
	<s:hidden name="saaUserInstead.authUserName" value="%{saaUser.userName}" />
	<s:hidden name="saaUserInstead.userGrades" id="saaUserInstead.userGrades" value="" />
		<s:hidden name="saaUser.comCode" id="saaUser.comCode" value="%{saaUser.comCode}" />
	<table class="fix_table">
		<tr>
			<td class="bgc_tt_center" colspan="2" ><s:text name="userinstead.grantuser"/></td>
			<td class="bgc_tt_center" colspan="2" ><s:text name="userinstead.accpetuser"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.usercode"/></td>
			<td class="long"><s:textfield name="saaUser.userCode"
				id="saaUser.userCode" cssClass='input_w w_30' readonly="true" /></td>
			<td class="bgc_tt short"><s:text name="userinstead.usercode"/></td>
			<td class="long"><s:textfield name="saaUserInstead.userCode"
				id="userCodeTemp" cssClass='input_w w_30' readonly="true" /></td>
		</tr>

		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.username"/></td>
			<td class="long"><s:textfield name="saaUser.userName"
				id="saaUser.userName" cssClass='input_w w_30' readonly="true" /></td>

			<td class="bgc_tt short"><s:text name="userinstead.username"/></td>
			<td class="long"><s:textfield name="saaUserInstead.userName"
				id="userNameTemp" cssClass='input_w w_30' readonly="true" /></td>
		</tr>
		
		<tr>
			<td class="bgc_tt short"><s:text name="userinstead.grantstarttime"/></td>
			<td><input type=text readonly id="beginDate"
				name="saaUserInstead.authBeginTime" /> <img
				src="${ctx}/pages/image/time/date_icon.gif" alt='<s:text name="prompt.clickcalendar"/>'
				id="imgBtn1" width="14" height="14" /> <span class="calender-panel">
			<div id="calContainer1" style="position: absolute;"></div>
			</span></td>
			<td class="bgc_tt short"><s:text name="userinstead.grantenddate"/></td>
			<td><input type=text readonly id="endDate"
				name="saaUserInstead.authEndTime" /> <img
				src="${ctx}/pages/image/time/date_icon.gif" alt='<s:text name="prompt.clickcalendar"/>'
				id="imgBtn2" width="14" height="14" /> <span class="calender-panel">
			<div id="calContainer2" style="position: absolute;"></div>
			</span></td>
		</tr>	
		<tr>
			<td colspan="4">
			<table width="98%" id="anthTable" class="fix_table">
				<tr class="top">
					<td align="center" valign="middle"><s:text name="userinstead.chosegrade"/></td>
					<td align="center" valign="middle"><s:text name="userinstead.choseuser"/></td>
				</tr>
				<tr>
					<td align="center" valign="middle">
					<select name="gradeSelect" id="gradeSelect"
						class="one" size=8 style="width:100%" onChange="grade_Select()" >
						<s:iterator value="saaUserGradeVOs" status="stuts">
							<option
								value="<s:property
								value="%{saaUserGradeVOs[#stuts.index].gradeCode}" />" /><s:property
								value="%{saaUserGradeVOs[#stuts.index].gradeCode}" /> -<s:property
								value="%{saaUserGradeVOs[#stuts.index].gradeName}" />
								</option>
						</s:iterator>
					</select>
					</td>
					<td align="center" valign="middle">
					<select name="userSelect" id="userSelect" class="one" size=8 style="width:100%"  style="color:green"
					onChange="user_Select()">
					</select>
					</td>
				</tr>
			</table>
			</td>
		</tr>		
			<tr>
				<td class="bgc_tt short" colspan="2" align="center"><input
					type="button" class="button_ty" value='<s:text name="button.ok"/>'
					onclick="javascript:form_submit()"></input></td>
				<td class="bgc_tt short" colspan="2" align="center"><input
					type="button" class="button_ty" value='<s:text name="button.cancel"/>'
					onclick="javascript:document.forms.form.reset()"></input></td>
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

<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/js/newCalendar.js"></script>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript"
	src="${ctx}/dwr/interface/dwrInvokeDataAction.js"></script>
<script language="javascript"
	src="${ctx}/widgets/yui/autocomplete/autocomplete-min.js"></script>

<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<script type="text/javascript">
function user_Select(){
	var userSelect = document.getElementById("userSelect");
	var userSelectText = userSelect.options[userSelect.selectedIndex].text;
	var userArray = userSelectText.split('-');
	document.getElementById("userCodeTemp").value=userArray[0];
	document.getElementById("userNameTemp").value=userArray[1];	
}
</script>
<script>
//function init(){
//	initAllSelectUi();
//}
//YAHOO.util.Event.addListener(window,'load',init);
</script>
<script type="text/javascript">
	var req;
	var userCode_tip = new YAHOO.widget.Tooltip("userCode_tip",{text:'<s:text name="userinstead.grantusercode"/>',context:"saaUser.userCode",zIndex:300});
	var userCodeTemp_tip = new YAHOO.widget.Tooltip("userCodeTemp_tip",{text:'<s:text name="userinstead.accpetusercode"/>',context:"userCodeTemp",zIndex:300});
	var userName_tip = new YAHOO.widget.Tooltip("userName_tip",{text:'<s:text name="userinstead.grantuser"/>',context:"saaUser.userName",zIndex:300});
	var userNameTemp_tip = new YAHOO.widget.Tooltip("userNameTemp_tip",{text:'<s:text name="userinstead.accpetuser"/>',context:"userNameTemp",zIndex:300});
	var beginDate_tip = new YAHOO.widget.Tooltip("beginDate_tip",{text:'<s:text name="userinstead.grantstarttime"/>',context:"beginDate",zIndex:300});
	var endDate_tip = new YAHOO.widget.Tooltip("endDate_tip",{text:'<s:text name="userinstead.grantenddate"/>',context:"endDate",zIndex:300});	
	var gradeSelect_tip = new YAHOO.widget.Tooltip("gradeSelect_tip",{text:'<s:text name="userinstead.accpetuserlist"/>',context:"gradeSelect",zIndex:300});
	var userSelect_tip = new YAHOO.widget.Tooltip("userSelect_tip",{text:'<s:text name="userinstead.havegradeusercode"/>',context:"userSelect",zIndex:300});
   function grade_Select(){       	
            var zhi=document.getElementById('gradeSelect').value;
            document.getElementById("saaUserInstead.userGrades").value=zhi;
            var url="${ctx}/saaUser/queryUserJSP.do?userCode=" + document.getElementById("saaUser.userCode").value +"&comCode=" + document.getElementById("saaUser.comCode").value+"&saaGradeCode="+zhi;
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
            var select_root=document.getElementById('userSelect');
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
        function form_submit(){
        	var gradeSelected = document.getElementById('gradeSelect').value;
        	var userSelected = document.getElementById('userSelect').value;
        	var beginTime=document.getElementById('beginDate').value;
        	var endTime=document.getElementById('endDate').value;
        	if(gradeSelected!=null&&gradeSelected!=""){
        		if(userSelected!=null&&userSelected!=""){
        			if(beginTime!=null&&beginTime!=""){
        				if(endTime!=null&&endTime!=""){
        					form.submit();
        				}else{
        					alert('<s:text name="userinstead.inputenddate"/>');
        					return false;
        				}
        			}else{
        				alert('<s:text name="userinstead.inputstartdate"/>');
        				return false;
        			}
        		}else{
        			alert('<s:text name="userinstead.userinstead.pleasechoseuser"/>');
        			return false;
        		}
        	}else{
        		alert('<s:text name="userinstead.pleasechosegrade"/>');
        		return false;
        	}
        }
/*****时间控件******/
init_calendar("calContainer1","imgBtn1","beginDate","toSecond");
init_calendar("calContainer2","imgBtn2","endDate","toSecond");

</script>



