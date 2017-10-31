$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'wxuserlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_wxuser.id',
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
	var url = ctx+"/wxuser/wxuser!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"wxuserlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var sex = "";
					if(0==o.sex){
						sex = "";
					}else if(o.sex==1){
						sex = "男";
					}else{
						sex = "女";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.nickname)+'</td>';
					html+='<td>'+replaceNull(o.username)+'</td>';
					html+='<td>'+replaceNull(o.wxCode)+'</td>';
					html+='<td>'+(replaceNull(o.province)+replaceNull(o.city))+'</td>';
					html+='<td>'+sex+'</td>';
					html+='<td><img src="'+(ctx+'/'+replaceNull(o.headerurl))+'" style="width:20px;height:20px;" onclick="lookcdicon(\''+replaceNull(o.headerurl)+'\');"/></td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function lookcdicon(filepath){
	$('#cdicon').attr("src",getWebRootPath()+"/"+filepath);
	openDiv('cdiconDiv');
}
/**
 * 加载列表
 */
function searchfromwx(){
	openblockdiv();
	$.webAjax( {
		type : "post",
		url : ctx+"/wxuser/wxuser!findUserInfoFromWx.htm",
		data:"",
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("获取成功");
			}else{
				alert(data.resultInfo[1]);
			}
			closeblockdiv();
			search();
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#username').val("");
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
		var url = ctx+"/wxuser/wxuser!saveToJson.htm";
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
		alert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		alert("请选择一条编辑的记录!");
		return;
	}
	var url = ctx+"/wxuser/wxuser!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"wxuserId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#nickname').val(replaceNull(data.model.nickname));
				$('#username').val(replaceNull(data.model.username));
				$('#wxCode').val(replaceNull(data.model.wxCode));
				$('#sex').val(replaceNull(data.model.sex));
				$('#province').val(data.model.province);
				$('#city').val(data.model.city);
				$('#fmark').val(data.model.fmark);
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
		var url = ctx+"/wxuser/wxuser!deleteToJson.htm";
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
