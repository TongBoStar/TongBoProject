$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'purchaseplanlistpage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_purchase_plan.id',
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
	var url = ctx+"/purchasePlan/purchase-plan!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"purchaseplanlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(o.planCode==null?"":o.planCode)+'</td>';
					html+='<td><a href="#" onclick="toDetail('+o.id+')">'+(null==o.productCode?"":o.productCode)+'</a></td>';
					html+='<td>'+(o.productName==null?"":o.productName)+'</td>';
					html+='<td>'+(o.productModel==null?"":o.productModel)+'</td>';
					html+='<td>'+(o.makeNumberCode==null?"":o.makeNumberCode)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+(o.createrName==null?"":o.createrName)+'</td>';
					html+='<td>'+(o.createTime==null?"":o.createTime.substring(0,10))+'</td>';
					html+='<td>'+(o.planendtime==null?"":o.planendtime.substring(0,10))+'</td>';
					html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function toDetail(id,sourceId){
	window.location.href=ctx+"/procure/purchase/purchaseplandetail.htm?id="+id;
}
/**
 * 选择检索的属性
 */
function selectoption(){
	var name = $('#selection').val();
	$('#optselect').attr("name",name);
}