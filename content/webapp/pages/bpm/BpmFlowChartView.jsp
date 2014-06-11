<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.struts2.ServletActionContext"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<%!
	//常量定义、方法定义
	int WIDTH = 120; //node width
	int HEIGHT = 70; //node height
	int SPACE = 50; //node space
	int INC_LEFT = WIDTH + SPACE; //node inc left
	int INC_TOP = HEIGHT + SPACE; //node ind top
	static HashMap<String,String> STAT_MAP;
	static{
		STAT_MAP = new HashMap<String,String>();
		STAT_MAP.put("0", "未处理");
		STAT_MAP.put("1", "已经处理");
		STAT_MAP.put("2", "正在处理");
		STAT_MAP.put("-1", "注销");	
	}
	
	private static String getStat(String stat){
		return (String)STAT_MAP.get(stat);
	}
%>
<%
	//获取流转数据
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
	ValueStack valueStack = ServletActionContext.getContext().getValueStack();

	List<Map<NodePK,WbusinessCmain>> nodes = (List<Map<NodePK,WbusinessCmain>>)valueStack.findValue("flowNodes");
	Map<String, String> epsCodeMap = (Map<String, String>)valueStack.findValue("epsCodeMap");
	List<NodeLine> lines = (List<NodeLine>)valueStack.findValue("flowLines");
	Map<NodePK,NodePosition> nodePositions = new HashMap<NodePK,NodePosition>();

%>


<%@page import="cn.com.sinosoft.bpm.vo.NodePK"%>
<%@page import="cn.com.sinosoft.bpm.model.WbusinessCmain"%>
<%@page import="cn.com.sinosoft.bpm.vo.NodeLine"%>
<%@page import="cn.com.sinosoft.bpm.vo.NodePosition"%><html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<title>流程图</title>
<style>
  v\:*{behavior:url(#default#VML);}
</style>
<style>
	A:link {text-decoration: none;color: #ffffff;}
	A:visited {text-decoration: none;color: #ffffff;}
	A.active {text-decoration: none;color: #ffffff;}
	A:hover {text-decoration: none;color: red; }

	.group { position: relative;
	         width: 1024px;
	         height: 768px;
	         left: 100px;
	         top: 20px; }
	
	.line { position: relative;
	        border: 2;
	        z-index: 3011; }
	        
	.rect { z-index: 1;
	        position: absolute;
	        width: <%=WIDTH%>; 
	        height: <%=HEIGHT%>; }
	
	tr.nodetitle-1 { background-color: #000080;
	                 text-align: center;
	                 color: #ffffff }
	                 
	tr.nodetitle0 { background-color: #0080C0;
	                text-align: center;
	                color: #ffffff }
	                
	tr.nodetitle1 { background-color: #008000;
	                text-align: center;
	                color: #ffffff }
	                
	tr.nodetitle2 { background-color: #800080;
	                text-align: center;
	                color: #ffffff }
	                
	tr.dealtitle { text-align: center; }
	tr.stattitle { text-align: center; }
	table.node { bordercolor: #4D457A; 
	             border-collapse: collapse; 
	             font-size:9pt; }

</style>
<script src="<c:url value="/common/js/Common.js"/>" type="text/javascript"></script>
<script language="javascript">
function viewNode(taskId, businessNo){
	var url = "${ctx}/bpm/viewApprove.do?certiNo=" + businessNo + "&taskId=" + taskId;
	//var url = "${ctx}/standardURL/forwardURL.do?"+params;
	openWindow(url, '_blank', 'alwaysRaised,resizable,status,scrollbars,width=640,height=480');
}
</script>
</head>
<body>
<v:group id="workflowGroup" class="group" coordsize="1024,768">
<%
//画流转节点
int top = 0; //node top
for(Map<NodePK,WbusinessCmain> nodeGroup : nodes){
	int left = 0;

	Set<NodePK> keys = nodeGroup.keySet();
	for(NodePK pk : keys){
		NodePosition nodePosition = new NodePosition(left,top);
		nodePositions.put(pk, nodePosition);
		WbusinessCmain wbusiness = nodeGroup.get(pk);
		String stat = epsCodeMap.get(wbusiness.getAuditStatus());
		if (stat == null){
			stat = "未处理";
		}
%>
		<v:rect id="vml<%=wbusiness.getTaskId()%>" class="rect" style="left: <%=left%>; top: <%=top%>;" 
		  fillcolor="white" strokecolor="white" strokeweight="1px">
		  <table border="1" cellspacing="0" cellpadding="0" width="100%" height="100%" align="center" class="node">
		    <tr class="nodetitle<%=wbusiness.getState()%>"><td><a href="javascript:viewNode('<%=wbusiness.getTaskId()%>', '<%=wbusiness.getBusinessNo() %>')"><div width="100%"><%=pk.getNodeName()%></div></a></td></tr>
		    <tr class="dealtitle"><td><ce:codetag codeType="appliUser" codeCode="<%=wbusiness.getHandlerUser()%>"/></td></tr>
			<tr class="dealtitle"><td><%=dateFormat.format(wbusiness.getInDate()) %></td></tr>
		    <tr class="stattitle"><td><%=stat %></td></tr>
		  </table>
		</v:rect>
<%
		left += INC_LEFT;
	}
	top += INC_TOP;
}

//画流转方向
for(NodeLine pLine : lines){
	NodePosition fromPosition = nodePositions.get(pLine.getFromNodePK());
	NodePosition toPosition = nodePositions.get(pLine.getToNodePK());
	
	if( fromPosition.getTop() <= toPosition.getTop() ){
		pLine.setFromX(fromPosition.getLeft()+WIDTH/2);
		pLine.setFromY(fromPosition.getTop()+HEIGHT+1);
		pLine.setToX(toPosition.getLeft()+WIDTH/2);
		pLine.setToY(toPosition.getTop()-1);
		
	} else {
		pLine.setFromX(fromPosition.getLeft()+WIDTH/2);
		pLine.setFromY(fromPosition.getTop()-1);
		pLine.setToX(toPosition.getLeft()+WIDTH/2);
		pLine.setToY(toPosition.getTop()+HEIGHT+1);
	}
	
%>
    <v:line class="line" fillcolor="#4D457A" strokeColor="#4D457A" strokeweight="1px" 
      from="<%=pLine.getFromX()%>,<%=pLine.getFromY()%>" to="<%=pLine.getToX()%>,<%=pLine.getToY()%>">
      <v:stroke endarrow="Classic"/>
    </v:line>
<%
}
%>
</v:group>
</body>
</html>
