<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx }/common/dtree/dtree.js"></script>
<html>
<head>
</head>
<body>
<s:form name="fm" action="/saaUserPower/productPowerGrant.do?userCode=${userCode}">
<table>
	<tr align="left"><td align="left"><input type="button" name="openCloseAll" value="展开" onclick="openAndClose();" class="button_ty"></td>
	</tr>
</table>
	<div id="productConfigTree" align="left">	
	</div>
</s:form>
</body>
</html>
<script language="javascript">
d = new dTree('d');
d.add('0','-1','<s:text name="userpower.promptproductselection"/>','','<s:text name="userpower.productlist"/>','','','','',false,false,true);
<s:iterator value="saaAuthProductVOList" status="stuts">	
  	d.add('<s:property value="%{saaAuthProductVOList[#stuts.index].riskObjecCode}" />','<s:property value="%{saaAuthProductVOList[#stuts.index].riskObjectParentCode}" />','<s:property value="%{saaAuthProductVOList[#stuts.index].riskObjectName}" />','','','','','','',true,'<s:property value="%{saaAuthProductVOList[#stuts.index].value}" />',true,'<s:property value="%{saaAuthProductVOList[#stuts.index].hasPower}" />');
</s:iterator>	
	document.getElementById("productConfigTree").innerHTML = d;  
    function openAndClose(){
      if(fm.openCloseAll.value=="展开"){
        fm.openCloseAll.value = "合并";
        d.openAll();
      }else{
        fm.openCloseAll.value = "展开";
        d.closeAll();
      }
    }
</script>
