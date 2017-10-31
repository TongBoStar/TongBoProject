$(function(){
	window.simpleTable =$(document).SimpleTable({
		id:'propage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_project_files.id',
		submitForm : loadProjectFiles//分页回调函数
	});
	$('#fileUpload').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/uploadProject.htm',// 处理Action
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
        'scriptData': {'folderName':$('#maker').val()},
        /*'formData':{'folderName':$('#maker').val()},*/
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
		},
		'onUploadStart': function (file) {  
			//上传前动态传递参数
            $("#fileUpload").uploadify("settings", "formData", { 'folderName':$('#maker').val()});   
        }  
	});
	loadMeasureCategory();
	loadProjectFiles();
});
function loadProjectFiles(){
	openblockdiv();
	$('.spinner.demo').show();
	$('.spinner.demo').css("opacity","0.6").css("zIndex","9999");
	$("#makerquery").val("");
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx + '/projectFiles/project-files!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"propage",simpleTable);
			//组装table
			var html = '';
			$.each(page.result, function(i, o){
				html += '<tr>';
				html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' +o.id  + '"/></td>';
				html += '<td>' + (i+1) + '</td>';
				html += '<td><a href="javascript:showFile(\''+o.filePath+'\')">' + o.fileName + '</td><td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.createTime) + '</td>';
				html += '<td>' + replaceNull(o.uploader) + '</td>';
				html += '<td>' + replaceNull(o.filetype) + '</td>';
				html +='<td>' + replaceNull(o.maker) + '</td>';
				html +='<td>' + formatDate("yyyy-MM-dd",o.validitydate) + '</td>';
				html +='<td>' + replaceNull(o.fnote) + '</td>';
				html += '<td>'+'<a href="javascript:toEditFile('+o.id+');">编辑</a>|';
				html += '<a href="javascript:loadFile('+o.id+',\''+o.filePath+'\');">下载</a></td>';
				html += '</tr>';
			});
			$('#data-body').html(html);
			closeblockdiv();
		}
	});
}
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
function loadMeasureCategory(){
	
	$('#navigation').html('<img src="'+ctx+'/images/icon_load.gif"/>');
		var html='';
		var url = ctx+"/projectMakertree/project-makertree!listToTree.htm";
			$.webAjax( {
				type : "post",
				url : url,
				success : function(data) {
				data = $.parseJSON(data);
					if(data.resultInfo[0]=='0')
					{
						$('#navigation').html(data.tree);
						inittreeview();
						bindright();
						$('.col-md-3').css("display","");
					}else{
						alert(data.resultInfo[1]);
					}				
				}
			});
}
function inittreeview()
{
	$("#navigation").treeview({
		animated: "fast",
		collapsed: true,
		unique: true,
		control: "#treecontrol",
		persist: "cookie",
		cookieId: "treeview-black"
	});
}

function bindright()
{
	$('#navigation span:first').contextMenu('myMenu1', {
		bindings: {
			'add1': function(t) {
				var strid = $(t).attr('ref');
				$("#makerid").val("");
				$("#makername").val("");
				$("#makerpid").val(strid==null?"":strid);
				openDiv('makerDiv');				
			 }
		}
	});	
	
	
	
	$('#navigation span[id!=li0]').contextMenu('myMenu', {
		bindings: {
			'add': function(t) {
				var strid = $(t).attr('ref');
				$("#makerid").val("");
				$("#makername").val("");
				$("#makerpid").val(strid==null?"":strid);
				openDiv('makerDiv');	
			 },
			 'edit': function(t) {
				var strid = $(t).attr('ref');
				var url = ctx+"/projectMakertree/project-makertree!showToJson.htm";
				$.webAjax( {
					type : "post",
					url : url,
					data:'projectMakertreeId='+strid,
					success : function(data) {
						data = $.parseJSON(data);
						var model=data.model;
						$("#makerid").val(model.id==null?"":model.id);
						$("#makername").val(model.fname==null?"":model.fname);
						$("#makerpid").val(model.fparentid==null?"":model.fparentid);
					}
				});	
				openDiv('makerDiv');	
			 },
			 /*'delete': function(t) {
				var blocid = $(t).attr('ref');
				if(!confirm('确定删除生产商以及子节点吗？')) {
					return;
				}
				var url = ctx + '/projectMakertree/project-makertree!deleteAlone.htm?pdparameterId='+blocid;
				$.webAjax( {
					type : 'post',
					url : url,
					success : function(data) {
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0'){
							$('#navigation').html(data.tree);
							inittreeview();
							bindright();
						} else {
							alert('删除数据失败！');
						}
					}
				});
			 },*/
			 'addfile':function(t) {
					var strid = $(t).attr('ref');
					var name = $(t).attr('name');
					$('#fileName').val('');
					$('#fileUpload').val('');
					$('#filetype').val('');
					$('#validitydate').val('');
					$('#fnote').val('');
					$('#hiddenid').val('');
					$('#maker').val(name);
					openDiv('inputDiv');
			}
		}
	});	
	
}


function closeAddDiv(){
	$.closeDiv("inputDiv");
}
function openDivAction(){
	art.dialog({
		id: 'inputDiv',
		padding: '50px',
		width:500,
		height:400,
		opacity:0.6,
		title: '添加/修改文件信息',
		content: $('#inputDiv').html(),
		lock:true,
		drag: true,
		resize: true,
		zIndex:99999,
		ok:function(){
			save();
		},
		cancel:true
	});
}
function loadFile(id,path){
	 var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+"/projectFiles/project-files!loadFiles.htm?projectFilesId="+id;
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
/**
 * 下载文件
 * @param path 下载的文件的路径
 */
function loadFile_error(id,path){
	  var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+path;
	  //alert("elemIF.src:"+elemIF.src);
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
function toEditFile(id){
	var url = ctx+'/projectFiles/project-files!showToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :'projectFilesId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				//openDivAction();
				$('#fileName').val(data.model.fileName==null?"":data.model.fileName);
				$('#filetype').val(data.model.filetype==null?"":data.model.filetype);
				$('#maker').val(data.model.maker==null?"":data.model.maker);
				$('#validitydate').val(data.model.validitydate==null?"":formatDate("yyyy-MM-dd",data.model.validitydate));
				$('#fnote').val(data.model.fnote==null?"":data.model.fnote);
				$('#hiddenid').val(data.model.id==null?"":data.model.id);
				openDiv('inputDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function save(){
	//验证各输入项
	var fileName = $("#fileName").val();
	if(!fileName){
		alert("文件名称不能为空！");
		//return;
	}
	var filetype = $("#filetype").val();
	if(!filetype){
		alert("文件类型不能为空！");
		return;
	}
	var maker = $("#maker").val();
	if(!maker){
		alert("厂家不能为空！");
		return;
	}
	var validitydate = $("#validitydate").val();
	if(!validitydate){
		alert("有效期不能为空！");
		return;
	}
	var inputForm = $('#inputForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/projectFiles/project-files!saveToJson.htm',
			data :inputForm,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("操作成功!");
					loadProjectFiles();
				}else{
					alert(data.resultInfo[1]);
				}
				closeDiv('inputDiv');
				$('.spinner.demo').fadeOut('slow');
			}
		});
	}
}

function saveMaker(){
	var makername = $("#makername").val();
	if(!makername){
		alert("生产商名称不能为空！");
		return;
	}
	var inputForm = $('#makerForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/projectMakertree/project-makertree!saveToJson.htm',
			data :inputForm,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("操作成功!");
					closeMakerDiv();
					loadMeasureCategory();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
function closeMakerDiv(){
	$.closeDiv("makerDiv");
}

function searchlist(name){
	$("#makerquery").val(name);
	$("#namequery").val("");
	$("#uploaderquery").val("");
	$("#validitydatequery").val("");
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+ '/projectFiles/project-files!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"propage",simpleTable);
			//组装table
			var html = '';
			$.each(page.result, function(i, o){
				html += '<tr>';
				html += '<td><input type="checkbox"/></td>';
				html += '<td>' + (i+1) + '</td>';
				html += '<td><a href="javascript:showFile(\''+o.filePath+'\')">' + o.fileName + '</td><td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.createTime) + '</td>';
				html += '<td>' + replaceNull(o.uploader) + '</td>';
				html += '<td>' + replaceNull(o.filetype) + '</td>';
				html +='<td>' + replaceNull(o.maker) + '</td>';
				html +='<td>' + formatDate("yyyy-MM-dd",o.validitydate) + '</td>';
				html +='<td>' + replaceNull(o.fnote) + '</td>';
				html += '<td>'+'<a href="javascript:toEditFile('+o.id+');">编辑</a>|';
				html += '<a href="javascript:loadFile('+o.id+');">下载</a></td>';
				html += '</tr>';
			});
			$('#data-body').html(html);
		}
	});
}


function fileToSwf(){
	var url = ctx+ '/projectFiles/project-files!fileToSwf.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			alert(data.resultInfo[0]);
		}
	});
}
/**
 * 弹出业务员列表
 */
function toAddBusinessUser(){
	$('#selectBusinessUserDiv').css("margin-left",$('#fcurempname').offset().left-215);
	$("#selectBusinessUserDiv").css("display","");
	var name = $("#fcurempname").val();//文本域输入值
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="businessUserSelect" onchange="addBusinessUser();" style="width: 175px; height: 115px;background-color: #E0E9EA"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
	var url =ctx+'/system/findListByDepart.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			//data = $.parseJSON(data);
			//var list = data.adminList;
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectBusinessUser').html(html);
		}
	});	
}
/**
 * 添加业务员
 */
function addBusinessUser(){
	var selectValue = $('#businessUserSelect').val();
	var selectTxt = $("#businessUserSelect").find('option:selected').text();
	$('#fcurempname').val(selectTxt);
	$('#uploaderid').val(selectValue);
	//$('#businessUserId').val(selectValue);
	$("#selectBusinessUserDiv").css("display","none");
}