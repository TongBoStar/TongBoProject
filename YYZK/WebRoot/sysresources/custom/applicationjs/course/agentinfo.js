$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'agentinfolistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_yyagent.id',
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
	var url = ctx+"/yyagent/yyagent!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"agentinfolistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var fscope = "";
					if(1==o.fscope){
						fscope = "小客户";
					}else if(2==o.fscope){
						fscope = "中等客户";
					}else if(3==o.fscope){
						fscope = "大客户";
					}else{
						
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.agentName)+'</td>';
					html+='<td>'+replaceNull(o.telNumber)+'</td>';
					html+='<td>'+replaceNull(o.wxCode)+'</td>';
					html+='<td>'+replaceNull(o.compName)+'</td>';
					html+='<td>'+fscope+'</td>';
					html+='<td>'+(o.fstatus == 1?"正常":"禁用")+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.regTime)+'</td>';
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
	$('#agentName').val("");
	$('#telNumber').val("");
	$('#compName').val("");
	$('#wxCode').val("");
	$('#regTime').val("");
	$('#fscope').val(1);
	$('#fstatus').val(1);
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	if($('#agentName').val().trim()==""){
		alert("必须输入名称!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/yyagent/yyagent!saveToJson.htm";
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
	$('#agentName').val("");
	$('#telNumber').val("");
	$('#compName').val("");
	$('#wxCode').val("");
	$('#regTime').val("");
	$('#fscope').val(1);
	$('#fstatus').val(1);
	$('#fmark').val("");
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid = $(o).val();
		cnt++;
	});
	if(cnt>1){
		alert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		alert("请选择一条编辑的记录!");
		return;
	}
	var url = ctx+"/yyagent/yyagent!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yyagentId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#agentName').val(replaceNull(data.model.agentName));
				$('#telNumber').val(replaceNull(data.model.telNumber));
				$('#compName').val(replaceNull(data.model.compName));
				$('#wxCode').val(replaceNull(data.model.wxCode));
				$('#regTime').val(replaceNull(data.model.regTime));
				$('#fscope').val(replaceNull(data.model.regTime));
				$('#fstatus').val(replaceNull(data.model.fstatus));
				$('#fmark').val(replaceNull(data.model.fmark));
				openDiv('inputDiv');
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
		var url = ctx+"/yyagent/yyagent!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("删除成功!");
					search();
				}
			}
		});
	}
}
