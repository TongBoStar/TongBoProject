var iframe;// iframe操作对象
var gridname="";//操作datagrid对象名称
//var windowapi = frameElement.api, W = windowapi.opener;//内容页中调用窗口实例对象接口
/**
 * 事件打开窗口
 * @param title		编辑框标题
 * @param addurl	目标页面地址
 * @param gname
 * @param width
 * @param height
 */
function add(title,addurl,gridname,width,height){
	gridname = gridname;
	createwindow(title,addurl,width,height);
}

/**
 * 创建添加或编辑窗口
 * @param title
 * @param addurl
 * @param width
 * @param height
 */
function createwindow(title,addurl,width,height){
	width = width?width:700;
	height = height?height:400;
	if(width=="100%" || height=="100%"){
		width = window.top.document.body.offsetWidth;
		height =window.top.document.body.offsetHeight-100;
	}
	//if(typeof(windowapi) == 'undefined'){
		$.dialog({
			content: 'url:'+addurl,
			lock : true,
			width:width,
			height:height,
			title:title,
			opacity : 0.3,
			cache:false,
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
				saveObj();
				return false;
		    },
		    cancelVal: '关闭',
		    cancel: true
		}).zindex();
	//}
}

/**
 * 执行保存
 */
function saveObj(){
	$('#btn_sub', iframe.document).click();
}