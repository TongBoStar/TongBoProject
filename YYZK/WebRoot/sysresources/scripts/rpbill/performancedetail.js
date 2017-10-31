$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'performancedetailpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_performance_detail.detailid',
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
	var url = ctx+"/performanceDetail/performance-detail!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"performancedetailpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var isuse;
				var processType;
				var awardall = 0;//奖励总额
				var awarda = 0; //标准类奖励
				var awardbcde = 0;//非标类奖励
				var awardex = 0;//超额奖
				var awardpl = 0;//pl调压器奖
				var servicea = 0;//标准类业务费
				var servicebcde = 0;//非标类业务费
				$.each(page.result,function(i,o){
					if((o.achrewardamounta==0||o.achrewardamounta==null)&&(o.servicefeeamounta==0||o.servicefeeamounta==null)
							&&(o.achrewardamountbcde==0||o.achrewardamountbcde==null)
							&&(o.servicefeeamountbcde==0||o.servicefeeamountbcde==null)
							&&(o.plamount==0||o.plamount==null)&&(o.excrewardamount==0||o.excrewardamount==null)){
						
					}else{
						html+='<tr align="center">';
						html += '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
						html+='<td>'+(i+1)+'</td>';
						html+='<td>'+replaceNull(o.forderno)+'</td>';
						var lname=(o.salerName==null?"":o.salerName);
						var sname = '';
						if(lname.length>4){
							sname=lname.substring(0,4);
						}else{
							sname=lname;
						}
						html+='<td><a data-rel="tooltip" href="javascript:void(0);" data-original-title="'+lname+'">'+sname+'</a></td>';
						html+='<td>'+(o.belongsaleName==null?"":o.belongsaleName)+'</td>';
						html+='<td>'+replaceNull(o.achrewardamounta)+'</td>';
						html+='<td>'+replaceNull(o.servicefeeamounta)+'</td>';
						html+='<td>'+replaceNull(o.achrewardamountbcde)+'</td>';
						html+='<td>'+replaceNull(o.servicefeeamountbcde)+'</td>';
						html+='<td>'+replaceNull(o.plamount)+'</td>';
						html+='<td>'+replaceNull(o.excrewardamount)+'</td>';
						html+='<td>'+replaceNull(o.debitamounta)+'</td>';
						html+='<td>'+replaceNull(o.debitamountbcde)+'</td>';
						html+='<td>'+replaceNull(o.isexstockwards)+'</td>';
						html+='<td>'+replaceNull(o.bailwards)+'</td>';
						html+='<td>'+replaceNull(o.awardall)+'</td>';
						html+='</tr>';
						awardall += o.awardall;//奖励总额
						awarda += o.achrewardamounta; //标准类奖励
						awardbcde += o.achrewardamountbcde;//非标类奖励
						awardex += o.excrewardamount;//超额奖
						awardpl += o.plamount;//pl奖
						servicea += o.servicefeeamounta;//标准类业务费
						servicebcde += o.servicefeeamountbcde;//非标类业务费
					}
				});
				html+='<tr align="center">';
				html+='<td colspan=3">本页小计:</td>';
				html+='<td></td>';
				html+='<td></td>';
				html+='<td>'+replaceNull(awarda).toFixed(2)+'</td>';
				html+='<td>'+replaceNull(servicea).toFixed(2)+'</td>';
				html+='<td>'+replaceNull(awardbcde).toFixed(2)+'</td>';
				html+='<td>'+replaceNull(servicebcde).toFixed(2)+'</td>';
				html+='<td>'+replaceNull(awardpl).toFixed(2)+'</td>';
				html+='<td>'+replaceNull(awardex).toFixed(2)+'</td>';
				html+='<td></td>';
				html+='<td></td>';
				html+='<td></td>';
				html+='<td></td>';
				html+='<td>'+replaceNull(awardall).toFixed(2)+'</td>';
				html+='</tr>';
				$('#data-body').html(html);
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
			}
			closeblockdiv();
		}
	});
}
function addsalesbratio(){
	$('#hiddenId').val('');
	$('#saleId').val('');
	$('#saleName').val('');
	$('#bztarget').val('');
	$('#bzselfratio').val('');
	$('#fbselfratio').val('');
	$('#bzsmratio').val('');
	$('#fbsmratio').val('');
	$('#bzamratio').val('');
	$('#fbamratio').val('');
	$('#salemanagerId').val('');
	$('#salemanagerName').val('');
	$('#areamanagerId').val('');
	$('#areamanagerName').val('');
	$('#fnotes').val('');
	openDiv('inputDiv');
}
/**
 * 弹出业务员列表
 */
function toSaler(){
	//$('#selectSalerDiv').css("margin-left",$('#fcurempname').offset().left-215);
	$("#selectSalerDiv").css("display","");
	var name = $("#saleName").val();//文本域输入值
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
	$('#saleName').val(selectTxt);
	$('#saleId').val(selectValue);
	$("#selectSalerDiv").css("display","none");
}
function save(){
	var formparam = $('#inputForm').serialize();
	var url =ctx+'/salesBratio/sales-bratio!saveToJson.htm';
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
			}
		}
	});
}
/**
 * 删除流程
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
		var url = ctx+"/salesBratio/sales-bratio!deleteToJson.htm";
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
 * 编辑流程
 * @param id 流程ID
 */
function toEdit(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		cnt++;
	});
	if(cnt>1){
		alert('只能选择一条记录！');
		return;
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要编辑的记录！');
		return;
	}
	var url = ctx+"/salesBratio/sales-bratio!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"salesBratioId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#saleId').val(data.model.saleId);
				$('#saleName').val(data.model.saleName);
				$('#bztarget').val(data.model.bztarget);
				$('#bzselfratio').val(data.model.bzselfratio);
				$('#fbselfratio').val(data.model.fbselfratio);
				$('#bzsmratio').val(data.model.bzsmratio);
				$('#fbsmratio').val(data.model.fbsmratio);
				$('#bzamratio').val(data.model.bzamratio);
				$('#fbamratio').val(data.model.fbamratio);
				$('#salemanagerId').val(data.model.salemanagerId);
				$('#salemanagerName').val(data.model.salemanagerName);
				$('#areamanagerId').val(data.model.areamanagerId);
				$('#areamanagerName').val(data.model.areamanagerName);
				$('#fnotes').val(data.model.fnotes);
				openDiv('inputDiv');
			}
		}
	});
}
/**
 * 结算
 */
function balanceRewardsByQuarter(){
	if($('#fdate').val().trim()==''){
		alert("请输入结算的季度!");
		return;
	}
	var flag = window.confirm("确定结算吗？");
	if (flag) {
		openblockdiv();
		var formparam = $('#queryForm').serialize();
		$.webAjax({
			type : 'post',
			url : ctx+"/receivable/receivable!balanceRewardsByQuarter.htm",
			data :formparam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("结算完成!");
					search();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
function tocountRewardsByQuarter(){
	//window.open(ctx+"/receivable/perdetailstatic.htm");
	window.location.href=ctx+"/receivable/perdetailstatic.htm";
}
/**
 * 改变筛选的类型
 */
function changecomparetype(){
	var type = $('#comparetype').val();
	if(type==3){
		$('#rangeend').css("display","");
		$('#linkmark').css("display","");
	}else{
		$('#rangeend').css("display","none");
		$('#linkmark').css("display","none");
	}
}