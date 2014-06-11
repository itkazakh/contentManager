<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
<title></title>
<s:head/>
</head>
<body>
<div id="container">
<div id="case_detail" class="query">
<div id="crash_menu">
<c:if test="${actionType == 'update'}">
	<c:set var="url" value="updateResource.do"></c:set>
	<c:set var="readStatus" value="true"></c:set>
</c:if>
<c:if test="${actionType == 'add'}">
   	<c:set var="url" value="addResource.do"></c:set>
    <c:set var="readStatus" value="false"></c:set>
</c:if>
<h2 align="center"><s:text name="资源信息修改" /></h2>
</div>

<s:form action="${url}" method="post" namespace="/resource" onsubmit="return submitValidate(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="资源编码" /></td>			
			<td class="long">
				<s:textfield name="resource.resNo" id="resource.resNo" maxlength="10" readonly="true"
				cssClass='input_w w_15'/>
			</td>			
			<td class="bgc_tt short"><s:text name="资源名称" /></td>
			<td class="long">
				<s:textfield name="resource.resourceName" id="resource.resourceName"
				cssClass='input_w w_15'/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="资源类型名称" /></td>
			<td class="long"><s:textfield name="resource.typeCName" id="resource.typeCName"
				cssClass='input_w w_15' readonly="true"/></td>
			<td class="bgc_tt short"><s:text name="资源地址" /></td>
			<td class="long"><s:textfield name="resource.resourceAddress"
				cssClass='input_w w_p90' id="resource.resourceAddress"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="资源描述" /></td>
			<td class="long"><s:textfield name="resource.resourceInfo" id="resource.resourceInfo"
				cssClass='input_w w_p90' /></td>
			<td class="bgc_tt short"><s:text name="点击率" /></td>
			<td class="long">
				<s:textfield name="resource.clickTimes" id="resource.clickTimes"
				cssClass='input_w w_15'/>
				<s:hidden name="resource.typeID" id="resource.typeID"></s:hidden>
				<s:hidden name="resource.resourceFile" id="resource.resourceFile"></s:hidden>
				<s:hidden name="resource.createDate" id="resource.createDate"></s:hidden>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center" class="bgc_tt short"><input type="submit" class="button_ty" value="<s:text name="prompt.add"/>"/> </td>
		</tr>
	</table>
	<br>
</s:form></div>
</div>
</body>
<%@include file="/common/meta_js.jsp" %>
<script type="text/javascript">
YAHOO.namespace("query.container");  
function init(){
}
YAHOO.util.Event.addListener(window,'load',init);
function submitValidate(form){ 
	if(validate()){
		return true;
	}else{
		return false;
	}
	
}

function validate(){
	return true;
}
</script>
</html>