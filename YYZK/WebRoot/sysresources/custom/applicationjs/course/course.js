$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'courselistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_course.id',
		submitForm : submitForm//分页回调函数
	});	
	loadDomain();
	search();
	$('#courseIcon').uploadify({
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
			nowpre1 = data.resPath;
		}
	});
	$('#contentImgPath').uploadify({
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
			$('#fileshowcimg').val(data.oldName);
			$('#filepathcimg').val(data.resPath);
			nowpre2 = data.resPath;
		}
	});
});
function submitForm(){
	search();
}
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/course/course!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"courselistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.courseName)+'</td>';
					html+='<td>'+replaceNull(o.domainName)+'</td>';
					html+='<td>'+replaceNull(o.courseseq)+'</td>';
					html+='<td>'+replaceNull(o.courseTimes)+'</td>';
					html+='<td>'+(null==o.startAge?0:o.startAge)+'-'+(null==o.endAge?10:o.endAge)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.courseIcon)+'\');">预览</a></td>';
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.contentImgPath)+'\');">预览</a></td>';
					html+='<td>'+replaceNull(o.courseDesc)+'</td>';
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
var nowpre1 = "";
var nowpre2 = "";
function lookcdiconnow(ltype){
	if(ltype==1){
		$('#cdicon').attr("src",getWebRootPath()+"/"+nowpre1);
	}else if(ltype==2){
		$('#cdicon').attr("src",getWebRootPath()+"/"+nowpre2);
	}else{
		
	}
	openDiv('cdiconDiv');
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#courseName').val("");
	$('#courseseq').val("");
	$('#courseTimes').val("");
	$('#courseIcon').val("");
	$('#courseDesc').val("");
	$('#domainSelect').val("");
	$('#domainId').val("");
	$('#domainCode').val("");
	$('#startAge').val("");
	$('#endAge').val("");
	$('#contentImgPath').val("");
	$('#filepathcimg').val("");
	$('#fileshowcimg').val("");
	$('#filepath').val("");
	$('#fileshow').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#courseName').val().trim()==""){
		newAlert("必须输入课程名称!");
		return;
	}
	if($('#courseTimes').val().trim()==""){
		newAlert("必须输入课程时长!");
		return;
	}
	if($('#startAge').val().trim()==""){
		newAlert("必须输入起始年龄!");
		return;
	}
	if($('#endAge').val().trim()==""){
		newAlert("必须输入结束年龄!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/course/course!saveToJson.htm";
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
	$('#courseName').val("");
	$('#courseseq').val("");
	$('#courseTimes').val("");
	$('#courseIcon').val("");
	$('#courseDesc').val("");
	$('#domainSelect').val("");
	$('#domainId').val("");
	$('#domainCode').val("");
	$('#startAge').val("");
	$('#endAge').val("");
	$('#contentImgPath').val("");
	$('#filepathcimg').val("");
	$('#fileshowcimg').val("");
	$('#filepath').val("");
	$('#fileshow').val("");
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
	var url = ctx+"/course/course!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"courseId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#courseName').val(replaceNull(data.model.courseName));
				$('#courseseq').val(replaceNull(data.model.courseseq));
				$('#courseTimes').val(replaceNull(data.model.courseTimes));
				$('#courseDesc').val(data.model.courseDesc);
				$('#courseIcon').val(data.model.courseIcon);
				$('#contentImgPath').val(data.model.contentImgPath);
				$('#domainSelect').val(data.model.domainId+","+data.model.domainCode);
				$('#domainId').val(data.model.domainId);
				$('#domainCode').val(data.model.domainCode);
				$('#startAge').val(data.model.startAge);
				$('#endAge').val(data.model.endAge);
				$('#filepath').val(data.model.courseIcon);
				$('#filepathcimg').val(data.model.contentImgPath);
				$('#fileshow').val(data.model.courseIcon);
				$('#fileshowcimg').val(data.model.contentImgPath);
				nowpre1 = data.model.courseIcon;
				nowpre2 = data.model.contentImgPath;
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
	var flag = window.confirm("确定删除所选课程以及课程中的课时吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/course/course!deleteToJson.htm";
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
 * 加载领域信息
 * @param id
 */
function loadDomain(){
	var url = ctx+"/domain/domain!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"",
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.domainList,function(i,o){
					if(i==0){
						$('#domainId').val(o.id);
						$('#domainCode').val(o.domainCode);
					}
					html+='<option value="'+o.id+','+o.domainCode+'">'+o.domainName+'</option>';
				});
				$('#domainSelect').html(html);
			}
		}
	});
}
function changedomain(){
	var val = $('#domainSelect').val();
	$('#domainId').val(val.split(",")[0]);
	$('#domainCode').val(val.split(",")[1]);
}