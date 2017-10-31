$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'prodeplistpage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_prodep_info.id',
		submitForm : submitForm//分页回调函数
		});	
	search();
});
function submitForm(){
	search();
}
function search(){
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/prodepInfo/prodep-info!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"prodeplistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td><a href="#" onclick="toDetail(\''+o.infoUrl+'\')">'+o.infoName+'</a></td>';
					html+='<td>'+(o.createTime==null?"":o.createTime)+'</td>';
					html+='<td>'+(o.infoDesc==null?"":o.infoDesc)+'</td>';
					//html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a> | <a href="#" onclick="toDelete('+o.id+');">删除</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
		}
	});
}
function toDetail(url){
	window.location.href=ctx+url;
}