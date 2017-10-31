$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'messagepage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_message.id',
		submitForm : submitForm//分页回调函数
		});	
	$('#fileUpload').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/uploadHelp.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*',// 文件过滤器
		'fileTypeDesc' : 'doc,docx,pdf文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':23,
        'width':60,
        'successTimeout':120,
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
			closeblockdiv();
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			$('#fileName').val(data.srcfilename);
			$('#url').val(data.filename);
			$('#content').val(data.srcfilename);
			closeblockdiv();
		},
		'onUploadStart': function (file) {  
			//openblockdiv();
        }  
	});
	search();
	//setInterval("loadScanCodes()",1000);
	$('input[name=seqcode]').on("blur",function(){
		if($.trim(this.value).length>=5){
			genTwoDimcode(this.value);
		}
	});
	$('#scancode').focus();
	$('#scancode').val("1234567890");
	setInterval("guangbiao()",500);
});
function submitForm(){
	search();
}
function guangbiao(){
	if($.trim($('#scancode').val()).length>0){
		$('#messagename').focus();
	}
}
function loadScanCodes(){
	var url = ctx+"/processTask/process-task!readphonecall.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"",
		success : function(data) {
			data = $.parseJSON(data);
			if(null!=data.processTaskList&&data.processTaskList.length>0&&null!=data.processTaskList[0]){
				$('#scancode').val(replaceNull(data.processTaskList[0].taskCode));
			}
		}
	});
}
/**
 * 加载列表
 */
function search(){
	closeblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/message/message!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.refreshPageToolbar(page,"messagepage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var unhandles = 0;
				var urltmp = "";
				$.each(page.result,function(i,o){
					html += '<tr>';
					html += '<td>'+(i+1)+'</td>';
					html += '<td>'+replaceNull(o.name)+'</td>';
					html += '<td>'+replaceNull(o.content)+'</td>';
					var createdate="";
					if(o.createdate!=null){
						createdate = formatDate('yyyy-MM-dd HH:mm:ss',o.createdate);
					}
					html += '<td>'+createdate+'</td>';
					var  status = "";
					if(o.status==1){
						status="未处理";
						unhandles += 1;
					}else if(o.status==2){
						status="已完成";
					}else{
						status = "";
					}
					html += '<td>'+status+'</td>';
					if(o.type==1){
						html += '<td><a href="#" onclick="toDetail(\''+o.url+'\')">查看</a></td>';
					}else if(o.type==2){
						urltmp = o.url;
						if(null!=urltmp&&""!=urltmp&&urltmp.indexOf(".htm") <= 0){
							html += '<td><a href="#" onclick="toLoadPre(\''+o.url+'\')">查看</a>|<a href="#" onclick="toLoadFile(\''+o.url+'\')">下载</a></td>';
						}else if(""==urltmp||null==urltmp){
							html += '<td>系统文本消息</td>';
						}else{
							html += '<td><a href="#" onclick="toLoadPre(\''+o.url+'\')">查看</a></td>';
						}
					}else{
						
					}
					html +='</tr>';
				});
				$('#home-data-body').html(html);
				if(unhandles>0){
					if($('#spaninfos').html()==undefined){
						$('#spanmenu1').after('<span id="spaninfos" class="badge badge-yellow">'+unhandles+'</span>');
					}else{
						$('#spaninfos').html(unhandles);
					}
				}
			}
			//closeblockdiv();
		}
	});
}
/**
 * 查看详情
 * @param id
 */
function toDetail(url){
	window.location.href=ctx+'/'+url;
}
function toDetailMain(content){
	$('#messageDetail').html(content);
	openDiv("messageDetailDiv");
}
function toLoadPre(path){
	var usepath = path.substring(0,path.lastIndexOf("."));
	openDiv('showDiv');
	new FlexPaperViewer(	
			ctx+'/FlexPaperViewer',
			 //'/FlexPaperViewer',
			 'viewerPlaceHolder', 
			 { 
				 config : {
					 SwfFile : escape(usepath+'.swf'),
					 Scale : 0.6, 
					 ZoomTransition : 'easeOut',
					 ZoomTime : 0.5,
					 ZoomInterval : 0.2,
					 FitPageOnLoad : true,
					 FitWidthOnLoad : true,
					 FullScreenAsMaxWindow : false,
					 ProgressiveLoading : false,
					 MinZoomSize : 0.2,
					 MaxZoomSize : 5,
					 SearchMatchAll : false,
					 InitViewMode : 'SinglePage',//SinglePage Portrait
					 
					 ViewModeToolsVisible : true,
					 ZoomToolsVisible : true,
					 NavToolsVisible : true,
					 CursorToolsVisible : true,
					 SearchToolsVisible : true,
							
					localeChain: 'en_US'
				 }
			});
}
function toLoadFile(url){
	window.location.href=ctx+url;
}
function save(){
	if($('#name').val()==""){
		alert("请输入消息名称");
		return;
	}
	/*var fileName = $("#fileName").val();
	if(!fileName){
		alert("上传文件不能为空！");
		return;
	}*/
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		//openblockdiv();
		var inputForm = $('#inputForm').serialize();
		$.webAjax({
			type : 'post',
			url : ctx+ '/message/message!saveToJson.htm',
			data :inputForm,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("操作成功!");
					search();
					closeDiv('inputDiv');
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
function addDiv(){
	$('#content').val('');
	$('#name').val('');
	$('#url').val('');
	$('#fileName').val('');
	openDiv("inputDiv");
}
/**
 * 将null转换为空字符串
 * @param obj 要转换的对象
 * @returns 空字符串
 */
function replaceNull(obj){
	if(obj==null){
		obj = "";
	}
	return obj;
}
function doexe(){
    //从Window下复制来的路径是 '\' 斜线,需改为'\\'或者'/'
    //路径前的file:\\\可有可无,建议加上
    //var qqPath="file:\\\D:\\Program Files\\winscpchs\\WinSCP.exe";
    var qqPath="file:\\\C:\\Windows\\system32\\calc.exe";
    try{
        var objShell = new ActiveXObject("wscript.shell");
        //加上 \" 解决路径中含有空格的问题
        objShell.Run("\""+qqPath);
        objShell = null;
    }
    catch (e){
        var repart=alert('找不到文件。请查看路径是否正确!');
    }
}
function toGenTwoDimcode(){
	openDiv('twoDimcodeDiv');
}
function genTwoDimcode(seqcode){
	$.webAjax({
		type : 'post',
		url : ctx+ '/processTask/process-task!genTwoDimcode.htm',
		data :"processTaskQuery.taskCode="+seqcode,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("二维码生成成功!");
				$('#twodimcode1').html("<img src='"+ctx+"/twodimcode/"+seqcode+".jpg'/>");
			}else{
				alert(data.resultInfo[1]);
			}
			closeblockdiv();
		}
	});
}
