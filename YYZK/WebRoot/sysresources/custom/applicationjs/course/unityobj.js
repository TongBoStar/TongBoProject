$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'unityobjlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_unityobj.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
});
function submitForm(){
	search();
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/unityobj/unityobj!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"unityobjlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.objName)+'</td>';
					html+='<td>'+replaceNull(o.enName)+'</td>';
					html+='<td>'+replaceNull(o.sceneCode)+'</td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#objName').val("");
	$('#sceneCode').val("");
	$('#enName').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#objName').val().trim()==""){
		newAlert("必须输入对象名称!");
		return;
	}
	if($('#sceneCode').val().trim()==""){
		newAlert("必须选择对象代码!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/unityobj/unityobj!saveToJson.htm";
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
	$('#objName').val("");
	$('#sceneCode').val("");
	$('#enName').val("");
	$('#fmark').val("");
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
	var url = ctx+"/unityobj/unityobj!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"domainId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#objName').val(replaceNull(data.model.objName));
				$('#sceneCode').val(replaceNull(data.model.sceneCode));
				$('#enName').val(data.model.enName);
				$('#fmark').val(data.model.fmark);
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
		var url = ctx+"/unityobj/unityobj!deleteToJson.htm";
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
