$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'useraddresslistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		userAddress: 'asc',
		userAddressBy: 't_user_address.id',
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
	var url = ctx+"/userAddress/user-address!listToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"useraddresslistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+replaceNull(o.userName)+'</td>';
					html+='<td>'+replaceNull(o.province)+'</td>';
					html+='<td>'+replaceNull(o.city)+'</td>';
					html+='<td>'+replaceNull(o.district)+'</td>';
					html+='<td>'+replaceNull(o.addressName)+'</td>';
					html+='<td>'+replaceNull(o.longitude)+'</td>';
					html+='<td>'+replaceNull(o.latitude)+'</td>';
					html+='<td>'+replaceNull(o.postCode)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createTime)+'</td>';
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