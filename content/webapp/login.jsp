<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sinosoft.platform.ipservice.IpSelectAction"%>
<%@ include file="/common/meta_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="Central Authentication Service,JA-SIG,CAS" />
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/style/index.css'/>" />
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/style/layout_index.css'/>" />
<link rel="stylesheet" href="<c:url value='/style/home.css'/>" type="text/css" media="all" />
<link rel="stylesheet" href="<c:url value='/style/jasig.css'/>" type="text/css" media="all" />

<title><s:text name="后台管理系统"/></title>
<link href="${ctx}/style/style_all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">	
//	if (self!=top){
//    top.location=self.location;
//  }
function submitForm(){
  return true;
}
function init(){
  //fm.userCode.focus();
  //fm.userCode.select();
}

function reloadComCode(){
	if(trim(fm.userCode.value).length==fm.userCode.maxLength){
	processComeCode();
}}

function relaodCenterCode(){
		processCenterCode();
}

function processComeCode(){
	var userCode = fm.userCode.value;
	var callback={
		success:successCom, 
		failure: failure,
		argument: []
	}
	var postData = 'userCode='+fm.userCode.value; 
  	YAHOO.util.Connect.asyncRequest('POST','${ctx}/common/processCodeCom.do',callback,postData);
}

function processCenterCode(){
	var userCode = fm.userCode.value;
	var callback={
		success:successCenter, 
		failure: failure,
		argument: []
	}
	var postData = 'comCode='+fm.comCode.value; 
  	YAHOO.util.Connect.asyncRequest('POST','${ctx}/common/processCodeCenter.do',callback,postData);
}

function successCom(res){
	var optionArray  =  res.responseText.split(GROUP_SEPARATOR);
    for(var i=0;i<optionArray.length;i++){
        var value = optionArray[i];
        fm.comCode.add(new Option(value,value));
     }  
}

function successCenter(res){
	var optionArray  =  res.responseText.split(GROUP_SEPARATOR);
    for(var i=0;i<optionArray.length;i++){
        var value = optionArray[i];
        fm.centerCode.add(new Option(value,value));
     }
}

function failure(res){
	alert("服务器连接异常！");
}

function removeAllComCode()
{  
  var objObject = fm.comCode;
  var objLen = objObject.length; 
  for (var i=objLen-1;i>=0;i--){ 
      objObject.options.remove(i); 
  }  
}         
function removeAllCenterCode() {
  var objO = fm.centerCode;
  var objLe = objO.length;
  for (var i = objLe-1;i>=0;i--) {
   objO.options.remove(i);
  }
}  
</script>
</head>
<body class="logon" onload="init();">
<form name="fm"  action="${ctx}/saaUserPower/login.do" method="post" onsubmit="return submitForm();">

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="101" align="right" background="${ctx}/pages/login_images/bglogonlogin-2.gif"><img src="${ctx}/pages/login_images/imglogon_1.gif" /></td>
    <td width="305" background="${ctx}/pages/login_images/bglogonlogin-1.gif"><img src="${ctx}/pages/login_images/imglogon_2.gif"  /></td>
    <td valign="top" background="${ctx}/pages/login_images/bglogonlogin-1.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="bg">
      <tr>
        <td align="center" valign="top"><table border="0" cellspacing="0" cellpadding="0" class="pleaselogon">
          <tr>
            <td><img src="${ctx}/pages/login_images/imgusername.gif" /></td>
            <td><input class="logon" type="text" name="userCode" maxlength="10" tabindex="1"/></td>
            <td height="31">&nbsp;</td>
          </tr>
          <tr>
            <td><img src="${ctx}/pages/login_images/imgpassword.gif"  /></td>
            <td><span class="username"><input class="logon" type="password" name="password" tabindex="2"/>
            <input type="hidden" name="request_locale" value="zh_CN"/></span></td>
            <td height="31">&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td>
			</td>
            <td><input type="image" name="imageField" src="${ctx}/pages/login_images/btnlogin.gif" style="width:64px;height:31px" class="btn" tabindex="3"/></td>
          </tr>
		  <tr>
            <td colspan="3" align="center" style="color='#FF3E39'">
        <%//	String login_error=request.getParameter("login_error");
		//	if(login_error!=null){
		%>
<%--			用户名或密码错误!--%>
		<%//}%>                 </td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>


</html>