$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'itemsteplistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_item_step.id',
		submitForm : submitForm//分页回调函数
	});
	loadItems();
});
function submitForm(){
	search();
}
function loadItems(){
	var url = ctx+"/item/item!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'',
		success : function(data) {
			data = $.parseJSON(data);
			var html = "";
			html+='<option value="">---全部---</option>';
			$.each(data.itemList,function(i,o){
				html+='<option value="'+o.id+'">'+replaceNull(o.itemName)+'</option>';
			});
			$('#itemselection').html(html);
			$('#itemId').html(html);
			$('#itemselection').val($('#itemIdHidden').val());
			search();
			if(""!=$('#itemIdHidden').val()&&null!=$('#itemIdHidden').val()){
				$('#itemId').val($('#itemIdHidden').val());
				openDiv('inputDiv');
			}
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
	var url = ctx+"/itemStep/item-step!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"itemsteplistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.stepNo)+'</td>';
					html+='<td>'+replaceNull(o.item.itemName)+'</td>';
					html+='<td>'+replaceNull(o.stepName)+'</td>';
					html+='<td>'+replaceNull(o.stepNeeds)+'</td>';
					html+='<td>'+replaceNull(o.stepContent)+'</td>';
					html+='<td>'+replaceNull(o.stepTimes)+'</td>';
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
/**
 * 导出为Excel
 * @param id
 */
function toExportAllExcel2007(){
	var id = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o) {
		id = $(o).val();
		cnt++;
	});
	if (cnt > 1) {
		newAlert("每次只能导出一个项目!");
		return;
	}
	if (cnt == 0) {
		newAlert("请选择要导出的项目!");
		return;
	}
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx
			+ "/designAssist/design-assist!exportAllExcel2007.htm?designAssistQuery.id="
			+ id;
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val('');
	$('#itemId').val($('#itemselection').val());
	$('#stepNo').val('');
	$('#stepName').val('');
	$('#stepNeeds').val('');
	$('#stepContent').val('');
	$('#stepTimes').val('');
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#stepName').val().trim()==""){
		newAlert("必须输入步骤名称!");
		return;
	}
	if($('#stepNo').val().trim()==""){
		newAlert("必须输入步骤序号!");
		return;
	}
	if($('#stepContent').val().trim()==""){
		newAlert("必须输入步骤内容!");
		return;
	}
	if($('#stepTimes').val().trim()==""){
		newAlert("必须输入时长");
		return;
	}else if(isNaN($('#stepTimes').val().trim())||parseFloat($('#stepTimes').val().trim())<0){
		newAlert("时长必须是大于0的数字");
		return;
	}else{}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/itemStep/item-step!saveToJson.htm";
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
	var url = ctx+"/itemStep/item-step!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"itemStepId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#itemId').val(data.model.item.id);
				$('#stepNo').val(data.model.stepNo);
				$('#stepName').val(data.model.stepName);
				$('#stepNeeds').val(data.model.stepNeeds);
				$('#stepContent').val(data.model.stepContent);
				$('#stepTimes').val(data.model.stepTimes);
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
		var url = ctx+"/itemStep/item-step!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("删除成功!");
					closeblockdiv();
					search();
				}
			}
		});
	}
}
