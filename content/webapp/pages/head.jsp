<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Claim</title>
<%@ page contentType="text/html;charset=utf-8" buffer="50kb"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp" %>
<link href="${ctx}/pages/style/mian_demo.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
		function doExit(){	
			if(confirm('<s:text name="prompt.yousurelogout" />')){
				window.location.href="${ctx}/logout";
				parent.window.opener = null;
				parent.window.close();
			}else{			
			}
			
		}
		
		function setWinSize(url)
		{
			window.open(url, "newwindow", "height=200, width=400, top=300, left=300, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no") ;
			
		}
		
		function switchMenu(field){
			if(field.value=="Open"){
				field.src="${ctx}/pages/image/btnopenmenu.gif";		
				top.frames["menuFrame"].cols="0,*";
				field.value="Close";
			}else{
				field.src="${ctx}/pages/image/btnclosemenu.gif";
				top.frames["menuFrame"].cols="180,*";
				field.value="Open";
			}
		}
	</script>  
</head>
<body>

 
<table border="0" cellpadding="0" cellspacing="0" class="top1">
  <tr>
    <td width="75%"><img src="${ctx}/pages/image/logo_n2.gif" /></td>
    <td align="center" width="25%"> ${userCode}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table>


<table class="top2" border="0" cellpadding="0" cellspacing="0">
    	  <tr>
		  <td width="18%" class="top2_td">      
		  	<input name="menuSwitch" type="image" onclick="switchMenu(this);" value="Open" src="${ctx}/pages/image/btnclosemenu.gif"/></td>
		  <td width="60%" nowrap="nowrap"><s:text name="prompt.youcurrentlocation"/>：<span align="left"  id="CurrentPositionSpan"><s:text name="prompt.indexpage"/></span></td>
		  <td width="22%">
		    <table width="100%">
			   <tr>
			      <td width="50%" align="center">
				  </td>
				  <td width="50%" >
				  </td>
				</tr>
		    </table>
		    </td>
	    </tr>
</table>
</body>
</html>
