$(document).ready(function() {
	loadadmin();
	window.simpleTable =$(document).SimpleTable({
		id:'incominfolistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_incominfo.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
});
function submitForm(){
	search();
}
function loadadmin(){
	var url = ctx+"/system/adminListadminName.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"adminQuery.type=2&&adminQuery.sortColum=adminCode asc",
		success : function(data) {
			data = $.parseJSON(data);
			var html = "";
			html+='<option value="">----无------</option>';
			$.each(data.adminList,function(i,o){
				html+='<option value="'+o.adminId+'">'+o.adminName+" | "+o.adminCode+'</option>';
			});
			$('#belongUserId').html(html);
		}
	});
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/incominfo/incominfo!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"incominfolistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var orderStatus = "";
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+replaceNull(o.adminCode)+'</td>';
					html+='<td>'+replaceNull(o.flevel)+'</td>';
					html+='<td>'+replaceNull(o.orderCode)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",replaceNull(o.orderTime))+'</td>';
					html+='<td>'+replaceNull(o.stseqCode)+'</td>';
					html+='<td>'+replaceNull(o.fixAwards)+'</td>';
					html+='<td>'+replaceNull(o.customAwards)+'</td>';
					html+='<td>'+replaceNull(o.firstAwards)+'</td>';
					html+='<td>'+replaceNull(o.secondAwards)+'</td>';
					html+='<td>'+replaceNull(o.fscore)+'</td>';
					if(o.orderStatus==1){
						orderStatus = "进行中";
					}else if(o.orderStatus==2){
						orderStatus = "无效";
					}else{
						orderStatus = "完成";
					}
					html+='<td>'+orderStatus+'</td>';
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
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#orderCode').val("");
	$('#orderWxCode').val("");
	$('#stseqCode').val("");
	$('#adminCode').val("");
	$('#orderTime').val("");
	$('#orderSource').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	if($('#orderCode').val().trim()==""){
		newAlert("必须输入订单编号!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/incominfo/incominfo!saveToJson.htm";
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
	$('#hiddenId').val("");
	$('#orderCode').val("");
	$('#stseqCode').val("");
	$('#orderWxCode').val("");
	$('#adminCode').val("");
	$('#orderTime').val("");
	$('#orderSource').val("");
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid = $(o).val();
		cnt++;
	});
	if(cnt>1){
		newAlert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		newAlert("请选择一条编辑的记录!");
		return;
	}
	var url = ctx+"/incominfo/incominfo!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"incominfoId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#orderCode').val(data.model.orderCode);
				$('#stseqCode').val(data.model.stseqCode);
				$('#adminCode').val(data.model.adminCode);
				$('#orderTime').val(data.model.orderTime);
				$('#orderWxCode').val(data.model.orderWxCode);
				$('#orderSource').val(data.model.orderSource);
				openDiv('inputDiv');
			}
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
		newAlert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/incominfo/incominfo!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("删除成功!");
					search();
				}
			}
		});
	}
}