<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
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
     <c:set var="url" value="updateEmployee.do"></c:set>
     <c:set var="manager" value="employee.update"></c:set>
     <c:set var="readStatus" value="true"></c:set>
     </c:if>
    <c:if test="${type == 'add'}">
   <c:set var="url" value="addEmployee.do"></c:set>
    <c:set var="manager" value="employee.add"></c:set>
    <c:set var="readStatus" value="false"></c:set>
    </c:if>
<h2 align="center"><s:text name="${manager }" /></h2>
<s:form action="${url }" method="post" namespace="/employee" validate="true" name="fm">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="employee.comCName" /></td>
			<td class="long"><s:textfield name="epsCompany.comCode" id="epsCompany.comCode" maxlength="8"
				cssClass='input_y w_p30' required="true" value="${epsCompany.comCode }"
				ondblclick="code_CodeSelect(this, 'comCode', '0', 'Y');"
				onkeyup="code_CodeSelect(this, 'comCode', '0', 'Y')"
				onchange="code_CodeChange(this, 'comCode', '0', 'Y')"
			  /></td>
		<td class="bgc_tt short"><s:text name="employee.userCode" /></td>
		<td class="long"><s:textfield name="epsUser.userCode" id="epsUser.userCode"  maxlength="10"
			cssClass='input_w w_15' required="true" readonly="${readStatus }"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="employee.userName" /></td>
			<td class="long"><s:textfield name="epsUser.userName" required="true" maxlength="30"
				id="employee.userName" cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="employee.userEName" /></td>
			<td class="long"><s:textfield name="epsUser.userEName" maxlength="30"
				id="epsUser.userEName"  cssClass='input_w w_15' /></td>
		</tr>
		<tr>
		   <td class="bgc_tt short"><s:text name="employee.passWord" /></td>
		   <td class="long"><input type="password" name="epsUser.passWord" value="${epsUser.passWord }" maxlength="64"
		    id="epsUser.passWord"  class='input_w w_15' /><font color="red">*</font></td>
		    <td class="bgc_tt short"></td>
		    <td class="bgc_tt short"></td>
		    </tr>
		    <tr>
		   <td class="bgc_tt short"><s:text name="employee.rePassWord" /></td>
		   <td class="long"><input type="password" name="rePassWord" value="${epsUser.passWord }" maxlength="64"
		    id="epsUser.rePassWord"  class='input_w w_15' /><font color="red">*</font></td>
		    <td class="bgc_tt short"></td>
		    <td class="bgc_tt short"></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="employee.passWordSetDate" /></td>
	       <td class="long"><input type="text" name="epsUser.passWordSetDate"  value="${epsUser.passWordSetDate }" 
	                    id="epsUser.passWordSetDate" class="input_w w_15" /><font color="red">*</font>
	        <img src="${ctx}/pages/image/time/date_icon.gif" alt="<s:text name="alertTime" />" id="setDateImg" class="showup"/>
	        <div id="setDateDiv" style="position: absolute;" ></div> 
           </td>
            
		  <td class="bgc_tt short"><s:text name="employee.passWordExpireDate" /></td>
	      <td class="long"><input type="text" name="epsUser.passWordExpireDate" value="${epsUser.passWordExpireDate }" 
	                    id="epsUser.passWordExpireDate" class="input_w w_15" /><font color="red">*</font>
	        <img src="${ctx}/pages/image/time/date_icon.gif" alt="<s:text name="alertTime" />" id="expireDateImg" class="showup"/>
	        <div id="expireDateDiv" style="position: absolute;"></div>
	       </td> 
		  </tr>	
			<tr>
			<td class="bgc_tt short"><s:text name="employee.phone" /></td>
			<td class="long"><s:textfield name="epsUser.phone" maxlength="12"
				id="employee.phone" cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="employee.mobile" /></td>
			<td class="long"><s:textfield name="epsUser.mobile" maxlength="12"
				id="epsUser.mobile"  cssClass='input_w w_15' /></td>
		</tr>
		<tr>
		   <td class="bgc_tt short"><s:text name="employee.email" /></td>
		   <td class="long"><s:textfield name="epsUser.email"  maxlength="30"
		    id="epsUser.email"  cssClass='input_w w_15' /></td>
		   <td class="bgc_tt short"><s:text name="employee.newUserCode" /></td>
		   <td class="long"><s:textfield name="epsUser.newUserCode"  maxlength="30"
		    id="epsUser.newUserCode"  cssClass='input_w w_15' /></td>
		</tr>
	    <tr>
	          <td class="bgc_tt short"><s:text name="employee.queryPermission" /></td>
		      <td class="long"><s:select list="#{'1':'本人','2':'本机构','3':'本机构及其下属机构' }" 
		         name="epsUser.queryPermission"  id="epsUser.queryPermission"  cssClass='input_w w_19'/>
		      </td>
	       <td class="bgc_tt short"><s:text name="employee.draftPermission" /></td>
		      <td class="long"><s:select list="#{'0':'无','1':'有' }" 
		         name="epsUser.draftPermission"  id="epsUser.draftPermission"  cssClass='input_w w_19'/>
		      </td>
		  
	   </tr>	
	    <tr>
			<td class="bgc_tt short"><s:text name="employee.payee" /></td>
			<td class="long"><s:textfield name="epsUser.payee"
				id="employee.payee" cssClass='input_w w_15' /></td>
		     <td class="bgc_tt short"><s:text name="validStatus" /></td>
		   <td class="long"><s:select name="epsUser.validStatus" list="#{'1':'有效','0':'无效' }" />
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="employee.payeeBankAccount" /></td>
			<td class="long"><s:textfield name="epsUser.payeeBankAccount" maxlength="19"
				id="epsUser.payeeBankAccount"  cssClass='input_w w_15' /></td>
		   <td class="bgc_tt short"><s:text name="employee.payeeBankName" /></td>
		   <td class="long"><s:textfield name="epsUser.payeeBankName" id="epsUser.payeeBankName"  cssClass='input_w w_15' /></td>
		</tr>
	</table>
	<table align="center">
		<tr align="center">
				<td>
				  <input type="button" class="button_ty" value="<s:text name="common.save" />" onclick=" return formsubmit('${url }');">  
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><input type="reset" class="button_ty" value="<s:text name="prompt.reset" />" /></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</tr>
	</table>
</s:form></div>
<div id="roleContainer" style="position:absolute;"></div>
</div>
</body>

<script type="text/javascript">
  function init(){
      var comCode_tip = new YAHOO.widget.Tooltip("comCode_tip",{text:"<s:text name="epsCompany.dbComCode" />",context:"epsCompany.comCode",zIndex:300});
      init_calendar("setDateDiv","setDateImg","epsUser.passWordSetDate","toDate");
      init_calendar("expireDateDiv","expireDateImg","epsUser.passWordExpireDate");
  }

  function backToTask(){
	 url = "contextRootPath/epsCompany/showEpsCompany.do";
	document.location.href=url;
  }
  function formsubmit(url){
  	if(checkForm()){
   	submitDlg = new YAHOO.widget.Dialog("submitDlg",{iframe:true, visible:true, width:650, height:500, underlay:"shadow", constraintoviewport:true, fixedcenter:true, modal:true,zIndex:302});
	submitDlg.setHeader("<s:text name='common.message' />");
	submitDlg.setBody("<iframe name='submitFrame' src='javascript:false;'  frameborder='0' style='margin:0; padding:0; width:100%; height: 100%'></iframe>");
	submitDlg.render(document.body);
	submitDlg.show();
  	fm.action = contextRootPath+'/employee/'+url;
	fm.target = "submitFrame";
	fm.submit();
	}
  }
  function checkForm(){
    var requiredNumReg=/^[0-9]{1,10}$/; // 必填数字类型
    var numberReg = /^[0-9]{0,10}$/; //非必填数字类型
    var requiredZh_CNReg=/^[0-9\u4e00-\u9fa5_-]{1,60}$/; // 必填中文类型
    var zh_cnReg = /^[0-9a-zA-Z\u4e00-\u9fa5_-]{0,60}$/; // 非必填中文类型
  	var requiredLetterReg=/^[0-9a-zA-Z_-]{1,80}$/; // 必填英文类型
  	var letterReg=/^[0-9a-zA-Z_-]{0,80}$/; // 非必填英文类型
   //  var emailReg=/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+){0,80}$/;// 电子邮件
  	var telReg =/^\(?0?(10|2[0-57-9]|[3-9]\d{0||2}|1(3\d|5[389]))\)?-?\d{0||8}$/; //电话号码
  	var bankAccountReg = /^\d{0|19}$/;  //银行账号
  	var dateReg = /^(\d{4})(\-)(\d{1,2})\-(\d{1,2})$/; // 日期 /^(\d{4})(\-)(\d{1,2})\-(\d{1,2})$/; 
  	
  	var userCode=document.getElementById("epsUser.userCode").value;
  	var comCode=document.getElementById("epsCompany.comCode").value;
  	var userName=document.getElementById("epsUser.userName").value;
  	var userEName =document.getElementById("epsUser.userEName").value;
  	var passWord = document.getElementById("epsUser.passWord").value;
  	var rePassWord = document.getElementById("epsUser.rePassWord").value;
    var pwdSetDate = document.getElementById("epsUser.passWordSetDate").value;
    var pwdExpireDate = document.getElementById("epsUser.passWordExpireDate").value;
    var phone =  document.getElementById("epsUser.phone").value;
    var mobile = document.getElementById("epsUser.mobile").value;
    var email = document.getElementById("epsUser.email").value;
    var newUserCode = document.getElementById("epsUser.newUserCode").value;
    var payee = document.getElementById("epsUser.payee").value;
    var bankAccount = document.getElementById("epsUser.payeeBankAccount").value;
    var bankName = document.getElementById("epsUser.payeeBankName").value;
    
    if(!requiredNumReg.test(userCode)){
         alert("<s:text name='employee.alertUserCode' />");
         return false;  
    } else if(userCode.length != 10)  {      
               alert("<s:text name='employee.alertUserCodeLength' />");
               return false;
           } 
    if(!requiredNumReg.test(comCode)){
        alert("<s:text name='employee.alertComCode' />");
        return false;
    }
    if(!requiredZh_CNReg.test(userName)){
        alert("<s:text name='employee.alertUserName' />");
        return false;
    }
    if(!letterReg.test(userEName)){
       alert("<s:text name='employee.alertUserEName' />");
       return false;
    }
    if(!requiredLetterReg.test(passWord) && !requiredLetterReg.test(rePassWord)){
         alert("<s:text name='employee.alertPassword' />");
         return false;
    }else if(passWord != rePassWord){
          alert("<s:text name='employee.alertRePassword' />");
          return false;
    }
    if(!dateReg.test(pwdSetDate)||!dateReg.test(pwdExpireDate)){
         alert("<s:text name='employee.alertPwdDate' />");
         return false;
    }else if(Date.parse(pwdSetDate.replace("-", "/")) > Date.parse(pwdExpireDate.replace("-", "/"))) {
       alert("<s:text name='employee.alertCPwdDate' />");
       return false;
    }
    if(!telReg.test(phone)){
      alert("<s:text name='employee.alertPhone' />");
      return false;
    }
    if(!telReg.test(mobile)){
        alert("<s:text name='employee.alertMobile' />");
        return false;
    }
    return true;
  }
  YAHOO.util.Event.addListener(window,'load',init);	
</script>
</html>
