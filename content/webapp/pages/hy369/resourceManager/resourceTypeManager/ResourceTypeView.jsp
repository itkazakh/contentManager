<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><s:text name="资源类型管理"></s:text></title>
</head>
<script language="javascript">
</script>
<frameset id="resourceTypeFrame" rows="100%*" cols="180,*" framespacing="0" frameborder="no" border="1" >
	<frame src="${ctx}/resourceType/queryResourceTypeTree.do" name="resourceTypeTreeFrame" scrolling="auto" id="resourceTypeTreeFrame" />
	<frame src="${ctx}/resourceType/queryResourceTypeMenu.do" name="resourceTypeEdit" scrolling="auto" id="resourceTypeEdit"/>
</frameset>	
<noframes><body><s:text name="你的浏览器版本太低了"/></body></noframes>
</html>