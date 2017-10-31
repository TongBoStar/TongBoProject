$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'processdefinepage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_process_define.id',
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
	var url = ctx+"/processDefine/process-define!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"processdefinepage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var isuse;
				var processType;
				$.each(page.result,function(i,o){
					if(o.isuse==null){
						isuse = "";
					}else if(o.isuse==0){
						isuse = "禁用";
					}else if(o.isuse==1){
						isuse = "使用";
					}else{
						isuse = "未知";
					}
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.processName==null?"":o.processName)+'</a></td>';
					html+='<td>'+o.depbelongName+'</td>';
					html+='<td>'+isuse+'</td>';
					html+='<td>'+o.createrName+'</td>';
					html+='<td>'+(o.createTime==null?"":o.createTime)+'</td>';
					html+='<td>'+(o.processMark==null?"":o.processMark)+'</td>';
					html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a> | <a href="#" onclick="toDefine('+o.id+',\''+o.processName+'\');">定义</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
/**
 * 添加流程
 */
function addProcess(){
	$('#hiddenId').val('');
	$('#processName').val('');
	$('#processType').val('');
	$('#isuse').val('');
	$('#processMark').val('');
	openDiv('inputDiv');
}
/**
 * 保存流程
 */
function save(){
	$('#createrId').val(realId);
	$('#createrName').val(realName);
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/processDefine/process-define!saveToJson.htm";
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
/**
 * 删除流程
 * @param id 流程ID
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
/**
 * 编辑流程
 * @param id 流程ID
 */
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
/**
 * 跳转到流程定义页面
 * @param id 流程ID
 * @param processName 流程名称
 */
function toDefine(id,processName){
	window.location.href = ctx+"/process/processadd.htm?processName="+processName+"&processId="+id;
}