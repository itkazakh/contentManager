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
<s:text name="epsCompany.view" />
</h2>
<s:form action="" method="post" namespace="/epsCompany" validate="true">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comCode" /></td>
			<td class="long"><s:label name="epsCompany.comCode"
				cssClass='view_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="epsCompany.upperComCode" /></td>
			<td class="long"><s:label name="epsCompany.upperComCode"
				cssClass='view_w w_15' /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.comCName" /></td>
			<td class="long"><s:label name="epsCompany.comCName"
				cssClass='view_w w_15' /></td>
			<td class="bgc_tt short"><s:text name="epsCompany.comEName" /></td>
			<td class="long"><s:label name="epsCompany.comEName" cssClass='view_w w_15' /></td>
		</tr>
		<tr>
		
			<td class="bgc_tt short"><s:text name="epsCompany.comLevel" /></td>
			<td class="long">		
		         <input name="epsCompany.comLevel" value="<ce:codetag codeType="comLevel" codeCode="${epsCompany.comLevel}"/>" 
		          class='view_w w_15'/>
			</td>
			<td class="bgc_tt short"><s:text name="epsCompany.centerFlag" /></td>
			<td class="long">
		         <input name="epsCompany.centerFlag"  value="<ce:codetag codeType='centerFlag' codeCode='${epsCompany.centerFlag }'/>" 
		          class='view_w w_19'/>
			   </td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="epsCompany.validStatus" /></td>
			<td class="long">
			<c:if test="${epsCompany.validStatus=='0' }">
		         <s:text name="validStatus.false"  /> 
		      </c:if>
		        <c:if test="${epsCompany.validStatus=='1' }">
		         <s:text name="validStatus.true" />
		      </c:if>
		      </td>
		</tr>
	</table>
	<br>
			<table>
			<tr>
				<td><input type="button" class="button_ty" value="<s:text name="prompt.close"/>" onclick="window.close();"/></td>
			</tr>		
  		</table>
</s:form></div>
</body>
</html>
