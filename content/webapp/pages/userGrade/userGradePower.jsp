<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<%@include file="/common/meta_css.jsp"%>
		<%@include file="/common/i18njs.jsp"%>
		<script type="text/javascript" src="${ctx}/common/js/sinosoft.js"></script>
		<script type="text/javascript" src="${ctx}/common/js/MulLine.js"></script>
		<script type="text/javascript" src="${ctx}/common/js/Common.js"></script>
		<script type="text/javascript" src="${ctx }/common/dtree/dtree.js"></script>
	</head>
	<body>

		<s:form name="fm" action="" target="companyTreeRight">
			<table width="100%" class="fix_table">
				<br />
				<tr>
					<td class="bgc_tt_center" colspan="4">
						<s:text name="usergrade.configcomcode"/>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<table width="98%" id="anthTable" class="fix_table">
							<tr class="top">
								<td align="center" valign="middle">
									<s:text name="usergrade.optionalcompany"/>
								</td>
								<td align="center" valign="middle">
									<s:text name="usergrade.permitcompany"/>
								</td>
								<td align="center" valign="middle">
									<s:text name="usergrade.prohibitcompany"/>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle">
									<select name="nonRightSelect" class="one" size=8
										style="width: 100%" multiple ondblclick="changeMethod(this);">
										<s:iterator value="saaSpareCompanys" status="stuts">
											<option
												value="<s:property
								value="%{saaSpareCompanys[#stuts.index].comCode}" />" />
												<s:property
													value="%{saaSpareCompanys[#stuts.index].comCode}" />
												--
												<s:property
													value="%{saaSpareCompanys[#stuts.index].comCname}" />
											</option>
										</s:iterator>
									</select>
								</td>
								<td align="center" valign="middle">
									<select name="allowSelect" class="one" size=8
										style="width: 100%" multiple ondblclick="changeMethod(this);"
										style="color:green">
										<s:iterator value="saaPermitCompanys" status="stuts">
											<option
												value="<s:property
								value="%{saaPermitCompanys[#stuts.index].comCode}" />" />
												<s:property
													value="%{saaPermitCompanys[#stuts.index].comCode}" />
												--
												<s:property
													value="%{saaPermitCompanys[#stuts.index].comCname}" />
											</option>
										</s:iterator>
									</select>
								</td>
								<td align="center" valign="middle">
									<select name="forbidSelect" class="one" size=8
										style="width: 100%" multiple ondblclick="changeMethod(this);"
										style="color:red">
										<s:iterator value="saaExceptCompanys" status="stuts">
											<option
												value="<s:property
								value="%{saaExceptCompanys[#stuts.index].comCode}" />" />
												<s:property
													value="%{saaExceptCompanys[#stuts.index].comCode}" />
												--
												<s:property
													value="%{saaExceptCompanys[#stuts.index].comCname}" />
											</option>
										</s:iterator>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<input type="button" name="allowIn" value='<s:text name="button.allowin"/>'
							class="button_ty" onclick="changeMethod(this);">
						<input type="button" name="allowOut" value='<s:text name="button.allowout"/>'
							class="button_ty" onclick="changeMethod(this);">
						<input type="button" name="forbidIn" value='<s:text name="button.forbidIn"/>'
							onclick="changeMethod(this);" class="button_ty">
						<input type="button" name="forbidOut" value='<s:text name="button.forbidOut"/>'
							onclick="changeMethod(this);" class="button_ty">
					</td>
				</tr>
				<tr>
					<td class="bgc_tt_center" colspan="4">
						<s:text name="usergrade.choseproduct"/>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<input type="button" name="openCloseAll2" value="展开"
							onclick="openAndClose2();" class="button_ty">
					</td>
				</tr>
			</table>
			<div id="insuranceTrees" align="left"></div>
			<table width="100%" class="fix_table" border="0">
				<tr>
					<td align=center>
						<input type="submit" value='<s:text name="button.ok"/>' class="button_ty"
							onclick="return updateUserPowerMethod();">
					</td>
				</tr>
			</table>
		</s:form>
		<%@include file="/common/meta_js.jsp"%>
	</body>
</html>
<script language="javascript">
		d2 = new dTree('d2');
		d2.add('0','-1','<s:text name="usergrade.promptproductselection"/>','','<s:text name="usergrade.productselection"/>','','','','',false,false,true);
		<s:iterator value="saaRiskObjectVOList" status="stuts">
 	  		d2.add('<s:property value="%{saaRiskObjectVOList[#stuts.index].riskObjecCode}" />','<s:property value="%{saaRiskObjectVOList[#stuts.index].riskObjectParentCode}" />','<s:property value="%{saaRiskObjectVOList[#stuts.index].riskObjectName}" />','','','','','','',true,'<s:property value="%{saaRiskObjectVOList[#stuts.index].value}" />',true,'<s:property value="%{saaRiskObjectVOList[#stuts.index].hasPower}" />');
  		</s:iterator>
	document.getElementById("insuranceTrees").innerHTML = d2;
	function openAndClose2(){
      if(fm.openCloseAll2.value=="展开"){
        fm.openCloseAll2.value = "合并";
        d2.openAll();
      }else{
        fm.openCloseAll2.value = "展开";
        d2.closeAll();
      }
    }  
 </script>
<script language="javascript">
function updateUserPowerMethod(){     
 
      for(var i=0; i < fm.allowSelect.options.length; i++){      
          fm.allowSelect.options[i].selected = true;
      } 
      for(var i=0; i< fm.forbidSelect.options.length; i++){
          fm.forbidSelect.options[i].selected = true;
      } 
      fm.action="${ctx}/saaUserGrade/updateUserServicePower.do?userCode=<%=request.getParameter("userCode")%>&saaGradeID=<%=request.getParameter("saaGradeID")%>";      
      fm.submit;
      return true;     
    }
    
var allowSelectIndex=fm.allowSelect.options.length;
var forbidSelectIndex=fm.forbidSelect.options.length;

function allowIn(){
	for(var i=fm.nonRightSelect.options.length-1; i>-1; i--){  
		 if(fm.nonRightSelect.options[i].selected){
		 	var no = new Option();
         	no.value = fm.nonRightSelect.options[i].value;
         	no.text = fm.nonRightSelect.options[i].text;
         
         	fm.allowSelect[allowSelectIndex]=no;
          	allowSelectIndex++; 
          	fm.nonRightSelect.options[i].removeNode(true);
		} 
	}
}
function allowOut(){
	for(var i=fm.allowSelect.options.length-1; i>-1; i--){
		if((fm.allowSelect.options[i]!=null)&&(fm.allowSelect.options[i].selected))	{
			
			allowSelectIndex--;
			var no = new Option();
         	no.value = fm.allowSelect.options[i].value;
         	no.text = fm.allowSelect.options[i].text;
         
         	 fm.nonRightSelect[fm.nonRightSelect.length]=no;
         	
         	fm.allowSelect.options[i].removeNode(true);
		}
	}
}
function forbidIn(){
	for(var i=fm.nonRightSelect.options.length-1; i>-1; i--){  
		if(fm.nonRightSelect.options[i].selected){
		 	var no = new Option();
         	no.value = fm.nonRightSelect.options[i].value;
         	no.text = fm.nonRightSelect.options[i].text;
         
         	fm.forbidSelect[forbidSelectIndex]=no;
         	forbidSelectIndex++;  
         
         	 fm.nonRightSelect.options[i].removeNode(true);
		} 
	}
}
function forbidOut(){
	for(var i=fm.forbidSelect.options.length-1; i>-1; i--){
		if((fm.forbidSelect.options[i]!=null)&&(fm.forbidSelect.options[i].selected))	{
			
			forbidSelectIndex--;
			
			var no = new Option();
         	no.value = fm.forbidSelect.options[i].value;
         	no.text = fm.forbidSelect.options[i].text;
         
         	 fm.nonRightSelect[fm.nonRightSelect.length]=no;
         	
         	fm.forbidSelect.options[i].removeNode(true);
		}
	}
}
function changeMethod(obj){
	if(obj==fm.allowIn){
		allowIn();
	}
	else if(obj==fm.allowOut){
		allowOut();
	}
	else if(obj==fm.forbidIn){
		forbidIn();
	}
	else if(obj==fm.forbidOut){
		forbidOut();
	}
} 
</script>
