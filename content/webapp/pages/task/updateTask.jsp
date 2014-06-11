<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript" src="${ctx}/dwr/interface/dwrInvokeDataAction.js"></script>
<script language="javascript" src="${ctx}/widgets/yui/autocomplete/autocomplete-min.js"></script>

<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<html>
<head>
<title><s:text name="prompt.function.modify"/></title>
<script type="text/javascript">
  function backToTask(){
	 url = "contextRootPath/saaTask/showTask.do";
	document.location.href=url;
  }
  function formsubmit(url){
  	if(checkForm()){
   	submitDlg = new YAHOO.widget.Dialog("submitDlg",{iframe:true, visible:true, width:650, height:500, underlay:"shadow", constraintoviewport:true, fixedcenter:true, modal:true,zIndex:302});
	submitDlg.setHeader('<s:text name="task.promptingmessage"/>');
	submitDlg.setBody("<iframe name='submitFrame' src='javascript:false;'  frameborder='0' style='margin:0; padding:0; width:100%; height: 100%'></iframe>");
	submitDlg.render(document.body);
	submitDlg.show();
	fm.action = contextRootPath+url;
	fm.target = "submitFrame";
	fm.submit();
	}
  }
  function checkForm(){
  	var codeReg=/^[0-9a-zA-Z_-]{1,50}$/;
  	var ENameReg=/^[0-9a-zA-Z_-]{0,20}$/;
  	var CNameReg=/^[0-9\u4e00-\u9fa5_-]{1,20}$/;
  	var TNameReg=/^[0-9\u4e00-\u9fa5_-]{0,20}$/;
  	var taskCode=document.getElementById("saaTask.taskCode").value;
  	var taskParentCode=document.getElementById("saaTask.parentCode").value;
  	var taskCName=document.getElementById("saaTask.taskCName").value;
  	var taskEName=document.getElementById("saaTask.taskEName").value;
  	var taskTName=document.getElementById("saaTask.taskTName").value;
  	
  	if(codeReg.test(taskCode)){
  		if(codeReg.test(taskParentCode)){
  			if(CNameReg.test(taskCName)){
  				if(ENameReg.test(taskEName)){
  					if(TNameReg.test(taskTName)){
  						return true;
  					}else{
  						alert('<s:text name="prompt.function.inputcurrenttname"/>');
  						return false;
  					}
  				}else{
  					alert('<s:text name="prompt.function.inputcurrentenglishname"/>');
  					return false;
  				}
  			}else{
  				alert(<s:text name="prompt.function.inputcurrentchinesename"/>);
  				return false;
  			}
  		}else{
  			alert(<s:text name="prompt.function.inputcurrentuppercode"/>);
  			return false;
  		}
  	}else{
  		alert(<s:text name="prompt.function.inputcurrentcode"/>);
  		return false;
  	}
  }
</script>
</head>

<body>
<div id="crash_menu">
<h2 align="center"><s:text name="prompt.function.managerfunctioinlist"/></h2>
</div>
<c:if test="${type == 'updateTask'}">
	<c:set var="url" value="/saaTask/updateTask.do"></c:set>
</c:if>
<c:if test="${type == 'addTask'}">
	<c:set var="url" value="/saaTask/addTask.do"></c:set>
</c:if>
<s:form name="fm" action="${url}" namespace="/saaTask" method="post"
	theme="simple">
	<table class="fix_table">
		<tr>
			<s:hidden name="saaTask.id"></s:hidden>
			<s:hidden name="saaTask.creatorCode"></s:hidden>
			<s:hidden name="saaTask.createTime"></s:hidden>
			<s:hidden name="saaTask.validInd"></s:hidden>
			<s:hidden name="saaTask.updaterCode"></s:hidden>
			<s:hidden name="type"></s:hidden>
			<td class="bgc_tt short"><s:text name="prompt.function.code"/></td>
			<td class="long"><s:textfield name="saaTask.taskCode"
				id="saaTask.taskCode" cssClass='input_w w_30' /></td>
			<td class="bgc_tt short"><s:text name="prompt.function.uppercode"/></td>
			<td class="long"><s:textfield name="saaTask.parentCode"
				id="saaTask.parentCode" cssClass='input_y w_30' value="${saaTask.parentCode}" 
				ondblclick="code_CodeSelect(this, 'methodTask', '0,1', 'Y','')"
				onkeyup="code_CodeSelect(this, 'methodTask', '0,1', 'Y','')"
				onchange="code_CodeChange(this, 'methodTask', '0,1', 'Y','')" />
				<s:hidden name="id" value="${id}" /> 
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="prompt.function.chinesename"/></td>
			<td class="long"><s:textfield name="saaTask.taskCName"
				id="saaTask.taskCName" cssClass='input_w w_30' /></td>
			<td class="bgc_tt short"><s:text name="prompt.function.englishname"/></td>
			<td class="long"><s:textfield name="saaTask.taskEName"
				id="saaTask.taskEName" cssClass='input_w w_30' /></td>
		</tr>
		<tr>

			<td class="bgc_tt short"><s:text name="prompt.function.tname"/></td>
			<td class="long"><s:textfield name="saaTask.taskTName"
				id="saaTask.taskTName" cssClass='input_w w_30' /></td>

			<!--
			<td class="bgc_tt short">最后修改人</td>
			<td class="long"><!--
				<s:textfield name="saaTask.updaterCode" id="saaTask.updaterCode"
					cssClass='input_w w_30' disabled="true"/>-->
			<td class="bgc_tt short"><s:text name="prompt.function.validstatus"/></td>
			<td class="long">
				<s:select name="saaTask.validStatus" id="saaTask.validStatus"
				list="#{'1':'有效','0':'无效'}"/> 
			</td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<c:if test="${type == 'updateTask'}">
				<td>
				  <input type="button" class="button_ty" value='<s:text name="button.save"/>' onclick="formsubmit('${url}');">  
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><input type="reset" class="button_ty" value='<s:text name="button.reset"/>' /></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</c:if>
			<c:if test="${type == 'addTask'}">
				<td> <input type="button" class="button_ty" value='<s:text name="button.add"/>' onclick="formsubmit('${url}');">
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</c:if>
			<td><input type="button" class="button_ty"
				onclick="window.close();" value='<s:text name="button.close"/>' /></td>
		</tr>
	</table>
</s:form>
</body>
</html>


<script>
//function init(){
//	initAllSelectUi();
//}
//YAHOO.util.Event.addListener(window,'load',init);
</script>
