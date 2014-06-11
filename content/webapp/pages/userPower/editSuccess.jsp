<html>
<head>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/i18njs.jsp"%> 
<%@include file="/common/meta_css.jsp"%>
</head>
<script type="text/javascript">
//parent.window.opener.location.reload();
</script>
<body>
  <table class=common align=center>
  <br>
    <tr>
      <td align="center"><img src='${pageContext.request.contextPath}/pages/image/success.gif'/></td>
      <td class="common"><s:property value="%{businessNo}"/><s:text name="prompt.operatorsuccess"/></td>
    </tr>
    <tr>
      <td align="center" colspan="2">
        <input type="button" class="button_ty" value='<s:text name="button.ok"/>' onclick="onClose();"> 
      </td>
    </tr>
  </table>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript">
function onClose(){
    if(parent.submitDlg!=undefined){
        parent.submitDlg.hide();
    }else {
    	//window.close();
       // window.location.href="about:blank";
       // parent.document.all.reload();
       // window.document.all.reload();
    	//parent.parent.document.all.reload();
    	//opener.document.frames[comIframe].location.reload();
   		 parent.window.location.reload();
    }
}
</script>