$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'yqkitempage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_yqkitem.id',
		submitForm : submitForm//分页回调函数
	});	
	loadyqtitem();
	search();
	$('#itemicon').uploadify({
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
		}
	});
});
function submitForm(){
	search();
}
function loadyqtitem(){
	var url = ctx+"/yqkitem/yqkitem!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yqkitemQuery.flevel=1",
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = "";
				html+='<option value="">无</option>';
				$.each(data.yqkitemList,function(i,o){
					html+='<option value="'+o.id+'">'+o.itemclassName+'</option>';
				});
				$('#parentId').html(html);
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
	var url = ctx+"/yqkitem/yqkitem!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"yqkitempage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var itemType = "";
					if(null==o.itemType||''==o.itemType){
						return true;
					}
					if(o.itemType.indexOf("GAMELANG")>=0){
						itemType += "语言学习<br/>";
					}
					if(o.itemType.indexOf("GAMEDRAW")>=0){
						itemType += "绘画<br/>";
					}
					if(o.itemType.indexOf("GAMEMUSIC")>=0){
						itemType += "音乐<br/>";
					}
					if(o.itemType.indexOf("GAMESPATIAL")>=0){
						itemType += "空间想象<br/>";
					}
					if(o.itemType.indexOf("GAMELOGICAL")>=0){
						itemType += "逻辑思维<br/>";
					}
					if(o.itemType.indexOf("GAMESPORT")>=0){
						itemType += "运动<br/>";
					}
					if(o.itemType.indexOf("GAMEMATH")>=0){
						itemType += "数学<br/>";
					}
					if(o.itemType.indexOf("GAMEEMOTION")>=0){
						itemType += "情感沟通<br/>";
					}
					
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.itemclassName)+'</td>';
					html+='<td>'+replaceNull(o.parentName)+'</td>';
					html+='<td>'+itemType+'</td>';
					html+='<td>'+o.flevel+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.itemicon)+'\');">预览</a></td>';
					html+='<td>'+replaceNull(o.fdesc)+'</td>';
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
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#itemclassName').val("");
	$('#flevel').val("");
	$('#parentId').val("");
	$('#itemicon').val("");
	$('#fdesc').val("");
	$('#fileshow').val("");
	$('#filepath').val("");
	var itemTypeAll = $('input[name="itemType"]');
	for(var i = 0;i<itemTypeAll.length;i++){
		itemTypeAll[i].checked = false;
	}
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#itemclassName').val().trim()==""){
		newAlert("必须输入名称!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/yqkitem/yqkitem!saveToJson.htm";
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
	var itemTypeAll = $('input[name="itemType"]');
	for(var i = 0;i<itemTypeAll.length;i++){
		itemTypeAll[i].checked = false;
	}
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
	var url = ctx+"/yqkitem/yqkitem!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yqkitemId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#itemclassName').val(replaceNull(data.model.itemclassName));
				$('#flevel').val(replaceNull(data.model.flevel));
				$('#fdesc').val(data.model.fdesc);
				$('#parentId').val(data.model.parentId);
				$('#resIcon').val(data.model.resIcon);
				$('#resourceUrl').val(data.model.resourceUrl);
				var itemTypeAll = $('input[name="itemType"]');
				var itemTypeBack = data.model.itemType.split(",");
				for(var n = 0;n<itemTypeBack.length;n++){
					for(var i = 0;i<itemTypeAll.length;i++){
						if(itemTypeAll[i].value == trimLeft(itemTypeBack[n]) ) {
							itemTypeAll[i].checked = true;
						}
					}
				}
				openDiv('inputDiv');
			}
		}
	});
}
//去掉左边的空白  
function trimLeft(s){  
    if(s == null) {  
        return "";  
    }  
    var whitespace = new String(" \t\n\r");  
    var str = new String(s);  
    if (whitespace.indexOf(str.charAt(0)) != -1) {  
        var j=0, i = str.length;  
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){  
            j++;  
        }  
        str = str.substring(j, i);  
    }  
    return str;  
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
		var url = ctx+"/yqkitem/yqkitem!deleteToJson.htm";
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
