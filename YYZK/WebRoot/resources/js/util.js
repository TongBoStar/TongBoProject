//var jsctx = '${ctx}';
//alert(jsctx);

/**
 * 取url参数
 * @param name
 * @returns
 */
function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
	var r = window.location.search.substr(1).match(reg);
	if (r!=null) return (r[2]); return null;
}

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
	var o = {
			"M+": this.getMonth() + 1, //月份 
			"d+": this.getDate(), //日 
			"h+": this.getHours(), //小时 
			"m+": this.getMinutes(), //分 
			"s+": this.getSeconds(), //秒 
			"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			"S": this.getMilliseconds() //毫秒 
	};
	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}
String.prototype.endWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
		return false;
	if(this.substring(this.length-str.length)==str)
		return true;
	else
		return false;
	return true;
}

String.prototype.startWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
		return false;
	if(this.substr(0,str.length)==str)
		return true;
	else
		return false;
	return true;
}


function delLastChar(originalString,delChar){
	if(originalString.endWith(delChar)){
		return originalString.substr(0,originalString.lastIndexOf(delChar));
	}else{
		return originalString;
	}
}


function openWin(varTitle,varIcon,varWidth,varHeight,varUrl,iframeId){
	if(varUrl.indexOf("?")==-1){
		varUrl = varUrl + "?iframeId="+iframeId
	}else{
		varUrl = varUrl + "&iframeId="+iframeId
	}
	
	window.top.$("#win").window({
		title: varTitle, 
		width: varWidth, 
		height: varHeight, 
		iconCls: varIcon, 
		modal: true, 
		collapsible: false, 
		minimizable: false, 
		maximizable: true, 
		closable: true, 
		content: "<iframe id='frm_win_project' src='"+varUrl+"' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>", 
		onClose: function () {
			//var rtnValue = window.top.$(this).data("returnValue");
			//var frames=window.top.window.document.getElementById(iframeId); 
			//frames.contentWindow.reload(); 
	  	}
	}).window('open');
}