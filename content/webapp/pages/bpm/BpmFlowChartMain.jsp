<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html xmlns:v="urn:schemas-microsoft-com:vml">
	<head>
		<title><s:text name="bpmFlow.title.bpmFlowTitle"></s:text></title>
		<style>
		  v\:*{behavior:url(#default#VML);}
		</style>
		<script src="<c:url value="/common/js/Common.js"/>"
			type="text/javascript"></script>
		<%@ include file="/common/meta_js.jsp"%>
		<script language="javascript" src="${ctx}/widgets/yui/tabview/tabview-min.js"></script>
		<script language="javascript" src="${ctx}/widgets/tabview_init.js"></script>
		<script language="javascript">
			function viewNode(params){
				//未处理需要特殊处理，不要求进入处理页面
				if(params!="unsettled"){
					var url = "${ctx}/standardURL/forwardURL.do?"+params;
					openWindow(url, '_blank', 'alwaysRaised,resizable,status,scrollbars,width=640,height=480');
				}else{
					alert("未处理任务无法进入处理页面！");
				}
			}
			function viewUser(userCode){
				var url = "${ctx}/platform/userDetailInfo.do?userCode="+userCode;
				openWindow(url, '_blank', 'alwaysRaised,resizable,status,scrollbars,width=640,height=480');
			}
			
			function init(){
				//创建TableView
				initTabViewByScript("bpmFlowChart")
			}
			YAHOO.util.Event.addListener(window,"load",init);
		</script>
	</head>
	<body>
		<div class="button_blue">	 
			 <div id="bpmFlowChart" class="yui-navset">
				<s:text name="bpmFlow.businessNo"></s:text>：<s:property value="businessNo"/>  
			      <ul class="yui-nav">
			      	<li class="selected"><a href="#"><font color="blue"><s:text name="bpmFlow.title.bpmFlowTitle"></s:text></font></a></li>
			        <li class="bw_8"><a href="#"><font color="blue"><s:text name="bpmFlow.flowList"></s:text></font></a></li>
			      </ul>
			      <div class="yui-content">
			        <div id="bpmFlowChartView">
			          <ul>
			          	<jsp:include page="BpmFlowChartView.jsp"/>
			          </ul>
			        </div>
			        <div id="bpmFlowChartViewTable">
			          <ul>
			          	<jsp:include page="BpmFlowChartViewTable.jsp"/>
			          </ul>
			        </div>
			      </div>
			    </div>
		</div>
	</body>
</html>
