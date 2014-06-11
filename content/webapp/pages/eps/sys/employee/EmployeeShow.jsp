<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title><s:text name="epsCompany.manage" /></title>
<link href="${ctx}/style/query.css" type="text/css" rel="stylesheet">


</head>
<body id="all_title"> 
  <div id="crash_menu">

<h2>
<s:text name="employee.view" />
</h2>
<s:form action="" method="post" namespace="/epsCompany" validate="true">
<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="employee.userCode" /></td>
			<td class="long"><s:label name="epsUser.userCode" id="epsUser.userCode" 
			cssClass='input_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="employee.comCName" /></td>
			<td class="long"><s:label name="epsCompany.comCName" cssClass='input_w w_20'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="employee.userName" /></td>
			<td class="long"><s:label name="epsUser.userName"
				id="employee.userName" cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="employee.userEName" /></td>
			<td class="long"><s:label name="epsUser.userEName"
				id="epsUser.userEName"  cssClass='input_w w_15' /></td>
		</tr>
		<tr>
		   <td class="bgc_tt short"><s:text name="employee.passWord" /></td>
		   <td class="long"><input type="password" name="epsUser.passWord" 
		    value="${epsUser.passWord }"  class='input_w w_15' /></td>
		    <td class="bgc_tt short"></td>
		    <td class="bgc_tt short"></td>
		    </tr>
		<tr>
			<td class="bgc_tt short"><s:text name="employee.passWordSetDate" /></td>
	       <td class="long"><s:label name="epsUser.passWordSetDate"  
	                    id="epsUser.passWordSetDate" cssClass="input_w w_15" />
           </td>
            
		  <td class="bgc_tt short"><s:text name="employee.passWordExpireDate" /></td>
	      <td class="long"><s:label  name="epsUser.passWordExpireDate" 
	                    id="epsUser.passWordExpireDate" cssClass="input_w w_15" />
	        </td> 
		  </tr>	
			<tr>
			<td class="bgc_tt short"><s:text name="employee.phone" /></td>
			<td class="long"><s:label name="epsUser.phone"
				id="employee.phone" cssClass='input_w w_15' /></td>
				<td class="bgc_tt short"><s:text name="employee.mobile" /></td>
			<td class="long"><s:label name="epsUser.mobile"
				id="epsUser.mobile"  cssClass='input_w w_15' /></td>
		</tr>
		<tr>
		   <td class="bgc_tt short"><s:text name="employee.email" /></td>
		   <td class="long"><s:label name="epsUser.email"
		    id="epsUser.email"  cssClass='input_w w_15' /></td>
		   <td class="bgc_tt short"><s:text name="employee.newUserCode" /></td>
		   <td class="long"><s:label name="epsUser.newUserCode" 
		   id="epsUser.newUserCode"  cssClass='input_w w_15' /></td>
		</tr>
	    <tr>
	          <td class="bgc_tt short"><s:text name="employee.queryPermission" /></td>
		      <td class="long">
		      <c:if test="${epsUser.queryPermission=='1' }">
		         <s:label name="epsUser.queryPermission" value="本人" cssClass='input_w w_15'/>
		      </c:if>
		       <c:if test="${epsUser.queryPermission=='2' }">
		         <s:label name="epsUser.queryPermission" value="本机构" cssClass='input_w w_15'/>
		      </c:if>
		       <c:if test="${epsUser.queryPermission=='3' }">
		         <s:label name="epsUser.queryPermission" value="本机构及其下属机构" cssClass='input_w w_19'/>
		      </c:if>
		      </td>
	       <td class="bgc_tt short"><s:text name="employee.draftPermission" /></td>
		      <td class="long">
		      <c:if test="${epsUser.draftPermission=='1' }">
		         <s:label name="epsUser.draftPermission" value="有" cssClass='input_w w_15'/>
		      </c:if>
		       <c:if test="${epsUser.draftPermission=='0' }">
		         <s:label name="epsUser.draftPermission" value="无" cssClass='input_w w_15'/>
		      </c:if>
		      
		  </td>
	   </tr>	
	    <tr>
			<td class="bgc_tt short"><s:text name="employee.payee" /></td>
			<td class="long"><s:label name="epsUser.payee"
				id="employee.payee" cssClass='input_w w_15' /></td>
		    <td class="bgc_tt short"><s:text name="validStatus" /></td>
		   <td class="long">
		    <c:if test="${epsUser.validStatus=='1' }">
		          <s:text name="validStatus.true" />
		      </c:if>
		       <c:if test="${epsUser.validStatus=='0' }">
		         <s:text name="validStatus.false" />
		      </c:if>		   
		  </td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="employee.payeeBankAccount" /></td>
			<td class="long"><s:label name="epsUser.payeeBankAccount"
				id="epsUser.payeeBankAccount"  cssClass='input_w w_15' /></td>
		   <td class="bgc_tt short"><s:text name="employee.payeeBankName" /></td>
		   <td class="long"><s:label name="epsUser.payeeBankName" id="epsUser.payeeBankName"  cssClass='input_w w_15' /></td>
		</tr>
	</table>
	<br>
			<table>
			<tr>
				<td><input type="button" class="button_ty" value="<s:text name='prompt.close' />" onclick="window.close();"/></td>
			</tr>		
  		</table>
</s:form></div>
</body>
</html>
