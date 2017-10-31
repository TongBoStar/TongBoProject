$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'agentsellratiopage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_agent_sellratio.id',
		submitForm : submitForm//分页回调函数
	});
	search();
});
function submitForm(){
	search();
}
function search(){
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/agentSellratio/agent-sellratio!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"agentsellratiopage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var isuse;
				var processType;
				$.each(page.result,function(i,o){
					var sellType = '';
					if(o.sellType==1){
						sellType = '经销/代销';
					}else if(o.sellType==2){
						sellType = '代销';
					}else{
						sellType = '经销';
					}
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.agentName)+'</a></td>';
					html+='<td>'+replaceNull(o.awardRatio)+'</td>';
					html+='<td>'+replaceNull(o.serviceRatio)+'</td>';
					html+='<td>'+replaceNull(o.serviceArea)+'</td>';
					html+='<td>'+sellType+'</td>';
					html+='<td>'+replaceNull(o.saleUserName)+'</td>';
					html+='<td>'+replaceNull(o.fprovince)+'</td>';
					html+='<td>'+replaceNull(o.blanceproject)+'</td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
					html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
function addagentsellratio(){
	$('#hiddenId').val('');
	$('#agentName').val('');
	$('#awardRatio').val('');
	$('#serviceRatio').val('');
	$('#serviceArea').val('');
	$('#saleUserName').val('');
	$('#saleUserId').val('');
	$('#fprovince').val('');
	$('#fmark').val('');
	$('#blanceproject').val('');
	openDiv('inputDiv');
}
/**
 * 弹出业务员列表
 */
function toSaler(){
	//$('#selectSalerDiv').css("margin-left",$('#fcurempname').offset().left-215);
	$("#selectSalerDiv").css("display","");
	var name = $("#saleUserName").val();//文本域输入值
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="salerSelect" onchange="addSaler();" style="width: 175px; height: 115px;background-color: #E0E9EA"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
	var url =ctx+'/system/findListByDepart.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			//data = $.parseJSON(data);
			//var list = data.adminList;
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectSaler').html(html);
		}
	});	
}
/**
 * 添加业务员
 */
function addSaler(){
	var selectValue = $('#salerSelect').val();
	var selectTxt = $("#salerSelect").find('option:selected').text();
	$('#saleUserName').val(selectTxt);
	$('#saleUserId').val(selectValue);
	$("#selectSalerDiv").css("display","none");
}

/**
 * 删除
 * @param id 流程ID
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
		alert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var url = ctx+"/agentSellratio/agent-sellratio!deleteToJson.htm";
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
/**
 * 编辑
 * @param id ID
 */
function toEdit(id){
	var url = ctx+"/agentSellratio/agent-sellratio!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"agentSellratioId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#agentName').val(data.model.agentName);
				$('#awardRatio').val(data.model.awardRatio);
				$('#serviceRatio').val(data.model.serviceRatio);
				$('#serviceArea').val(data.model.serviceArea);
				$('#sellType').val(data.model.sellType);
				$('#saleUserName').val(data.model.saleUserName);
				$('#saleUserId').val(data.model.saleUserId);
				$('#fprovince').val(data.model.fprovince);
				$('#fmark').val(data.model.fmark);
				$('#blanceproject').val(data.model.blanceproject);
				openDiv('inputDiv');
			}
		}
	});
}
function save(){
	var formparam = $('#inputForm').serialize();
	var url =ctx+'/agentSellratio/agent-sellratio!saveToJson.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:formparam,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("保存成功!");
				closeDiv('inputDiv');
				search();
			}else{
				alert("保存失败:"+data.resultInfo[1]);
			}
		}
	});
}