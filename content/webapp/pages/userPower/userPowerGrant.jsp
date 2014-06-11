<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>
<html>
<head></head>
<body >
	<table class="fix_table" border="0" >
	<div id="viewTab" class="yui-navset">   
	    <ul class="yui-nav">
	    <li class="selected"><a href="#tab1"><em><s:text name="userpower.functionscopeconfig"/></em></a></li>
	    <li><a href="#tab2" onclick="javascript:showiframe('com');"><em><s:text name="userpower.companyscopeconfig"/></em></a></li>
	    <li><a href="#tab3" onclick="javascript:showiframe('product');"><em><s:text name="userpower.productscopeconfig"/></em></a></li>
	    </ul>
		<div class="yui-content">
	        <div id="tab1">
	        	<iframe id="taskIframe" src="${ctx}/saaUserPower/taskPowerConfig.do?userCode=${userCode}" frameborder="0" width="100%" height="580"></iframe>
	        </div>
	        <div id="tab2">
	        	<iframe id="comIframe" src="#" frameborder="0" width="100%" height="580"></iframe>
	        </div>
	        <div id="tab3">
	        	<iframe id="productIframe" src="#" frameborder="0" width="100%" height="580"></iframe>
	        </div>
	    </div>
	 </div>
	<tr>
	<s:form name="fm" method="post" enctype ="multipart/form-data">	
		<td align="center"><input type="button" name="submitIframeButton" onclick="javascript:iframe_submit()" class="button_ty" value='<s:text name="button.saveconfig"/>'></td>
	</s:form>
	</tr>	
</table>
</body>
</html>
<script type="text/javascript">
var tabView = new YAHOO.widget.TabView('viewTab');
var taskFlage="t";
var comFlage="";
var productFlage="";
	function iframe_submit(){
		var comUrl=document.all.comIframe.src;
		var productUrl=document.all.productIframe.src;
		if(comUrl=="#"||productUrl=="#"){
			alert('<s:text name="userpower.unauthorized"/>');
			return false;
		}
		if(comUrl!="#"){
			if(document.frames["comIframe"].document.forms["fm"].authComCode.value==""){
				
				alert('<s:text name="userpower.grantcompanyscope"/>');
				return false;
			}
			
			document.frames["productIframe"].document.forms["fm"].submit();
		}
		if(productUrl!="#"){
			document.frames["comIframe"].document.forms["fm"].submit();
		}
			document.frames["taskIframe"].subMitMethod();
			fm.submitIframeButton.disabled=true;
		}
	function show(temp){
		if(temp=="task"){
			document.getElementById("taskIframe").style.display="block";
			document.getElementById("comIframe").style.display="none";
			document.getElementById("productIframe").style.display="none";
		}
		if(temp=="com"){
			document.getElementById("taskIframe").style.display="none";
			document.getElementById("comIframe").style.display="block";
			document.getElementById("productIframe").style.display="none";
		}
		if(temp=="product"){
			document.getElementById("taskIframe").style.display="none";
			document.getElementById("comIframe").style.display="none";
			document.getElementById("productIframe").style.display="block";
		}
	}
	
	function showiframe(temp){
			/*if(temp=="task"&&taskFlage!="t"){
				document.all.taskIframe.src="${ctx}/saaUserPower/taskPowerConfig.do?userCode=${userCode}"
			}*/
			if(temp=="com"&&comFlage!="t"){
				document.all.comIframe.src="${ctx}/saaUserPower/comPowerConfig.do?userCode=${userCode}"
				comFlage="t";
			}
			if(temp=="product"&&productFlage!="t"){
				document.all.productIframe.src="${ctx}/saaUserPower/productPowerConfig.do?userCode=${userCode}"
				productFlage="t";
			}
		}
</script>