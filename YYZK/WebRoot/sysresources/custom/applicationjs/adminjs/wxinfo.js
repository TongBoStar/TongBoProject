$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'wxinfolistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_wxinfo.id',
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
	var url = ctx+"/wxinfo/wxinfo!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"wxinfolistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var wxType = "";
					if(o.wxType==1){
						wxType = "订阅号";
					}else{
						wxType = "服务号";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.wxName)+'</td>';
					html+='<td>'+wxType+'</td>';
					html+='<td>'+replaceNull(o.appId)+'</td>';
					html+='<td>'+replaceNull(o.appSecret)+'</td>';
					html+='<td>'+replaceNull(o.token)+'</td>';
					html+='<td>'+replaceNull(o.access_token)+'</td>';
					html+='<td>'+replaceNull(o.token_expireTime)+'</td>';
					html+='<td>'+replaceNull(o.jsapi_ticket)+'</td>';
					html+='<td>'+replaceNull(o.noncestr)+'</td>';
					html+='<td>'+replaceNull(o.signature)+'</td>';
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
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#activityItemName').val("");
	$('#orgId').val("");
	$('#activityType').val("");
	$('#startTime').val("");
	$('#endTime').val("");
	$('#priceAux').val("");
	$('#orderLimit').val("");
	$('#userLimit').val("");
	$('#expiryDate').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#activityItemName').val().trim()==""){
		newAlert("必须输入活动名称!");
		return;
	}
	if($('#activityType').val().trim()==""){
		newAlert("必须选择活动类型!");
		return;
	}
	if($('#startTime').val().trim()==""){
		newAlert("必须输入开始时间!");
		return;
	}
	if($('#endTime').val().trim()==""){
		newAlert("必须输入结束时间!");
		return;
	}
	if($('#priceAux').val().trim()==""){
		newAlert("必须输入活动价格");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/activityItem/activity-item!saveToJson.htm";
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
	var url = ctx+"/activityItem/activity-item!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"activityItemId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#activityItemName').val(replaceNull(data.model.activityItemName));
				$('#activityType').val(data.model.activityType);
				$('#startTime').val(formatDate("yyyy-MM-dd",data.model.startTime));
				$('#endTime').val(formatDate("yyyy-MM-dd",data.model.endTime));
				$('#priceAux').val(data.model.priceAux);
				$('#orderLimit').val(data.model.orderLimit);
				$('#userLimit').val(data.model.userLimit);
				$('#expiryDate').val(formatDate("yyyy-MM-dd",data.model.expiryDate));
				$('#pricePlan').val(data.model.pricePlan);
				$('#takeAddress').val(data.model.takeAddress);
				$('#activityRole').val(data.model.activityRole);
				$('#activityDesc').val(data.model.activityDesc);
				$('#timesLimit').val(data.model.timesLimit);
				$('#payType').val(data.model.payType);
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
		var url = ctx+"/activityItem/activity-item!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("删除成功!");
					search();
				}else{
					alert(data.resultInfo[1]);
					closeblockdiv();
				}
			}
		});
	}
}
