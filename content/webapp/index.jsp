<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><s:text name="后台管理系统"></s:text></title>
</head>
<script language="javascript">
<!--
  function quit() 
  { 
          event.returnValue='<s:text name="common.closewindowprompt"/>'; 
  } 

//-->
</script>
<frameset id="mainFrame" rows="68,*" cols="1113" framespacing="0" frameborder="no"	border="0" onbeforeunload="quit()">
	<frame src="${ctx}/pages/head.do" name="head" id="head" scrolling="no"  noresize="noresize" />
	<frameset id="menuFrame" rows="100%*" cols="180,*" framespacing="0" frameborder="no" border="0" >
		<frame src="${ctx}/menu/showMenu.do?systemCode=content&menuId=0&userCode=<%="0000000000"%>&powerType=<%="1" %>&gradesIdString=" name="main" scrolling="auto" id="main" />
	  	<frame src="${ctx}/pages/Welcome1.jsp" name="page" scrolling="auto" id="page"/>
	</frameset>	
</frameset>
<noframes><body><s:text name="common.browsersupport"/></body></noframes>
</html>