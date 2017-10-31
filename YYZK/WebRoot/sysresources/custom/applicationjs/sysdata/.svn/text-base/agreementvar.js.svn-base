$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'agreementvarpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_agreement_var.id',
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
	var url = ctx+"/agreementVar/agreement-var!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"agreementvarpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var attrType='';
					if(o.attrType==1){
						attrType='浮点型';
					}else if(o.attrType==2){
						attrType='整型';
					}else if(o.attrType==3){
						attrType='长整型';
					}else if(o.attrType==4){
						attrType='时间日期';
					}else{
						attrType='标识符';
					}
					var fmust='';
					if(o.fmust==1){
						fmust='必需';
					}else{
						fmust='非必需';
					}
					html+='<tr align="center">';
					//html+= '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.attrName==null?"":o.attrName)+'</a></td>';
					html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='<td>'+(o.attrLen==null?"":o.attrLen)+'</td>';
					html+='<td>'+attrType+'</td>';
					html+='<td>'+fmust+'</td>';
					html+='<td>'+(o.remark==null?"":o.remark)+'</td>';//<a href="#" onclick="toDelete('+o.id+');">删除</a>
					html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a></td>';
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
	$('#attrName').val('');
	$('#attrLen').val('');
	$('#fmark').val('');
	$('#attrType').val(1);
	$('#fmust').val(0);
	$('#remark').val('');
	openDiv('inputDiv');
}
/**
 * 保存任务流程
 */
function save(){
	if($('#attrName').val().trim()==''){
		alert("名称不能为空");
		return;
	}
	if($('#fmark').val().trim()==''){
		alert("标识不能为空");
		return;
	}
	if($('#attrLen').val().trim()==''){
		alert("长度不能为空");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/agreementVar/agreement-var!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					closeDiv('inputDiv');
					closeblockdiv();
					search();
				}
			}
		});
	}
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
	openblockdiv();
	var url = ctx+"/agreementVar/agreement-var!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"agreementVarId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#attrName').val(data.model.attrName);
				$('#attrLen').val(data.model.attrLen);
				$('#fmark').val(data.model.fmark);
				$('#attrType').val(data.model.attrType);
				$('#fmust').val(data.model.fmust);
				$('#remark').val(data.model.remark);
				closeblockdiv();
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
		var url = ctx+"/agreementVar/agreement-var!deleteToJson.htm";
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