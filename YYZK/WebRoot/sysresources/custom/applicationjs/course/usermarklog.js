$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'usermarklistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_usermark.takeTime',
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
	var url = ctx+"/usermark/usermark!listToJson.htm";
	if(ftype==1){
		url = ctx+"/usermark/usermark!findByGroup.htm";
	}else{
		url = ctx+"/usermark/usermark!listToJson.htm";
	}
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"usermarklistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td><a href="'+ctx+'/course/stuseloglist.htm?stCode='+o.stCode+'">'+replaceNull(o.stCode)+'</a></td>';
					html+='<td>'+replaceNull(o.serialNumber)+'</td>';
					html+='<td>'+replaceNull(o.operateType==1?"上线":"下线")+'</td>';
					html+='<td>'+replaceNull(o.markContent)+'</td>';
					html+='<td>'+replaceNull(o.fversion)+'</td>';
					html+='<td>'+replaceNull(o.username)+'</td>';
					html+='<td>'+replaceNull(o.agentName)+'</td>';
					html+='<td>'+replaceNull(o.telNumber)+'</td>';
					html+='<td>'+replaceNull(o.faddress)+'</td>';
					html+='<td>'+replaceNull(o.upTime)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
var ftype = 1;
function searchtype(type){
	if(type==1){
		ftype=1;
		$("#searchbtn1").removeClass("btn-info");
		$("#searchbtn1").addClass("btn-danger");
		$("#searchbtn2").removeClass("btn-danger");
		$("#searchbtn2").addClass("btn-info");
	}else{
		ftype=2;
		$("#searchbtn2").removeClass("btn-info");
		$("#searchbtn2").addClass("btn-danger");
		$("#searchbtn1").removeClass("btn-danger");
		$("#searchbtn1").addClass("btn-info");
	}
	search();
}