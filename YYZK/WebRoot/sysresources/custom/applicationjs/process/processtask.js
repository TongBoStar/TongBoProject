$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'processtaskpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_process_task.id',
		submitForm : submitForm//分页回调函数
		});	
	search();
	loadprocess();
});
function submitForm(){
	search();
}
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/processTask/process-task!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"processtaskpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//html+= '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.taskName==null?"":o.taskName)+'</a></td>';
					html+='<td>'+(o.taskCode==null?"":o.taskCode)+'</td>';
					html+='<td>'+(o.processName==null?"":o.processName)+'</td>';
					html+='<td>'+(o.taskMark==null?"":o.taskMark)+'</td>';
					html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a> | <a href="#" onclick="toDelete('+o.id+');">删除</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
function addProcessTask(){
	$('#hiddenId').val('');
	$('#taskName').val('');
	$('#taskCode').val('');
	$('#processIds').val('');
	$('#taskMark').val('');
	openDiv('inputDiv');
}
/**
 * 保存任务流程
 */
function save(){
	if($('#taskName').val().trim()==''){
		alert("任务名称不能为空");
		return;
	}
	if($('#taskCode').val().trim()==''){
		alert("任务编码不能为空");
		return;
	}
	var url = ctx+"/processTask/process-task!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"processTaskQuery.taskCode="+$('#taskCode').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if($('#hiddenId').val()==''&&data.processTaskList.length>0){
					alert("系统中已经存在任务编码:"+$('#taskCode').val()+",请更换!");
				}else{
					exesave()
				}
			}else{
				alert("系统响应失败,请联系管理员!");
			}
		}
	});
}
/**
 * 执行保存
 */
function exesave(){
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/processTask/process-task!saveToJson.htm";
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
function toEdit(id){
	var url = ctx+"/processTask/process-task!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"processTaskId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#taskName').val(data.model.taskName);
				$('#taskCode').val(data.model.taskCode);
				$('#processIds').val(data.model.processIds);
				$('#taskMark').val(data.model.taskMark);
				openDiv('inputDiv');
			}
		}
	});
}
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
		var url = ctx+"/processTask/process-task!deleteToJson.htm";
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
function loadprocess(){
	var html = '';
	var url = ctx+"/processDefine/process-define!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.processDefineList,function(i,o){
					html+='<option value="'+o.id+'">'+o.processName+'</td>';
				});
				$('#processIds').html(html);
				/*$('.selectpicker').selectpicker({
			        iconBase: 'fa',
			        tickIcon: 'fa-check'
			    });*/
			}
		}
	});
}