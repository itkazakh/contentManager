
		// 当原币金额改变是，重新计算本位币金额
	function reCalDest(){
		var length = document.getElementsByName("size").length - 1;	// 得到页面上已经显示的列表的个数
		// 计算累计值
		for(var i=0;i<length;i++){
			var debitSourceName = "voucherTempList["+i+"].debitSource";
			var creditSourceName = "voucherTempList["+i+"].creditSource";
			var exchangeRateName = "voucherTempList["+i+"].exchangeRate";
			var debitDestName = "voucherTempList["+i+"].debitDest";
			var creditDestName = "voucherTempList["+i+"].creditDest";
			// 获取原币的值
			var debitSoure = parseFloat(document.getElementsByName(debitSourceName)[0].value);
			var creditSource = parseFloat(document.getElementsByName(creditSourceName)[0].value);
			var exchangeRate = parseFloat(document.getElementsByName(exchangeRateName)[0].value);
			// 计算本位币的值，并且赋给对应的字段
			var debitDest = parseFloat(debitSoure * exchangeRate);
			var creditDest = parseFloat(creditSource * exchangeRate);
			document.getElementsByName(debitDestName)[0].value = round(debitDest,2);
			document.getElementsByName(creditDestName)[0].value = round(creditDest,2);
		}
	}
	// 根据当前数据的情况计算累计的借贷方本位币金额。
	function sumDebitCredit(){
		var debitDest = 0.00;	// 总的借方本位币
		var creditDest = 0.00;	// 总的贷方本位币
		var length = document.getElementsByName("size").length - 1;	// 得到页面上已经显示的列表的个数
		// 计算累计值
		for(var i=0;i<length;i++){
			var debitDestName = "voucherTempList["+i+"].debitDest";
			var creditDestName = "voucherTempList["+i+"].creditDest";
			debitDest = parseFloat(debitDest) +  parseFloat(document.getElementsByName(debitDestName)[0].value);
			creditDest = parseFloat(creditDest) + parseFloat(document.getElementsByName(creditDestName)[0].value);
		}
		var sumDebitDest = fm.sumDebitDest;
		var sumCreditDest = fm.sumCreditDest;
		sumDebitDest.value = round(debitDest,2);
		sumCreditDest.value = round(creditDest,2);
	}
	var index = 0;
	// 科目代码的选择域，根据科目代码的选择，使用ajax返回一个能够解析的包含了，科目代码对应的T字段信息的结果。然后根据这个结果改变对应页面上的状态。
	function codeSelect(field){
		// 调用双击域的方法
		code_CodeSelect(field, 'itemCodeAll', '0,1', 'Y');
		var itemCode=field.value;
		var fieldId = field.id;
		index = fieldId.substring(16,17);
		resetTCodeByItemCode(itemCode);

	}
	// 使用ajax技术得到那个节点
	function resetTCodeByItemCode(itemCode){
		var formObject = document.getElementById('fm');   
   		YAHOO.util.Connect.setForm(formObject);  	
		var callback={
			success:testListener, 
			failure: failure,
			argument: []
		}
		//将表单信息 发送到airManageAction 中的createDeptsData方法处理
		var postDate = "itemCode=" + itemCode;
 		YAHOO.util.Connect.asyncRequest('POST','${ctx}/accPaymentConfirm/createItemTCodeData.do',callback,postDate);
	}
	
	
	function testListener(res){
		var voucherItemString = res.responseText;
		if(voucherItemString.length < 1){
			return;
		}
		var voucherItemArray = voucherItemString.split("|");
		// 判断所有的为*的T字段，把它置为双击域
		for(var i=2;i<9;i++){
			if(voucherItemArray[i] == '*'){
				var voucherItemTId = "voucherTempList["+ index +"].T" + (i-1);
				var voucherItemT = document.getElementById(voucherItemTId);
				var codeTypeTemp = "T" + (i-1);
				var centerCodeTemp = document.getElementById("centerCode").value;
				var classNameY = "input_y w_7";
				var classNameW = "input_w w_7";
				var paramaters ={
					field:voucherItemTId,
					codeType:codeTypeTemp,
					codeRelation:'-1,0',
					isClear:'Y',
					centerCode:centerCodeTemp
				};
				YAHOO.util.Dom.get(voucherItemTId).readOnly=false;
				YAHOO.util.Event.addListener(voucherItemT,'dblclick',codeSelectTCode,paramaters,true);
				YAHOO.util.Dom.replaceClass(voucherItemT,classNameW, classNameY);
			}else{
				var voucherItemTId = "voucherTempList["+ index +"].T" + (i-1);
				var voucherItemT = document.getElementById(voucherItemTId);
				var classNameY = "input_y w_7";
				var classNameW = "input_w w_7";
				YAHOO.util.Dom.get(voucherItemTId).value=""
				YAHOO.util.Dom.get(voucherItemTId).readOnly=true;
				YAHOO.util.Event.removeListener(voucherItemTId,'dblclick');
				YAHOO.util.Dom.replaceClass(voucherItemT,classNameY, classNameW);
			}
		var voucherSubmitTest = document.getElementById("voucherTempList["+ index +"].remark");
		}
	}
	
	function codeSelectTCode(obj){
		var fieldName = this.field;
		var field = document.getElementById(fieldName);
		var codeType = this.codeType;
		var codeRalation= this.codeRelation;
		var isClear = this.isClear;
		var centerCode = this.centerCode;
		code_CodeSelect(field, codeType, codeRalation, isClear,centerCode);
	}
	
	function failure(){
 		alert("服务器连接异常");
	}