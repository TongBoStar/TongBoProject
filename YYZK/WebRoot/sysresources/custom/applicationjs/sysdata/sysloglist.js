$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'sysloglistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 'id',
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
	var url = ctx+"/operationlog/operation-log!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"sysloglistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.empUserName==null?"":o.empUserName)+'</td>';
					html+='<td>'+(o.empLoginName==null?"":o.empLoginName)+'</td>';
					html+='<td>'+(o.ip==null?"":o.ip)+'</td>';
					html+='<td>'+(o.machineName==null?"":o.machineName)+'</td>';
					html+='<td>'+(o.moduleName==null?"":o.moduleName)+'</td>';
					html+='<td>'+(o.operateType==null?"":o.operateType)+'</td>';
					html+='<td>'+(o.operateDescription==null?"":o.operateDescription)+'</td>';
					html+='<td>'+o.operateDateString+'</td>';
				});
				$('#data-body').html(html);
			}else{
				newAlert(data.resultInfo[1]);
			}
			closeblockdiv();
		}
	});
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