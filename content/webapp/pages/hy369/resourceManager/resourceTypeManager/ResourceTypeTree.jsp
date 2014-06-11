<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>BOC</title>
<%@ include file="/widgets/loading/loading.jsp"%>
<script type="text/javascript" src="${ctx}/pages/js/anylinkvertical.js"></script>
<script type="text/javascript" src="${ctx}/pages/logo/js/yahoo.js"></script>
<script type="text/javascript" src="${ctx}/pages/logo/js/event.js"></script>
<script type="text/javascript" src="${ctx}/pages/logo/js/dom.js"></script>
<script type="text/javascript" src="${ctx}/pages/logo/js/logger.js"></script>
<script type="text/javascript" src="${ctx}/pages/hy369/resourceManager/resourceTypeManager/resourceType.js"></script>
<script type="text/javascript"
	src="${ctx}/pages/logo/js/treeview-debug.js"></script>
<script type="text/javascript" src="${ctx}/pages/logo/js/changestyle.js"></script>
<script type="text/javascript" src="${ctx}/pages/logo/js/date.js"></script>
<script language="javascript" src="${ctx}/widgets/TaskNode.js"></script> 
<link href="${ctx}/widgets/yui/treeview/assets/css/menu/tree.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx }/common/dtree/dtree.js"></script>
<style type="text/css">
#treeDiv1{font:1px arial,helvetica,clean,sans-serif;* font-size:small;* font:x-small;}
</style>
</head>
<body style="width: 100%; height: 100%;">
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<tr height="100%" valign="top">
		<td>
			<div id="treeDiv1"></div>
		</td>
	</tr>
	<tr height="100%" valign="top">
		<td width="15%" height="100%" background="login_images/imgWelcome.gif">
		</td>
	</tr>
	
</table>
</body>
<s:property value="resourceTypeContent" escape="false" />
</html>