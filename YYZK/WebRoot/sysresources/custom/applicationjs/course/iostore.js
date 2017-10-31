$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'iostorelistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_iostore.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
	var io = $('#dataTypeHidden').val();
	if(io==1){
		$('#dataTypeb').text("入库信息");
		$('#trType').text("入库类型:");
		$('#ftype').val(2);
	}else{
		$('#dataTypeb').text("出库信息");
		$('#trType').text("出库类型:");
		$('#ftype').val(1);
	}
	
	/**设置点击弹出框之外的元素 弹出框消失 开始*/
	document.body.onclick = function(e){
		 e = e || window.event;
		 var target = e.target || e.srcElement;
		 if(target.id == "selectItemCodeDiv"||target.id == "itemCode"
			 ||target.id == "selectItemNameDiv"||target.id == "itemName") {
			 return;
		 }else{
			 $('#selectItemCodeDiv').css("display","none");
			 $('#selectItemNameDiv').css("display","none");
		 }
	}; 
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
	var url = ctx+"/iostore/iostore!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"iostorelistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.itemCode)+'</td>';
					html+='<td>'+replaceNull(o.itemName)+'</td>';
					html+='<td>'+replaceNull(o.fbatchno)+'</td>';
					html+='<td>'+replaceNull(o.fqty)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.createTime)+'</td>';
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
	$('#itemCode').val("");
	$('#itemName').val("");
	$('#itemMode').val("");
	$('#funit').val("");
	$('#fqty').val("");
	$('#fbatchno').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/iostore/iostore!saveToJson.htm";
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
	$('#hiddenId').val("");
	$('#itemCode').val("");
	$('#itemName').val("");
	$('#itemMode').val("");
	$('#funit').val("");
	$('#fqty').val("");
	$('#fbatchno').val("");
	$('#fmark').val("");
	var url = ctx+"/iostore/iostore!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"iostoreId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#itemCode').val(replaceNull(data.model.itemCode));
				$('#fqty').val(replaceNull(data.model.fqty));
				$('#funit').val(replaceNull(data.model.funit));
				$('#itemMode').val(replaceNull(data.model.itemMode));
				$('#itemName').val(replaceNull(data.model.itemName));
				$('#fbatchno').val(data.model.fbatchno);
				$('#ftype').val(data.model.ftype);
				$('#fmark').val(replaceNull(data.model.fmark));
				openDiv('inputDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
//去掉左边的空白  
function trimLeft(s){  
    if(s == null) {  
        return "";  
    }  
    var whitespace = new String(" \t\n\r");  
    var str = new String(s);  
    if (whitespace.indexOf(str.charAt(0)) != -1) {  
        var j=0, i = str.length;  
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){  
            j++;  
        }  
        str = str.substring(j, i);  
    }  
    return str;  
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
		var url = ctx+"/iostore/iostore!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					search();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}

/**
 * 弹出物料编码
 */
function toAddItemCode(){
	$("#selectItemCodeDiv").css("display","");
	var itemcode = $("#itemCode").val();
	var data = 'yyitemQuery.itemCode='+itemcode+"&page.pageSize=20&page.pageNo=1&page.orderBy=t_yyitem.id&page.order=asc";
	var html='<td><select id="itemCodeSelect" onchange="addItemCode();" style="width: 370px; height: 108px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+"/yyitem/yyitem!listToJson.htm";
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.each(page.result,function(i,o){
				html+='<option value="'+o.id+'">'+o.itemCode+'|'+o.itemName+'|'+o.itemMode+'|'+o.funit+'</option>';
			});
			html+='</select></td>';
			$('#selectItemCode').html(html);
		}
	});	
}
/**
 * 添加物料编码
 */
function addItemCode(){
	var selectValue = $('#itemCodeSelect').val();
	var selectTxt = $('#itemCodeSelect').find('option:selected').text();
	$('#yyItemIdHiddenId').val(selectValue);
	$('#itemCode').val(selectTxt.split('|')[0]);
	$('#itemName').val(selectTxt.split('|')[1]);
	$('#itemMode').val(selectTxt.split('|')[2]);
	$('#funit').val(selectTxt.split('|')[3]);
	$("#selectItemCodeDiv").css("display","none");
}
/**
 * 弹出物料编码
 */
function toAddItemName(){
	$("#selectItemNameDiv").css("display","");
	var itemName = $("#itemName").val();
	var data = 'yyitemQuery.itemName='+itemName+"&page.pageSize=20&page.pageNo=1&page.orderBy=t_yyitem.id&page.order=asc";
	var html='<td><select id="itemNameSelect" onchange="addItemName();" style="width: 370px; height: 108px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+"/yyitem/yyitem!listToJson.htm";
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.each(page.result,function(i,o){
				html+='<option value="'+o.id+'">'+o.itemCode+'|'+o.itemName+'|'+o.itemMode+'|'+o.funit+'</option>';
			});
			html+='</select></td>';
			$('#selectItemName').html(html);
		}
	});	
}
/**
 * 添加物料编码
 */
function addItemName(){
	var selectValue = $('#itemNameSelect').val();
	var selectTxt = $('#itemNameSelect').find('option:selected').text();
	$('#yyItemIdHiddenId').val(selectValue);
	$('#itemCode').val(selectTxt.split('|')[0]);
	$('#itemName').val(selectTxt.split('|')[1]);
	$('#itemMode').val(selectTxt.split('|')[2]);
	$('#funit').val(selectTxt.split('|')[3]);
	$("#selectItemNameDiv").css("display","none");
}
