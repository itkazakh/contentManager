<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
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
      <td align="center">
        <img src='${pageContext.request.contextPath}/pages/image/success.gif'/>
      </td>
      <td class="common"><s:property value="%{businessNo}"/><s:text name="prompt.operatorsuccess"/></td>
    </tr>
    <tr>
      <td align="center" colspan="2">
        <input type="button" class="button_ty" value='<s:text name="prompt.ok"/>' onclick="success();"> 
        <input type="button" id="btnReturn" class="button_ty" value='<s:text name="prompt.backtotasklist"/>' onclick="returnTaskPage();" disabled/>
      </td>
    </tr>
  </table>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript">
function init(){
	reloadTaskPage();
	YAHOO.util.Dom.get("btnReturn").disabled=false;
}
function reloadTaskPage(){
	if(parent.window!=null){
		try{
		if(parent.window!=null && parent.window!=undefined){
			if(parent.window.opener.fm.bpmsubmit!=undefined){
				parent.window.opener.fm.bpmsubmit.onclick();
			}
		}
		}catch(E){
		
		}
	}
}
function returnTaskPage(){
	if(parent.window!=null && parent.window!=undefined){
		parent.window.close();
	}
    if (parent.window.opener!=undefined && parent.window.opener.editRecordOverCustom!=undefined) {
        parent.window.opener.editRecordOverCustom();
    }
}
function success(){
	if(parent.submitDlg!=undefined){
        parent.submitDlg.hide();
		if(parent.window._pageReload){
			parent.window._pageReload();
		}else{
			parent.window.location.reload();
		}
	}else{
		if(parent.window!=undefined) parent.window.close();
	}

    if (parent.window.opener!=undefined && parent.window.opener.editRecordOverCustom!=undefined) {
        parent.window.opener.editRecordOverCustom();
    }
}
YAHOO.util.Event.addListener(window,'load',init);
</script>