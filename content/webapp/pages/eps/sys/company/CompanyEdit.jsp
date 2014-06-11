<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title></title>

</head>
<body>
<s:fielderror />
<div id="crash_menu">
<div id="calContainer"
	style="position:absolute;display:none;z-index:999;left:33%;"></div>
<div id="case_detail" class="query">
 <c:if test="${type == 'update'}">
     <c:set var="url" value="updateEpsCompany.do"></c:set>
     <c:set var="manager" value="company.update"></c:set>
     <c:set var="readStatus" value="true"></c:set>
     </c:if>
    <c:if test="${type == 'add'}">
   <c:set var="url" value="addEpsCompany.do"></c:set>
    <c:set var="manager" value="company.add"></c:set>
    <c:set var="readStatus" value="false"></c:set>
    </c:if>
<h2 align="center"><s:text name="${manager }" /></h2>
<s:form action="${url }" method="post" namespace="/epsCompany" validate="true" name="fm">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comCode" /></td>
			<td class="long"><s:textfield name="epsCompany.comCode" required="true" maxlength="8"
			 id="epsCompany.comCode" cssClass='input_w w_15' readonly="${readStatus }"/></td>
			<td class="bgc_tt short"><s:text name="epsCompany.upperComCode" /></td>
			<td class="long"><s:textfield name="epsCompany.upperComCode"
			 id="epsCompany.upperComCode"	cssClass='input_y w_p30' required="true"
				ondblclick="code_CodeSelect(this, 'upperComCode', '0', 'Y');"
				onkeyup="code_CodeSelect(this, 'upperComCode', '0', 'Y')"
				onchange="code_CodeChange(this, 'upperComCode', '0', 'Y')"
			  /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comCName" /></td>
			<td class="long"><s:textfield name="epsCompany.comCName" required="true"
				id="epsCompany.comCName" cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="epsCompany.comEName" /></td>
			<td class="long"><s:textfield name="epsCompany.comEName" 
				id="epsCompany.comEName"  cssClass='input_w w_15' /></td>
		</tr>
		<tr>
		   <td class="bgc_tt short"><s:text name="epsCompany.comLevel" /></td>
			<td class="long"><s:select name="epsCompany.comLevel" list="comLevelMap" value="${epsCompany.comLevel }" cssClass='input_w w_15'></s:select>
			</td>
			<td class="bgc_tt short"><s:text name="epsCompany.centerFlag" /></td>
			<td><s:select name="epsCompany.centerFlag" list="centerFlagMap" value="${epsCompany.centerFlag }" cssClass='input_w w_15' />
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.validStatus" /></td>
			<td class="long"><s:select list="#{'1':'有效','0':'无效'}" name="epsCompany.validStatus"  cssClass='input_w w_15'/>
			</td>
		</tr>		
	</table>
	<table>
		<tr>
				<td>
				  <input type="button" class="button_ty" value="<s:text name="common.save"/>" onclick=" return formsubmit('${url }');">  
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><input type="reset" class="button_ty" value="<s:text name="prompt.reset"/>"/></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
</s:form></div>
<div id="roleContainer" style="position:absolute;"></div>
</div>
</body>

<script type="text/javascript">
  function init(){
      var upperComCode_tip = new YAHOO.widget.Tooltip("upperComCode_tip",{text:"<s:text name="epsCompany.upperComCode_tip"/>",context:"epsCompany.upperComCode",zIndex:300});
  }

  function backToTask(){
	 url = "contextRootPath/epsCompany/showEpsCompany.do";
	document.location.href=url;
  }
  function formsubmit(url){
  	if(checkForm()){
   	submitDlg = new YAHOO.widget.Dialog("submitDlg",{iframe:true, visible:true, width:650, height:500, underlay:"shadow", constraintoviewport:true, fixedcenter:true, modal:true,zIndex:302});
	submitDlg.setHeader("common.message");
	submitDlg.setBody("<iframe name='submitFrame' src='javascript:false;'  frameborder='0' style='margin:0; padding:0; width:100%; height: 100%'></iframe>");
	submitDlg.render(document.body);
	submitDlg.show();
  	fm.action = contextRootPath+'/epsCompany/'+url;
	fm.target = "submitFrame";
	fm.submit();
	}
  }
  function checkForm(){
  	 // var codeReg=/^[0-9a-zA-Z_-]{1,50}$/;
    	var comCodeReg=/^[0-9]{1,8}$/;
  	    // var upperComCodeReg = /^[0-9]{1,8}$/;
        var CNameReg=/^[0-9\u4e00-\u9fa5_-]{1,60}$/;
  	    var ENameReg=/^[0-9a-zA-Z_-]{0,80}$/;
      //	var TNameReg=/^[0-9\u4e00-\u9fa5_-]{0,20}$/;
  	var comCode=document.getElementById("epsCompany.comCode").value;
  	var upperComCode=document.getElementById("epsCompany.upperComCode").value;
  	var comCName=document.getElementById("epsCompany.comCName").value;
  	var comEName =document.getElementById("epsCompany.comEName").value;
  
     if(!comCodeReg.test(comCode)){
  	  	  alert("<s:text name='epsCompany.alertComCode' />");
  		  return false;
  	   }
  		if(!comCodeReg.test(upperComCode)){
  		    alert("<s:text name='epsCompany.alertUpperComCode' />");
  			return false;
  		}
  		if(!CNameReg.test(comCName)){
  		        alert("<s:text name='epsCompany.alertComCName' />");
  				return false;
  		}
  		if(!ENameReg.test(comEName)){
  			    alert("<s:text name='epsCompany.alertComEName' />");
  				return false;		
  		}
  	    return true;
     }
  YAHOO.util.Event.addListener(window,'load',init);	
</script>
</html>
