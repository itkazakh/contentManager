<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.struts2.ServletActionContext"%>
<%@ page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	//获取流转数据
	ValueStack valueStackTable = ServletActionContext.getContext().getValueStack();

	List<WbusinessCmain> wbusinessCmains=(List<WbusinessCmain>)valueStackTable.findValue("wbusinessCmains");
	
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	Map<String, String> epsCodeMap = (Map<String, String>)valueStackTable.findValue("epsCodeMap");

	String stat = "";
	
%>


<%@page import="cn.com.sinosoft.bpm.model.WbusinessCmain"%><html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<title><s:text name="bpmFlow.title.bpmFlowTitle"></s:text></title>
<style>
  v\:*{behavior:url(#default#VML);}
</style>
<style>
A:link {
	COLOR: #000000; TEXT-DECORATION: none
}
A:visited {
	COLOR: #000000; TEXT-DECORATION: none
}
A.active {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: red; TEXT-DECORATION: underline
}
.group {
	LEFT: 100px; WIDTH: 1024px; POSITION: relative; TOP: 20px; HEIGHT: 768px
}
.line {
	BORDER-RIGHT: 2px; BORDER-TOP: 2px; Z-INDEX: 3011; BORDER-LEFT: 2px; BORDER-BOTTOM: 2px; POSITION: relative
}
.rect {
	Z-INDEX: 1; WIDTH: 150px; POSITION: absolute; HEIGHT: 120px
}
TR.nodetitle-1 {
	COLOR: #000000; BACKGROUND-COLOR: #e2e2e2; TEXT-ALIGN: center

TR.nodetitle0 {
	COLOR: #000000; BACKGROUND-COLOR: #ffe2ae; TEXT-ALIGN: center
}
TR.nodetitle1 {
	COLOR: #000000; BACKGROUND-COLOR: #e8f5f9; TEXT-ALIGN: center
}
TR.nodetitle2 {
	COLOR: #000000; BACKGROUND-COLOR: #7ccfde; TEXT-ALIGN: center
}
TR.dealtitle {
	TEXT-ALIGN: center
}
TR.stattitle {
	TEXT-ALIGN: center
}
</style>
<script src="<c:url value="/common/js/Common.js"/>" type="text/javascript"></script>
</head>
<body>

<table id="tableSrc" align="center">
<tr></tr><tr></tr>
<tr class="nodetitle2">
	<td align="center"><s:text name="bpmFlow.businessNode"></s:text></td>
	<td align="center"><s:text name="bpmFlow.businessNo"></s:text></td>
	<td align="center"><s:text name="bpmFlow.operator"></s:text></td>
	<td align="center"><s:text name="bpmFlow.handler"></s:text></td>
	<td align="center"><s:text name="bpmFlow.inDate"></s:text></td>
	<td align="center"><s:text name="bpmFlow.outDate"></s:text></td>
	<td align="center"><s:text name="bpmFlow.status"></s:text></td>
</tr>
<%
	int colorFlag=0;
	for (WbusinessCmain wbusinessCmain : wbusinessCmains) {
		colorFlag++;
		stat = epsCodeMap.get(wbusinessCmain.getAuditStatus());
		if (stat == null){
			stat = "未处理";
		}
%>
<tr class="nodetitle<%=colorFlag%2 %>">
	<td align="center"><%=wbusinessCmain.getWbusinessSystypeByNodeid().getNodeCName() %></td>
	<td align="center"><%=wbusinessCmain.getBusinessNo() %></td>
	
	<td align="center"><ce:codetag codeType="appliUser" codeCode="<%=wbusinessCmain.getHandlerUser()%>"/></td>
		<td align="center"><ce:codetag codeType="appliUser" codeCode="<%=wbusinessCmain.getPrepHandlerUser()%>"/></td>
	<td align="center"><%=dateFormat.format(wbusinessCmain.getInDate())%></td>
	<%if (wbusinessCmain.getOutDate()!=null&&!"".equals(wbusinessCmain.getOutDate())){ %>
		<td align="center"><%=dateFormat.format(wbusinessCmain.getOutDate())%></td>
	<%}else{ %>
		<td align="center">案件未流出</td>
	<%} %>
	<!-- 状态标志 -->
	<td align="center"><%=stat %></td>
</tr>
<%
	}
%>
</table>
</body>
</html>
