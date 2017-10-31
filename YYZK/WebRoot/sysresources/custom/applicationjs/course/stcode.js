$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'stcodelistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_stcode.id',
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
	var url = ctx+"/stcode/stcode!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"stcodelistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var giveaway = "";
				var fcolor = "";
				var isinvoice = "";
				var isfqty = "";
				$.each(page.result,function(i,o){
					if(o.giveaway==1){
						giveaway = "学习卡+三脚架+优盘";
					}else if(o.giveaway==2){
						giveaway = "学习卡+三脚架";
					}else if(o.giveaway==3){
						giveaway = "学习卡+优盘";
					}else if(o.giveaway==4){
						giveaway = "学习卡";
					}else if(o.giveaway==5){
						giveaway = "优盘";
					}else if(o.giveaway==6){
						giveaway = "幕布";
					}else if(o.giveaway==7){
						giveaway = "学习卡+三脚架+优盘+幕布";
					}else if(o.giveaway==8){
						giveaway = "优盘+幕布";
					}else if(o.giveaway==9){
						giveaway = "三脚架+幕布";
					}else if(o.giveaway==10){
						giveaway = "学习卡+幕布";
					}else if(o.giveaway==11){
						giveaway = "无";
					}else if(o.giveaway==12){
						giveaway = "幕布+三脚架+优盘";
					}else if(o.giveaway==13){
						giveaway = "幕布+三脚架+学习卡";
					}else{
						giveaway = "";
					}
					if(o.fcolor==1){
						fcolor = "甜心粉";
					}else if(o.fcolor==2){
						fcolor = "梦幻蓝";
					}else{
						fcolor = "";
					}
					if(o.isinvoice==1){
						isinvoice = "是";
					}else if(o.isinvoice==0){
						isinvoice = "否";
					}else{
						isinvoice = "";
					}
					if(o.fqty==1){
						isfqty = "已发";
					}else if(o.fqty==0){
						isfqty = "未发";
					}else{
						isfqty = "";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.stCode)+'</td>';
					html+='<td>'+replaceNull(o.serialNumber)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="lookcdicon(\''+replaceNull(o.stCode)+'\');">预览</a></td>';
					html+='<td>'+replaceNull(o.username)+'</td>';
					html+='<td>'+replaceNull(o.telNumber)+'</td>';
					html+='<td>'+replaceNull(o.agentName)+'</td>';
					html+='<td>'+replaceNull(o.faddress)+'</td>';
					html+='<td>'+replaceNull(o.fadressdetail)+'</td>';
					html+='<td>'+replaceNull(fcolor)+'</td>';
					html+='<td>'+replaceNull(o.sendTime)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createTime)+'</td>';
					html+='<td>'+replaceNull(isinvoice)+'</td>';
					html+='<td>'+replaceNull(o.invoiceHead)+'</td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
					html+='<td>'+replaceNull(o.quality)+'</td>';
					html+='<td>'+isfqty+'</td>';
					html+='<td>'+replaceNull(o.famount)+'</td>';
					html+='<td>'+replaceNull(o.tracknumber)+'</td>';
					html+='<td>'+replaceNull(o.trackamount)+'</td>';
					html+='<td>'+replaceNull(giveaway)+'</td>';
					html+='<td>'+replaceNull(o.feedback)+'</td>';
					html+='<td>'+replaceNull(o.flowup)+'</td>';
					html+='<td>'+replaceNull(o.customerservice)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
function lookcdicon(stcode){
	$('#cdicon').attr("src",getWebRootPath()+"/stcode/"+stcode+".jpg");
	openDiv('cdiconDiv');
}

/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#stCode').val("");
	$('#serialNumber').val("");
	$('#username').val("");
	$('#telNumber').val("");
	$('#agentName').val("");
	$('#faddress').val("");
	$('#fmark').val("");
	$('#fcolor').val("");
	$('#fqty').val("");
	$('#isinvoice').val("");
	$('#invoiceHead').val("");
	$('#tracknumber').val("");
	$('#famount').val("");
	$('#trackamount').val("");
	$('#giveaway').val("");
	$('#feedback').val("");
	$('#flowup').val("");
	$('#customerservice').val("");
	$('#fadressdetail').val("");
	$('#quality').val("");
	$('#sendTime').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#serialNumber').val().trim()==""){
		newAlert("必须出厂序列号!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/stcode/stcode!saveToJson.htm";
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
 * 保存
 */
function saveBatch(){
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputBatchForm').serialize();
		var url = ctx+"/stcode/stcode!updateByIds.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('inputBatchDiv');
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
	$('#hiddenId').val("");
	$('#stCode').val("");
	$('#serialNumber').val("");
	$('#username').val("");
	$('#telNumber').val("");
	$('#agentName').val("");
	$('#faddress').val("");
	$('#fmark').val("");
	$('#fcolor').val("");
	$('#fqty').val("");
	$('#isinvoice').val("");
	$('#invoiceHead').val("");
	$('#tracknumber').val("");
	$('#famount').val("");
	$('#trackamount').val("");
	$('#giveaway').val("");
	$('#feedback').val("");
	$('#flowup').val("");
	$('#customerservice').val("");
	$('#fadressdetail').val("");
	$('#quality').val("");
	$('#sendTime').val("");
	var url = ctx+"/stcode/stcode!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stcodeId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			var giveaway = "";
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#stCode').val(replaceNull(data.model.stCode));
				$('#serialNumber').val(replaceNull(data.model.serialNumber));
				$('#username').val(replaceNull(data.model.username));
				$('#agentName').val(replaceNull(data.model.agentName));
				$('#telNumber').val(replaceNull(data.model.telNumber));
				$('#faddress').val(replaceNull(data.model.faddress));
				$('#fmark').val(replaceNull(data.model.fmark));
				$('#fcolor').val(replaceNull(data.model.fcolor));
				$('#fqty').val(replaceNull(data.model.fqty));
				$('#isinvoice').val(replaceNull(data.model.isinvoice));
				$('#invoiceHead').val(replaceNull(data.model.invoiceHead));
				$('#tracknumber').val(replaceNull(data.model.tracknumber));
				$('#famount').val(replaceNull(data.model.famount));
				$('#trackamount').val(replaceNull(data.model.trackamount));
				$('#giveaway').val(replaceNull(data.model.giveaway));
				$('#feedback').val(replaceNull(data.model.feedback));
				$('#flowup').val(replaceNull(data.model.flowup));
				$('#customerservice').val(replaceNull(data.model.customerservice));
				$('#fadressdetail').val(replaceNull(data.model.fadressdetail));
				$('#quality').val(replaceNull(data.model.quality));
				$('#sendTime').val(replaceNull(data.model.sendTime));
				openDiv('inputDiv');
			}
		}
	});
}
/**
 * 批量编辑
 * @param id 
 */
function toEditBatch(){
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid += $(o).val()+",";
		cnt++;
	});
	if(cnt==0){
		newAlert("请选择一条或多条编辑的记录!");
		return;
	}
	editid = editid.substring(0,editid.length-1);
	$('#stCode2').val(editid);
	$('#username2').val("");
	$('#telNumber2').val("");
	$('#faddress2').val("");
	$('#fmark2').val("");
	$('#isinvoice2').val("");
	$('#invoiceHead2').val("");
	$('#tracknumber2').val("");
	$('#giveaway2').val("");
	$('#fadressdetail2').val("");
	$('#sendTime2').val("");
	var url = ctx+"/stcode/stcode!findListByIds.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stcodeQuery.stCode="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			stcodeList = data.stcodeList;
			if(data.resultInfo[0]=='0'){
				var aatemp;
				$('#username2').val(checksame(1));
				$('#telNumber2').val(checksame(2));
				$('#faddress2').val(checksame(3));
				$('#fmark2').val(checksame(4));
				$('#isinvoice2').val(checksame(5));
				$('#invoiceHead2').val(checksame(6));
				$('#tracknumber2').val(checksame(7));
				$('#giveaway2').val(checksame(8));
				$('#fadressdetail2').val(checksame(9));
				$('#sendTime2').val(checksame(10));
				$('#agentName2').val(checksame(11));
				$('#fqty2').val(checksame(12));
				openDiv('inputBatchDiv');
			}
		}
	});
}
var stcodeList;
function checksame(seq){
	var aatemp = -100;
	if(seq==1){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.username){
				aatemp = o.username;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.username){
				aatemp = "";
				return false;
			}else{
				aatemp = o.username;
			}
		});
	}else if(seq==2){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.telNumber){
				aatemp = o.telNumber;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.telNumber){
				aatemp = "";
				return false;
			}else{
				aatemp = o.telNumber;
			}
		});
	}else if(seq==3){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.faddress){
				aatemp = o.faddress;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.faddress){
				aatemp = "";
				return false;
			}else{
				aatemp = o.faddress;
			}
		});
	}else if(seq==4){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.fmark){
				aatemp = o.fmark;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.fmark){
				aatemp = "";
				return false;
			}else{
				aatemp = o.fmark;
			}
		});
	}else if(seq==5){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.isinvoice){
				aatemp = o.isinvoice;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.isinvoice){
				aatemp = "";
				return false;
			}else{
				aatemp = o.isinvoice;
			}
		});
	}else if(seq==6){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.invoiceHead){
				aatemp = o.invoiceHead;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.invoiceHead){
				aatemp = "";
				return false;
			}else{
				aatemp = o.invoiceHead;
			}
		});
	}else if(seq==7){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.tracknumber){
				aatemp = o.tracknumber;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.tracknumber){
				aatemp = "";
				return false;
			}else{
				aatemp = o.tracknumber;
			}
		});
	}else if(seq==8){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.giveaway){
				aatemp = o.giveaway;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.giveaway){
				aatemp = "";
				return false;
			}else{
				aatemp = o.giveaway;
			}
		});
	}else if(seq==9){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.fadressdetail){
				aatemp = o.fadressdetail;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.fadressdetail){
				aatemp = "";
				return false;
			}else{
				aatemp = o.fadressdetail;
			}
		});
	}else if(seq==10){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.sendTime){
				aatemp = o.sendTime;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.sendTime){
				aatemp = "";
				return false;
			}else{
				aatemp = o.sendTime;
			}
		});
	}else if(seq==11){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.agentName){
				aatemp = o.agentName;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.agentName){
				aatemp = "";
				return false;
			}else{
				aatemp = o.agentName;
			}
		});
	}else if(seq==12){
		$.each(stcodeList,function(i,o){
			if(aatemp!=-100&&aatemp==o.fqty){
				aatemp = o.fqty;
				return true;
			}else if(aatemp!=-100&&aatemp!=o.fqty){
				aatemp = "";
				return false;
			}else{
				aatemp = o.fqty;
			}
		});
	}else{
		
	}
	return (null==aatemp||""==aatemp)?"":aatemp;
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
		var url = ctx+"/stcode/stcode!deleteToJson.htm";
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
function selectitemc(){
	$('#inputselect').attr("name",$('#selectitem').val());
}