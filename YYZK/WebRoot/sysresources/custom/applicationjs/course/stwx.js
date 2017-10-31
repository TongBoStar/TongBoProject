$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'stwxlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_st_wx.stCode',
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
	var url = ctx+"/stWx/st-wx!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"stwxlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.stCode)+'</td>';
					html+='<td>'+replaceNull(o.serialNumber)+'</td>';
					html+='<td>'+replaceNull(o.username)+'</td>';
					html+='<td>'+replaceNull(o.faddress)+'</td>';
					html+='<td>'+replaceNull(o.wxcode)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createDate)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
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
		newAlert('请选择要解绑的记录！');
		return;
	}
	var flag = window.confirm("确定解绑吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/stWx/st-wx!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("解绑成功!");
					search();
				}
			}
		});
	}
}
