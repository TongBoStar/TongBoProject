$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'yyitemlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_yyitem.id',
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
	var url = ctx+"/yyitem/yyitem!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"yyitemlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.itemCode)+'</td>';
					html+='<td>'+replaceNull(o.itemName)+'</td>';
					html+='<td>'+replaceNull(o.itemMode)+'</td>';
					html+='<td>'+replaceNull(o.fprice)+'</td>';
					html+='<td>'+replaceNull(o.funit)+'</td>';
					html+='<td>'+(0==o.fstatus?"禁用":"使用")+'</td>';
					html+='<td>'+replaceNull(o.supplier)+'</td>';
					html+='<td><a hre="javascript:void(0);" onclick="tobom(\''+o.itemCode+'\',\''+o.itemName+'\');" style="cursor:pointer;">BOM</a></td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function tobom(itemCode,itemName){
	window.open( ctx+'/course/yybomlist.htm?itemCodeQuery='+itemCode+'&itemNameQuery='+itemName);
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#itemCode').val("");
	$('#itemName').val("");
	$('#itemMode').val("");
	$('#fprice').val("");
	$('#funit').val("");
	$('#fstatus').val("1");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#itemName').val().trim()==""){
		alert("必须输入物料名称!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/yyitem/yyitem!saveToJson.htm";
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
	$('#fprice').val("");
	$('#funit').val("");
	$('#fstatus').val("1");
	$('#fmark').val("");
	var url = ctx+"/yyitem/yyitem!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yyitemId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#itemCode').val(replaceNull(data.model.itemCode));
				$('#itemName').val(replaceNull(data.model.itemName));
				$('#itemMode').val(replaceNull(data.model.itemMode));
				$('#fprice').val(replaceNull(data.model.fprice));
				$('#funit').val(replaceNull(data.model.funit));
				$('#fstatus').val(data.model.fstatus);
				$('#supplier').val(replaceNull(data.model.supplier));
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
		var url = ctx+"/yyitem/yyitem!deleteToJson.htm";
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
