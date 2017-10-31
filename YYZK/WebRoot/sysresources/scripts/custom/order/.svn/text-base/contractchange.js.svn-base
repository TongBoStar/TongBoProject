$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'contractchangepage',
		formId: 'queryform',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 'contractChangeId',
		submitForm : submitQueryForm//分页回调函数
		});	
	/**设置点击弹出框之外的元素 弹出框消失*/
	document.body.onclick = function(e){
	 e = e || window.event;
	 var target = e.target || e.srcElement;
	 if(target.id == "selectContractUserDiv"||target.id == "contractUser"
		 ||target.id == "selectMarketManagerDiv"||target.id == "marketManagerName"||target.id == "orderCode") {
		 return;
	 }else{
		 $('#selectContractUserDiv').css("display","none");
		 $('#selectMarketManagerDiv').css("display","none");
		 $('#orderCodeDiv').css("display","none");
	 }
	};
	loadContractChanges();
	 $('#blongFileUpload').uploadify({
			'swf' : ctx+'/uploadify/uploadify.swf',
			'uploader' : ctx+'/common/file-upload.htm',// 处理Action
			'folder' : '/uploads',// 服务端默认保存路径
			// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
			'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
			// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
			'multi' : 'false',// 多文件上传开关
			'fileTypeExts' : '*.doc;*.docx;*.pdf',// 文件过滤器
			'fileTypeDesc' : 'doc,docx,pdf文件',// 文件过滤器 详解见文档
			'hideButton' : true,
			'fileObjName' : 'uploadFile',
			'uploadLimit' : 5,
			'height':20,
	        'width':60,
			'onUploadComplete' : function(file) {
				// response为服务器端返回的字符串值
			},
			'onUploadError' : function(file, errorCode, errorMsg) {
				alert(errorMsg);
			},
			'onUploadSuccess' : function(file, data, response) {
				data = $.parseJSON(data);
				$('#blongFileShow').val(data.srcfilename);
				$('#blongFile').val(data.filename);
			}
		});
	 $('#changeFileUpload').uploadify({
			'swf' : ctx+'/uploadify/uploadify.swf',
			'uploader' : ctx+'/common/file-upload.htm',// 处理Action
			'folder' : '/uploads',// 服务端默认保存路径
			// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
			'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
			// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
			'multi' : 'false',// 多文件上传开关
			'fileTypeExts' : '*.doc;*.docx;*.pdf',// 文件过滤器
			'fileTypeDesc' : 'doc,docx,pdf文件',// 文件过滤器 详解见文档
			'hideButton' : false,
			'fileObjName' : 'uploadFile',
			'uploadLimit' : 5,
			'height':20,
	        'width':60,
			'onUploadComplete' : function(file) {
				// response为服务器端返回的字符串值
			},
			'onUploadError' : function(file, errorCode, errorMsg) {
				alert(errorMsg);
			},
			'onUploadSuccess' : function(file, data, response) {
				data = $.parseJSON(data);
				$('#changeFileShow').val(data.srcfilename);
				$('#changeFile').val(data.filename);
			}
		});
	 $('#assitFileUpload').uploadify({
			'swf' : ctx+'/uploadify/uploadify.swf',
			'uploader' : ctx+'/common/file-upload.htm',// 处理Action
			'folder' : '/uploads',// 服务端默认保存路径
			// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
			'buttonText' : '上传文件',// 按钮显示文字,不支持中文,解决方案见下
			// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
			'multi' : 'true',// 多文件上传开关
			'fileTypeExts' : '*.doc;*.docx;*.pdf',// 文件过滤器
			'fileTypeDesc' : 'doc,docx,pdf文件',// 文件过滤器 详解见文档
			'hideButton' : true,
			'fileObjName' : 'uploadFile',
			'uploadLimit' : 5,
			'height':20,
	        'width':60,
			'onUploadComplete' : function(file) {
				// response为服务器端返回的字符串值
			},
			'onUploadError' : function(file, errorCode, errorMsg) {
				alert(errorMsg);
			},
			'onUploadSuccess' : function(file, data, response) {
				data = $.parseJSON(data);
				$('#assitFileShow').val(data.srcfilename);
				$('#assitFile').val(data.filename);
			}
		});
});
function submitQueryForm(simpleTable, param){
	loadContractChanges();
}

/**
 * 查询标准订单信息
 */
function loadContractChanges() {
	openblockdiv();
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx + '/contractChange/contract-change!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"contractchangepage",simpleTable);
			//组装table
			$.each(page.result, function(i, o){
				/**
				var status;
				var editorder = "";
				var submitorder = "";
				var examineorder = "";
				var refuseReason = "";
				if(o.contractChangeStatus==0){
					status= "待提交";
					editorder = '<a href="javascript:toEditContractChange('+o.contractChangeId+');">修改</a>|';
					submitorder = '<a href="javascript:submitContractChange('+o.contractChangeId+');">提交</a>|';
				}else if(o.contractChangeStatus==1){
					status= "待审核";
					examineorder = '<a href="javascript:examineContractChange('+o.contractChangeId+',\''+o.orderCode+'\');">审核</a>|';
				}else if(o.contractChangeStatus==2){
					status= "已生效";
				}else if(o.contractChangeStatus==3){
					status= "被驳回";
					editorder = '<a href="javascript:toEditContractChange('+o.contractChangeId+');">修改</a>|';
					submitorder = '<a href="javascript:submitContractChange('+o.contractChangeId+');">提交</a>|';
					refuseReason = replaceNull(o.examineAdvice);
					if(refuseReason!=""){
						refuseReason = "("+refuseReason+")";
					}
				}else{
					status= "未知";
				}
				html += '<tr>';
				html += '<td><input type="checkbox"  id="checkedOrder" name="checkedContractChange" value="' + o.contractChangeId + '"/></td>';
				html += '<td>'+o.orderCode+'</td><td>' + o.contractCode + '</td><td>' + o.contractName + '</td>';
				html += '<td>' + formatDate("yyyy-MM-dd",o.contractChangeTime) + '</td><td>' + replaceNull(o.contractUser) + '</td><td>' + formatDate("yyyy-MM-dd",o.examineTime) + '</td>';
				html +=  '</td><td>' + status + refuseReason+ '</td>';
				html += '<td>'+editorder+submitorder+examineorder+'<a href="javascript:toCheckContractChange('+o.contractChangeId+');">查看</a>|</td>';
				html += '</tr>';
				**/
				var edits = '<a href="javascript:editContractChangenew('+o.contractChangeId+');">编辑</a>|';
				var dels = '<a href="javascript:delContractChanges('+o.contractChangeId+');">删除</a>';
				var status = '';
				if(1==o.relativestatus){
					edits = '';
					dels = '';
					status = '已被关联';
				}
				html += '<tr>';
				html += '<td><input type="checkbox"  id="checkedOrder" name="checkedContractChange" value="' + o.contractChangeId + '"/></td>';
				html += '<td>'+o.orderCode+'</td><td>' + o.contractCode + '</td>';
				html += '<td><a href="javascript:checkFile(\'' + o.changeFile + '\')">查看</a></td>';
				html += '<td><a href="javascript:checkFile(\'' + o.assitFile + '\')">查看</a></td>';
				html += '<td>' + replaceNull(o.uploaderName) + '</td>';
				html += '<td>' + formatDate("yyyy-MM-dd",o.uploaderTime) + '</td>';
				html += '<td>' + replaceNull(o.relativerName) + '</td>';
				html += '<td>' + formatDate("yyyy-MM-dd",o.relativeTime) + '</td>';
				html += '<td>'+edits+dels+status+'</td>';
				html += '</tr>';
			});
			$('#data-body').html(html);
			closeblockdiv();
		}
	});
}
function editContractChangenew(id){
	$.webAjax({
		type : 'post',
		url : ctx + '/contractChange/contract-change!showToJson.htm',
		data :'id='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#orderCode').val(data.contractChange.orderCode);
				$('#contractCode').val(data.contractChange.contractCode);
				$('#contractChangeIdHiddenFile').val(data.contractChange.contractChangeId);
				openDiv('uploadDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}

/**
 * 保存变更单
 */
function submitForm() {
	var pageParam = simpleTable.bindPageParam();
	var queryForm = $('#queryForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/contractChange/contract-change!save.htm',
			data :pageParam +'&'+queryForm,
			success : function(data) {
				window.location.href = ctx+"/order/contractchange-list.htm";
			}
		});
	}
}
/**
 * 添加变更单
 */
function addContractChange(){
	//window.location.href = ctx+"/order/contractchange-add.htm";
	$('#orderCode').val("");
	$('#contractCode').val("");
	openDiv('uploadDiv');
}
/**
 * 新版保存变更单
 */
function uploadexe(){
	if($.trim($('#orderCode').val())==""){
		alert("订单编号不能为空!");
		return;
	}else if($.trim($('#contractCode').val())==""){
		alert("合同编号不能为空!");
		return;
	}else{
		var uploadForm = $('#uploadForm').serialize();
		var flag = window.confirm("确定保存吗？");
		if(flag==true){
			$.webAjax({
				type : 'post',
				url : ctx + '/contractChange/contract-change!save.htm',
				data :uploadForm,
				success : function(data) {
					data = $.parseJSON(data);
					if(data.resultInfo[0]=='0'){
						closeDiv('uploadDiv');
						loadContractChanges();
					}else{
						alert(data.resultInfo[1]);
					}
				}
			});
		}
	}
}
/**
 * 保存变更单
 */
function savecontractchange(){
	if(checkOrderParams()){
		submitForm();
	}
}
/**
 * 校验订单各参数
 * @returns {Boolean}
 */
function checkOrderParams(){
	if($.trim($('#orderCode').val())==""){
		alert("订单编号不能为空!");
	}else if($.trim($('#contractCode').val())==""){
		alert("合同编号不能为空!");
	}else if($.trim($('#contractName').val())==""){
		alert("合同名称不能为空!");
	}else if($.trim($('#contractUser').val())==""){
		alert("负责人不能为空!");
	}else if($.trim($('#contractChangeTime').val())==""){
		alert("日期不能为空!");
	}else if($.trim($('#orderGoodsCompany').val())==""){
		alert("订货方不能为空!");
	}else if($.trim($('#changeContent').val())==""){
		alert("变更内容不能为空!");
	}else if($.trim($('#changeReason').val())==""){
		alert("变更原因不能为空!");
	}else{
		return true;
	}
	return false;
}
/**
 * 跳转到变更合同通知单页面
 * @param id 要编辑的通知单的id
 */
function toEditContractChange(id){
	window.location.href = ctx+"/order/contractchange-add.htm?contractChangeId="+id;
}
/**
 * 编辑变更通知单
 * @param id 要编辑的通知单的id
 */
function editContractChange(id){
	if(null!=id&&id!=""){
		$.webAjax({
			type : 'post',
			url : ctx + '/contractChange/contract-change!input.htm?id='+id,
			success : function(data) {
				$('#contractChangeIdHidden').val(data.contractChangeId);
				$('#orderCode').val(data.orderCode);
				$('#contractCode').val(data.contractCode);
				$('#contractName').val(data.contractName);
				$('#blongFile').val(data.blongFile);
				$('#contractUser').val(data.contractUser);
				$('#contractUserId').val(data.contractUserId);
				$('#contractChangeTime').val(formatDate("yyyy-MM-dd",data.contractChangeTime));
				$('#orderGoodsCompany').val(data.orderGoodsCompany);
				$('#changeContent').val(data.changeContent);
				$('#changeReason').val(data.changeReason);
				$('#customAdvice').val(data.customAdvice);
				$('#marketManagerAdvice').val(data.marketManagerAdvice);
				$('#marketManagerName').val(data.marketManagerName);
				$('#marketManagerId').val(data.marketManagerId);
				$('#examineTime').val(formatDate("yyyy-MM-dd",data.examineTime));
				$('#blongFileShow').val(data.blongFile);
			}
		});
	}
}
/**
 * 提交到审核变更通知单
 */
function submitContractChange(id){
	if(!confirm('确定提交变更单？')) {
		return;
	}
	$.webAjax({
		type : 'post',
		url : ctx + '/contractChange/contract-change!save.htm',
		data :{"contractChange.contractChangeId":id,"contractChange.contractChangeStatus":1},
		success : function(data) {
			alert("提交成功!");
			loadContractChanges();
		}
	});
}
/**
 * 单个、批量删除变更单
 * @param id 单个变更单的id
 */
function delContractChanges(id){
	var param = {};
	if(null!=id&&id!='') {
		param['checkedIdList[0]'] = id;
	} else {		
		var delDecvices = $('[name="checkedContractChange"]:checked');
		var cnt = 0;
		$.each(delDecvices, function(i, o){		
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的变更单！');
		return;
	}
	
	if(!confirm('确定删除变更单？')) {
		return;
	}
	var url = ctx + '/contractChange/contract-change!delete.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			if(data && data == 'success') {
				loadContractChanges();
			} else {
				alert('删除变更单失败！');
			}
		}
	});
}
/**
 * 弹出审核窗口
 * @param 被审核变更单的id
 */
function examineContractChange(id,orderCode){
	$('#contractChangeIdHidden').val(id);
	$('#orderCodeHidden').val(orderCode);
	openDiv('examineDiv');
}
/**
 * 审核
 */
function examineAgree(){
	var contractChangeId = $('#contractChangeIdHidden').val();
	var contractChangeStatus = $("input[name='examine']:checked").val();
	var examineAdvice = $('#examineAdvice').val();
	var orderCode = $('#orderCodeHidden').val();
	var flag = window.confirm("确定提交吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/contractChange/contract-change!examineContractChange.htm',
			data :{	"contractChange.contractChangeId":contractChangeId,
					"contractChange.contractChangeStatus":contractChangeStatus,
					"contractChange.examineAdvice":examineAdvice,
					"contractChange.orderCode":orderCode},
			success : function(data) {
				loadContractChanges();
				$('#contractChangeId').val("");
				closeDiv('examineDiv');
			}
		});
	}
}
/**
 * 弹出销售负责人列表
 */
function toAddContractUser(){
	$("#selectContractUserDiv").css("display","");
	var name = $("#contractUser").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="contractUserSelect" onchange="addContractUser();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/adminList.htm';
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
			$('#selectContractUser').html(html);
		}
	});	
}
/**
 * 添加销售负责人
 */
function addContractUser(){
	var selectValue = $('#contractUserSelect').val();
	var selectTxt = $("#contractUserSelect").find('option:[value='+selectValue+']').text();
	$('#contractUser').val(selectTxt);
	$('#contractUserId').val(selectValue);
	$("#selectContractUserDiv").css("display","none");
}
/**
 * 弹出销售主管
 */
function toAddMarketManager(){
	$("#selectMarketManagerDiv").css("display","");
	var name = $("#marketManagerName").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="marketManagerSelect" onchange="addMarketManager();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/adminList.htm';
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
			$('#selectMarketManager').html(html);
		}
	});	
}
/**
 * 添加销售负责人
 */
function addMarketManager(){
	var selectValue = $('#marketManagerSelect').val();
	var selectTxt = $("#marketManagerSelect").find('option:[value='+selectValue+']').text();
	$('#marketManagerName').val(selectTxt);
	$('#marketManagerId').val(selectValue);
	$("#selectMarketManagerDiv").css("display","none");
}
/**
 * 跳转到查看变更单页面
 * @param id
 */
function toCheckContractChange(id){
	window.location.href = ctx+'/order/contractchange-check.htm?id='+id;
}
/**
 * 查看变更单
 * @param id
 */
function checkContractChage(id){
	$.webAjax({
		type : 'post',
		url : ctx + '/contractChange/contract-change!input.htm?id='+id,
		success : function(data) {
			$('#contractChangeIdHidden').html(data.contractChangeId);
			$('#orderCode').html(data.orderCode);
			$('#contractCode').html(data.contractCode);
			$('#contractName').html(data.contractName);
			$('#contractUser').html(data.contractUser);
			$('#contractChangeTime').html(data.contractChangeTime);
			$('#orderGoodsCompany').html(data.orderGoodsCompany);
			$('#changeContent').html(data.changeContent);
			$('#changeReason').html(data.changeReason);
			$('#customAdvice').html(data.customAdvice);
			$('#marketManagerAdvice').html(data.marketManagerAdvice);
			$('#marketManagerName').html(data.marketManagerName);
			$('#examineTime').html(data.examineTime);
			$('#blongFileShow').html("<a href='javascript:checkFile(\""+data.blongFile+"\");'>查看</a>|<a href='javascript:downloadFile(\""+data.blongFile+"\");'>下载</a>");
		}
	});
}
/**
 * 下载文件
 * @param path 下载的文件的路径
 */
function downloadFile(path){
	  var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+path;
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
/**
 * 在线预览文件
 * @param path
 */
function checkFile(path){
	var usepath = path.substring(0,path.indexOf("."));
	openDiv('checkDiv');
	new FlexPaperViewer(	
			 ctx+'/FlexPaperViewer',
			 'viewerPlaceHolder', 
			 { 
				 config : {
					 SwfFile : escape(ctx+usepath+'.swf'),
					 Scale : 0.6, 
					 ZoomTransition : 'easeOut',
					 ZoomTime : 0.5,
					 ZoomInterval : 0.2,
					 FitPageOnLoad : true,
					 FitWidthOnLoad : false,
					 FullScreenAsMaxWindow : false,
					 ProgressiveLoading : false,
					 MinZoomSize : 0.2,
					 MaxZoomSize : 5,
					 SearchMatchAll : false,
					 InitViewMode : 'SinglePage',
					 
					 ViewModeToolsVisible : true,
					 ZoomToolsVisible : true,
					 NavToolsVisible : true,
					 CursorToolsVisible : true,
					 SearchToolsVisible : true,
							
					localeChain: 'en_US'
				 }
			});
}
//订单编号选择
function orderCodeCheck(){
	/*var offsettop=$("#orderCode").offset().top;   
 	var offsetleft=$("#orderCode").offset().left;
	$("#orderCodeDiv").css({position: "absolute",'top':offsettop-20,'left':offsetleft-205}); */
	$("#orderCodeDiv").css("display","");
	var code = $("#orderCode").val();
	var html='<td><select id="selectCode" onchange="changeCode();" style="width: 300px; height: 160px;background-color: #ccc;" multiple="true">';
	var url =ctx+'/sysOrder/sys-order!findCheckedList.htm';
	var data = 'sysOrderQuery.contractCode='+code;
 	$.webAjax({
				type : "post",
				url : url,
				data :data,
				success : function(data) {
								data = $.parseJSON(data);
								var list = data.sysOrderList;
								$.each(list,function(i,o){
									html+='<option value="'+o.orderCode+'" >'+o.orderCode+'|'+o.checkProject+'</option>';
								});
							
						html+='</select></td>';
						$('#orderCodeSelectsbody').html(html);
				}
	});	
}
function changeCode(){			
	var sel = $("#selectCode").val();
	var txt = $("#selectCode").find("option:selected").text();
	$("#orderCode").val(sel);
	$("#contractCode").val(sel);
	$("#orderCodeDiv").css("display","none");
	
}