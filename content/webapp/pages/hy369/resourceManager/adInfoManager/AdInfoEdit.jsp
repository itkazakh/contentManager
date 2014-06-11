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
	<c:set var="url" value="updateAdInfo.do"></c:set>
	<c:set var="readStatus" value="true"></c:set>
</c:if>
<c:if test="${actionType == 'add'}">
   	<c:set var="url" value="addAdInfo.do"></c:set>
    <c:set var="readStatus" value="false"></c:set>
</c:if>
<h2 align="center"><s:text name="新用户增加" /></h2>
</div>

<s:form action="${url}" method="post" namespace="/adInfo" onsubmit="return submitValidate(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="资源ID" /></td>			
			<td class="long">
				<s:textfield name="adInfo.resourceID" id="adInfo.resourceID" maxlength="10" readonly="true"
				cssClass='input_y w_p60' />
			</td>			
			<td class="bgc_tt short"><s:text name="资源名称" /></td>
			<td class="long">
			<s:textfield name="adInfo.resourceName" id="adInfo.resourceName" maxlength="10" readonly="${readStatus}"
				cssClass='input_y w_p60'
				ondblclick="code_CodeSelect(this, 'ResouceID', '-1,0', 'Y')"
				onkeyup="code_CodeSelect(this, 'ResouceID', '-1,0', 'Y')"
				onchange="code_CodeChange(this, 'ResouceID', '-1,0', 'Y')" />
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="地区" /></td>
			<td class="long"><s:select list="areaMap" name="adInfo.areaNo"/>
			</td>
			<td class="bgc_tt short"></td>
			<td class="long">
			<s:hidden name="adInfo.adNo" ></s:hidden>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告资源地址" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adInfo" id="adInfo.adInfo"
				cssClass='input_w w_p90' maxlength="100"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告链接" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adLink" id="adInfo.adLink"
				cssClass='input_w w_p90' maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告资源地址1" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adInfo1" id="adInfo.adInfo1"
				cssClass='input_w w_p90' maxlength="100"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告链接1" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adLink1" id="adInfo.adLink1"
				cssClass='input_w w_p90' maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告资源地址2" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adInfo2" id="adInfo.adInfo2"
				cssClass='input_w w_p90' maxlength="100"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告链接2" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adLink2" id="adInfo.adLink2"
				cssClass='input_w w_p90' maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告资源地址3" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adInfo3" id="adInfo.adInfo3"
				cssClass='input_w w_p90' maxlength="100"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告链接3" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adLink3" id="adInfo.adLink3"
				cssClass='input_w w_p90' maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告资源地址4" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adInfo4" id="adInfo.adInfo4"
				cssClass='input_w w_p90' maxlength="100"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告链接4" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adLink4" id="adInfo.adLink4"
				cssClass='input_w w_p90' maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告资源地址5" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adInfo5" id="adInfo.adInfo5"
				cssClass='input_w w_p90' maxlength="100"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="广告链接5" /></td>
			<td class="long" colspan="3"><s:textfield name="adInfo.adLink5" id="adInfo.adLink5"
				cssClass='input_w w_p90' maxlength="100"/>
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