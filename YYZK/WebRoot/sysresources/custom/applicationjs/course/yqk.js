$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'yqklistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_yqk.id',
		submitForm : submitForm//分页回调函数
	});	
	loadyqtitem();
	search();
	$('#resIcon').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif',// 文件过滤器
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
			nowpre = data.resPath;
		}
	});
	/*$('#resourceUrl').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif;*.wmv;*.mpeg;*.mp4;',// 文件过滤器
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
			$('#fileshowres').val(data.oldName);
			$('#filepathres').val(data.resPath);
		}
	});*/
});
function submitForm(){
	search();
}
function loadyqtitem(){
	var url = ctx+"/yqkitem/yqkitem!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"",
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = "";
				$.each(data.yqkitemList,function(i,o){
					html+='<option value="'+o.id+'">'+o.itemclassName+'</option>';
				});
				$('#ftype').html(html);
			}
		}
	});
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/yqk/yqk!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"yqklistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.fname)+'</td>';
					//html+='<td>'+o.ftypeName+'</td>';
					html+='<td>'+replaceNull(o.ftypeName)+'</td>';
					html+='<td>'+replaceNull(o.times)+'</td>';
					html+='<td>'+replaceNull(o.videoseq)+'</td>';
					html+='<td><a href="http://player.youku.com/embed/'+o.videoId+'" target="_blank">'+replaceNull(o.videoId)+'</a></td>';
					/*html+='<td>'+replaceNull(o.uuid)+'</td>';
					html+='<td>'+replaceNull(o.vuid)+'</td>';*/
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.resIcon)+'\');">预览</a></td>';
					//html+='<td>'+replaceNull(o.resourceUrl)+'</td>';
					html+='<td>'+replaceNull(o.fdesc)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 查看详情
 * @param id
 */
function toDetail(id){
	window.location.href=ctx+"/designassist/designlistdetail.htm?did="+id;
}

function lookcdicon(filepath){
	$('#cdicon').attr("src",filepath);//getWebRootPath()+"/"+filepath
	openDiv('cdiconDiv');
}
var nowpre = "";
function lookcdiconnow(){
	$('#cdicon').attr("src",getWebRootPath()+"/"+nowpre);
	openDiv('cdiconDiv');
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#fname').val("");
	$('#times').val("20");
	$('#resIcon').val("");
	//$('#ftype').val("1");
	$('#videoseq').val("");
	//$('#resourceUrl').val("");
	$('#videoId').val("");
	$('#album').val("");
	/*$('#uuid').val("");
	$('#vuid').val("");*/
	$('#fesc').val("");
	$('#fileshowres').val("");
	$('#filepathres').val("");
	$('#fileshow').val("");
	$('#filepath').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	if($('#resourceType').val()==1){//85825372
		$('#filepathres').val($('#fileshowres').val());
	}
	var hid = $('#hiddenId').val();
	/*if($('#fname').val().trim()==""){
		newAlert("必须输入名称!");
		return;
	}*/
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/yqk/yqk!saveToJson.htm";
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
	$('#videoId').val("");
	$('#album').val("");
	/*$('#uuid').val("");
	$('#vuid').val("");*/
	$('#hiddenId').val("");
	$('#fname').val("");
	$('#times').val("");
	$('#resIcon').val("");
	//$('#ftype').val("1");
	$('#resourceType').val("1");
	$('#videoseq').val("");
	//$('#resourceUrl').val("");
	$('#fesc').val("");
	$('#fileshowres').val("");
	$('#filepathres').val("");
	$('#fileshow').val("");
	$('#filepath').val("");
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
	var url = ctx+"/yqk/yqk!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yqkId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#fname').val(replaceNull(data.model.fname));
				$('#ftype').val(replaceNull(data.model.ftype));
				$('#fdesc').val(data.model.fdesc);
				$('#times').val(data.model.times);
				$('#videoId').val(replaceNull(data.model.videoId));
				$('#videoseq').val(data.model.videoseq);
				$('#resourceType').val(data.model.resourceType);
				$('#album').val(replaceNull(data.model.album));
				/*$('#uuid').val(replaceNull(data.model.uuid));
				$('#vuid').val(replaceNull(data.model.vuid));*/
				$('#resIcon').val(data.model.resIcon);
				$('#fileshow').val(data.model.resIcon);
				nowpre = data.model.resIcon;
				//$('#resourceUrl').val(data.model.resourceUrl);
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
		var url = ctx+"/domain/domain!deleteToJson.htm";
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
function changerestype(){
	var restype = $('#resourceType').val();
	if(restype==1){
		$('#fileshowres').removeAttr("readonly");
	}else if(restype==2){
		$('#fileshowres').attr("readonly","readonly");
	}else{
		
	}
}
function toExport(){
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx+ "/yqk/yqk!exportAllExcel2007.htm";
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}