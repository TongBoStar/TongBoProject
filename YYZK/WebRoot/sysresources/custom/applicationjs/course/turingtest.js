$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'turingtestlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '30',
		order: 'desc',
		orderBy: 't_turingtest.id',
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
	var url = ctx+"/turingtest/turingtest!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"turingtestlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.modelName)+'</td>';
					html+='<td>'+replaceNull(o.fask)+'</td>';
					html+='<td>'+replaceNull(o.fanswer)+'</td>';
					html+='<td>'+replaceNull(o.fcontent)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createTime)+'</td>';
					html+='<td>'+(o.fstatus==0?"异常":"正常")+'</td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}