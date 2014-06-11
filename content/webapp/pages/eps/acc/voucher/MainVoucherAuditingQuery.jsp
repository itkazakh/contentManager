<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title><s:text name="user.manage" /></title>
<%@ include file="/common/meta_css.jsp"%>
</head>
<body id="all_title">
<div id="wrapper">
<div id="crash_menu">
<h2 align="center"><s:text name="applyMain.head" /></h2>
</div>
	<s:form action="updateAll" method="post" namespace="/mainVoucher" name="fm"
	validate="true"  onsubmit="return checkForm();">
	<table class="fix_table" width="100%" >
			<tr>
				<td class="bgc_tt short"></td>
	            <td class="bgc_tt short"><s:text name="epsMainVoucher.id" /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.yearMonth" /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.voucherNo" /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.centerCode" /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.operatorCode" /></td>
				<td class="bgc_tt short"><s:text name="epsMainVoucher.voucherFlag" /></td>
			</tr>
		<c:forEach items="${listAuditing}" var="i">
				<tr>
					<td class="bgc_tt short"><input type="checkbox" name="checkboxs" value="${i[0]}" ></td>
					<td class="bgc_tt short">${i[0] }</td>
					<td class="bgc_tt short">${i[1] }</td>
					<td class="bgc_tt short"><a href="./viewAuditingVoucher.do?id=${i[0] }">${i[2]}</a></td>
					<td class="bgc_tt short">${i[3]}</td>
					<td class="bgc_tt short">${i[4]}</td>
					<td class="bgc_tt short">
					<c:if test="${i[5]=='1'}">未复核</c:if>
					<c:if test="${i[5]=='2'}">下发修改</c:if>
					<c:if test="${i[5]=='3'}">已修改</c:if>
					<c:if test="${i[5]=='4'}">已复核</c:if>
					</td>
				</tr>
		</c:forEach>

		        <br>
		       <tr>
			        <td></td><td></td><td></td>
					<td align="center">
						<input type="submit" value="<s:text name="common.auditing" />"
							id="queryButton" class="button_ty" >
					</td>
					<td></td><td></td><td></td>
			  </tr>
      </table>
</s:form>
</div>
<div id="content_navigation" class="query" align="center"></div>
<div id="content" class="sort"></div>
<div id="content_navigation" class="query" align="center"></div>

<%@ include file="/common/i18njs.jsp"%>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript">
   function checkForm(){
    var obj=document.getElementsByName("checkboxs");//根据自己的多选框名称修改下
    var b =false;
    for(var i=0;i< obj.length;i++){
    if(obj[i].checked){
        b = true;
    }
    }
    if(b==false){
        alert("未选中审核的单子!");//提示信息自己修改
    }
    return b;
   }
</script>
</body>
</html>
