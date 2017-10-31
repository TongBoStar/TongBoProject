$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'callslippage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_callslip.id',
		submitForm : submitForm//分页回调函数
		});	
	search();
});
function submitForm(){
	search();
}
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/callslip/callslip!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"callslippage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var mark = '';
					if(o.callType=="TO_BRACKET_STOREROOM_TASK"){
						mark = "支架";
					}else if(o.callType=="TO_BAIT_STOREROOM_TASK"){
						mark = "下料";
					}else if(o.callType=="TO_ASSWELD_STOREROOM_TASK"){
						mark = "组焊";
					}else if(o.callType=="TO_ASSEMBLE_STOREROOM_TASK"){
						mark = "装配";
					}else if(o.callType=="TO_DELIVERY_STOREROOM_TASK"){
						mark = "发货";
					}else{}
					
					html+='<tr align="center">';
					//html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(o.callslipCode==null?"":o.callslipCode)+'</td>';
					html+='<td><a href="#" onclick="toDetail('+o.id+')">'+(o.productCode==null?"":o.productCode)+'</a></td>';
					html+='<td>'+(o.productName==null?"":o.productName)+'</td>';
					html+='<td>'+(o.productModel==null?"":o.productModel)+'</td>';
					html+='<td>'+(o.makeNumberCode==null?"":o.makeNumberCode)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+mark+'</td>';
					html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
function toDetail(id){
	window.location.href=ctx+"/productmanage/callslipdetail.htm?id="+id;
}