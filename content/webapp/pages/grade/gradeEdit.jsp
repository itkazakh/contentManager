<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@include file="/common/meta_css.jsp"%>
<%@include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/common/js/sinosoft.js"></script>
<script type="text/javascript" src="${ctx}/common/js/MulLine.js"></script>
<script type="text/javascript" src="${ctx}/common/js/Common.js"></script>
<script type="text/javascript" src="${ctx }/common/dtree/dtree.js"></script>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
</head>
<body id="all_title">
<div id="wrapper">
<div id="container">
<s:form name="fm" action=""	target="companyTreeRight">
<s:hidden name="editType" id="editType" value="${editType}"></s:hidden>
	<table width="100%" class="fix_table">
		<tr class="top">
			<s:if test="${editType=='insert' }">
				<td colspan="6" align="center"><strong><s:text name="grade.addgrade"/></strong></td>
			</s:if>
			<s:if test="${editType=='update' }">
				<td colspan="6" align="center"><strong><s:text name="grade.config"/></strong></td>
			</s:if>
			<s:if test="${editType=='view' }">
				<td colspan="6" align="center"><strong><s:text name="grade.view"/></strong></td>
			</s:if>
			<s:if test="${editType=='copy' }">
				<td colspan="6" align="center"><strong><s:text name="grade.copygrade"/></strong></td>
				<s:hidden name="grade.creatorCode" value="${oldGrade.creatorCode}"></s:hidden>
				<s:hidden name="grade.createTime" value="${oldGrade.createTime}"></s:hidden>
				<s:hidden name="grade.updateTime" value="${oldGrade.updateTime}"></s:hidden>
				<s:hidden name="grade.updaterCode" value="${oldGrade.updaterCode}"></s:hidden>
			</s:if>
		</tr>				
		<s:if test="${editType=='copy' }">
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecname"/></td>
				<td class="long""><s:textfield name="grade.gradeCName" value="${oldGrade.gradeCName}(副本)"
					id="gradeCName2" cssClass='input_w w_15' maxlength="20"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeename"/></td>
				<td class="long""><s:textfield name="grade.gradeEName" value="${oldGrade.gradeEName}"
					id="gradeEName2" cssClass='input_w w_15' maxlength="20"/></td>								
				<td class="bgc_tt short"><s:text name="grade.gradetname"/></td>
				<td class="long""><s:textfield name="grade.gradeTName" value="${oldGrade.gradeTName}"
					id="gradeTName2" cssClass='input_w w_15' maxlength="20"/></td>				
			</tr>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecomcode" /></td>
				<td class="long""><s:textfield name="grade.comCode" value="${userComCode}"
					 cssClass='input_w w_15' maxlength="20" readonly="true"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeproperty"/></td>
				<td class="long""><s:select name="grade.commonGrade" value="${oldGrade.commonGrade}"
					list="#{'1':'公有','0':'私有'}" /></td>				
				<td class="bgc_tt short"><s:text name="grade.validflag"/></td>
				<td class="long""><s:select name="grade.validStatus" value="${oldGrade.validStatus}"
					list="#{'1':'有效','0':'无效'}" /></td>
			</tr>
		</s:if>
		<s:elseif test="${editType=='view' }">
			<s:hidden name="grade.id "/>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecname"/></td>
				<td class="long""><s:textfield name="grade.gradeCName" 
					id="gradeCName" cssClass='input_w w_15' maxlength="20" readonly="true"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeename"/></td>
				<td class="long""><s:textfield name="grade.gradeEName" 
					id="gradeEName" cssClass='input_w w_15' maxlength="20" readonly="true"/></td>				
				<td class="bgc_tt short"><s:text name="grade.gradetname"/></td>
				<td class="long""><s:textfield name="grade.gradeTName" 
					id="gradeTName" cssClass='input_w w_15' maxlength="20" readonly="true"/></td>				
				
			</tr>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecomcode" /></td>
				<td class="long""><s:textfield name="grade.comCode"
					id="comCode" cssClass='input_w w_15' maxlength="20" readonly="true"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeproperty"/></td>
				<td class="long""><s:select name="grade.commonGrade" 
					list="#{'1':'公有','0':'私有'}" disabled="true" /></td>			
				<td class="bgc_tt short"><s:text name="grade.validflag"/></td>
				<td class="long""><s:select name="grade.validStatus" 
					list="#{'1':'有效','0':'无效'}" disabled="true" /></td>
			</tr>
		</s:elseif>
		<s:elseif test="${editType=='update' }">
			<s:hidden name="grade.id "/>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecname"/></td>
				<td class="long""><s:textfield name="grade.gradeCName" 
					id="gradeCName" cssClass='input_w w_15' maxlength="20"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeename"/></td>
				<td class="long""><s:textfield name="grade.gradeEName" 
					id="gradeEName" cssClass='input_w w_15' maxlength="20"/></td>				
				<td class="bgc_tt short"><s:text name="grade.gradetname"/></td>
				<td class="long""><s:textfield name="grade.gradeTName" 
					id="gradeTName" cssClass='input_w w_15' maxlength="20"/></td>				
				
			</tr>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecomcode" /></td>
				<td class="long""><s:textfield name="grade.comCode" 
					id="comCode" cssClass='input_w w_15' maxlength="20" readonly="true"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeproperty"/></td>
				<td class="long""><s:select name="grade.commonGrade" 
					list="#{'1':'公有','0':'私有'}" /></td>			
				<td class="bgc_tt short"><s:text name="grade.validflag"/></td>
				<td class="long""><s:select name="grade.validStatus" 
					list="#{'1':'有效','0':'无效'}" /></td>
			</tr>
		</s:elseif>
		<s:else>
			<s:hidden name="grade.id "/>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecname"/></td>
				<td class="long""><s:textfield name="grade.gradeCName" 
					id="gradeCName" cssClass='input_w w_15' maxlength="20"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeename"/></td>
				<td class="long""><s:textfield name="grade.gradeEName" 
					id="gradeEName" cssClass='input_w w_15' maxlength="20"/></td>				
				<td class="bgc_tt short"><s:text name="grade.gradetname"/></td>
				<td class="long""><s:textfield name="grade.gradeTName" 
					id="gradeTName" cssClass='input_w w_15' maxlength="20"/></td>				
				
			</tr>
			<tr>
				<td class="bgc_tt short"><s:text name="grade.gradecomcode" /></td>
				<td class="long""><s:textfield name="grade.comCode" value="${userComCode}"
					 cssClass='input_w w_15' maxlength="20" readonly="true"/></td>
				<td class="bgc_tt short"><s:text name="grade.gradeproperty"/></td>
				<td class="long""><s:select name="grade.commonGrade" 
					list="#{'1':'公有','0':'私有'}" /></td>			
				<td class="bgc_tt short"><s:text name="grade.validflag"/></td>
				<td class="long""><s:select name="grade.validStatus" 
					list="#{'1':'有效','0':'无效'}" /></td>
			</tr>
		</s:else>
	</table>
	<table width="100%" border="0" cellpadding="5" cellspacing="1">
		<br/>
	<s:if test="${editType=='update' }">
	<div id="tabdemo" class="yui-navset">   
	    <ul class="yui-nav">
	    <c:set var="index" value="0" />
	    <s:iterator value="systemTasks" status="stuts">
	    <s:if test="${index+1==1}">
	    <li class="selected"><a href="#tab${index+1 }"><em><s:property value="%{systemTasks[#stuts.index].taskCName}" /></em></a></li>
	        <c:set var="index" value="${index+1 }" />
	    </s:if>
	    <s:else>
	    <li><a href="#tab${index+1 }" ><em><s:property value="%{systemTasks[#stuts.index].taskCName}" /></em></a></li>
	        <c:set var="index" value="${index+1 }" />
	    </s:else>
	    </s:iterator> 
	    </ul>               
	    <div class="yui-content">
	     <c:set var="indexi" value="0" /> 
	     <s:iterator value="systemTasks" status="stuts">
	        <div id="tab${indexi+1 }">
	        <iframe id="taskIframe${indexi+1 }" src="${ctx}/saaGrade/preGradeTaskCodeBySys.do?rootTaskCode=<s:property value="%{systemTasks[#stuts.index].taskCode}" />&editType=${editType}&gradeID=${grade.id}" frameborder="0" width="100%" height="580"></iframe>
	        	<s:property value="%{systemTasks[#stuts.index].taskCName}" />
	        </div>  
	        <c:set var="indexi" value="${indexi+1 }" /> 
	     </s:iterator>
	    </div>  
	</div>  
	</s:if>
	<s:elseif test="${editType=='copy' }">
		<div id="tabdemo" class="yui-navset">   
	    <ul class="yui-nav">
	    <c:set var="index" value="0" />
	    <s:iterator value="systemTasks" status="stuts">
	    <s:if test="${index+1==1}">
	    <li class="selected"><a href="#tab${index+1 }"><em><s:property value="%{systemTasks[#stuts.index].taskCName}" /></em></a></li>
	        <c:set var="index" value="${index+1 }" />
	    </s:if>
	    <s:else>
	    <li><a href="#tab${index+1 }" ><em><s:property value="%{systemTasks[#stuts.index].taskCName}" /></em></a></li>
	        <c:set var="index" value="${index+1 }" />
	    </s:else>
	    </s:iterator> 
	    </ul>               
	    <div class="yui-content">
	     <c:set var="indexi" value="0" /> 
	     <s:iterator value="systemTasks" status="stuts">
	        <div id="tab${indexi+1 }">
	        <iframe id="taskIframe${indexi+1 }" src="${ctx}/saaGrade/preGradeTaskCodeBySys.do?rootTaskCode=<s:property value="%{systemTasks[#stuts.index].taskCode}" />&editType=${editType}&gradeID=${oldGrade.id}" frameborder="0" width="100%" height="580"></iframe>
	        	<s:property value="%{systemTasks[#stuts.index].taskCName}" />
	        </div>  
	        <c:set var="indexi" value="${indexi+1 }" /> 
	     </s:iterator>
	    </div>  
	</div>  
	</s:elseif>
	<s:else>
		<div id="tabdemo" class="yui-navset">   
	    <ul class="yui-nav">
	    <c:set var="index" value="0" />
	    <s:iterator value="systemTasks" status="stuts">
	    <s:if test="${index+1==1}">
	    <li class="selected"><a href="#tab${index+1 }"><em><s:property value="%{systemTasks[#stuts.index].taskCName}" /></em></a></li>
	        <c:set var="index" value="${index+1 }" />
	    </s:if>
	    <s:else>
	    <li><a href="#tab${index+1 }" onclick="javascript:showInsertGradeIframe('taskIframe${index+1 }','<s:property value="%{systemTasks[#stuts.index].taskCode}" />')";><em><s:property value="%{systemTasks[#stuts.index].taskCName}" /></em></a></li>
	        <c:set var="index" value="${index+1 }" />
	    </s:else>
	    </s:iterator> 
	    </ul>               
	    <div class="yui-content">
	     <c:set var="indexi" value="0" /> 
	     <s:iterator value="systemTasks" status="stuts">
	        <div id="tab${indexi+1 }">
	        <s:if test="${indexi+1==1}">
	        	<iframe id="taskIframe${indexi+1 }" src="${ctx}/saaGrade/preGradeTaskCodeBySys.do?rootTaskCode=<s:property value="%{systemTasks[#stuts.index].taskCode}" />&editType=${editType}" frameborder="0" width="100%" height="580"></iframe>
	   		</s:if>
	   		<s:else>
	        <iframe id="taskIframe${indexi+1 }" src="#" frameborder="0" width="100%" height="580"></iframe>
	   		</s:else>
	        	<s:property value="%{systemTasks[#stuts.index].taskCName}" />
	        </div>  
	        <c:set var="indexi" value="${indexi+1 }" /> 
	     </s:iterator>
	    </div>  
	</div>  
	</s:else>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr align="center" class="top">
			<c:if test="${editType=='insert' }">
				<td><input type="button" value='<s:text name="button.add"/>' class="button_ty"
				onclick="return addMethod()"></td>
			</c:if>
			<c:if test="${editType=='update' }">
				<td><input type="button" value='<s:text name="button.save"/>' class="button_ty"
					onclick="return updateMethod()"></td>
			</c:if>
			<c:if test="${editType=='copy' }">
				<td><input type="button"  value='<s:text name="button.copy"/>' class="button_ty"
				onclick="return addMethod()"></td>
			</c:if>
			<div id="gradeTrees" style="display:none"></div>
		</tr>
	</table>
</s:form>
</div>
</div>
</body>
</html>
<script language="javascript">
var tabView = new YAHOO.widget.TabView('tabdemo');
var tabFlag = new Array();
tabFlag.push("taskIframe1");
function showInsertGradeIframe(tab,rootCode){
	var tabNum=0;
	for(var i=0;i<tabFlag.length;i++){
		if(tabFlag[i]==tab){
			tabNum+=1;
		}
	}
	if(tabNum==0){
		document.getElementById(""+tab).src="${ctx}/saaGrade/preGradeTaskCodeBySys.do?rootTaskCode="+rootCode+"&editType=${editType}&gradeID=${grade.id}";
		tabFlag.push(tab);
	}
	
}
/*(function() {
    var tabView = new YAHOO.widget.TabView();
    
    tabView.addTab( new YAHOO.widget.Tab({
        label: 'Opera',
        dataSrc: '${ctx}/pages/grade/tasksView.jsp',
        cacheData: true,
        active: true
    }));

    tabView.addTab( new YAHOO.widget.Tab({
        label: 'Firefox',
        dataSrc: '',
        cacheData: true
    }));

    tabView.addTab( new YAHOO.widget.Tab({
        label: 'Explorer',
        dataSrc: '',
        cacheData: true
    }));

    tabView.addTab( new YAHOO.widget.Tab({
        label: 'Safari',
        dataSrc: '',
        cacheData: true
    }));

    YAHOO.log("The example has finished loading; as you interact with it, you'll see log messages appearing here.", "info", "example");

    tabView.appendTo('container');
})();*/
  function updateMethod(){
	  	if(checkForm()){
	    fm.action="${ctx}/saaGrade/updateGrade.do";
	    fm.target="companyTreeRight";
	    var framesNum=${indexi};
  		for(var i=1;i<=framesNum;i++){
  			if(document.getElementById("taskIframe"+i).src!="#"){
  				document.frames["taskIframe"+i].selected();
  			}
  		}
	    fm.submit();
	    return true;
 	 }
  }
  function returnToConfig(){
	  fm.action="${ctx}/saaGrade/gradeConfig.do";
	  fm.target="companyTreeLeft";
	  parent.frames["companyTreeRight"].location="about:blank";
	  fm.submit();
	  return true;
  }
  function addMethod(){
  	if(checkForm()){
  		fm.action="${ctx}/saaGrade/insertGrade.do";
  		fm.target="companyTreeRight";
  		var framesNum=${indexi};
  		for(var i=1;i<=framesNum;i++){
  			if(document.getElementById("taskIframe"+i).src!="#"){
  				document.frames["taskIframe"+i].selected();
  			}
  		}
   		fm.submit();
   		return true;
   	}
  }
  function treeCheckBox(treeCheckBox){
  	treeCheckBox.checked=true;
  	document.getElementById("gradeTrees").innerHTML+="<input type='checkbox' name='treeCheckBox' value="+treeCheckBox.value+" checked />";
  }
  function intranetCheckBox(intranetCheckBox){
  	document.getElementById("gradeTrees").innerHTML+="<input type='checkbox' name='intranetCheckBox' value="+intranetCheckBox.value+" checked="+intranetCheckBox.checked+" />";
  }
  function internetCheckBox(internetCheckBox){
  	document.getElementById("gradeTrees").innerHTML+="<input type='checkbox' name='internetCheckBox' value="+internetCheckBox.value+" checked="+internetCheckBox.checked+" />";
  }
  function checkForm(){
    var editType=document.getElementById("editType").value;
  	var ENameReg=/^[0-9a-zA-Z_]{0,20}$/;
  	var CNameReg=/^[0-9\u4e00-\u9fa5_]{1,20}$/;
  	var TNameReg=/^[0-9\u4e00-\u9fa5_]{0,20}$/;
  	if(editType=="copy"){
  		var CName=document.getElementById("gradeCName2").value;
  		var EName=document.getElementById("gradeEName2").value;
  		var TName=document.getElementById("gradeTName2").value;
  		if(CNameReg.test(CName)){
  			if(ENameReg.test(EName)){
  				if(TNameReg.test(TName)){
  					return true;
  				}else{
  					alert('<s:text name="prompt.grade.inputgradetname"/>');
  					return false;
  				}  				
  			}else{
  				alert('<s:text name="prompt.grade.inputgradeename"/>');
  				return false;
  			}
  		}else{
  			alert('<s:text name="prompt.grade.inputgradecname"/>');
  			return false;
  		}  	
  	}else{
  		var CName=document.getElementById("gradeCName").value;
  		var EName=document.getElementById("gradeEName").value;
  		var TName=document.getElementById("gradeTName").value;
  		if(CNameReg.test(CName)){
  			if(ENameReg.test(EName)){
  				if(TNameReg.test(TName)){
  					return true;
  				}else{
  					alert('<s:text name="prompt.grade.inputgradetname"/>');
  					return false;
  				}
  			}else{
  				alert('<s:text name="prompt.grade.inputgradeename"/>');
  				return false;
  			}
  		}else{
   			alert('<s:text name="prompt.grade.inputgradeename"/>');
  			return false;
  		}
  	}
  }
</script>