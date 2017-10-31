$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'warehousepage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_stock.fitemid',
		submitForm : submitForm//分页回调函数
		});	
	search();
});
function submitForm(){
	search();
}
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/stock/stock!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"warehousepage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//html+= '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.fitemid + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.fname==null?"":o.fname)+'</a></td>';
					html+='<td>'+(o.fnumber==null?"":o.fnumber)+'</td>';
					html+='<td>'+(o.fshortnumber==null?"":o.fshortnumber)+'</td>';
					//html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.fitemid+');">编辑</a> | <a href="#" onclick="toDelete('+o.fitemid+');">删除</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 添加仓库信息
 *//*
function addWarehouse(){
	$('#hiddenId').val('');
	$('#fname').val('');
	$('#fnumber').val('');
	$('#fshortnumber').val('');
	openDiv('inputDiv');	
}

*//**
 * 保存流程
 *//*
function save(){
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/stock/stock!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeblockdiv();
					closeDiv('inputDiv');
					search();
				}
			}
		});
	}
}
*//**
 * 删除流程
 * @param id 流程ID
 *//*
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
		alert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/processDefine/process-define!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("删除成功!");
					closeblockdiv();
					search();
				}
			}
		});
	}
}
*//**
 * 编辑流程
 * @param id 流程ID
 *//*
function toEdit(id){
	var url = ctx+"/processDefine/process-define!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"processDefineId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#processName').val(data.model.processName);
				$('#processType').val(data.model.processType);
				$('#isuse').val(data.model.isuse);
				$('#processMark').val(data.model.processMark);
				openDiv('inputDiv');
			}
		}
	});
}
*//**
 * 跳转到流程定义页面
 * @param id 流程ID
 * @param processName 流程名称
 *//*
function toDefine(id,processName){
	window.location.href = ctx+"/process/processadd.htm?processName="+processName+"&processId="+id;
}*/