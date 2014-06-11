<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/i18njs.jsp"%>

<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="prompt.function.viewfunction"/></title>
    <%@ include file="/common/meta_css.jsp"%>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  <div id="crash_menu">
					<h2 align="center">
						<s:text name="prompt.function.mangecode"/>
					</h2>
				</div>
  	<s:form name="fm" action="updateTask" namespace="/saaTask" method="post">
  		<table class="fix_table">
  			<tr>
  				<s:hidden name="saaTask.id"></s:hidden>
  				<s:hidden name="saaTask.creatorCode"></s:hidden>
  				<s:hidden name="saaTask.createTime"></s:hidden>
  				<s:hidden name="saaTask.validInd"></s:hidden>
  				<s:hidden name="saaTask.updaterCode"></s:hidden>
  				
				<td class="bgc_tt short"><s:text name="prompt.function.lastmodifiercode"/></td>
				<td class="long" colspan="3">
				<s:textfield name="saaTask.updaterCode" id="saaTask.updaterCode"
					cssClass='input_w w_30' disabled="true"/></td>
				<td class="bgc_tt short"><s:text name="prompt.function.chinesename"/></td>
				<td class="long"><s:textfield name="saaTask.taskCName"
					id="saaTask.taskcname" cssClass='input_w w_30' disabled="true"/></td>
			</tr>
			<tr>
				<td class="bgc_tt short"><s:text name="prompt.function.code"/></td>
				<td class="long" colspan="3">
				<s:textfield name="saaTask.taskCode" id="saaTask.taskCode"
					cssClass='input_w w_30'  disabled="true"/></td>
				<td class="bgc_tt short"><s:text name="prompt.function.englishname"/></td>
				<td class="long"><s:textfield name="saaTask.taskEName"
					id="saaTask.taskename" cssClass='input_w w_30'  disabled="true"/></td>
			</tr>
			<tr>
				<td class="bgc_tt short"><s:text name="prompt.function.uppercode"/></td>
				<td class="long" colspan="3">
				<s:textfield name="saaTask.parentCode" id="saaTask.parentCode"
					cssClass='input_w w_30'  disabled="true"/></td>
				<td class="bgc_tt short"><s:text name="prompt.function.tname"/></td>
				<td class="long"><s:textfield name="saaTask.taskTName"
					id="saaTask.tasktname" cssClass='input_w w_30'  disabled="true"/></td>
			</tr>  
			</table>
			<br>
			<table>
			<tr>
				<td><input type="button" class="button_ty" value='<s:text name="prompt.ok"/>' onclick="window.close();"/></td>
			</tr>		
  		</table>
  		
  	</s:form>
  	
    
  </body>
</html>
<%@ include file="/common/meta_js.jsp"%>
