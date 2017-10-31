$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'coursedetaillistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_course_detail.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
	loadInteract();
	loadCourses();
	$('#courseDetailIcon').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif;*.mp4;*.mpeg;*.wmv',// 文件过滤器
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
	/*$('#courseDetailRes').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif;*.mp4;*.mpeg;*.wmv',// 文件过滤器
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
			$('#fileshowRes').val(data.oldName);
			$('#filepathRes').val(data.resPath);
		}
	});*/
});
function submitForm(){
	search();
}
function loadCourses(){
	var url = ctx+"/course/course!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'',
		success : function(data) {
			data = $.parseJSON(data);
			var html = "";
			$.each(data.courseList,function(i,o){
				html+='<option value="'+o.id+'">'+replaceNull(o.courseName)+'</option>';
			});
			$('#courseId').html(html);
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
	var url = ctx+"/courseDetail/course-detail!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"coursedetaillistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var courseDetailType = '';
				$.each(page.result,function(i,o){
					if(o.courseDetailType==1){
						courseDetailType = "纯文本";
					}else if(o.courseDetailType==2){
						courseDetailType = "纯音乐";
					}else if(o.courseDetailType==3){
						courseDetailType = "纯图片";
					}else if(o.courseDetailType==4){
						courseDetailType = "依云视频";
					}else if(o.courseDetailType==5){
						courseDetailType = "网络视频";
					}else if(o.courseDetailType==6){
						courseDetailType = "图文混排";
					}else if(o.courseDetailType==7){
						courseDetailType = "图音混排";
					}else if(o.courseDetailType==8){
						courseDetailType = "图视混排";
					}else if(o.courseDetailType==9){
						courseDetailType = "文视混排";
					}else{
						courseDetailType = "未知";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.courseDetailNo)+'</td>';
					html+='<td>'+replaceNull(o.course.courseName)+'</td>';
					html+='<td>'+replaceNull(o.courseDetailName)+'</td>';
					html+='<td>'+courseDetailType+'</td>';
					html+='<td>'+replaceNull(o.courseDetailTimes)+'</td>';
					html+='<td><a href="http://player.youku.com/embed/'+o.videoId+'" target="_blank">'+replaceNull(o.videoId)+'</a></td>';
					/*html+='<td>'+replaceNull(o.uuid)+'</td>';
					html+='<td>'+replaceNull(o.vuid)+'</td>';*/
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.courseDetailIcon)+'\');">预览</a></td>';
					//html+='<td>'+replaceNull(o.courseDetailRes)+'</td>';
					html+='<td>'+replaceNull(o.courseDetailDesc)+'</td>';
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
	$('#cdicon').attr("src",getWebRootPath()+"/"+filepath);
	openDiv('cdiconDiv');
}
var nowpre = "";
function lookcdiconnow(){
	$('#cdicon').attr("src",getWebRootPath()+"/"+nowpre);
	openDiv('cdiconDiv');
}
function kslxchange(){
	var kslxtype = $('#courseDetailType').val();
	if(kslxtype==5){
		$('#fileshowRes').removeAttr("readonly");
	}else{
		$('#fileshowRes').attr("readonly","readonly");
	}
}
function loadInteract(){
	var url = ctx+"/interactGame/interact-game!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'',
		success : function(data) {
			data = $.parseJSON(data);
			var html = "<option value='0'>请选择互动内容</option>";
			$.each(data.interactGameList,function(i,o){
				html+='<option value="'+o.id+'">'+replaceNull(o.fname)+'</option>';
			});
			$('#interactId').html(html);
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#courseId').val("");
	$('#courseDetailName').val("");
	$('#courseDetailNo').val("");
	$('#courseDetailTimes').val("");
	$('#videoId').val("");
	$('#album').val("");
	$('#gameaward').val("");
	$('#gameawardpackage').val("");
	$('#interactId').val("");
	/*$('#uuid').val("");
	$('#vuid').val("");*/
	$('#courseDetailIcon').val("");
	//$('#courseDetailRes').val("");
	$('#fileshowRes').val("");
	$('#fileshow').val("");
	$('#filepathRes').val("");
	$('#filepath').val("");
	$('#courseDetailDesc').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#courseDetailName').val().trim()==""){
		newAlert("必须输入课时名称!");
		return;
	}
	if($('#courseDetailTimes').val().trim()==""){
		newAlert("必须输入课时时长!");
		return;
	}
	if($('#fileshowRes').val()!=''&&(null==$('#filepathRes').val()||$('#filepathRes').val()=='')){
		$('#filepathRes').val($('#fileshowRes').val());
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/courseDetail/course-detail!saveToJson.htm";
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
	$('#hiddenId').val("");
	$('#courseId').val("");
	$('#courseDetailName').val("");
	$('#courseDetailNo').val("");
	$('#courseDetailTimes').val("");
	$('#videoId').val("");
	$('#album').val("");
	$('#gameaward').val("");
	$('#gameawardpackage').val("");
	$('#interactId').val("");
	/*$('#uuid').val("");
	$('#vuid').val("");*/
	$('#courseDetailIcon').val("");
	//$('#courseDetailRes').val("");
	$('#fileshowRes').val("");
	$('#fileshow').val("");
	$('#filepathRes').val("");
	$('#filepath').val("");
	$('#courseDetailDesc').val("");
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
	var url = ctx+"/courseDetail/course-detail!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"courseDetailId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#courseId').val(replaceNull(data.model.courseId));
				$('#courseDetailNo').val(replaceNull(data.model.courseDetailNo));
				$('#courseDetailName').val(replaceNull(data.model.courseDetailName));
				$('#courseDetailType').val(replaceNull(data.model.courseDetailType));
				$('#courseDetailTimes').val(replaceNull(data.model.courseDetailTimes));
				$('#videoId').val(replaceNull(data.model.videoId));
				$('#album').val(replaceNull(data.model.album));
				$('#gameaward').val(replaceNull(data.model.gameaward));
				$('#gameawardpackage').val(replaceNull(data.model.gameawardpackage));
				$('#interactId').val(replaceNull(data.model.interactId));
				/*$('#uuid').val(replaceNull(data.model.uuid));
				$('#vuid').val(replaceNull(data.model.vuid));*/
				$('#courseDetailDesc').val(data.model.courseDetailDesc);
				$('#courseDetailIcon').val(data.model.courseDetailIcon);
				//$('#courseDetailRes').val(data.model.courseDetailRes);
				$('#filepath').val(data.model.courseDetailIcon);
				$('#fileshow').val(data.model.courseDetailIcon);
				nowpre = data.model.courseDetailIcon;
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
		var url = ctx+"/courseDetail/course-detail!deleteToJson.htm";
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
