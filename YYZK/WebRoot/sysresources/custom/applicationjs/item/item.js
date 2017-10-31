$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'itemlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_item.id',
		submitForm : submitForm//分页回调函数
		});	
	search();
	loadModules();
	loadActivityInfos();
});
function submitForm(){
	search();
}
/**
 * 加载列表
 */
function search(){
	//$('#departmentIdQuery').val(teamId);
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/item/item!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"orderlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.itemName)+'</td>';
					html+='<td>'+replaceNull(o.itemPriceAux)+'</td>';
					html+='<td>'+replaceNull(o.wxProductId)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.subjectCode)+'\');">'+replaceNull(o.subjectCode)+'</a></td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function lookcdicon(subjectCode){
	$('#cdicon').attr("src",getWebRootPath()+"/stcode/"+subjectCode+".jpg");
	openDiv('cdiconDiv');
}
function saveToItemActivityInfo(){
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputActivityInfoForm').serialize();
		var url = ctx+"/item/item!saveToJson.htm";
		$.webAjax({
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('inputActivityInfoDiv');
					search();
				}else{
					alert(data.resultInfo[1]);
					closeblockdiv();
				}
			}
		});
	}
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
	$('#itemName').val('');
	$('#itemPriceAux').val('');
	$('#wxProductId').val('');
	$('#subjectCode').val('');
	openDiv('inputDiv');
}
/**
 * 点击添加按钮进行添加
 */
function toAddImages(){
	window.location.href=ctx+"/item/itemimg.htm"
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#itemName').val().trim()==""){
		newAlert("必须输入步骤名称!");
		return;
	}
	if($('#itemPriceAux').val().trim()==""){
		newAlert("必须输入价格!");
		return;
	}
	if($('#wxProductId').val().trim()==""){
		newAlert("必须输入产品编号");
		return;
	}else{}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/item/item!saveToJson.htm";
		$.webAjax({
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
	openblockdiv();
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid = $(o).val();
		cnt++;
	});
	if(cnt>1){
		alert("每次只能编辑一条!");
		closeblockdiv();
		return;
	}
	if(cnt==0){
		alert("请选择一条编辑的记录!");
		closeblockdiv();
		return;
	}
	var url = ctx+"/item/item!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"itemId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#itemName').val(data.model.itemName);
				$('#itemPriceAux').val(data.model.itemPriceAux);
				$('#wxProductId').val(data.model.wxProductId);
				$('#subjectCode').val(data.model.subjectCode);
				openDiv('inputDiv');
				closeblockdiv();
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
		var url = ctx+"/item/item!deleteToJson.htm";
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