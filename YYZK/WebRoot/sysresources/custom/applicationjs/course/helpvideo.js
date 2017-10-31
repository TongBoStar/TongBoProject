$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'helpvideolistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_helpvideo.fseq',
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
	var url = ctx+"/helpvideo/helpvideo!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"helpvideolistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+replaceNull(o.fseq)+'</td>';
					html+='<td>'+replaceNull(o.videoName)+'</td>';
					html+='<td><a href="http://v.youku.com/v_show/id_'+o.videoUrl+'==.html" target="_blank;">'+replaceNull(o.videoUrl)+'</a></td>';
					html+='<td>'+replaceNull(o.videoDetail)+'</td>';
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
	$('#videoName').val("");
	$('#videoDetail').val("");
	$('#videoUrl').val("");
	$('#fseq').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	if($('#videoName').val().trim()==""){
		alert("必须输入名称!");
		return;
	}
	if($('#videoUrl').val().trim()==""){
		alert("必须输入链接地址!");
		return;
	}
	if($('#fseq').val().trim()==""){
		alert("必须输入序号!");
		return;
	}
	if($('#videoDetail').val().trim()==""){
		alert("必须输入详细介绍!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/helpvideo/helpvideo!saveToJson.htm";
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
	$('#videoName').val("");
	$('#videoDetail').val("");
	$('#videoUrl').val("");
	$('#fseq').val("");
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
	var url = ctx+"/helpvideo/helpvideo!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"helpvideoId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#videoName').val(replaceNull(data.model.videoName));
				$('#videoDetail').val(replaceNull(data.model.videoDetail));
				$('#fseq').val(replaceNull(data.model.fseq));
				$('#videoUrl').val(replaceNull(data.model.videoUrl));
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
		var url = ctx+"/helpvideo/helpvideo!deleteToJson.htm";
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
