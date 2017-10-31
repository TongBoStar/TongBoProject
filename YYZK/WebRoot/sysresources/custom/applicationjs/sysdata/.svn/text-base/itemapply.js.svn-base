$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'itemapplypage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_baseitem_apply.id',
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
	var url = ctx+"/baseitemApply/baseitem-apply!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"itemapplypage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var executors = new Array();
				$.each(page.result,function(i,o){
					var flag = false;
					if(null!=o.executors){
						executors = o.executors.split(" ");
						$.each(executors,function(n,m){
							if(m==realName){
								flag = true;
							}
						});
					}
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</a></td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.parentitemcode==null?"":o.parentitemcode)+'</td>';
					html+='<td>'+(o.formatno==null?"":o.formatno)+'</td>';
					html+='<td>'+(o.applyerName==null?"":o.applyerName)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.createTime)+'</td>';
					html+='<td>'+(o.iscreate==null?"未创建":"已创建")+'</td>';
					html+='<td style="font-size:12px;">';
					if(o.fstatus==null){
						html+='<a href="#" onclick="exeprocess('+o.id+','+(null==o.fstatus?0:o.fstatus)+','+(null==o.processExeId?0:o.processExeId)+');">下推 </a>';
						html+='';// | <a href="#" onclick="toDelete('+o.id+');">删除</a>
					}else if(o.fstatus==100){
						html+='';
						html+='<a href="#" onclick="checkprocesshis('+o.id+');">流程</a>';// | <a href="#" onclick="toDelete('+o.id+');">删除</a>
					}else{
						if(flag){
							html+='<a href="#" onclick="exeprocess('+o.id+','+o.fstatus+','+(null==o.processExeId?0:o.processExeId)+');">审核 | </a>';
						}else{
							html+='';
						}
						html+='<a href="#" onclick="checkprocesshis('+o.id+');">流程</a>';// | <a href="#" onclick="toDelete('+o.id+');">删除</a>
					}
					if(o.iscreate==null&&o.fstatus==100){
						html += '<a href="#" onclick="addItemcode('+o.id+');"> | 创建</a></td>';
					}else{
						html += '</td>';
					}
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function addItemcode(id){
	window.open(ctx +'/sysdata/additem.htm?applyid='+id);
}
/**
 * 审核流程
 * @param type
 * @param mark
 */
function exeprocess(id,fstatus,processexeid){
	$('#sourceIdHidden').val(id);
	if(fstatus==0){
		$('#nodeSeqHidden').val(0);
		$('#processExeIdHidden').val('');
		var flag = window.confirm("确定下推？");
		if (!flag) {
			return;
		}
		saveexamine();
	}else{
		$('#nodeSeqHidden').val(fstatus);
		$('#processExeIdHidden').val(processexeid);
		openDiv('examineAddDiv');
	}
}
function saveexamine(){
	var processExeIdHidden;
	if($('#processExeIdHidden').val()==0){
		processExeIdHidden = '';
	}else{
		processExeIdHidden = '&processExetask.id='+$('#processExeIdHidden').val();
	}
	var examineAddForm = $('#examineAddForm').serialize();
	var url = ctx+"/baseitemApply/baseitem-apply!exeProcess.htm";
	var param = 'processExetask.sourceId='+$('#sourceIdHidden').val()+
				'&processExetask.sourceCode='+
				'&processExetask.nodeSeq='+$('#nodeSeqHidden').val()+
				processExeIdHidden+
				'&processExetask.taskCode=TO_BASEITEM_APPLY_TASK'+
				'&id='+$('#sourceIdHidden').val();
	$.webAjax({
		type : "post",
		url : url,
		data: examineAddForm+"&"+param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("操作成功!");
				//window.location.reload();
				closeDiv('examineAddDiv');
				search();
			}
		}
	});
}
/**
 * 查看流程
 */
function checkprocesshis(id){
	var url = ctx+"/processHistask/process-histask!listToQuery.htm";
	var param = 'processHistaskQuery.taskCode=TO_BASEITEM_APPLY_TASK'+
				"&processHistaskQuery.sourceId="+id;
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				if(null!=data.processHistaskList&&data.processHistaskList.length>0){
					$.each(data.processHistaskList,function(i,o){
						var status = '';
						if(o.examineStatus==0){
							status = '驳回';
						}else if(o.examineStatus==1){
							status = '审批通过';
						}else{
							
						}
						html += "<tr>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td>"+o.operaterName+"</td>";
						html += "<td>"+o.nodeName+"</td>";
						html += "<td>"+status+"</td>";
						html += "<td>"+o.operateTime+"</td>";
						html += "<td>"+replaceNull(o.fmark)+"</td>";
						html += "</tr>";
					});
				}
				$('#processcontent').html(html);
				openDiv('checkDiv');
			}
		}
	});
}
function addProcessTask(){
	$('#hiddenId').val('');
	$('#taskName').val('');
	$('#taskCode').val('');
	$('#processIds').val('');
	$('#taskMark').val('');
	openDiv('inputDiv');
}
function toEdit(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	var applyid;
	$.each(delareas, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		cnt++;
		applyid = $(o).val();
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要编辑的记录！');
		return;
	}else if(cnt>1){
		alert('每次只能编辑一条记录！');
		return;
	}else{}
	window.open(ctx+"/sysdata/selectitemforapply.htm?applyid="+applyid+"&type=1");
}
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
		alert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/baseitemApply/baseitem-apply!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("删除成功!");
					closeblockdiv();
					search();
				}
			}
		});
	}
}
function addItemInfo(){
	window.open(ctx +'/sysdata/selectitemforapply.htm?type=1');
	//window.location.href = ctx +'/sysdata/selectitemforapply.htm?type=1';
}
/**
 * 选择检索的属性
 */
function selectoption(){
	var name = $('#selection').val();
	$('#optselect').attr("name",name);
}