$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'salesbratiopage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_sales_bratio.id',
		submitForm : submitForm//分页回调函数
	});
	search();
	/**设置点击弹出框之外的元素 弹出框消失 开始*/
	document.body.onclick = function(e){
		 e = e || window.event;
		 var target = e.target || e.srcElement;
		 if(target.id == "salemanagerName"||target.id == "selectsalemanagerDiv"||
				 target.id == "saleName"||target.id == "selectSalerDiv"|| 
				 target.id == "areamanagerName"||target.id == "selectareamanagerDiv"){
			 return;
		 }else{
			 $('#selectareamanagerDiv').css("display","none");
			 $('#selectsalemanagerDiv').css("display","none");
			 $('#selectSalerDiv').css("display","none");
		 }
	};
});
function submitForm(){
	search();
}
function search(){
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/salesBratio/sales-bratio!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"salesbratiopage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var isuse;
				var processType;
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.saleName==null?"":o.saleName)+'</a></td>';
					html+='<td>'+replaceNull(o.bztarget)+'</td>';
					html+='<td>'+replaceNull(o.bzselfratio)+'</td>';
					html+='<td>'+replaceNull(o.fbselfratio)+'</td>';
					html+='<td>'+replaceNull(o.bzsmratio)+'</td>';
					html+='<td>'+replaceNull(o.fbsmratio)+'</td>';
					html+='<td>'+replaceNull(o.bzamratio)+'</td>';
					html+='<td>'+replaceNull(o.fbamratio)+'</td>';
					html+='<td>'+replaceNull(o.fnotes)+'</td>';
					html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
function addsalesbratio(){
	$('#hiddenId').val('');
	$('#saleId').val('');
	$('#saleName').val('');
	$('#bztarget').val('');
	$('#bzselfratio').val('');
	$('#fbselfratio').val('');
	$('#bzsmratio').val('');
	$('#fbsmratio').val('');
	$('#bzamratio').val('');
	$('#fbamratio').val('');
	$('#salemanagerId').val('');
	$('#salemanagerName').val('');
	$('#areamanagerId').val('');
	$('#areamanagerName').val('');
	$('#fnotes').val('');
	openDiv('inputDiv');
}
/**
 * 弹出业务员列表
 */
function toSaler(){
	//$('#selectSalerDiv').css("margin-left",$('#fcurempname').offset().left-215);
	$("#selectSalerDiv").css("display","");
	var name = $("#saleName").val();//文本域输入值
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="salerSelect" onchange="addSaler();" style="width: 175px; height: 115px;background-color: #E0E9EA"; multiple="true">';
		html+='';
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
			$('#selectSaler').html(html);
		}
	});	
}
/**
 * 添加业务员
 */
function addSaler(){
	var selectValue = $('#salerSelect').val();
	var selectTxt = $("#salerSelect").find('option:selected').text();
	$('#saleName').val(selectTxt);
	$('#saleId').val(selectValue);
	$("#selectSalerDiv").css("display","none");
}
/**
 * 弹出销售经理列表
 */
function tosalemanager(){
	$("#selectsalemanagerDiv").css("display","");
	var name = $("#salemanagerName").val();//文本域输入值
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="salemanagerSelect" onchange="addsalemanager();" style="width: 175px; height: 115px;background-color: #E0E9EA"; multiple="true">';
		html+='';
	var url =ctx+'/system/findListByDepart.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectsalemanager').html(html);
		}
	});	
}
/**
 * 添加销售经理
 */
function addsalemanager(){
	var selectValue = $('#salemanagerSelect').val();
	var selectTxt = $("#salemanagerSelect").find('option:selected').text();
	$('#salemanagerName').val(selectTxt);
	$('#salemanagerId').val(selectValue);
	$("#selectsalemanagerDiv").css("display","none");
}
/**
 * 弹出区域经理列表
 */
function toareamanager(){
	$("#selectareamanagerDiv").css("display","");
	var name = $("#areamanagerName").val();//文本域输入值
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="areamanagerSelect" onchange="addareamanager();" style="width: 175px; height: 115px;background-color: #E0E9EA"; multiple="true">';
		html+='';
	var url =ctx+'/system/findListByDepart.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectareamanager').html(html);
		}
	});	
}
/**
 * 添加区域经理
 */
function addareamanager(){
	var selectValue = $('#areamanagerSelect').val();
	var selectTxt = $("#areamanagerSelect").find('option:selected').text();
	$('#areamanagerName').val(selectTxt);
	$('#areamanagerId').val(selectValue);
	$("#selectareamanagerDiv").css("display","none");
}
function save(){
	var formparam = $('#inputForm').serialize();
	var url =ctx+'/salesBratio/sales-bratio!saveToJson.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:formparam,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("保存成功!");
				closeDiv('inputDiv');
				search();
			}
		}
	});
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
		var url = ctx+"/salesBratio/sales-bratio!deleteToJson.htm";
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
	var url = ctx+"/salesBratio/sales-bratio!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"salesBratioId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#saleId').val(data.model.saleId);
				$('#saleName').val(data.model.saleName);
				$('#bztarget').val(data.model.bztarget);
				$('#bzselfratio').val(data.model.bzselfratio);
				$('#fbselfratio').val(data.model.fbselfratio);
				$('#bzsmratio').val(data.model.bzsmratio);
				$('#fbsmratio').val(data.model.fbsmratio);
				$('#bzamratio').val(data.model.bzamratio);
				$('#fbamratio').val(data.model.fbamratio);
				$('#salemanagerId').val(data.model.salemanagerId);
				$('#salemanagerName').val(data.model.salemanagerName);
				$('#areamanagerId').val(data.model.areamanagerId);
				$('#areamanagerName').val(data.model.areamanagerName);
				$('#fnotes').val(data.model.fnotes);
				openDiv('inputDiv');
			}
		}
	});
}