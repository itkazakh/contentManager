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
	<c:set var="url" value="updatePayWay.do"></c:set>
	<c:set var="readStatus" value="true"></c:set>
</c:if>
<c:if test="${actionType == 'add'}">
   	<c:set var="url" value="addPayWay.do"></c:set>
    <c:set var="readStatus" value="false"></c:set>
</c:if>
<h2 align="center"><s:text name="sys.payway.headadd" /></h2>
</div>

<s:form action="${url}" method="post" namespace="/payWay" onsubmit="return submitValidate(this)">
	<table class="fix_table" border="0">
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.paywaycode" /></td>			
			<td class="long">
				<s:textfield name="epsPayWay.payWayCode" id="epsPayWay.payWayCode" maxlength="3" readonly="${readStatus}"
				cssClass='input_w w_15' required="true"/>
				<s:hidden name="epsPayWay.createCode"></s:hidden>
				<s:hidden name="epsPayWay.createDat"></s:hidden>	
			</td>			
			<td class="bgc_tt short"><s:text name="sys.payway.paywayname" /></td>
			<td class="long">
				<s:textfield name="epsPayWay.payWayCName" id="epsPayWay.payWayCName" 
				cssClass='input_w w_15' required="true"/>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short">
				<s:text name="sys.payway.paywaytype" />
			</td>
			<td class="long">
				<s:select name="epsPayWay.payWayType" list="#{'*':'收付','1':'收','2':'付'}" cssClass='input_w w_15'>
				</s:select>
			</td>
			<td class="bgc_tt short">
				<s:text name="sys.payway.debitOrCredit" />
			</td>
			<td class="long" >
				<s:select name="epsPayWay.dcInd"  list="#{'0':'借','1':'贷'}" cssClass='input_w w_15'>
				</s:select>
			</td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.permitCenterCode" /></td>
			<td class="long"><s:textfield name="epsPayWay.permitCenterCode"
				cssClass='input_y w_p60' id="epsPayWay.permitCenterCode" required="true"
				ondblclick="code_CodeSelect(this, 'centerCode', '0,1', 'Y');"
				onkeyup="code_CodeSelect(this, 'centerCode', '0,1', 'Y')"
				onchange="code_CodeChange(this, 'centerCode', '0,1', 'Y')" />
			</td>
			<td class="bgc_tt short"><s:text name="sys.payway.permitCenterName" /></td>
			<td class="long"><s:textfield name="permitCenterCodeName" id="permitCenterCodeName"
				cssClass='input_w w_15' readonly="true"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.exceptCenterCode" /></td>
			<td class="long"><s:textfield name="epsPayWay.exceptCenterCode"
				cssClass='input_y w_p60'
				ondblclick="code_CodeSelect(this, 'exceptCenterCode', '0,1', 'Y');"
				onkeyup="code_CodeSelect(this, 'exceptCenterCode', '0,1', 'Y');"
				onchange="code_CodeChange(this, 'exceptCenterCode', '0,1', 'Y');" />
			</td>
			<td class="bgc_tt short"><s:text name="sys.payway.exceptCenterName" /></td>
			<td class="long"><s:textfield name="exceptCenterCodeName" id="exceptCenterCodeName"
				cssClass='input_w w_15' readonly="true"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.permitPayType" /></td>
			<td class="long">
				<s:textfield name="epsPayWay.permitPayType"
				cssClass='input_y w_p60' required="true"
				ondblclick="code_CodeQuery(this, 'PayType', '0,1', 'Y');"
				onkeyup="code_CodeQuery(this, 'PayType', '0,1', 'Y');"
				onchange="code_CodeChange(this, 'PayType', '0,1', 'Y');" />	
			</td>
			<td class="bgc_tt short"><s:text name="sys.payway.permitPayTypeName" /></td>
			<td class="long"><s:textfield name="permitPayTypeName" id="permitPayTypeName"
				cssClass='input_w w_15' readonly="true"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.opPayWay" /></td>
			<td class="long">
				<s:textfield name="epsPayWay.opPayWay"
				cssClass='input_y w_p60' required="true"
				ondblclick="code_CodeSelect(this, 'OPPayWay', '0,1', 'Y');"
				onkeyup="code_CodeSelect(this, 'OPPayWay', '0,1', 'Y');"
				onchange="code_CodeChange(this, 'OPPayWay', '0,1', 'Y');" />
			</td>
			<td class="bgc_tt short"><s:text name="sys.payway.opPayWayName" /></td>
			<td class="long"><s:textfield name="opPayWayName" id="opPayWayName"
				cssClass='input_w w_15' readonly="true"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short">
				<s:text name="sys.payway.titleRelation" />
			</td>
			<td class="long">
				<s:select name="epsPayWay.titleRelation"  list="#{'0':'无其他相关性','1':'跟银行账号相关'}" 
				cssClass='input_w w_15' disabled="${readStatus}" >
				</s:select>
				<s:if test="${readStatus=='true'}">
				<s:hidden name="epsPayWay.titleRelation"></s:hidden>
				</s:if>
			</td>
			<td class="bgc_tt short">
				<s:text name="sys.payway.validStatus" />
			</td>
			<td class="long">
				<s:select name="epsPayWay.validStatus"  list="#{'0':'无效','1':'有效'}" cssClass='input_w w_15'>
				</s:select>
			</td>
		</tr>
		<tr>
			<td colspan=4 align="left" class="long"></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.titleCode" /></td>
			<td class="long"><s:textfield name="epsPayWay.titleCode"
				cssClass='input_w w_15' required="true"/></td>
			<td class="bgc_tt short"><s:text name="sys.payway.titleName" /></td>
			<td class="long"><s:textfield name="epsPayWay.titleName"
				cssClass='input_w w_15' required="true"/></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="sys.payway.articleType" /></td>
			<td class="long">
				<s:textfield name="articleType"
				cssClass='input_y w_p60'
				ondblclick="code_CodeQuery(this, 'tcode', '0,1', 'Y');"
				onkeyup="code_CodeQuery(this, 'tcode', '0,1', 'Y')"
				onchange="code_CodeChange(this, 'tcode', '0,1', 'Y')" />
			</td>
			<td class="bgc_tt short"><s:text name="sys.payway.articleTypeName" /></td>
			<td class="long"><s:textfield name="articleTypeName"
				cssClass='input_w w_15' readonly="true"/></td>
		</tr>
		<tr>
			<td colspan=4 align="center" class="bgc_tt short"><input type="submit" class="button_ty" value="<s:text name="prompt.add"/>"/> </td>
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
	var centerCode_tip = new YAHOO.widget.Tooltip("centerCode_tip",{text:"请双击选择适用机构",context:"epsPayWay.permitCenterCode",zIndex:250});
	var exceptCenterCode_tip = new YAHOO.widget.Tooltip("exceptCenterCode_tip",{text:"请双击选择除外机构",context:"epsPayWay.exceptCenterCode",zIndex:250});
	var permitPayType_tip = new YAHOO.widget.Tooltip("permitPayType_tip",{text:"请双击选择适用收付类型",context:"epsPayWay.permitPayType",zIndex:250});
	var opPayWay_tip = new YAHOO.widget.Tooltip("opPayWay_tip",{text:"请双击选择业务收付方式",context:"epsPayWay.opPayWay",zIndex:250});
	var articleType_tip = new YAHOO.widget.Tooltip("articleType_tip",{text:"请双击选择核算项",context:"articleType",zIndex:250});
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