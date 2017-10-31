$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'interactgamelistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_interact_game.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
	$('#tagName').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif;',// 文件过滤器
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
	$('#resImg').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif;*.mp4;*.mpeg;*.mp3;*.wma;*.avi',// 文件过滤器
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
	});
	$('#interactIcon').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;',// 文件过滤器
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
			$('#fileshowinter').val(data.oldName);
			$('#filepathinter').val(data.resPath);
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
	var url = ctx+"/interactGame/interact-game!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"interactgamelistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.fname)+'</td>';
					html+='<td>'+replaceNull(o.ftype)+'</td>';
					html+='<td>'+replaceNull(o.fcontent)+'</td>';
					html+='<td>'+replaceNull(o.fanswer)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.interactIcon)+'\');">预览</a></td>';
					html+='<td>'+replaceNull(o.fdesc)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="toDetail('+o.id+','+o.ftype+')">设置</a></td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function lookcdicon(filepath){
	$('#cdicon').attr("src",getWebRootPath()+"/"+filepath);
	openDiv('cdiconDiv');
}
/**
 * 查看详情
 * @param id
 */
function toDetail(id,ftype){
	$('#hiddengameId').val(id);
	$('#fileshowres').val("");
	$('#filepathres').val("");
	if(ftype==1){
		$('#tagNameTR').css("display","none");
		$('#equalNumberTR').css("display","");
	}else{
		$('#equalNumberTR').css("display","none");
		$('#tagNameTR').css("display","");
	}
	var url = ctx+"/interactGameentry/interact-gameentry!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"interactGameentryQuery.gameId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = "";
				$.each(data.interactGameentryList,function(i,o){
					if(i==0||i%4==0){
						if(i!=0&&i%4==0){
							html += "</tr>";
							html += "<tr>";
						}else{
							html += "<tr>";
						}
					}
					html += '<td><img src="'+getWebRootPath()+'/'+o.resImg+'" style="width:120px;height:120px;"/></td>';
					if(i==data.interactGameentryList.length-1){
						html += "</tr>";
					}
				});
				if(ftype == 2){
					$.each(data.interactGameentryList,function(i,o){
						if(i==0||i%4==0){
							if(i!=0&&i%4==0){
								html += "</tr>";
								html += "<tr>";
							}else{
								html += "<tr>";
							}
						}
						html += '<td><img src="'+getWebRootPath()+'/'+o.tagName+'" style="width:120px;height:120px;"/></td>';
						if(i==data.interactGameentryList.length-1){
							html += "</tr>";
						}
					});
				}
				$.each(data.interactGameentryList,function(i,o){
					if(i==0||i%4==0){
						if(i!=0&&i%4==0){
							html += "</tr>";
							html += "<tr>";
						}else{
							html += "<tr>";
						}
					}
					html += '<td>'+replaceNull(o.equalNumber)+'</td>';
					if(i==data.interactGameentryList.length-1){
						html += "</tr>";
					}
				});
				$.each(data.interactGameentryList,function(i,o){
					if(i==0||i%4==0){
						if(i!=0&&i%4==0){
							html += "</tr>";
							html += "<tr>";
						}else{
							html += "<tr>";
						}
					}
					html += '<td><a href="javascript:void(0);" onclick="toDeleteDetail('+o.id+');">删除</a></td>';
					if(i==data.interactGameentryList.length-1){
						html += "</tr>";
					}
				});
				$('#contentimages').html(html);
				openDiv('gameentryDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function loadImages(id){
	var url = ctx+"/interactGameentry/interact-gameentry!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"interactGameentryQuery.gameId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = "";
				var ftype = 0;
				$.each(data.interactGameentryList,function(i,o){
					if(i==0||i%4==0){
						if(i!=0&&i%4==0){
							html += "</tr>";
							html += "<tr>";
						}else{
							html += "<tr>";
						}
					}
					html += '<td><img src="'+getWebRootPath()+'/'+o.resImg+'" style="width:120px;height:120px;"/></td>';
					if(i==data.interactGameentryList.length-1){
						html += "</tr>";
					}
					if(null!=o.tagName&&""!=o.tagName&&undefined!=o.tagName){
						ftype = 2;
					}
				});
				if(ftype == 2){
					$.each(data.interactGameentryList,function(i,o){
						if(i==0||i%4==0){
							if(i!=0&&i%4==0){
								html += "</tr>";
								html += "<tr>";
							}else{
								html += "<tr>";
							}
						}
						html += '<td><img src="'+getWebRootPath()+'/'+o.tagName+'" style="width:120px;height:120px;"/></td>';
						if(i==data.interactGameentryList.length-1){
							html += "</tr>";
						}
					});
				}
				$.each(data.interactGameentryList,function(i,o){
					if(i==0||i%4==0){
						if(i!=0&&i%4==0){
							html += "</tr>";
							html += "<tr>";
						}else{
							html += "<tr>";
						}
					}
					html += '<td><a href="javascript:void(0);" onclick="toDeleteDetail('+o.id+');">删除</a></td>';
					if(i==data.interactGameentryList.length-1){
						html += "</tr>";
					}
				});
				$('#contentimages').html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#fname').val("");
	$('#ftype').val("");
	$('#fcontent').val("");
	$('#fdesc').val("");
	$('#fanswer').val("");
	$('#gameaward').val("");
	$('#gameawardpackage').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#fname').val().trim()==""){
		newAlert("必须输入互动名称!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/interactGame/interact-game!saveToJson.htm";
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
	var url = ctx+"/interactGame/interact-game!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"interactGameId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#fname').val(replaceNull(data.model.fname));
				$('#ftype').val(replaceNull(data.model.ftype));
				$('#fcontent').val(data.model.fcontent);
				$('#fdesc').val(data.model.fdesc);
				$('#fanswer').val(data.model.fanswer);
				$('#gameaward').val(data.model.gameaward);
				$('#gameawardpackage').val(data.model.gameawardpackage);
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
		var url = ctx+"/interactGame/interact-game!deleteToJson.htm";
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
/**
 * 保存明细
 */
function saveentry(){
	var hid = $('#hiddenId').val();
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputentryForm').serialize();
		var url = ctx+"/interactGameentry/interact-gameentry!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					$('#fileshowres').val("");
					$('#filepathres').val("");
					loadImages($('#hiddengameId').val());
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 删除明细
 * @param id
 */
function toDeleteDetail(id){
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
		var url = ctx+"/interactGameentry/interact-gameentry!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					loadImages($('#hiddengameId').val());
				}
				closeblockdiv();
			}
		});
	}
}
function changetype(){
	
}