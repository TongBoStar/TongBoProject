$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'orderlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_order.id',
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
	var url = ctx+"/order/order!listToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"orderlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var serviceType = "";
					if(o.serviceType==1){
						serviceType = "淘宝";
					}else if(o.serviceType==1){
						serviceType = "线下";
					}else{
						serviceType = "微信小店";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+replaceNull(o.orderCode)+'</td>';
					html+='<td>'+replaceNull(o.item.itemName)+'</td>';
					html+='<td>'+replaceNull(o.item.itemPriceAux)+'</td>';
					html+='<td>'+replaceNull(o.item.consumTimes)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.fixTime)+'</td>';
					html+='<td>'+replaceNull(o.serviceReceiver)+'</td>';
					html+='<td>'+serviceType+'</td>';
					html+='<td>'+replaceNull(o.serviceAddress)+'</td>';
					html+='<td>'+replaceNull(o.remark)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 查看详情
 * @param id
 */
function toDetail(id){
	window.location.href=ctx+"/designassist/designlistdetail.htm?did="+id;
}
/**
 * 导出为Excel
 * @param id
 */
function toExportAllExcel2007(){
	var id = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o) {
		id = $(o).val();
		cnt++;
	});
	if (cnt > 1) {
		newAlert("每次只能导出一个项目!");
		return;
	}
	if (cnt == 0) {
		newAlert("请选择要导出的项目!");
		return;
	}
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx
			+ "/designAssist/design-assist!exportAllExcel2007.htm?designAssistQuery.id="
			+ id;
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}