$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'arvoicelistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_arvoice.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
	$('#voicePath').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadsecond.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.mp3;*.wav;',// 文件过滤器
		'fileTypeDesc' : 'xlsx,xls文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'file',
		'uploadLimit' : 5,
		'height':25,
        'width':40,
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			$('#fileshow').val(data.oldName);
			$('#filepath').val(data.resPath);
		}
	});
});
function submitForm(){
	search();
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/arvoice/arvoice!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"arvoicelistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.voiceName)+'</td>';
					html+='<td>'+replaceNull(o.actionName)+'</td>';
					html+='<td>'+replaceNull(o.voicePath)+'</td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}

/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#voiceName').val("");
	$('#actionName').val("");
	$('#voicePath').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#voiceName').val().trim()==""){
		newAlert("必须输入名称!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/arvoice/arvoice!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('inputDiv');
					search();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 编辑
 * @param id
 */
function toEdit(){
	$('#voiceName').val("");
	$('#actionName').val("");
	$('#voicePath').val("");
	$('#fmark').val("");
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid = $(o).val();
		cnt++;
	});
	if(cnt>1){
		newAlert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		newAlert("请选择一条编辑的记录!");
		return;
	}
	var url = ctx+"/arvoice/arvoice!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"arvoiceId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#voiceName').val(replaceNull(data.model.voiceName));
				$('#actionName').val(replaceNull(data.model.actionName));
				$('#voicePath').val(data.model.voicePath);
				$('#filepath').val(data.model.voicePath);
				$('#fileshow').val(data.model.voicePath);
				$('#fmark').val(data.model.fmark);
				openDiv('inputDiv');
			}
		}
	});
}
/**
 * 删除
 * @param id
 */
function toDelete(id){
	var param = {};
	if(id) {
		param['checkedIdList[0]'] = id;
	} else {		
		var delareas = $('[name="checkedIdList"]:checked');
		var cnt = 0;
		$.each(delareas, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		newAlert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/arvoice/arvoice!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("删除成功!");
					search();
				}
			}
		});
	}
}
