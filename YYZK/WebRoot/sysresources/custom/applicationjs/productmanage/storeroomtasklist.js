$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'storeroomtasklistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_storeroom_task.fstatus',
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
	var url = ctx+"/storeroomTask/storeroom-task!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"storeroomtasklistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var fstatusdis = '';
					var fstatushtml = '';
					var style="";
					if(o.fstatus==100){
						fstatusdis = 'disabled="disabled"';
						fstatushtml = "已结束";
					}else{
						fstatushtml = "未结束";
					}
					if(o.bracketStatus==50||o.baitStatus==50||o.assweldStatus==50||o.assembleStatus==50||o.deliveryStatus==50){
						fstatushtml = '<a href="javascript:void(0);" onclick="checkchanges('+o.sourceId+');">有变更</a>';
						style = " style='background-color:#F0AD4E;'";
					}
					html+='<tr align="center">';
					html+='<td'+style+'><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '"'+fstatusdis+' /></td>';
					html+='<td'+style+'>'+(o.storeTaskCode==null?"":o.storeTaskCode)+'</td>';
					html+='<td'+style+'><a href="#" onclick="toDetail('+o.id+','+o.sourceId+')">'+replaceNull(o.productCode)+'</a></td>';
					html+='<td'+style+'>'+(o.productName==null?"":o.productName)+'</td>';
					html+='<td'+style+'>'+(o.productModel==null?"":o.productModel)+'</td>';
					html+='<td'+style+'>'+(o.makeNumberCode==null?"":o.makeNumberCode)+'</td>';
					html+='<td'+style+'>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td'+style+'>'+(o.createrName==null?"":o.createrName)+'</td>';
					html+='<td'+style+'>'+formatDate("yyyy-MM-dd",o.planendtime)+'</td>';
					html+='<td'+style+'>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='<td'+style+'>'+fstatushtml+'</td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function toDetail(id,sourceId){
	window.location.href=ctx+"/productmanage/storeroomtaskdetail.htm?id="+id+"&did="+sourceId;
}
/**
 * 关闭单据
 */
function toClose(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		cnt++;
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要关闭的记录！');
		return;
	}
	var flag = window.confirm("确定关闭吗？");
	if (flag) {
		openblockdiv();
		var url = ctx+"/storeroomTask/storeroom-task!closeToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("关闭成功!");
					closeblockdiv();
					search();
				}
			}
		});
	}
}
/**
 * 查看变更内容
 * @param sourceid 源单的ID
 */
function checkchanges(sourceid){
	var html='';
	var url = ctx+"/modelList/model-list!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data: "modelListQuery.modelMark=t_bomchange_list&modelListQuery.designassistId="+sourceid+"&modelListQuery.sortColumns=t_bomchange_list.changemark",
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.modelListList,function(i,o){
					var belong = '';
					if(o.changemark.trim()=='t_bracket_list'){
						belong = '支架';
					}else if(o.changemark.trim()=='t_bait_list'){
						belong = '下料';
					}else if(o.changemark.trim()=='t_assweld_list'){
						belong = '组焊';
					}else if(o.changemark.trim()=='t_assemble_list'){
						belong = '装配';
					}else{
						belong = '发货';
					}
					var changedesc = '';
					if(o.changestatus==1){
						changedesc = '新增';
					}else if(o.changestatus==2){
						changedesc = '修改';
					}else if(o.changestatus==3){
						changedesc = '删除';
					}else{
						
					}
					html+='<tr align="center">';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+changedesc+'</td>';
					html+='<td>'+belong+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createTime)+'</td>';
					html += '</tr>';
				});
				$('#changecontentbody').html(html);
				openDiv("changecontentDiv");
			}
		}
	});
}