$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'designassistlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_client_serviceblance.id',
		submitForm : submitForm//分页回调函数
		});	
	/**设置点击弹出框之外的元素 弹出框消失 开始*/
	document.body.onclick = function(e){
		 e = e || window.event;
		 var target = e.target || e.srcElement;
		 if(target.id == "selectItemcodeDiv"||target.id == "fcontractno"||
				 target.id == "selectItemnameDiv"||target.id == "createUserName"){
			 return;
		 }else{
			 $('#selectItemcodeDiv').css("display","none");
			 $('#selectItemnameDiv').css("display","none");
		 }
	};
	search();
});


function submitForm(){
	search();
}
/**
 * 加载列表
 */
function search(){
	//$('#departmentIdQuery').val(teamId);
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/clientServiceblance/client-serviceblance!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		//alert(JSON.stringify(data));
		var page = data.page;
		$.refreshPageToolbar(page,"designassistlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var createaUserId = "";
					var fstatusdis = '';
					var running = 0;
					if(o.createaUserId==100){
						createaUserId = "已结束";
						fstatusdis = 'disabled="disabled"';
					}else if(o.createaUserId==10){
						createaUserId = "已中止";
						fstatusdis = 'disabled="disabled"';
					}else{
						createaUserId = "未结束";
					}
					if(o.bracketStatus==100||o.baitStatus==100||o.assweldStatus==100||
							o.assembleStatus==100||o.deliveryStatus==100||o.bracketStatus==10||
							o.baitStatus==10||o.assweldStatus==10||
							o.assembleStatus==10||o.deliveryStatus==10){
						running = 1;
					}
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td id="forderno'+o.id+'">'+(o.forderno==null?"":o.forderno)+'</td>';
					html+='<td>'+(o.forderno==null?"":o.forderno)+'</td>';
					html+='<td>'+(o.createUserName==null?"":o.createUserName)+'</td>';
					html+='<td>'+(o.serviceHeader==null?"":o.serviceHeader)+'</td>';
					html+='<td>'+(o.serviceFee==null?"":o.serviceFee)+'</td>';
					html+='<td>'+(o.payfee==null?"":o.payfee)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.createDate)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.balanceDate)+'</td>';
					html+='<input type="hidden" id="fstatushidden'+o.id+'" value="'+(null==o.createaUserId?0:o.createaUserId)+'"/>';
					html+='<input type="hidden" id="run'+o.id+'" value="'+running+'"/></tr>';
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
/*function toDetail(id){
	window.location.href=ctx+"/designassist/designlistdetail.htm?did="+id;
}*/

/**
 * 点击添加按钮进行添加
 */
function addDesignAssist(){
	$('#hiddenId').val('');
	$('#fcontractno').val('');
	$('#forderno').val('');
	$('#createUserName').val('');
	$('#serviceHeader').val('');
	$('#serviceFee').val('');
	$('#payfee').val('');
	$('#planendtime').val('');
	$('#planendtime').val('');
	$("#departmentIdHidden").val(teamId);
	openDiv('inputDiv');
	
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#run'+hid).val()==1 || $('#run'+hid).val()=='1'){
		alert('此单据已经下发到其他部门，不能再次编辑!');
		/*newAlert("此单据已经下发到其他部门，不能再次编辑!");*/
		return;
	}
	if($('#fcontractno').val().trim()==""){
		alert('必须输入合同编号');
		/*newAlert("必须输入合同编号");*/
		return;
	}
	if($('#forderno').val().trim()==""){
		newAlert("必须输入订单号");
		return;
	}
	if($('#payfee').val().trim()==""){
		alert('必须输入付款申请金额');
		/*newAlert("必须输入付款申请金额");*/
		return;
	}else if(isNaN($('#payfee').val().trim())||parseFloat($('#payfee').val().trim())<0){
		alert('付款申请金额必须是大于0的数字');
		newAlert("付款申请金额必须是大于0的数字");
		return;
	}else{}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		exesave();
		/*var formParam = $('#inputForm').serialize();//之前版本，如果产品存在就不可以在创建
		var url = ctx+"/clientServiceblance/client-serviceblance!listToQuery.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:"designAssistQuery.fcontractno="+$('#fcontractno').val(),
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					if(data.designAssistList.length>0){
						if(undefined!=$('#hiddenId').val()&&null!=$('#hiddenId').val()&&''!=$('#hiddenId').val().trim()){
							exesave();
						}else{
							newAlert("此产品已经存在!");
						}
					}else{
						exesave();
					}
				}
			}
		});*/
	}
}
function exesave(){
	openblockdiv();
	var formParam = $('#inputForm').serialize();
	var url = ctx+"/clientServiceblance/client-serviceblance!saveToJson.htm";
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
		alert('每次只能编辑一条');
		/*newAlert("每次只能编辑一条!");*/
		return;
	}
	if(cnt==0){
		alert("请选择一条编辑的记录!");
		/*newAlert("请选择一条编辑的记录!");*/
		return;
	}
	if($('#fstatushidden'+editid).val()=='100' || $('#fstatushidden'+editid).val()==100){
		alert("此单据已经结束，不能再次编辑!");
		/*newAlert("此单据已经结束，不能再次编辑!");*/
		return;
	}
	if($('#fstatushidden'+editid).val()=='10' || $('#fstatushidden'+editid).val()==10){
		alert("此单据已经中止，不能再次编辑!");
		/*newAlert("此单据已经中止，不能再次编辑!");*/
		return;
	}
	if($('#run'+editid).val()==1 || $('#run'+editid).val()=='1'){
		alert("此单据已经下发到其他部门，不能再次编辑!");
		/*newAlert("此单据已经下发到其他部门，不能再次编辑!");*/
		return;
	}
	
	$('#fcontractno').val('');
	$("#selectItemcodeDiv").css("display","none");
	var url = ctx+"/clientServiceblance/client-serviceblance!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"clientServiceblanceId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			//alert(JSON.stringify(data));
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#fcontractno').val(replaceNull(data.model.fcontractno));
				$('#forderno').val(data.model.forderno);
				$('#createUserName').val(data.model.createUserName);
				$('#serviceHeader').val(data.model.serviceHeader);
				$('#serviceFee').val(data.model.serviceFee);
				$('#payfee').val(data.model.payfee);
				/*$('#createDate').val(data.model.createDate);*/
				$('#balanceDate').val(formatDate("yyyy-MM-dd",data.model.balanceDate));
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
		var url = ctx+"/clientServiceblance/client-serviceblance!deleteToJson.htm";
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

/**
 * 执行关闭操作
 * @param param 参数
 */
function exeClose(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		cnt++;
	});
	param['createaUserId'] = $("input[name='closestatus']:checked").val();
	var flag = window.confirm("确定关闭吗？");
	if (flag) {
		openblockdiv();
		var url = ctx+"/clientServiceblance/client-serviceblance!closeToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('closeinfoDiv');
					newAlert("关闭成功!");
					closeblockdiv();
					search();
				}
			}
		});
	}
}

/**
 * 选择物料编码
 *//*
function finditemcode(){
	$("#selectItemcodeDiv").css("display","");
	var code = $("#fcontractno").val();
	var html='<td><select id="itemcodeSelect" onchange="addItemcode();" style="width: 600px; height: 115px;background-color: #E0E9EA"; multiple="true">';
	var data = 'baseItemQuery.itemcode='+code;
	var url =ctx+'/baseItem/base-item!listToEntityPorequest.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.baseItemList;
			$.each(list,function(i,o){
				html+='<option value="'+o.itemcode+'" >'+o.itemcode+'|'+o.itemname+'|'+o.formatno+'|'+o.unitname+'|'+(o.f101==null?"":o.f101)+'|'+(o.f102==null?"":o.f102)+'|'+(o.supplier==null?"":o.supplier.fname)+'</option>';
			});
			html+='</select></td>';
			$('#selectItemcode').html(html);
		}
	});	
}*/
/**
 * 添加物料
 */
function addItemcode(){
	var selectValue = $('#itemcodeSelect').val();
	var selectTxt = $("#itemcodeSelect").find('option:selected').text();
	$('#fcontractno').val(selectValue);
	$('#createUserName').val(selectTxt.split('|')[1]);
	$("#selectItemcodeDiv").css("display","none");
}
/**
 * 选择物料名称
 *//*
function finditemname(){
	$("#selectItemnameDiv").css("display","");
	var name = $("#createUserName").val();
	var html='<td><select id="itemnameSelect" onchange="addItemname();" style="width: 600px; height: 115px;background-color: #E0E9EA"; multiple="true">';
	var data = 'baseItemQuery.itemname='+name;
	var url =ctx+'/baseItem/base-item!listToEntityPorequest.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.baseItemList;
			$.each(list,function(i,o){
				html+='<option value="'+o.itemcode+'" >'+o.itemcode+'|'+o.itemname+'|'+o.formatno+'|'+o.unitname+'|'+(o.f101==null?"":o.f101)+'|'+(o.f102==null?"":o.f102)+'|'+(o.supplier==null?"":o.supplier.fname)+'</option>';
			});
			html+='</select></td>';
			$('#selectItemname').html(html);
		}
	});	
}*/
/**
 * 添加物料名称
 */
function addItemname(){
	var selectValue = $('#itemnameSelect').val();
	var selectTxt = $("#itemnameSelect").find('option:selected').text();
	$('#fcontractno').val(selectValue);
	$('#createUserName').val(selectTxt.split('|')[1]);
	$("#selectItemnameDiv").css("display","none");
} 
/**
 * 选择检索的属性
 */
function selectoption(){
	var name = $('#selection').val();
	$('#optselect').attr("name",name);
}
/**
 * 自动计算台数
 */
/*function counttaishu(){
	var makeNumberCodeStart = $('#makeNumberCodeStart').val();
	var makeNumberCodeEnd = $('#makeNumberCodeEnd').val();
	if(makeNumberCodeStart!=''&&isNaN(makeNumberCodeStart)){
		alert("请输入数字");
		$('#makeNumberCodeStart').val('');
	}
	if(makeNumberCodeStart.trim()==''){
		makeNumberCodeStart=0;
	}
	if(makeNumberCodeEnd.trim()==''){
		makeNumberCodeEnd=0;
	}
	if(makeNumberCodeEnd!=''&&isNaN(makeNumberCodeEnd)){
		alert("请输入数字");
		$('#makeNumberCodeEnd').val('');
	}
	if(makeNumberCodeStart.trim()!=''&&makeNumberCodeEnd.trim()!=''){
		if(parseInt(makeNumberCodeEnd)<=parseInt(makeNumberCodeStart)){
			alert("尾数应大于首数!");
			return;
		}
		$('#copyfcount').val(parseInt(makeNumberCodeEnd)-parseInt(makeNumberCodeStart));
	}
	if(makeNumberCodeStart.trim()==''||makeNumberCodeEnd.trim()==''){
		$('#copyfcount').val(1);
	}
}*/

/**
 * 执行复制单据
 */
/*function exeCopy(){
	if($('#copyprojectName').val().trim()==''){
		alert("请输入项目名称!");
		return;
	}
	var flag = window.confirm("确定复制吗？");
	if (flag) {
		openblockdiv();
		var copyForm = $('#copyForm').serialize();
		var url = ctx+"/clientServiceblance/client-serviceblance!copyToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:copyForm,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("复制成功!");
					closeDiv('copyDiv');
					search();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}*/