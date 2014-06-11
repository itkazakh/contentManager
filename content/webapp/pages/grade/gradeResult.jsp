<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<%@include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
</head>
<body>
<s:form name="fm" action="/saaGrade/updateGrade.do">
	<div id="div"
		style="MARGIN: 2pt; width: 100%; height: 100%;">
	<table class="fix_table">
		<tr>
			<td align="center">
			<h2><s:text name="prompt.grade"/></h2>
			</td>
		</tr>
		<c:set var="index" value="0" />
		<s:iterator value="grades" status="stuts">
			<tr>
				<td>
				<div style="display: none">${index+1 }</div>
				<input type=radio name=checkboxSelect
					value="<s:property value='%{grades[#stuts.index].id}'/>"> <a
					href="${ctx }/saaGrade/viewGrade.do?editType=view&gradeID=<s:property
					value='%{grades[#stuts.index].id}' />"
					target="companyTreeRight"><s:property
					value='%{grades[#stuts.index].id}' />-<s:property
					value="%{grades[#stuts.index].gradeCName}" /></a></td>
				<s:hidden name="gradeCode" value="%{grades[#stuts.index].id}" />
			</tr>
			<c:set var="index" value="${index+1 }" />
		</s:iterator>
	</table>
	</div>
	<table align="center" class="fix_table">
		<tr>
			<td align="right"><input type='button' class="button_ty"
				name=buttonInsert value='<s:text name="button.addgrade"/>' onclick="return insertMethod()"></td>

			<td align="left"><input type='button' class="button_ty"
				name=buttonModify value='<s:text name="button.configgrade"/>' onclick="return modifyMethod()"></td>
		</tr>
		<tr>
			<td align="right"><input type='button' class="button_ty"
				name=buttonInsert value='<s:text name="button.copygrade"/>' onclick="return copyMethod()"></td>

			<td align="left"><input type='button' class="button_ty"
				name=buttonModify value='<s:text name="button.viewgrade"/>' onclick="return checkMethod()"></td>
		</tr>
		<tr>
			<td align="right" colspan="2"><input type='button' class="button_ty"
				name=buttonInsert value='<s:text name="button.deletegrade"/>' onclick="return deleteMethod()"></td>
		</tr>
	</table>
</s:form>
</body>
</html>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/common/js/MulLine.js"></script>
<script language="javascript">
    function insertMethod(){
        fm.action="contextRootPath/saaGrade/prepareInsertGrade.do?editType=insert";
        fm.target="companyTreeRight";
        fm.submit();
        return true;
    }
    function copyMethod(){
    	  var count = getElementCount('checkboxSelect');
         if(count==0){
            alert('<s:text name="prompt.havenotresult"/>');
            return false;
        }else 
        if(count==1){
            if(fm.checkboxSelect.checked==true){
            	var checkboxSelect = fm.checkboxSelect.value;
                fm.action = '${ctx}/saaGrade/prepareCopyGrade.do?editType=cope&gradeID='+checkboxSelect;
                fm.target="companyTreeRight";
                fm.submit();
                return true;
            }
            else{
                alert('<s:text name="prompt.selectonerecord"/>');
                return false;
            }
        }else{
        	var n = 0;
        	for(var i=0;i<fm.checkboxSelect.length;i++){
        	    if(fm.checkboxSelect[i].checked==true){
        	        n = n + 1;
        	    }
       	 	}
	        if(n==0){
	            alert("<s:text name="prompt.selectonerecord"/>");
	            return false;
	        }
	        else if(n==1){
	            for(var j=0;j<fm.checkboxSelect.length;j++){
	                if(fm.checkboxSelect[j].checked==true){
	                   var checkboxSelect = fm.checkboxSelect[j].value;
	                   fm.action = 'contextRootPath/saaGrade/prepareCopyGrade.do?editType=copy&gradeID='+checkboxSelect;
	                   fm.target="companyTreeRight";
	                   fm.submit();
	                   break;
	                 }
	            }
	        }
	        else{
	            alert("<s:text name="prompt.selectonerecord"/>");
	            return false;
	        }
	        return true;
	    	}
    }
    
    function modifyMethod(){
        var count = getElementCount('checkboxSelect');
         if(count==0){
            alert('<s:text name="prompt.havenotresult"/>');
            return false;
        }else 
        if(count==1){
            if(fm.checkboxSelect.checked==true){
            	var checkboxSelect = fm.checkboxSelect.value;
                fm.action = '${ctx}/saaGrade/prepareUpdateGrade.do?editType=update&gradeID='+checkboxSelect;
                fm.target="companyTreeRight";
                fm.submit();
                return true;
            }
            else{
                alert('<s:text name="prompt.selectonerecord"/>');
                return false;
            }
        }else{
        	var n = 0;
        	for(var i=0;i<fm.checkboxSelect.length;i++){
        	    if(fm.checkboxSelect[i].checked==true){
        	        n = n + 1;
        	    }
       	 	}
	        if(n==0){
	            alert("<s:text name="prompt.selectonerecord"/>");
	            return false;
	        }
	        else if(n==1){
	            for(var j=0;j<fm.checkboxSelect.length;j++){
	                if(fm.checkboxSelect[j].checked==true){
	                   var checkboxSelect = fm.checkboxSelect[j].value;
	                   fm.action = 'contextRootPath/saaGrade/prepareUpdateGrade.do?editType=update&gradeID='+checkboxSelect;
	                   fm.target="companyTreeRight";
	                   fm.submit();
	                   break;
	                 }
	            }
	        }
	        else{
	            alert('<s:text name="prompt.choseonlyrecord"/>');
	            return false;
	        }
	        return true;
	    	}
    }
    function checkMethod(){
        var count = getElementCount('checkboxSelect');
         if(count==0){
            alert('<s:text name="prompt.havenotresult"/>');
            return false;
        }else 
        if(count==1){
            if(fm.checkboxSelect.checked==true){
            	var checkboxSelect = fm.checkboxSelect.value;
                fm.action = '${ctx }/saaGrade/viewGrade.do?editType=view&gradeID='+checkboxSelect;
                fm.target="companyTreeRight";
                fm.submit();
                return true;
            }
            else{
                alert('<s:text name="prompt.selectonerecord"/>');
                return false;
            }
        }else{
        	var n = 0;
        	for(var i=0;i<fm.checkboxSelect.length;i++){
        	    if(fm.checkboxSelect[i].checked==true){
        	        n = n + 1;
        	    }
       	 	}
	        if(n==0){
	            alert("<s:text name="prompt.selectonerecord"/>");
	            return false;
	        }
	        else if(n==1){
	            for(var j=0;j<fm.checkboxSelect.length;j++){
	                if(fm.checkboxSelect[j].checked==true){
	                   var checkboxSelect = fm.checkboxSelect[j].value;
	                   fm.action = 'contextRootPath/saaGrade/viewGrade.do?editType=view&gradeID='+checkboxSelect;
	                   fm.target="companyTreeRight";
	                   fm.submit();
	                   break;
	                 }
	            }
	        }
	        else{
	            alert('<s:text name="prompt.choseonlyrecord"/>');
	            return false;
	        }
	        return true;
	    	}
    }
    function deleteMethod(){
    	var count = getElementCount('checkboxSelect');
         if(count==0){
            alert('<s:text name="prompt.havenotresult"/>');
            return false;
        }else{
        	var n = 0;
        	for(var i=0;i<fm.checkboxSelect.length;i++){
        	    if(fm.checkboxSelect[i].checked==true){
        	        n = n + 1;
        	    }
       	 	}if(n==0){
	            alert("<s:text name="prompt.selectonerecord"/>");
	            return false;
	        }else if(n==1){
	        	if(confirm('<s:text name="prompt.suretodeletegrade"/>')){
	            	for(var j=0;j<fm.checkboxSelect.length;j++){
	                	if(fm.checkboxSelect[j].checked==true){
	                   		var checkboxSelect = fm.checkboxSelect[j].value;
	                  	 	fm.action = 'contextRootPath/saaGrade/deleteGrade.do?gradeID='+checkboxSelect;
	                  	 	fm.target="companyTreeRight";
	                   		fm.submit();
	                   		break;
	                 	}
	            	}
	            }else{
	            	return false；
	            }
	        }else{
	            alert('<s:text name="prompt.choseonlyrecord"/>');
	            return false;
	        }
	        return true;
	    }
    }
 </script>
