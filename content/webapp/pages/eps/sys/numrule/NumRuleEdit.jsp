<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<title></title>

</head>
<body>
<s:fielderror />
<div id="container">
<div id="case_detail" class="query">

<div id="crash_menu">
<h2 align="center"><s:text name="单号配置"/></h2>
</div>
          <c:if test="${actionType == 'update'}">
                  <c:set var="url" value="updateNumRule.do"></c:set>
          </c:if>
          <c:if test="${actionType == 'edit'}">
                  <c:set var="url" value="addNumRule.do"></c:set>
          </c:if>
<s:form action="${url}" method="post" namespace="/numRule" validate="true" name="fm" onsubmit="return checkForm();" >
	<table class="fix_table" border="0">

		<tr>
			<td class="bgc_tt short"><s:text name="单号类型代码" /></td>
			<td class="long"><s:textfield name="epsNumRule.numType" required="true"
				cssClass='input_y w_p30' id="epsNumRule.numType"
				ondblclick="code_CodeSelect(this, 'EpsNumType', '0,1', 'Y');"
				onkeyup="code_CodeSelect(this, 'EpsNumType', '0,1', 'Y')"
				onchange="code_CodeChange(this, 'EpsNumType', '0,1', 'Y')" value="${epsNumRule.numType}" /></td>
			<td class="bgc_tt short"><s:text name="单号类型名称" /></td>
			<td class="long"><s:textfield name="epsNumRule.numTypeName" required="true"
				cssClass='input_w w_15' id="epsNumRule.numTypeName" value="${epsNumRule.numTypeName}" /></td>
		</tr>
		<tr>
			<td class="bgc_tt short"><s:text name="单号前缀" /></td>
			<td class="long"><s:textfield name="epsNumRule.numPre" id="epsNumRule.numPre" required="true"
				cssClass='input_w w_15' value="${epsNumRule.numPre}" /></td>
				 <td class="bgc_tt short"><s:text name="validStatus" /></td>
		   <td class="long"><s:select name="epsNumRule.status" list="#{'1':'有效','0':'无效' }" cssClass='input_w w_15' /></td>
		</tr>
	</table>

		<table align="center">
		<tr align="center">
				<td>
				  <input type="submit" class="button_ty" value="保存" />  
				</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><input type="reset" class="button_ty" value="重置" /></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
			</tr>
	</table>
	<br>
</s:form></div>
</div>
</body>
<%@include file="/common/meta_js.jsp" %>
<script type="text/javascript">
function init(){
   var numType_tip = new YAHOO.widget.Tooltip("numType_tip",{text:"请双击选择机构代码",context:"epsNumRule.numType",zIndex:300});
	}
function checkForm(){
    var requiredNumReg=/^[0-9]{1,10}$/; // 必填数字类型
   	var requiredLetterReg=/^[0-9a-zA-Z_-]{1,80}$/; // 必填英文类型
   	 var zh_cnReg = /^[0-9a-zA-Z\u4e00-\u9fa5_-]{0,60}$/; // 非必填中文类型
   	var numType = document.getElementById("epsNumRule.numType").value;
   	var numTypeName = document.getElementById("epsNumRule.numTypeName").value;
    var numPre = document.getElementById("epsNumRule.numPre").value;
    if(!requiredLetterReg.test(numType)){
         alert("填入正确的单号类型代码");
         return false;
    }
    if(!zh_cnReg.test(numTypeName)){
      alert("请填入正确的单号类型名称!");
      return false;
    }
    if(!requiredLetterReg.test(numPre)){
       alert("请填入正确的单号前缀!");
       return false;
    }
    return true;
}
YAHOO.util.Event.addListener(window,'load',init);
</script>
</html>
