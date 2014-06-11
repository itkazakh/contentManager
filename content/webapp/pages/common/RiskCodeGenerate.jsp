<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><s:text name="common.productintroductionsimulator"/></title>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>

</head>

<body id="all_title">

<div id="wrapper">
<div id="container">
<div id="crash_menu">
<h2 align="center"><s:text name="common.enterqueryconditions"/></h2>
</div>
<s:form name="fm" action="" namespace="/" method="post">
<s:hidden name="flag" id="flag"></s:hidden>
	<table class="fix_table">	
		<tr>
			<td class="bgc_tt short"><s:text name="common.productcode"/></td>			
			<td class="long"><input name="riskCode"
				id="riskCode" class='input_y w_p90'
				ondblclick="showRiskPanel(this);"/></td>			
		</tr>		
	</table>
</s:form></div>
</div>
</body>
</html>
<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/common/dwr/engine.js"></script>
<script language="javascript" src="${ctx}/common/dwr/util.js"></script>
<script language="javascript" src="${ctx}/common/js/CodeSelect.js"></script>
	<script type="text/javascript" src="${ctx }/pages/saa/js/saaing.js"></script>