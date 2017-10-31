$(function(){
	window.simpleTable =$(document).SimpleTable({
		id:'helppage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_help_files.id',
		submitForm : search//分页回调函数
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
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			$('#fileName').val(data.srcfilename);
			$('#filePath').val(data.filename);
		}/*,
		'onUploadStart': function (file) {  
			//上传前动态传递参数
            $("#fileUpload").uploadify("settings", "formData", { 'folderName':$('#maker').val()});   
        }  */
	});
	loadMenu();
	
});
//加载列表
function search(){
	openblockdiv();
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx + '/helpFiles/help-files!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"helppage",simpleTable);
			//组装table
			var html = '';
			$.each(page.result, function(i, o){
				html += '<tr>';
				html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' +o.id  + '"/></td>';
				html += '<td>' + (i+1) + '</td>';
				html += '<td><a href="javascript:showFile(\''+o.filePath+'\')">' + o.menuName + '</td>';
				html += '<td>' + replaceNull(o.uploaderName) + '</td>';
				html += '<td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.createTime) + '</td>';
				html +='<td>' + replaceNull(o.modifyName) + '</td>';
				html += '<td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.modifyTime) + '</td>';
				html += '<td>'+'<a href="javascript:toEditFile('+o.id+');">编辑</a>|';
				html += '<a href="javascript:loadFile('+o.id+',\''+o.filePath+'\');">下载</a></td>';
				html += '</tr>';
			});
			$('#data-body').html(html);
			closeblockdiv();
		}
	});
}
//在线预览文件
function showFile(path){
	var usepath = path.substring(0,path.lastIndexOf("."));
	openDiv('showDiv');
	new FlexPaperViewer(	
			ctx+'/FlexPaperViewer',
			 //'/FlexPaperViewer',
			 'viewerPlaceHolder', 
			 { 
				 config : {
					 SwfFile : escape(usepath+'.swf'),
					 //SwfFile : escape('D:\\1.swf'),
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

//添加
function addDiv(){
	clearValues();
	openDiv("inputDiv");
}
//下载
function loadFile(id,path){
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx+"/helpFiles/help-files!loadFiles.htm?helpFilesId="+id;
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}

//编辑
function toEditFile(id){
	clearValues();
	var url = ctx+'/helpFiles/help-files!showToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :'helpFilesId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#menuName').val(data.model.menuName==null?"":data.model.menuName);
				$('#menuId').val(data.model.menuId==null?"":data.model.menuId);
				$('#filePath').val(data.model.filePath==null?"":data.model.filePath);
				$('#fileName').val(data.model.fileName==null?"":data.model.fileName);
				$('#hiddenid').val(data.model.id==null?"":data.model.id);
				openDiv('inputDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
//清空输入项值
function clearValues(){
	$('#menuName').val("");
	$('#menuId').val("");
	$('#filePath').val("");
	$('#fileName').val("");
	$('#hiddenid').val("");
}
//保存
function save(){
	//验证各输入项
	var menuName = $("#menuName").val();
	if(!menuName){
		alert("菜单名称不能为空！");
		return;
	}
	var fileName = $("#fileName").val();
	if(!fileName){
		alert("上传文件不能为空！");
		return;
	}
	var inputForm = $('#inputForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/helpFiles/help-files!saveToJson.htm',
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
			}
		});
	}
}

//加载菜单
function loadMenu(){
	var url = ctx+"/helpFiles/help-files!listMenuAll.htm";
	$.webAjax({
		type : "post",
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var options = "";
				$.each(data.menusList,function(i,o){
						options += "<option value='"+o.id+"'>"+o.name+"</option>";
				});
				$('#menuId').html(options);
				options = "<option value=''>-----</option>"+options;
				$('#menuIdQuery').html(options);
				search();
			}
		}
	});
}
//选择框改变值
function changeMenu(){
	var sel = $("#menuId").val();
	var txt = $('#menuId').find("option:selected").text();
	$("#menuName").attr("value",txt);
}
//删除
function del(helpid){
	var param = {};
	if(helpid) {
		param['checkedIdList[0]'] = helpid;
	} else {		
		var delBlocs = $('[name="checkedIdList"]:checked');
		var cnt = 0;
		$.each(delBlocs, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的帮助文档！');
		return;
	}
	
	if(!confirm('确定删除帮助文档吗？')) {
		return;
	}
	var url = ctx + '/helpFiles/help-files!deleteToJson.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				search();
			} else {
				alert('删除帮助文档失败！');
			}
		}
	});
}
