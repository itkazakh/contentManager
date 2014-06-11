/**
 * Ajax���ú���
 * Made by yaochunyang at 20080702
 * void ajaxForDiv(divName, methodType, url)
 * @param divName     ������Textֱ�Ӳ��뵽DIV��
 *        methodType  ����ʽGET��POST
 *        url         �����URL
 *
 * void ajaxForMethod(callBackMethod, methodType, url)
 * @param callBackMethod  �ص�������,����һ������,����xmlHttp
 *        methodType      ����ʽGET��POST
 *        url             �����URL
 */
function ajaxForDiv(divName, methodType, url) {
	var xmlHttp;
	if(window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if(window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			divName.innerHTML = xmlHttp.responseText;
		}
	};
	
	methodType = methodType.toUpperCase();
	if (methodType == "GET") {
		xmlHttp.open(methodType, url, true);
		xmlHttp.send(null);
	} else {
		var pUrl=url.split("?");
		xmlHttp.open(methodType, pUrl[0], true);
		xmlHttp.setRequestHeader("Method", "POST "+pUrl[0]+" HTTP/1.1");
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		if (pUrl[1]!="" && typeof(pUrl[1])!='undefined') {
			xmlHttp.send(pUrl[1]);
		} else {
			xmlHttp.send("");
		}
	}
}
function ajaxForMethod(callBackMethod, methodType, url) {
	var xmlHttp;
	if(window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if(window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			callBackMethod(xmlHttp);
		}
	};
	
	methodType = methodType.toUpperCase();
	if (methodType == "GET") {
		xmlHttp.open(methodType, url, true);
		xmlHttp.send(null);
	} else {
		var pUrl=url.split("?");
		xmlHttp.open(methodType, pUrl[0], true);
		xmlHttp.setRequestHeader("Method", "POST "+pUrl[0]+" HTTP/1.1");
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		if (pUrl[1]!="" && typeof(pUrl[1])!='undefined') {
			xmlHttp.send(pUrl[1]);
		} else {
			xmlHttp.send("");
		}
	}
}


/**
 * ��FORMԪ��ת�����ַ�������
 * @param form_obj  FORM����
 */
function formToParameter(form_obj) {
	var query_string="";
	var and="";
	for (var i=0; i<form_obj.length; i++) {
		e=form_obj[i];
		if (e.name) {
			if (e.type=="select-one") {
				element_value=e.options[e.selectedIndex].value;
			} else if (e.type=="select-multiple") {
				for (var n=0; n<e.length; n++) {
					var op=e.options[n];
					if (op.selected) {
						query_string+=and+e.name+'='+encodeURIComponent(op.value);
						and="&"
					}
				}
				continue;
			} else if (e.type=="checkbox" || e.type=="radio") {
				if (e.checked==false) {
					continue;   
				}
				element_value=e.value;
			} else if (typeof e.value != "undefined") {
				element_value=e.value;
			} else {
				continue;
			}
			query_string+=and+e.name+"="+encodeURIComponent(element_value);
			and="&"
		}
	}
	return query_string;
}