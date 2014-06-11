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
<h2 align="center"><s:text name="资源类型管理" /></h2>
</div>

<s:form action="" method="post" namespace="/resourceType" onsubmit="">
	<table class="fix_table" border="0">
		<tr>
			<!--<td class="bgc_tt short"><s:text name="资源类型id" /></td>			
			<td class="long">
				<s:textfield name="resourceType.typeID" id="resourceType.typeID" maxlength="10" readonly="true"
				cssClass='input_w w_15'/>
			</td>			
			-->
			<td class="bgc_tt short"><s:text name="上级资源类型id" /></td>
			<td class="long">
				<s:textfield name="resourceType.upperTypeID" id="resourceType.upperTypeID" readonly="true"
				cssClass='input_w w_15'/>
			</td>
			<td class="bgc_tt short"><s:text name="资源类型显示序号" /></td>
			<td class="long"><s:textfield name="resourceType.displayNo" readonly="true"
				cssClass='input_w w_15' id="resourceType.displayNo" />
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="资源类型级别" /></td>
			<td class="long"><s:textfield name="resourceType.typeLevel"
				cssClass='input_w w_15' id="resourceType.typeLevel" readonly="true"/>
			</td>
			<td class="bgc_tt short"><s:text name="资源类型名称" /></td>
			<td class="long"><s:textfield name="resourceType.typeCName" id="resourceType.typeCName" readonly="true"
				cssClass='input_w w_15'/>
				<s:hidden name="resourceType.systemCode" id="resourceType.systemCode"></s:hidden>
			<s:hidden name="resourceType.validStatus" id="resourceType.validStatus"></s:hidden>
			<s:hidden name="resourceType.typeID" id="resourceType.typeID"></s:hidden>
				</td>
		</tr>
		<tr>
			<td ></td>
			<td align="center" colspan="2">
			<input type="button" class="button_ty" value="<s:text name="删除"/>" onclick="deleteResourceType()"/>
			<input type="button" class="button_ty" value="<s:text name="修改"/>" onclick="updateResourceType()"/>
			<input type="button" class="button_ty" value="<s:text name="增加下级目录"/>" onclick="addResourceType()"/> </td>
			<td></td>
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
function deleteResourceType(){
	var typeID = document.getElementById("resourceType.typeID");
	editRecord('${ctx}/resourceType/deleteResourceType.do?resourceType.typeID=' + typeID.value);
}
function updateResourceType(){
	var typeID = document.getElementById("resourceType.typeID");
	editRecord('${ctx}/resourceType/prepareUpdateResourceType.do?resourceType.typeID=' + typeID.value);
}
function addResourceType(){
	var typeID = document.getElementById("resourceType.typeID").value;
	var typeLevel = document.getElementById("resourceType.typeLevel").value;
	editRecord('${ctx}/resourceType/prepareAddResourceType.do?resourceType.upperTypeID=' + typeID + '&resourceType.typeLevel=' + (parseInt(typeLevel) + 1));
}
</script>
</html>