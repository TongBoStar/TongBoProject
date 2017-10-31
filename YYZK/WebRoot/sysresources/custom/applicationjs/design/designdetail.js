$(document).ready(function() {
	openblockdiv();
	loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
	$('#uploadtabbody').css('height',window.innerHeight-147);
	$('#manualbomdiv').css('height',window.innerHeight-79);
	$('#allbombody').css('height',window.innerHeight-117);
	$('#fileUpload_bracket').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/fileupload.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*.*',// 文件过滤器
		'fileTypeDesc' : 'doc,docx,pdf文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':27,
        'width':60,
        'scriptData':   {'userId':'${currentUserId}','userName':'${realName}'}, 
        'onSelect': function(event, queueID, fileObj) {
        	var designassistId = $('#sourceId').val();
            $("#fileUpload_bracket").uploadify("settings", "formData", {'userId':realId,'userName':realName,'designassistId':designassistId,'modelMark':'t_bracket_list'}); 
        },
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.reload();
			}else{
				alert(data.resultInfo[1]);
			}
			//$('#fileShow_bracket').html(data.srcfilename);
		}
	});
	$('#fileUpload_bait').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/fileupload.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*.*',// 文件过滤器
		'fileTypeDesc' : 'dwg文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':27,
        'width':60,
        'scriptData':   {'userId':'${currentUserId}','userName':'${realName}'}, 
        'onSelect': function(event, queueID, fileObj) {
        	var designassistId = $('#sourceId').val();
            $("#fileUpload_bait").uploadify("settings", "formData", {'userId':realId,'userName':realName,'designassistId':designassistId,'modelMark':'t_bait_list'}); 
        },
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.reload();
			}else{
				alert(data.resultInfo[1]);
			}
			//$('#fileShow_bait').html(data.srcfilename);
		}
	});
	$('#fileUpload_assweld').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/fileupload.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*.*',// 文件过滤器
		'fileTypeDesc' : 'dwg文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':27,
        'width':60,
        'scriptData':   {'userId':'${currentUserId}','userName':'${realName}'}, 
        'onSelect': function(event, queueID, fileObj) {
        	var designassistId = $('#sourceId').val();
            $("#fileUpload_assweld").uploadify("settings", "formData", {'userId':realId,'userName':realName,'designassistId':designassistId,'modelMark':'t_assweld_list'}); 
        },
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.reload();
			}else{
				alert(data.resultInfo[1]);
			}
			//$('#fileShow_assweld').html(data.srcfilename);
		}
	});
	$('#fileUpload_assemble').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/fileupload.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*.*',// 文件过滤器
		'fileTypeDesc' : 'dwg文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':27,
        'width':60,
        'scriptData':   {'userId':'${currentUserId}','userName':'${realName}'}, 
        'onSelect': function(event, queueID, fileObj) {
        	var designassistId = $('#sourceId').val();
            $("#fileUpload_assemble").uploadify("settings", "formData", {'userId':realId,'userName':realName,'designassistId':designassistId,'modelMark':'t_assemble_list'}); 
        },
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.reload();
			}else{
				alert(data.resultInfo[1]);
			}
			//$('#fileShow_assemble').html(data.srcfilename);
		}
	});
	$('#fileUpload_delivery').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/fileupload.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*.*',// 文件过滤器
		'fileTypeDesc' : 'dwg文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':27,
        'width':60,
        'scriptData':   {'userId':'${currentUserId}','userName':'${realName}'}, 
        'onSelect': function(event, queueID, fileObj) {
        	var designassistId = $('#sourceId').val();
            $("#fileUpload_delivery").uploadify("settings", "formData", {'userId':realId,'userName':realName,'designassistId':designassistId,'modelMark':'t_delivery_list'}); 
        },
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.reload();
			}else{
				alert(data.resultInfo[1]);
			}
			//$('#fileShow_delivery').html(data.srcfilename);
		}
	});
	$('#fileUpload_handFile').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/fileuploadall.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'false',// 多文件上传开关
		'fileTypeExts' : '*.dwg',// 文件过滤器
		'fileTypeDesc' : 'dwg文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':25,
        'width':60,
        'scriptData':   {'userId':'${currentUserId}','userName':'${realName}'}, 
        'onSelect': function(event, queueID, fileObj) {
        	openblockdiv();
        	var designassistId = $('#sourceId').val();
            $("#fileUpload_handFile").uploadify("settings", "formData", {'userId':realId,'userName':realName,'designassistId':designassistId,'modelMark':'t_delivery_list'}); 
        },
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
			closeblockdiv();
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
			closeblockdiv();
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				//window.location.reload();
				$('#fileshow_upload').val(data.srcfilename);
				$('#fileshow_uploadhidden').val(data.filename);
			}else{
				alert(data.resultInfo[1]);
			}
			closeblockdiv();
		}
	});
	loaddesignassist();
	loadBomdRaws();
	window.simpleTable =$(document).SimpleTable({
		id:'bomlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '10',
		submitForm : bomlist//分页回调函数
	});	
	/**设置点击弹出框之外的元素 弹出框消失 开始*/
	document.body.onclick = function(e){
		 e = e || window.event;
		 var target = e.target || e.srcElement;
		 if(target.id == "selectItemcodeDiv0"||target.id == "itemcode0"||target.id == "selectItemnameDiv0"||target.id == "itemname0"||
				 target.id == "selectItemcodeDiv1"||target.id == "itemcode1"||target.id == "selectItemnameDiv1"||target.id == "itemname1"||
				 target.id == "selectItemcodeDiv2"||target.id == "itemcode2"||target.id == "selectItemnameDiv2"||target.id == "itemname2"||
				 target.id == "selectItemcodeDiv3"||target.id == "itemcode3"||target.id == "selectItemnameDiv3"||target.id == "itemname3"||
				 target.id == "selectItemcodeDiv4"||target.id == "itemcode4"||target.id == "selectItemnameDiv4"||target.id == "itemname4"||
				 target.id == "selectItemcodeDiv5"||target.id == "itemcode5"||target.id == "selectItemnameDiv5"||target.id == "itemname5"||
				 target.id == "selectItemcodeDiv6"||target.id == "itemcode6"||target.id == "selectItemnameDiv6"||target.id == "itemname6"||
				 target.id == "selectItemcodeDiv7"||target.id == "itemcode7"||target.id == "selectItemnameDiv7"||target.id == "itemname7"||
				 target.id == "selectItemcodeDiv8"||target.id == "itemcode8"||target.id == "selectItemnameDiv8"||target.id == "itemname8"||
				 target.id == "selectItemcodeDiv9"||target.id == "itemcode9"||target.id == "selectItemnameDiv9"||target.id == "itemname9"||
				 target.id == "selectItemcodeDiv10"||target.id == "itemcode10"||target.id == "selectItemnameDiv10"||target.id == "itemname10"||
				 target.id == "selectItemcodeDiv11"||target.id == "itemcode11"||target.id == "selectItemnameDiv11"||target.id == "itemname11"||
				 target.id == "selectItemcodeDiv12"||target.id == "itemcode12"||target.id == "selectItemnameDiv12"||target.id == "itemname12"||
				 target.id == "selectItemcodeDiv13"||target.id == "itemcode13"||target.id == "selectItemnameDiv13"||target.id == "itemname13"||
				 target.id == "selectItemcodeDiv14"||target.id == "itemcode14"||target.id == "selectItemnameDiv14"||target.id == "itemname14"||
				 target.id == "selectItemcodeDiv15"||target.id == "itemcode15"||target.id == "selectItemnameDiv15"||target.id == "itemname15"||
				 target.id == "selectItemcodeDiv16"||target.id == "itemcode16"||target.id == "selectItemnameDiv16"||target.id == "itemname16"||
				 target.id == "selectItemcodeDiv17"||target.id == "itemcode17"||target.id == "selectItemnameDiv17"||target.id == "itemname17"||
				 target.id == "selectItemcodeDiv18"||target.id == "itemcode18"||target.id == "selectItemnameDiv18"||target.id == "itemname18"||
				 target.id == "selectItemcodeDiv19"||target.id == "itemcode19"||target.id == "selectItemnameDiv19"||target.id == "itemname19"||
				 target.id == "selectItemcodeDiv20"||target.id == "itemcode20"||target.id == "selectItemnameDiv20"||target.id == "itemname20"){
			 return;
		 }else{
			 $('#selectItemcodeDiv0').css("display","none");
			 $('#selectItemcodeDiv1').css("display","none");
			 $('#selectItemcodeDiv2').css("display","none");
			 $('#selectItemcodeDiv3').css("display","none");
			 $('#selectItemcodeDiv4').css("display","none");
			 $('#selectItemcodeDiv5').css("display","none");
			 $('#selectItemcodeDiv6').css("display","none");
			 $('#selectItemcodeDiv7').css("display","none");
			 $('#selectItemcodeDiv8').css("display","none");
			 $('#selectItemcodeDiv9').css("display","none");
			 $('#selectItemcodeDiv10').css("display","none");
			 $('#selectItemcodeDiv11').css("display","none");
			 $('#selectItemcodeDiv12').css("display","none");
			 $('#selectItemcodeDiv13').css("display","none");
			 $('#selectItemcodeDiv14').css("display","none");
			 $('#selectItemcodeDiv15').css("display","none");
			 $('#selectItemcodeDiv16').css("display","none");
			 $('#selectItemcodeDiv17').css("display","none");
			 $('#selectItemcodeDiv18').css("display","none");
			 $('#selectItemcodeDiv19').css("display","none");
			 $('#selectItemcodeDiv20').css("display","none");
			 $('#selectItemcodeDiv0').css("display","none");
			 $('#selectItemnameDiv1').css("display","none");
			 $('#selectItemnameDiv2').css("display","none");
			 $('#selectItemnameDiv3').css("display","none");
			 $('#selectItemnameDiv4').css("display","none");
			 $('#selectItemnameDiv5').css("display","none");
			 $('#selectItemnameDiv6').css("display","none");
			 $('#selectItemnameDiv7').css("display","none");
			 $('#selectItemnameDiv8').css("display","none");
			 $('#selectItemnameDiv9').css("display","none");
			 $('#selectItemnameDiv10').css("display","none");
			 $('#selectItemnameDiv11').css("display","none");
			 $('#selectItemnameDiv12').css("display","none");
			 $('#selectItemnameDiv13').css("display","none");
			 $('#selectItemnameDiv14').css("display","none");
			 $('#selectItemnameDiv15').css("display","none");
			 $('#selectItemnameDiv16').css("display","none");
			 $('#selectItemnameDiv17').css("display","none");
			 $('#selectItemnameDiv18').css("display","none");
			 $('#selectItemnameDiv19').css("display","none");
			 $('#selectItemnameDiv20').css("display","none");
		 }
	};
});
function bomlist(){
	loadAllBoms(bdtIdGloabl,"t_model_list.itemcode desc");
}
var titleObj;
function loaddesignassist(){
	var url = ctx+"/designAssist/design-assist!showToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: 'designAssistId='+$('#sourceId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			titleObj = data;
			if(data.resultInfo[0]=='0'){
				addHead(data.model);
				dispatchData(data.model);
				loadtools(data.model);
				checkmanualbomdraw();
				//loadexestatus(data.model);
			}
		}
	});
}
function addHead(data){
	$('#productCode_bracket').val(data.productCode);
	$('#productName_bracket').val(data.productName);
	$('#productModel_bracket').val(data.productModel);
	$('#makeNumberCode_bracket').val(data.makeNumberCode);
	$('#fcount_bracket').val(data.fcount);
	$('#baitDate_bracket').val(formatDate("yyyy-MM-dd",data.bracketDate));
	
	$('#productCode_bait').val(data.productCode);
	$('#productName_bait').val(data.productName);
	$('#productModel_bait').val(data.productModel);
	$('#makeNumberCode_bait').val(data.makeNumberCode);
	$('#fcount_bait').val(data.fcount);
	$('#baitDate_bait').val(formatDate("yyyy-MM-dd",data.baitDate));
	
	$('#productCode_assweld').val(data.productCode);
	$('#productName_assweld').val(data.productName);
	$('#productModel_assweld').val(data.productModel);
	$('#makeNumberCode_assweld').val(data.makeNumberCode);
	$('#fcount_assweld').val(data.fcount);
	$('#baitDate_assweld').val(formatDate("yyyy-MM-dd",data.assweldDate));
	
	$('#productCode_assemble').val(data.productCode);
	$('#productName_assemble').val(data.productName);
	$('#productModel_assemble').val(data.productModel);
	$('#makeNumberCode_assemble').val(data.makeNumberCode);
	$('#fcount_assemble').val(data.fcount);
	$('#baitDate_assemble').val(formatDate("yyyy-MM-dd",data.assembleDate));
	
	$('#productCode_delivery').val(data.productCode);
	$('#productName_delivery').val(data.productName);
	$('#productModel_delivery').val(data.productModel);
	$('#makeNumberCode_delivery').val(data.makeNumberCode);
	$('#fcount_delivery').val(data.fcount);
	$('#baitDate_delivery').val(formatDate("yyyy-MM-dd",data.deliveryDate));
}
function dispatchData(data){
	var obj = null;
	var hid = '';
	var html = '';
	for(var i=0;i<5;i++){
		if(i==0){
			obj = data.bracketLists;
			hid = 'bracketlistcontent';
			html = addContent_zx(obj,"t_bracket_list");
		}else if(i==1){
			obj = data.baitLists;
			hid = 'baitlistcontent';
			html = addContent_zx(obj,"t_bait_list");
		}else if(i==2){
			obj = data.assweldLists;
			hid = 'assweldlistcontent';
			html = addContent_zzf(obj,"t_assweld_list");
		}else if(i==3){
			obj = data.assembleLists;
			hid = 'assemblelistcontent';
			html = addContent_zzf(obj,"t_assemble_list");
		}else{
			obj = data.deliveryLists;
			hid = 'deliverylistcontent';
			html = addContent_zzf(obj,"t_delivery_list");
		}
		$('#'+hid).html(html);
	}
}
function addContent_zx(obj,modelmark){
	var html = '';
	var bomdraw = '';
	$.each(obj,function(i,o){
		if(bomdraw != o.fileName){
			html+='<tr align="center">';
			html+='<td colspan="10">'+(null==o.fileName?"手动添加":o.fileName)+'</td>';
			html+='</tr>';
			bomdraw = o.fileName;
		}else{
			
		}
		var bgcolor = '';
		var delmark = '';
		if(o.changestatus==1){
			bgcolor = ' style="background-color:#6D6DDA"';
			delmark = '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deleteModelListDef('+o.id+','+o.designassistId+','+o.modelId+',\''+modelmark+'\');"/>';
		}else if(o.changestatus==2){
			bgcolor = ' style="background-color:#EC8A5E"';
			delmark = '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deleteModelListDef('+o.id+','+o.designassistId+','+o.modelId+',\''+modelmark+'\');"/>';
		}else if(o.changestatus==3){
			bgcolor = ' style="background-color:#9C9999"';
		}else{
			bgcolor = '';
			delmark = '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deleteModelListDef('+o.id+','+o.designassistId+','+o.modelId+',\''+modelmark+'\');"/>';
		}
		html+='<tr align="center">'
		html+='<td'+bgcolor+'>'+delmark+(i+1)+'</td>';
		html+='<td'+bgcolor+'>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td'+bgcolor+'>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td'+bgcolor+'>'+(o.fcount==null?"":o.fcount)+'</td>';
		html+='<td'+bgcolor+'>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td'+bgcolor+'>'+(o.fmark==null?"":o.fmark)+'</td>';
		html+='<td'+bgcolor+'>'+(o.sweight==null?"":o.sweight)+'</td>';
		html+='<td'+bgcolor+'>'+(o.aweight==null?"":o.aweight)+'</td>';
		html+='<td'+bgcolor+'>'+(o.slen==null?"":o.slen)+'</td>';
		html+='<td'+bgcolor+'>'+(o.alen==null?"":o.alen)+'</td>';
		//html+='<td>'+replaceNull(o.checkno)+'</td>';
		//html+='<td>'+replaceNull(o.dispenserName)+'</td>';
		//html+='<td>'+replaceNull(o.receiverName)+'</td>';
		//html+='<td>'+replaceNull(o.checkerName)+'</td>';
		//html+='<td>'+replaceNull(o.baitDate)+'</td>';
		html+='</tr>';
	});
	return html;
}
function addContent_zzf(obj,modelmark){
	var html = '';
	var bomdraw = '';
	$.each(obj,function(i,o){
		if(bomdraw != o.fileName){
			html+='<tr align="center">';
			html+='<td colspan="8">'+(null==o.fileName?"手动添加":o.fileName)+'</td>';
			html+='</tr>';
			bomdraw = o.fileName;
		}else{
			
		}
		var bgcolor = '';
		var delmark = '';
		if(o.changestatus==1){
			bgcolor = ' style="background-color:#6D6DDA"';
			delmark = '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deleteModelListDef('+o.id+','+o.designassistId+','+o.modelId+',\''+modelmark+'\');"/>';
		}else if(o.changestatus==2){
			bgcolor = ' style="background-color:#EC8A5E"';
		}else if(o.changestatus==3){
			bgcolor = ' style="background-color:#9C9999"';
		}else{
			bgcolor = '';
			delmark = '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deleteModelListDef('+o.id+','+o.designassistId+','+o.modelId+',\''+modelmark+'\');"/>';
		}
		html+='<tr align="center">';
		html+='<td'+bgcolor+'>'+delmark+(i+1)+'</td>';
		html+='<td'+bgcolor+'>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td'+bgcolor+'>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td'+bgcolor+'>'+(o.fcount==null?"":o.fcount)+'</td>';
		html+='<td'+bgcolor+'>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td'+bgcolor+'>'+(o.fmark==null?"":o.fmark)+'</td>';
		//html+='<td>'+replaceNull(o.checkno)+'</td>';
		//html+='<td>'+replaceNull(o.dispenserName)+'</td>';
		//html+='<td>'+replaceNull(o.receiverName)+'</td>';
		//html+='<td>'+replaceNull(o.checkerName)+'</td>';
		//html+='<td>'+replaceNull(o.planreachTime)+'</td>';
		//html+='<td>'+replaceNull(o.baitDate)+'</td>';
		html+='</tr>';
	});
	return html;
}
function loadtools(data){
	if(data.bracketStatus==-1){
		$('#rebackinfo_start_bracket').text("被驳回,原因:"+data.bracketStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bracket').css("display","");
		$('#examinebtn_bracket').css("display","none");
	}else if(data.bracketStatus==100||data.bracketStatus==50){
		if(data.bracketStatus==50){
			$('#changebtn_bracket').removeClass("btn btn-info");
			$('#changebtn_bracket').addClass("btn btn-primary");
		}
		if(data.bracketStatus==100){
			$('#changebtn_bracket').removeClass("btn btn-primary");
			$('#changebtn_bracket').addClass("btn btn-info");
		}
		$('#changebtn_bracket').css("display","");
		$('#examinestatusdiv_bracket').css("display","");
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","none");
		$('#unexaminebtn_bracket').css("display","");
		$('#currentprocess_bracket').text("流程结束!");
	}else if(data.bracketLists.length==0){
		//$('#uploadDiv_bracket').css("display","");
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","none");
		$('#detialdiv_bracket').css("display","none");
	}else if(null==data.bracketStatus||data.bracketStatus==0){
		$('#pushbtn_bracket').css("display","");
		$('#examinebtn_bracket').css("display","none");
		$('#unexaminebtn_bracket').css("display","none");
	}else{
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","");
	}
	if(data.baitStatus==-1){
		$('#rebackinfo_start_bait').text("被驳回,原因:"+data.baitStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bait').css("display","");
	}else if(data.baitStatus==100||data.baitStatus==50){
		if(data.baitStatus==50){
			$('#changebtn_bait').removeClass("btn btn-info");
			$('#changebtn_bait').addClass("btn btn-primary");
		}
		if(data.baitStatus==100){
			$('#changebtn_bait').removeClass("btn btn-primary");
			$('#changebtn_bait').addClass("btn btn-info");
		}
		$('#changebtn_bait').css("display","");
		$('#examinestatusdiv_bait').css("display","");
		$('#pushbtn_bait').css("display","none");
		$('#examinebtn_bait').css("display","none");
		$('#unexaminebtn_bait').css("display","");
		$('#currentprocess_bait').text("流程结束!");
	}else if(data.baitLists.length==0){
		//$('#uploadDiv_bait').css("display","");
		$('#pushbtn_bait').css("display","none");
		$('#examinebtn_bait').css("display","none");
		$('#detialdiv_bait').css("display","none");
	}else if(null==data.baitStatus||data.baitStatus==0){
		$('#pushbtn_bait').css("display","");
		$('#examinebtn_bait').css("display","none");
		$('#unexaminebtn_bait').css("display","none");
	}else{
		$('#pushbtn_bait').css("display","none");
		$('#examinebtn_bait').css("display","");
	}
	if(data.assweldStatus==-1){
		$('#rebackinfo_start_assweld').text("被驳回,原因:"+data.assweldStatusDesc).css("display","").css("color","red");
		$('#pushbtn_assweld').css("display","");
		$('#examinebtn_assweld').css("display","none");
	}else if(data.assweldStatus==100||data.assweldStatus==50){
		if(data.assweldStatus==50){
			$('#changebtn_assweld').removeClass("btn btn-info");
			$('#changebtn_assweld').addClass("btn btn-primary");
		}
		if(data.assweldStatus==100){
			$('#changebtn_assweld').removeClass("btn btn-primary");
			$('#changebtn_assweld').addClass("btn btn-info");
		}
		$('#changebtn_assweld').css("display","");
		$('#examinestatusdiv_assweld').css("display","");
		$('#pushbtn_assweld').css("display","none");
		$('#examinebtn_assweld').css("display","none");
		$('#unexaminebtn_assweld').css("display","");
		$('#currentprocess_assweld').text("流程结束!");
	}else if(data.assweldLists.length==0){
		//$('#uploadDiv_assweld').css("display","");
		$('#pushbtn_assweld').css("display","none");
		$('#examinebtn_assweld').css("display","none");
		$('#detialdiv_assweld').css("display","none");
	}else if(null==data.assweldStatus||data.assweldStatus==0){
		$('#pushbtn_assweld').css("display","");
		$('#examinebtn_assweld').css("display","none");
		$('#unexaminebtn_assweld').css("display","none");
	}else{
		$('#pushbtn_assweld').css("display","none");
		$('#examinebtn_assweld').css("display","");
	}
	if(data.assembleStatus==-1){
		$('#rebackinfo_start_assemble').text("被驳回,原因:"+data.assembleStatusDesc).css("display","").css("color","red");
		$('#pushbtn_assemble').css("display","");
		$('#examinebtn_assemble').css("display","none");
	}else if(data.assembleStatus==100||data.assembleStatus==50){
		if(data.assembleStatus==50){
			$('#changebtn_assemble').removeClass("btn btn-info");
			$('#changebtn_assemble').addClass("btn btn-primary");
		}
		if(data.assembleStatus==100){
			$('#changebtn_assemble').removeClass("btn btn-primary");
			$('#changebtn_assemble').addClass("btn btn-info");
		}
		$('#changebtn_assemble').css("display","");
		$('#examinestatusdiv_assemble').css("display","");
		$('#pushbtn_assemble').css("display","none");
		$('#examinebtn_assemble').css("display","none");
		$('#unexaminebtn_assemble').css("display","");
		$('#currentprocess_assemble').text("流程结束!");
	}else if(data.assembleLists.length==0){
		//$('#uploadDiv_assemble').css("display","");
		$('#pushbtn_assemble').css("display","none");
		$('#examinebtn_assemble').css("display","none");
		$('#detialdiv_assemble').css("display","none");
	}else if(null==data.assembleStatus||data.assembleStatus==0){
		$('#pushbtn_assemble').css("display","");
		$('#examinebtn_assemble').css("display","none");
		$('#unexaminebtn_assemble').css("display","none");
	}else{
		$('#pushbtn_assemble').css("display","none");
		$('#examinebtn_assemble').css("display","");
	}
	if(data.deliveryStatus==-1){
		$('#rebackinfo_start_delivery').text("被驳回,原因:"+data.deliveryStatusDesc).css("display","").css("color","red");
		$('#pushbtn_delivery').css("display","");
		$('#examinebtn_delivery').css("display","none");
	}else if(data.deliveryStatus==100||data.deliveryStatus==50){
		if(data.deliveryStatus==50){
			$('#changebtn_delivery').removeClass("btn btn-info");
			$('#changebtn_delivery').addClass("btn btn-primary");
		}
		if(data.deliveryStatus==100){
			$('#changebtn_delivery').removeClass("btn btn-primary");
			$('#changebtn_delivery').addClass("btn btn-info");
		}
		$('#changebtn_delivery').css("display","");
		$('#examinestatusdiv_delivery').css("display","");
		$('#pushbtn_delivery').css("display","none");
		$('#examinebtn_delivery').css("display","none");
		$('#unexaminebtn_delivery').css("display","");
		$('#currentprocess_delivery').text("流程结束!");
	}else if(data.deliveryLists.length==0){
		//$('#uploadDiv_delivery').css("display","");
		$('#pushbtn_delivery').css("display","none");
		$('#examinebtn_delivery').css("display","none");
		$('#detialdiv_delivery').css("display","none");
	}else if(null==data.deliveryStatus||data.deliveryStatus==0){
		$('#pushbtn_delivery').css("display","");
		$('#examinebtn_delivery').css("display","none");
		$('#unexaminebtn_delivery').css("display","none");
	}else{
		$('#pushbtn_delivery').css("display","none");
		$('#examinebtn_delivery').css("display","");
	}
	loadexestatus(data);
}
/**
 * 进行下推，启动下料下推的流程
 * @param type 是下推还是审核 0下推 1审核
 */
var examineMark = '';
function exeprocess(type,mark){
	if(type==0){//是下推
		if($('#baitDate_'+mark).val().trim()==''){
			alert("请选择完成日期!");
			return;
		}
		saveexamine(type,mark);
	}else{//是审核
		$('#fmark').val('');
		examineMark = mark;
		openDiv("examineAddDiv");
	}
}
function selectAccess(rv){
	if(rv==1){
		$('#rebackTR').css("display","none");
	}else if(rv==0){
		var nodeseq = $('#nodeSeq_'+examineMark).val();
		if(nodeseq==1){
			$('#rebackNode').html("<option value='0'>开始</option>");
			$('#rebackTR').css("display","");
		}else if(nodeseq>1){
			var url = ctx+"/processDetail/process-detail!findByCode.htm";
			$.webAjax({
				type : "post",
				url : url,
				data: 'processDetailQuery.processCode='+$('#taskcode_'+examineMark).val(),
				success : function(data) {
				data = $.parseJSON(data);
					if(data.resultInfo[0]=='0'){
						var options = "<option value='0'>开始</option>";
						$.each(data.processDetailList,function(i,o){
							if(o.nodeSeq<nodeseq){
								options += "<option value='"+o.nodeSeq+"'>"+o.nodeName+"</option>";
							}
						});
						$('#rebackNode').html(options);
						$('#rebackTR').css("display","");
					}
				}
			});
		}else{
			
		}
	}else{
		
	}
}
/**
 * 下推审核
 * @param type
 * @param mark
 */
function saveexamine(type,mark){
	var flag = window.confirm("确定下推审核吗？");
	var baitdate = '';
	if(flag){
		openblockdiv();
		var examineinfo = '';
		if(type==0){//如果是下推按钮则不传审核类的信息
			if(mark == 'bracket'){
				baitdate = "&bracketDate="+$("#baitDate_"+mark).val();
			}else if(mark == 'bait'){
				baitdate = "&baitDate="+$("#baitDate_"+mark).val();
			}else if(mark == 'assweld'){
				baitdate = "&assweldDate="+$("#baitDate_"+mark).val();
			}else if(mark == 'assemble'){
				baitdate = "&assembleDate="+$("#baitDate_"+mark).val();
			}else if(mark == 'delivery'){
				baitdate = "&deliveryDate="+$("#baitDate_"+mark).val();
			}else{
				
			}
		}else if(type==1&&mark=='_blank'){//如果是审核操作要将信息传入
			mark = examineMark;
			//examineinfo = '&processExetask.examineStatus='+$('input[name="processExetask.examineStatus"]:checked').val()+
			//			  '&processExetask.fmark='+$('#fmark').val();
		}else{}
		var nodeseq = $('#nodeSeq_'+mark).val();
		if(nodeseq==undefined || nodeseq==null || nodeseq==''){
			nodeseq = 0;
		}
		var examineAddForm = $('#examineAddForm').serialize();
		var url = ctx+"/designAssist/design-assist!exeProcess.htm";
		var param = 'processExetask.sourceId='+$('#sourceId').val()+
					'&processExetask.sourceCode='+$('#sourceCode').val()+
					'&processExetask.nodeSeq='+nodeseq+
					'&processExetask.id='+$('#exeTaskId_'+mark).val()+
					'&processExetask.taskCode='+$('#taskcode_'+mark).val()+
					'&id='+$('#sourceId').val()+baitdate;
		$.webAjax({
			type : "post",
			url : url,
			data: examineAddForm+"&"+param,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("操作成功!");
					loaddesignassist();
					closeDiv("examineAddDiv");
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 装载正在执行的流程
 */
function loadexestatus(model){
	var url = ctx+"/processExetask/process-exetask!listToQuery.htm";
	var param = 'processExetaskQuery.sourceId='+$('#sourceId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(null!=data.processExetaskList&&data.processExetaskList.length>0){
					$.each(data.processExetaskList,function(i,o){
						if(o.taskCode=='TO_BRACKET_TASK'){
							$('#exeTaskId_bracket').val(o.id);
							$('#nodeSeq_bracket').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bracket').text(spantxt);
							$('#examinestatusdiv_bracket').css("display","");
							$('#examinebtn_bracket').css("display",parseApproer(o.handlers));
							$('#pushbtn_bracket').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bracket').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_bracket').css("color","red");
							}
						}else if(o.taskCode=='TO_BAIT_TASK'){
							$('#exeTaskId_bait').val(o.id);
							$('#nodeSeq_bait').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bait').text(spantxt);
							$('#examinestatusdiv_bait').css("display","");
							$('#examinebtn_bait').css("display",parseApproer(o.handlers));
							$('#pushbtn_bait').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bait').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_bait').css("color","red");
							}
						}else if(o.taskCode=='TO_ASSWELD_TASK'){
							$('#exeTaskId_assweld').val(o.id);
							$('#nodeSeq_assweld').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_assweld').text(spantxt);	
							$('#examinestatusdiv_assweld').css("display","");
							$('#examinebtn_assweld').css("display",parseApproer(o.handlers));
							$('#pushbtn_assweld').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_assweld').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_assweld').css("color","red").css("display","");
								$('#rebackinfo_assweld').css("display","");
							}
						}else if(o.taskCode=='TO_ASSEMBLE_TASK'){
							$('#exeTaskId_assemble').val(o.id);
							$('#nodeSeq_assemble').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_assemble').text(spantxt);
							$('#examinestatusdiv_assemble').css("display","");
							$('#examinebtn_assemble').css("display",parseApproer(o.handlers));
							$('#pushbtn_assemble').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_assemble').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_assemble').css("color","red");
								$('#rebackinfo_assemble').css("display","");
							}
						}else if(o.taskCode=='TO_DELIVERY_TASK'){
							$('#exeTaskId_delivery').val(o.id);
							$('#nodeSeq_delivery').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_delivery').text(spantxt);
							$('#examinestatusdiv_delivery').css("display","");
							$('#examinebtn_delivery').css("display",parseApproer(o.handlers));
							$('#pushbtn_delivery').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_delivery').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_delivery').css("color","red");
							}
						}else{
							
						}
					});
				}
			}
			closeblockdiv();
		}
	});
}
/**
 * 查看流程
 */
function checkprocesshis(mark){
	var statusmark = 0;
	if(mark=="bracket"&&titleObj.model.bracketStatus!=null){
		statusmark= titleObj.model.bracketStatus;
	}else if(mark=="bait"&&titleObj.model.baitStatus!=null){
		statusmark= titleObj.model.baitStatus;
	}else if(mark=="assweld"&&titleObj.model.assweldStatus!=null){
		statusmark= titleObj.model.assweldStatus;
	}else if(mark=="assemble"&&titleObj.model.assembleStatus!=null){
		statusmark= titleObj.model.assembleStatus;
	}else if(mark=="delivery"&&titleObj.model.deliveryStatus!=null){
		statusmark= titleObj.model.deliveryStatus;
	}else{
		
	}
	var url = ctx+"/processHistask/process-histask!listToQueryAll.htm";
	var param = 'processHistaskQuery.taskCode='+$('#taskcode_'+mark).val()+
				"&processHistaskQuery.sourceId="+$('#sourceId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				if(null!=data.processHistaskList&&data.processHistaskList.length>0){
					$.each(data.processHistaskList,function(i,o){
						var status = '';
						if(o.examineStatus==0){
							status = '已执行:驳回';
						}else if(o.examineStatus==1){
							status = '已执行:审批通过';
						}else{
							
						}
						html += "<tr>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td>"+o.operaterName+"</td>";
						html += "<td>"+o.nodeName+"</td>";
						html += "<td>"+status+"</td>";
						html += "<td>"+o.operateTime+"</td>";
						html += "<td>"+replaceNull(o.fmark)+"</td>";
						html += "</tr>";
						if(i==data.processHistaskList.length-1){
							//html += parseProcessDetails(data.processDetails,o.nodeSeq,i+1);
							var seqnum=0;
							if(o.examineStatus==0){
								if(o.backnode!=null&&o.backnode>0){
									seqnum =o.backnode-1;
								}
							}else{
								if(statusmark==0){
									seqnum=0;
								}else{
									seqnum = o.nodeSeq;
								}
							}
							html += parseProcessDetails(data.processDetails,seqnum,i+1);
						}
					});
				}else{
					html += parseProcessDetails(data.processDetails,0,0);
				}
				$('#processcontent').html(html);
				openDiv('checkDiv');
			}
		}
	});
}
/**
 * 将要执行的流程
 * @param obj 流程明细
 * @param seq 流程顺序
 * @param index 序号
 * @returns {String} 返回一条记录
 */
function parseProcessDetails(obj,seq,index){
	var indextemp = index+1;
	var html = '';
	var stye = ' style="background-color:#A8B6E8;"';
	$.each(obj,function(i,o){
		if(o.nodeSeq>seq&&o.nodeType==1){
			html += "<tr>";
			html += "<td "+stye+">"+indextemp+"</td>";
			html += "<td "+stye+">";
			$.each(o.processHandleList,function(n,m){
				html +=m.handlerName+" ";
			});
			html += "</td "+stye+">";
			html += "<td "+stye+">"+o.nodeName+"</td>";
			html += "<td "+stye+">未进行</td>";
			html += "<td "+stye+"></td>";
			html += "<td "+stye+"></td>";
			html += "</tr>";
			indextemp++;
		}
	});
	return html;
}
/**
 * 解析审核人信息
 * @param approers
 * @returns {String}
 */
function parseApproer(approers){
	var show = "none";
	if(approers.length>1){
		var approves = approers.split(" ");
		$.each(approves,function(n,m){
			if(m==realName){
				show = "";
			}
		});
	}
	return show;
}
/**
 * 加载相关的图纸
 * @param id
 * @param tabtype
 */
function loadFile(id,tabtype){
	var url = ctx+"/bomDrawTitle/bom-draw-title!loadFileList.htm";
	var param = 'bomDrawTitleQuery.tabType='+tabtype+"&bomDrawTitleQuery.designassistId="+id;
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.bomDrawTitleList,function(i,o){
					html+='<tr align="center">';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</a></td>';
					html+='<td>'+(o.fileName==null?"":o.fileName)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="downLoadBomDraw('+o.id+');">下载</a></td>';
					html+='</tr>';
				});
				$('#bomdrawlistcontent').html(html);
				if(html == ''){
					alert("还没有图纸!");
				}else{
					openDiv('downLoadListDiv');
				}
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
	/*var elemIF = document.createElement("iframe");
	elemIF.src = ctx+"/bomDrawTitle/bom-draw-title!loadFiles.htm?designassistId="+id+"&tabType="+tabtype;
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);*/
}
/**
 * 下载文件
 * @param id 文件的ID
 */
function downLoadBomDraw(id){
	 var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+"/bomDrawTitle/bom-draw-title!downLoadBomDraw.htm?bomDrawTitleId="+id;
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
function loadFile_backup(id,tabtype){
	 var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+"/bomDrawTitle/bom-draw-title!loadFiles.htm?designassistId="+id+"&tabType="+tabtype;
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
/**
 * BOM图纸上传
 */
function uploadBOM(){
	if($('#fbomDrawType').val()==''){
		alert("请选择图纸类型!");
		return;
	}
	var flag = window.confirm("确定上传并读取此图纸吗？");
	if(flag){
		openblockdiv();
		var url = ctx+"/bomDrawTitle/bom-draw-title!handleFileAll.htm";
		var param = 'filename='+$('#fileshow_uploadhidden').val()+"&designassistId="+$('#sourceId').val()+"&bomDrawType="+$('#fbomDrawType').val()+
					'&srcfilename='+$('#fileshow_upload').val()+"&fname="+$('#fnamebomdraw').val()+"&fmodel="+$('#fmodelbomdraw').val();
		$.webAjax({
			type : "post",
			url : url,
			data: param,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("上传成功!");
					$('#fbomDrawType').val("");
					$('#fnamebomdraw').val("");
					$('#fmodelbomdraw').val("");
					$('#fileshow_uploadhidden').val("");
					$('#fileshow_upload').val("");
					closeblockdiv();
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
					loadBomdRaws();
				}else{
					alert(data.resultInfo[1]);
					closeblockdiv();
				}
			}
		});
	}
}
/**
 * 加载图纸列表
 */
function loadBomdRaws(){
	var url = ctx+"/bomDrawTitle/bom-draw-title!listToQuery.htm";
	var param = 'bomDrawTitleQuery.designassistId='+$('#sourceId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.bomDrawTitleList,function(i,o){
					html+='<tr align="center">';
					html+='<td id="bomdraw'+o.id+'">'+(i+1)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="loadAllBoms('+o.id+',\'\');">'+(o.itemcode==null?"":o.itemcode)+'</a></td>';
					html+='<td>'+(o.fname==null?"":o.fname)+'</td>';
					html+='<td>'+(o.fmodel==null?"":o.fmodel)+'</td>';
					html+='<td>'+(o.fmaterial==null?"":o.fmaterial)+'</td>';
					html+='<td>'+(o.fileName==null?"":o.fileName)+'</td>';
					html+='<td>'+(o.createbomor==null?"":o.createbomor)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createdate)+'</td>';
					html+='<td>'+(o.bomDrawType==1?"总图":"部件图")+o.bomversion+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="downLoadBomDraw('+o.id+');">下载</a>|';
					html+='<a href="javascript:void(0);" onclick="deleteBomDraw('+o.id+');">删除</a></td>';
					html+='</tr>';
				});
				$('#bomdrawlist').html(html);
			}
		}
	});
}
/**
 * 删除图纸和与其关联的对象
 * @param bomdrawid
 */
function deleteBomDraw(bomdrawid){
	var flag = window.confirm("确定删除此图纸和与此图纸相关联的数据吗？");
	if(flag){
		var param = {};
		param['checkedIdList[0]'] = bomdrawid;
		var url = ctx+"/bomDrawTitle/bom-draw-title!deleteToJson.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: param,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("图纸删除成功!");
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
					loadBomdRaws();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
var bdtIdGloabl;
/**
 * 点击表头进行排序
 * @param sort 排序规则和排序的属性 升序 降序
 */
function sort(sort,divid){
	if(null==bdtIdGloabl||undefined==bdtIdGloabl){
		return;
	}
	if($('#'+divid).attr('class')=='sorttddesc'){
		$('#'+divid).removeClass('sorttddesc');
		$('#'+divid).addClass('sorttdasc');
		sort = sort+" asc";
	}else{
		$('#'+divid).removeClass('sorttdasc');
		$('#'+divid).addClass('sorttddesc');
		sort =  sort+" desc";
	}
	loadAllBoms(bdtIdGloabl,sort);
}
/**
 * 总清单中点击表头进行排序
 * @param sort 排序规则和排序的属性 升序 降序
 */
function sortAll(sort,divid){
	if($('#'+divid).attr('class')=='sorttddesc'){
		$('#'+divid).removeClass('sorttddesc');
		$('#'+divid).addClass('sorttdasc');
		sort = sort+" asc";
	}else{
		$('#'+divid).removeClass('sorttdasc');
		$('#'+divid).addClass('sorttddesc');
		sort =  sort+" desc";
	}
	loadAllBomsIndex('modelListQuery.sortColumns='+sort);
}
/**
 * 加载指定的图纸的bom列表
 * @param bdtid 指定图纸的id
 * @param sort 排序规则 升序 降序
 */
function loadAllBoms(bdtid,sort){
	openblockdiv();
	bdtIdGloabl = bdtid;
	if(sort==''||undefined==sort){
		sort = "t_model_list.itemcode desc";
	}
	$('#bomdraw'+bdtid).css("background-color","#C5C5CC").siblings().css("background-color","#C5C5CC");
	$('#bomdraw'+bdtid).parent().siblings().children().css("background-color","white");
	var url = ctx+"/modelList/model-list!listToJson.htm";
	var param = 'modelListQuery.designassistId='+$('#sourceId').val()+'&modelListQuery.bdtId='+bdtid+
				'&modelListQuery.modelMark=t_model_list'+'&modelListQuery.sortColumns='+sort;
	var pageParam = simpleTable.bindPageParamMy(sort.split(" ")[0],sort.split(" ")[1]);
	$.webAjax({
		type : "post",
		url : url,
		data: pageParam+"&"+param,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
			if(data.resultInfo[0]=='0'){
				$.refreshPageToolbar(page,"bomlistpage",simpleTable);
				var html = '';
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					var disablemark = '';
					var dispatchname = '';
					if(o.isdispatch=='t_bracket_list'){
						disablemark = 'disabled';
						dispatchname = '支架';
					}else if(o.isdispatch=='t_bait_list'){
						disablemark = 'disabled';
						dispatchname = '下料';
					}else if(o.isdispatch=='t_assweld_list'){
						disablemark = 'disabled';
						dispatchname = '组焊';
					}else if(o.isdispatch=='t_assemble_list'){
						disablemark = 'disabled';
						dispatchname = '装配';
					}else if(o.isdispatch=='t_delivery_list'){
						disablemark = 'disabled';
						dispatchname = '发货';
					}else{
						disablemark = '';
						dispatchname = '';
					}
					html+= '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" '+disablemark+'/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+(o.sweight==null?"":o.sweight)+'</td>';
					html+='<td>'+(o.aweight==null?"":o.aweight)+'</td>';
					html+='<td>'+(o.slen==null?"":o.slen)+'</td>';
					html+='<td>'+(o.alen==null?"":o.alen)+'</td>';
					html+='<td>'+dispatchname+'</td>';
					html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='</tr>';
				});
				$('#uploadlistcontent').html(html);
				closeblockdiv();
			}
		}
	});
}
/**
 * 打开分配的窗口
 */
function dispatch(){
	/*if($("#checkmanualbomdrawbtn").attr("class")=='btn btn-primary'){
		newAlert("存在冲突,请先处理");
		return;
	}*/
	if(selectedtyperec!=0&&$('#mfcount'+selectedtyperec).val()==''){
		newAlert("请输入数量!");
		return;
	}
	if(selectedtyperec!=0&&undefined!=$('#mfcount'+selectedtyperec).val()&&isNaN($('#mfcount'+selectedtyperec).val())){
		newAlert("数量必须为数字!");
		return;
	}
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){	
		if(!$(o).attr("disabled")&&$(o).parent().parent().css("display")!='none'){//已选的和隐藏起来的不能算
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		}
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要分配的记录！');
		return;
	}
	if(titleObj.model.fstatus==100){
		$('#dispatchbtn').css("display","none");
	}else{
		/*if(titleObj.model.bracketStatus==100){
			$('#selectcheckbox'+1).attr("disabled","disabled");
		}
		if(titleObj.model.baitStatus==100){
			$('#selectcheckbox'+2).attr("disabled","disabled");
		}
		if(titleObj.model.assweldStatus==100){
			$('#selectcheckbox'+3).attr("disabled","disabled");
		}
		if(titleObj.model.assembleStatus==100){
			$('#selectcheckbox'+4).attr("disabled","disabled");
		}
		if(titleObj.model.deliveryStatus==100){
			$('#selectcheckbox'+5).attr("disabled","disabled");
		}*/
	}
	openDiv('dispatchDiv');
}
/**
 * 选择要分配的对象
 */
function selectcheckbox(sseq){
	$('#selectcheckbox'+sseq).attr("checked","true");
	$('#selectcheckbox'+sseq).parent().siblings().find("input[name='selectcheckbox']").removeAttr("checked");
}
/**
 * 分配操作
 * @param id
 */
function savedispatch(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		if(!$(o).attr("disabled")){
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		}
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要分配的记录！');
		return;
	}
	param['modelListQuery.fcount'] = $('#mfcount'+selectedtyperec).val();
	var tabs = $('[name="selectcheckbox"]:checked');
	var tabn = 0;
	$.each(tabs, function(i, o){			
		param['dispatchList[' + tabn + ']'] = $(o).val();
		tabn++;
	});
	if(!param['dispatchList[0]']) {
		alert('请选择要分配的对象！');
		return;
	}
	var flag = window.confirm("确定分配吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/modelList/model-list!dispatchModel.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("分配成功!");
					loadAllBoms(bdtIdGloabl,null);
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
				}else{
					alert(data.resultInfo[1]);
					closeblockdiv();
				}
				closeDiv('dispatchDiv');
			}
		});
	}
}
/**
 * 反审单据
 * @param type
 * @param modelmark
 */
function unexamine(type,modelmark){
	var flag = window.confirm("确定反审吗？");
	if(flag){
		openblockdiv();
		var url = ctx+"/designAssist/design-assist!unexamineToJson.htm";
		$.webAjax({
			type : "post",
			url : url,
			data:  "designAssistQuery.fmark="+modelmark+"&designAssistQuery.id="+$('#sourceId').val(),
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("反审成功!");
					loadBomdRaws();
					loaddesignassist();
					$('#exeTaskId_bracket').val("");
					$('#nodeSeq_bracket').val("");
					$('#exeTaskId_bait').val("");
					$('#nodeSeq_bait').val("");
					$('#exeTaskId_assweld').val("");
					$('#nodeSeq_assweld').val("");
					$('#exeTaskId_assemble').val("");
					$('#nodeSeq_assemble').val("");
					$('#exeTaskId_delivery').val("");
					$('#nodeSeq_delivery').val("");
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 手动添加
 */
var addmanualindex = 0;
function addmanual(){
	var html = '';
	var index = 0;
	for(var i=0;i<15;i++){
		html += '<tr id="modelTR'+i+'"><input type="hidden" name="modelListList['+i+'].designassistId" value="'+$('#sourceId').val()+'"/><input type="hidden" name="modelListList['+i+'].sourceType" value="1"/>';
		html +=	'<td style="padding:1px;"><input type="hidden" name="modelListList['+i+'].bomversion" value="1.1"/>';
		html += '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deletemanualmodel('+i+');"/>'+(i+1)+'</td>';
		html += '<td style="padding:1px;"><input type="text" id="itemcode'+i+'" class="input160" name="modelListList['+i+'].itemcode" onclick="finditemcode('+i+');" onkeyup="finditemcode('+i+');"/>';
		html += '<div id="selectItemcodeDiv'+i+'" style="background-color: #FFFFFF;position: absolute;overflow: auto;display: none;padding: 5px;z-index: 9999;">';
		html += '<table><tbody id="selectItemcode'+i+'"></tbody></table>';
		html += '</div></td>';
		html += '<td style="padding:1px;"><input type="text" class="input160" name="modelListList['+i+'].itemname" id="itemname'+i+'" onclick="finditemname('+i+');" onkeyup="finditemname('+i+');"/>';
		html += '<div id="selectItemnameDiv'+i+'" style="background-color: #FFFFFF;position: absolute;overflow: auto;display: none;padding: 5px;z-index: 9999;">';
		html += '<table><tbody id="selectItemname'+i+'"></tbody></table>';
		html += '</div></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+i+'].fmatrial" id="fmatrial'+i+'"/></td>';
		html += '<td style="padding:1px;"><input type="text" id="manualfcount'+i+'" class="input80" name="modelListList['+i+'].manualfcount"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+i+'].sweight"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+i+'].aweight"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+i+'].slen"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+i+'].alen"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input120" name="modelListList['+i+'].fmark"/></td>';
		html += '<td style="padding:1px;"><select class="select80" id="selecttab'+i+'" style="height:25px;padding:3px 5px;" name="modelListList['+i+'].modelMark">';
		html += '<option value="">请选择</option><option value="t_bracket_list">支架</option><option value="t_bait_list">下料</option>';
		html += '<option value="t_assweld_list">组焊</option><option value="t_assemble_list">装配</option><option value="t_delivery_list">发货</option>';
		html += '</select></td>';
		html += '</tr>';
		index = index+1;
	}
	addmanualindex += index;
	$('#bommanuallist').html(html);
}
/**
 * 点击添加按钮添加一条手动输入的记录
 */
function addmanualsigal(){
	addmanualindex += 1;
	var html = '';
		html += '<tr id="modelTR'+addmanualindex+'"><input type="hidden" name="modelListList['+addmanualindex+'].designassistId" value="'+$('#sourceId').val()+'"/><input type="hidden" name="modelListList['+addmanualindex+'].sourceType" value="1"/>';
		html +=	'<td style="padding:1px;"><input type="hidden" name="modelListList['+addmanualindex+'].bomversion" value="1.1"/>';
		html += '<img src="'+ctx+'/images/delete.png" style="margin-right:5px;cursor: pointer;" onclick="deletemanualmodel('+addmanualindex+');"/>'+addmanualindex+'</td>';
		html += '<td style="padding:1px;">';
		html += '<div id="selectItemcodeDiv'+addmanualindex+'" style="background-color: #FFFFFF;position: absolute;overflow: auto;display: none;padding: 5px;z-index: 9999;">';
		html += '<table><tbody id="selectItemcode'+addmanualindex+'"></tbody></table>';
		html += '</div><input type="text" id="itemcode'+addmanualindex+'" class="input160" name="modelListList['+addmanualindex+'].itemcode" onclick="finditemcode('+addmanualindex+');" onkeyup="finditemcode('+addmanualindex+');"/></td>';
		html += '<td style="padding:1px;">';
		html += '<div id="selectItemnameDiv'+addmanualindex+'" style="background-color: #FFFFFF;position: absolute;overflow: auto;display: none;padding: 5px;z-index: 9999;">';
		html += '<table><tbody id="selectItemname'+addmanualindex+'"></tbody></table>';
		html += '</div><input type="text" class="input160" name="modelListList['+addmanualindex+'].itemname" id="itemname'+addmanualindex+'" onclick="finditemname('+addmanualindex+');" onkeyup="finditemname('+addmanualindex+');"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+addmanualindex+'].fmatrial" id="fmatrial'+addmanualindex+'"/></td>';
		html += '<td style="padding:1px;"><input type="text" id="manualfcount'+addmanualindex+'" class="input80" name="modelListList['+addmanualindex+'].manualfcount"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+addmanualindex+'].sweight"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+addmanualindex+'].aweight"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+addmanualindex+'].slen"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input80" name="modelListList['+addmanualindex+'].alen"/></td>';
		html += '<td style="padding:1px;"><input type="text" class="input120" name="modelListList['+addmanualindex+'].fmark"/></td>';
		html += '<td style="padding:1px;"><select class="select80" id="selecttab'+addmanualindex+'" style="height:25px;padding:3px 5px;" name="modelListList['+addmanualindex+'].modelMark">';
		html += '<option value="">请选择</option><option value="t_bracket_list">支架</option><option value="t_bait_list">下料</option>';
		html += '<option value="t_assweld_list">组焊</option><option value="t_assemble_list">装配</option><option value="t_delivery_list">发货</option>';
		html += '</select></td>';
		html += '</tr>';
	$('#bommanuallist').append(html);
}
/**
 * 删除手动添加的记录
 * @param i 要删除的记录的索引
 */
function deletemanualmodel(i){
	var flag = window.confirm("确定删除吗？");
	if(flag){
		$('#modelTR'+i).remove();
	}
}
/**
 * 统一选择分配对象
 */
function changeselectmaual(){
	for(var i=0;i<100;i++){
		$('#selecttab'+i).val($('#selecttaball').val());
	}
}
/**
 * 选择物料编码
 */
function finditemcode(seq){
	$("#selectItemcodeDiv"+seq).css("display","");
	var code = $("#itemcode"+seq).val();
	var html='<td><select id="itemcodeSelect'+seq+'" onchange="addItemcode('+seq+');" style="width: 600px; height: 115px;background-color: #E0E9EA"; multiple="true">';
	var data = 'baseItemQuery.itemcode='+code;
	var url =ctx+'/baseItem/base-item!listToEntityPorequest.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.baseItemList;
			$.each(list,function(i,o){
				html+='<option value="'+o.itemcode+'" >'+o.itemcode+'|'+o.itemname+'|'+o.formatno+'|'+o.unitname+'|'+(o.f101==null?"":o.f101)+'|'+(o.f102==null?"":o.f102)+'|'+(o.supplier==null?"":o.supplier.fname)+'</option>';
			});
			html+='</select></td>';
			$('#selectItemcode'+seq).html(html);
		}
	});	
}
/**
 * 添加物料
 */
function addItemcode(seq){
	var selectValue = $('#itemcodeSelect'+seq).val();
	var selectTxt = $("#itemcodeSelect"+seq).find('option:selected').text();
	var txts = selectTxt.split('|');
	$('#itemcode'+seq).val(selectValue);
	$('#itemname'+seq).val(txts[1]);
	$('#fmatrial'+seq).val(txts[5]);
	$("#selectItemcodeDiv"+seq).css("display","none");
}
/**
 * 选择物料名称
 */
function finditemname(seq){
	$("#selectItemnameDiv"+seq).css("display","");
	var name = $("#itemname"+seq).val();
	var html='<td><select id="itemnameSelect'+seq+'" onchange="addItemname('+seq+');" style="width: 600px; height: 115px;background-color: #E0E9EA"; multiple="true">';
	var data = 'baseItemQuery.itemname='+name;
	var url =ctx+'/baseItem/base-item!listToEntityPorequest.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.baseItemList;
			$.each(list,function(i,o){
				html+='<option value="'+o.itemcode+'" >'+o.itemcode+'|'+o.itemname+'|'+o.formatno+'|'+o.unitname+'|'+(o.f101==null?"":o.f101)+'|'+(o.f102==null?"":o.f102)+'|'+(o.supplier==null?"":o.supplier.fname)+'</option>';
			});
			html+='</select></td>';
			$('#selectItemname'+seq).html(html);
		}
	});	
}
/**
 * 添加物料名称
 */
function addItemname(seq){
	var selectValue = $('#itemnameSelect'+seq).val();
	var selectTxt = $("#itemnameSelect"+seq).find('option:selected').text();
	var txts = selectTxt.split('|');
	$('#itemcode'+seq).val(selectValue);
	$('#itemname'+seq).val(txts[1]);
	$("#selectItemnameDiv"+seq).css("display","none");
}
/**
 * 手动添加BOM
 */
function savemanual(){
	var countsj = '';
	var count = 0;
	for(var i=0;i<addmanualindex;i++){
		if($('#itemcode'+i).val()!=undefined&&$('#itemcode'+i).val().trim()!=''){
			count++;
			if($('#manualfcount'+i).val()==undefined||$('#manualfcount'+i).val().trim()==''){
				countsj += (i+1)+' ';
			}
		}
	}
	if(count==0){
		newAlert("没有填写记录!");
		return;
	}
	if(countsj!=''){
		newAlert("第"+countsj+"行,请输入数量!");
		return;
	}
	var paramForm = $('#manualbomForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag){
		openblockdiv();
		var url = ctx+"/modelList/model-list!saveManualBatch.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: paramForm,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("保存成功!");
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
					loadBomdRaws();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 列出全部的清单
 * @param sort
 */
function loadAllBomsIndex(sort){
	openblockdiv();
	$('#allbomlist').html("<img src='"+ctx+"/images/icon_load.gif'/>");
	if(null==sort||sort==""||sort==undefined){
		sort = "modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc";
	}
	var url = ctx+"/modelList/model-list!listToQuery.htm";
	var formParam = $('#allbomform').serialize();
	$.webAjax({
		type : "post",
		url : url,
		data: sort+"&"+formParam,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				var filenametemp = '';
				var dis = '';
				var cccount = 0;
				var ccount = 0;
				var first = 0;
				$.each(data.modelListList,function(i,o){
					if(o.sourceType==2&&o.fileName!=filenametemp){
						ccount = cccount;
						html+='<tr id="TR'+ccount+'" align="center" style="cursor:pointer;">';
						html+='<td colspan="4" style="text-align:left;">'+(o.drawtype==1?"总图":"部件图")+':<a href="#" onclick="openthisdraw('+ccount+');">'+o.drawitemcode+'</a></td>';
						html+='<td colspan="2" style="text-align:left;">名称:'+o.drawitemname+'</td>';
						html+='<td colspan="2" style="text-align:left;">'+(null==o.drawitemmode?"":"材料:"+o.drawitemmode)+'</td>';
						html+='<td colspan="4" style="text-align:left;">图纸名称:'+o.fileName+'</td>';
						if(o.drawtype==2){
							html+='<td colspan="2" style="text-align:left;">数量:<input type="text" id="mfcount'+ccount+'" class="input60" value="'+replaceNull(o.mfcount)+'"/></td></tr>';
						}else{
							html+='<td colspan="2" style="text-align:left;"></td></tr>';
						}
						filenametemp = o.fileName;
						dis = ' style="display:none;" name="TR'+ccount+'"';
					}if(o.sourceType==1&&first==0){
						first = 1;
						html+='<tr id="TR10000" align="center" style="cursor:pointer;" onclick="openthisdraw(10000);">';
						html+='<td colspan="4" style="border-left:none;border-right:none;text-align:left;">类型:手动添加</td><td colspan="10" style="border-left:none;text-align:left;"></td></tr>';
						dis = ' style="display:none;" name="TR10000"';
					}else{
						
					}
					html+='<tr align="center"'+dis+'>';
					var disablemark = '';
					var dispatchname = '';
					if(o.isdispatch=='t_bracket_list'){
						disablemark = 'disabled';
						dispatchname = '支架';
					}else if(o.isdispatch=='t_bait_list'){
						disablemark = 'disabled';
						dispatchname = '下料';
					}else if(o.isdispatch=='t_assweld_list'){
						disablemark = 'disabled';
						dispatchname = '组焊';
					}else if(o.isdispatch=='t_assemble_list'){
						disablemark = 'disabled';
						dispatchname = '装配';
					}else if(o.isdispatch=='t_delivery_list'){
						disablemark = 'disabled';
						dispatchname = '发货';
					}else{
						disablemark = '';
						dispatchname = '';
					}
					html+= '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" '+disablemark+'/></td>';
					html+='<td>'+(cccount+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
					html+='<td>'+(o.manualfcount==null?"":o.manualfcount)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+(o.sweight==null?"":o.sweight)+'</td>';
					html+='<td>'+(o.aweight==null?"":o.aweight)+'</td>';
					html+='<td>'+(o.slen==null?"":o.slen)+'</td>';
					html+='<td>'+(o.alen==null?"":o.alen)+'</td>';
					html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='<td>'+(o.sourceType==1?"手动":"图纸")+'</td>';
					html+='<td>'+dispatchname+'</td>';
					html+='</tr>';
					cccount++;
				});
				$('#allbomlist').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 打开图纸对应的bom
 * @param index 图纸的序号
 */
var selectedtyperec = 0;//选的哪个tr,即显示的哪个tr内的内容
function openthisdraw(index){
	for(var i=0;i<100;i++){
		if(i!=index){
			$("tr[name='TR"+i+"']").css("display","none");
		}
	}
	if(index!=10000){
		selectedtyperec = index;
		$("tr[name='TR"+10000+"']").css("display","none");
	}else{
		selectedtyperec = 0;
	}
	var css = $("tr[name='TR"+index+"']").eq(0).css("display");
	if(css!='none'){
		$("tr[name='TR"+index+"']").css("display","none");
		selectedtyperec = 0;
	}else{
		$("tr[name='TR"+index+"']").css("display","");
	}
	$('#allbombody').animate({scrollTop:0}, 'slow');
}
/**
 * 选择是手动输入还是上传图纸还是查看bom总列表
 * @param index
 */
function selecttabindex(index){
	if(index==1){
		addmanual();
		$('#manualbomdiv').css("display","");
		$('#allbomdiv').css("display","none");
		$('#uploaddiv').css("display","none");
	}else if(index==2){
		$('#manualbomdiv').css("display","none");
		$('#allbomdiv').css("display","none");
		$('#uploaddiv').css("display","");
	}else if(index==0){
		$('#manualbomdiv').css("display","none");
		$('#allbomdiv').css("display","");
		$('#uploaddiv').css("display","none");
	}else{
		
	}
}
/**
 * 弹出变更内容窗口
 * @param type
 * @param mark
 */
function changelist_backup(type,mark){
	var obj = null;
	var html = '';
	var modelMark = '';
	if(mark=='bracket'){
		obj = titleObj.model.bracketLists;
		modelMark = "t_bracket_list";
	}else if(mark=='bait'){
		obj = titleObj.model.baitLists;
		modelMark = "t_bait_list";
	}else if(mark=='assweld'){
		obj = titleObj.model.assweldLists;
		modelMark = "t_assweld_list";
	}else if(mark=='assemble'){
		obj = titleObj.model.assembleLists;
		modelMark = "t_assemble_list";
	}else{
		obj = titleObj.model.deliveryLists;
		modelMark = "t_delivery_list";
	}
	$.each(obj,function(i,o){
		var changedesc = '';
		if(o.changestatus==1){
			changedesc = '新增';
		}else if(o.changestatus==2){
			changedesc = '修改';
		}else if(o.changestatus==3){
			changedesc = '删除';
		}else{
			return true;
		}
		html+='<tr align="center">'
		html+='<td><input type="hidden" name="modelList['+i+'].changestatus" value="'+o.changestatus+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].designassistId" value="'+replaceNull(o.designassistId)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].modelId" value="'+replaceNull(o.modelId)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].id" value="'+replaceNull(o.id)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].modelMark" value="'+modelMark+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].bdtId" value="'+replaceNull(o.bdtId)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].alen" value="'+replaceNull(o.alen)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].slen" value="'+replaceNull(o.slen)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].aweight" value="'+replaceNull(o.aweight)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].sweight" value="'+replaceNull(o.sweight)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].itemname" value="'+replaceNull(o.itemname)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].itemcode" value="'+replaceNull(o.itemcode)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].fcount" value="'+replaceNull(o.fcount)+'"/>';
		html+='<input type="hidden" name="modelList['+i+'].fmatrial" value="'+replaceNull(o.fmatrial)+'"/>';
		html+=(i+1)+'</td>';
		html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
		html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
		html+='<td>'+changedesc+'</td>';
		html += '</tr>';
	});
	$('#changecontentbody').html(html);
	openDiv('changecontentDiv');
}
/**
 * 弹出变更内容窗口
 * @param type
 * @param mark
 */
var modelMarkGlobal = '';
function changelist(stype,mark){
	var obj = null;
	var html = '';
	var modelMark = '';
	modelMarkGlobal = mark;
	if(mark=='bracket'){
		obj = titleObj.model.bracketLists;
		modelMark = "t_bracket_list";
	}else if(mark=='bait'){
		obj = titleObj.model.baitLists;
		modelMark = "t_bait_list";
	}else if(mark=='assweld'){
		obj = titleObj.model.assweldLists;
		modelMark = "t_assweld_list";
	}else if(mark=='assemble'){
		obj = titleObj.model.assembleLists;
		modelMark = "t_assemble_list";
	}else{
		obj = titleObj.model.deliveryLists;
		modelMark = "t_delivery_list";
	}
	var cc = 0;
	$.each(obj,function(i,o){
		var changedesc = '';
		if(o.changestatus==1){
			changedesc = '新增';
			cc += 1;
		}else if(o.changestatus==2){
			changedesc = '修改';
			cc += 1;
		}else if(o.changestatus==3){
			changedesc = '删除';
			cc += 1;
		}else{
			return true;
		}
		html+='<tr align="center">';
		html+='<td><input type="hidden" name="modelList['+(cc-1)+'].changestatus" value="'+o.changestatus+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].designassistId" value="'+replaceNull(o.designassistId)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].modelId" value="'+replaceNull(o.modelId)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].id" value="'+replaceNull(o.id)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].modelMark" value="'+modelMark+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].bdtId" value="'+replaceNull(o.bdtId)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].alen" value="'+replaceNull(o.alen)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].slen" value="'+replaceNull(o.slen)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].aweight" value="'+replaceNull(o.aweight)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].sweight" value="'+replaceNull(o.sweight)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].itemname" value="'+replaceNull(o.itemname)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].itemcode" value="'+replaceNull(o.itemcode)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].fcount" value="'+replaceNull(o.fcount)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].modifycount" value="'+replaceNull(o.modifycount)+'"/>';
		html+='<input type="hidden" name="modelList['+(cc-1)+'].fmatrial" value="'+replaceNull(o.fmatrial)+'"/>';
		html+=cc+'</td>';
		html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
		html+='<td>'+(o.modifycount==null?"":o.modifycount)+'</td>';
		html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
		html+='<td>'+changedesc+'</td>';
		html += '</tr>';
	});
	$('#changecontentbody').html(html);
	if(stype!=2){
		openDiv('changecontentDiv');
	}else{
		closeDiv('changecontentselectDiv');
	}
}
/**
 * 弹出变更内容窗口
 * @param type
 * @param mark
 */
function listtabbom(){
	var obj = null;
	var html = '';
	var modelMark = '';
	if(modelMarkGlobal=='bracket'){
		obj = titleObj.model.bracketLists;
		modelMark = "t_bracket_list";
	}else if(modelMarkGlobal=='bait'){
		obj = titleObj.model.baitLists;
		modelMark = "t_bait_list";
	}else if(modelMark=='assweld'){
		obj = titleObj.model.assweldLists;
		modelMark = "t_assweld_list";
	}else if(modelMarkGlobal=='assemble'){
		obj = titleObj.model.assembleLists;
		modelMark = "t_assemble_list";
	}else{
		obj = titleObj.model.deliveryLists;
		modelMark = "t_delivery_list";
	}
	var count = 0;
	$.each(obj,function(i,o){
		var changedesc = '';
		if(o.changestatus==1){
			return true;
		}else if(o.changestatus==2){
			return true;
		}else if(o.changestatus==3){
			return true;
		}else{
			
		}
		html+='<tr align="center">'
		html+='<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" style="width:16px;height:16px;"/>';
		html+='<input type="hidden" name="modelList['+count+'].designassistId" value="'+replaceNull(o.designassistId)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].modelId" value="'+replaceNull(o.modelId)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].id" value="'+replaceNull(o.id)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].modelMark" value="'+modelMark+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].bdtId" value="'+replaceNull(o.bdtId)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].alen" value="'+replaceNull(o.alen)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].slen" value="'+replaceNull(o.slen)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].aweight" value="'+replaceNull(o.aweight)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].sweight" value="'+replaceNull(o.sweight)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].itemname" value="'+replaceNull(o.itemname)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].itemcode" value="'+replaceNull(o.itemcode)+'"/>';
		html+='<input type="hidden" name="modelList['+count+'].fmatrial" value="'+replaceNull(o.fmatrial)+'"/>';
		html+='</td><td>'+count+'</td>';
		html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td><input type="text" class="input60" name="modelList['+count+'].fcount" value="'+replaceNull(o.fcount)+'"/></td>';
		html+='<td><input id="modifycountselect'+o.id+'" type="text" class="input60" name="modelList['+count+'].modifycount" value="'+replaceNull(o.modifycount)+'"/></td>';
		html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
		html+='<td><select id="selectrecord'+o.id+'" name="modelList['+count+'].changestatus"><option value="">请选择</option><option value="2">修改</option><option value="3">删除</option></select></td>';
		html+='</tr>';
		count++;
	});
	$('#changecontentselectbody').html(html);
	openDiv('changecontentselectDiv');
}
/**
 * 变更选择后保存
 */
function changepushselect(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	var rec = '';
	var mod = '';
	$.each(delareas, function(i, o){	
		if(!$(o).attr("disabled")){
			if($('#selectrecord'+$(o).val()).val()==''){
				rec += (i+1)+" ";
			}
			if($('#selectrecord'+$(o).val()).val()=='2'&&$('#modifycountselect'+$(o).val()).val()==''){
				mod += (i+1)+" ";
			}
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		}
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要变更的记录！');
		return;
	}
	if(rec!=''){
		alert("第"+rec+"条记录请选择处理操作类型");
		return;
	}
	if(mod!=''){
		alert("第"+mod+"条记录请输入修改后的数量");
		return;
	}
	var paramForm = $('#changecontentselectForm').serialize();
	var flag = window.confirm("确定保存此变更吗？");
	if(flag){
		var url = ctx+"/designAssist/design-assist!changepushselect.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: paramForm,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("保存成功!");
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
					loadBomdRaws();
				}else{
					alert(data.resultInfo[1]);
				}
				setTimeout("changelist(2,modelMarkGlobal)",1000);
			}
		});
	}
}
function closesigleDiv(id){
	$('#'+id).css("display","none");
}
/**
 * 变更下推
 */
function changepush(){
	var paramForm = $('#changecontentForm').serialize();
	var flag = window.confirm("确定下推变更吗？");
	if(flag){
		var url = ctx+"/designAssist/design-assist!changepush.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: paramForm,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("保存成功!");
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
					loadBomdRaws();
				}else{
					alert(data.resultInfo[1]);
				}
				closeDiv('changecontentDiv');
			}
		});
	}
}
/**
 * 删除tab页中清单的某个记录
 * @param id
 * @param modelid
 * @param modelmark
 */
function deleteModelListDef(id,designassistId,modelid,modelmark){
	var flag = window.confirm("确定删除吗？");
	if(flag){
		var url = ctx+"/modelList/model-list!deleteModelListDef.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: "modelListQuery.id="+id+"&modelListQuery.designassistId="+designassistId+"&modelListQuery.modelId="+modelid+"&modelListQuery.modelMark="+modelmark,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("删除成功!");
					loadAllBomsIndex("modelListQuery.sortColumns=t_model_list.sourceType ,bomdrawtype asc");
					loaddesignassist();
					loadBomdRaws();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
/**
 * 校验图纸和手动录入的差异情况
 */
function checkmanualbomdraw(){
	//openblockdiv();
	var url = ctx+"/manualBomdif/manual-bomdif!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: "manualBomdifQuery.designassistId="+$('#sourceId').val()+"&manualBomdifQuery.sortColumns=t_manual_bomdif.id asc",
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				var index = 0;
				var seq = '';
				$.each(data.manualBomdifList,function(i,o){
					var stye = '';
					var source = '';
					if(o.opertype==0){
						stye = ' style="background-color:#E8B66F;"';
						source = '';
						index += 1;
						seq = index;
					}else if(o.opertype==1){
						source = '手动';
						seq = '';
					}else if(o.opertype==2){
						source = '图纸';
						seq = '';
					}else if(o.opertype==3){
						source = '上下冲突';
						stye = ' style="background-color:#47378C;"';
						index += 1;
						seq = index;
					}else{
						source = '未知';
						seq = '';
					}
					html += '<tr>';
					html += '<td'+stye+'>'+seq+'</td>';
					html += '<td'+stye+'>'+replaceNull(o.itemcode)+'</td>';
					html += '<td'+stye+'>'+replaceNull(o.itemname)+'</td>';
					html += '<td'+stye+'>'+replaceNull(o.manualcount)+'</td>';
					html += '<td'+stye+'>'+replaceNull(o.bomdrawcount)+'</td>';
					html += '<td'+stye+'>'+source+'</td>';
					html += '<tr>';
				});
				if(html==''){
					html = '<font style="font-size:16px;">没有冲突!</font>';
				}else{
					$('#checkmanualbomdrawbtn').removeClass("btn btn-info");
					$('#checkmanualbomdrawbtn').addClass("btn btn-primary");
				}
				$('#checkmanualbomdrawcontent').html(html);
				//closeblockdiv();
				//openDiv('checkmanualbomdrawDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
/**
 * 打开校验结果对话框
 */
function openmanualbomdraw(){
	openDiv('checkmanualbomdrawDiv');
}
/**
 * 重新校验
 */
function checkagain(){
	var flag = window.confirm("确定重新校验吗？");
	openblockdiv();
	if(flag){
		var url = ctx+"/bomDrawTitle/bom-draw-title!countDifAfter.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: "bomDrawTitleQuery.designassistId="+$('#sourceId').val(),
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					checkmanualbomdraw();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}