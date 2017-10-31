$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'designassistlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_design_assist.fstatus',
		submitForm : submitForm//分页回调函数
		});	
	/**设置点击弹出框之外的元素 弹出框消失 开始*/
	document.body.onclick = function(e){
		 e = e || window.event;
		 var target = e.target || e.srcElement;
		 if(target.id == "selectItemcodeDiv"||target.id == "productCode"||
				 target.id == "selectItemnameDiv"||target.id == "productName"){
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
	var url = ctx+"/designAssist/design-assist!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"designassistlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var fstatus = "";
					var fstatusdis = '';
					var running = 0;
					if(o.fstatus==100){
						fstatus = "已结束";
						fstatusdis = 'disabled="disabled"';
					}else if(o.fstatus==10){
						fstatus = "已中止";
						fstatusdis = 'disabled="disabled"';
					}else{
						fstatus = "未结束";
					}
					if(o.bracketStatus==100||o.baitStatus==100||o.assweldStatus==100||
							o.assembleStatus==100||o.deliveryStatus==100||o.bracketStatus==10||
							o.baitStatus==10||o.assweldStatus==10||
							o.assembleStatus==10||o.deliveryStatus==10){
						running = 1;
					}
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td id="designAssistCode'+o.id+'">'+(o.designAssistCode==null?"":o.designAssistCode)+'</td>';
					html+='<td><a href="#" onclick="toDetail('+o.id+')">'+o.productCode+'</a></td>';
					html+='<td>'+(o.productName==null?"":o.productName)+'</td>';
					html+='<td>'+(o.productModel==null?"":o.productModel)+'</td>';
					html+='<td>'+(o.makeNumberCode==null?"":o.makeNumberCode)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+(o.projectName==null?"":o.projectName)+'</td>';
					html+='<td>'+(o.createrName==null?"":o.createrName)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.createTime)+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd",o.planendtime)+'</td>';
					html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
					html+='<td>'+fstatus+'</td>';
					html+='<input type="hidden" id="fstatushidden'+o.id+'" value="'+(null==o.fstatus?0:o.fstatus)+'"/>';
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
function addDesignAssist(){
	$('#hiddenId').val('');
	$('#productCode').val('');
	$('#productName').val('');
	$('#makeNumberCode').val('');
	$('#productModel').val('');
	$('#projectName').val('');
	$('#fcount').val('');
	$('#fmark').val('');
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
		newAlert("此单据已经下发到其他部门，不能再次编辑!");
		return;
	}
	if($('#productCode').val().trim()==""){
		newAlert("必须选择产品编码");
		return;
	}
	if($('#makeNumberCode').val().trim()==""){
		newAlert("必须输入制令号");
		return;
	}
	if($('#fcount').val().trim()==""){
		newAlert("必须输入台数");
		return;
	}else if(isNaN($('#fcount').val().trim())||parseFloat($('#fcount').val().trim())<0){
		newAlert("台数必须是大于0的数字");
		return;
	}else{}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		exesave();
		/*var formParam = $('#inputForm').serialize();//之前版本，如果产品存在就不可以在创建
		var url = ctx+"/designAssist/design-assist!listToQuery.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:"designAssistQuery.productCode="+$('#productCode').val(),
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
	var url = ctx+"/designAssist/design-assist!saveToJson.htm";
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
		newAlert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		newAlert("请选择一条编辑的记录!");
		return;
	}
	if($('#fstatushidden'+editid).val()=='100' || $('#fstatushidden'+editid).val()==100){
		newAlert("此单据已经结束，不能再次编辑!");
		return;
	}
	if($('#fstatushidden'+editid).val()=='10' || $('#fstatushidden'+editid).val()==10){
		newAlert("此单据已经中止，不能再次编辑!");
		return;
	}
	if($('#run'+editid).val()==1 || $('#run'+editid).val()=='1'){
		newAlert("此单据已经下发到其他部门，不能再次编辑!");
		return;
	}
	$('#productCode').val('');
	$("#selectItemcodeDiv").css("display","none");
	var url = ctx+"/designAssist/design-assist!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"designAssistId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#productCode').val(replaceNull(data.model.productCode));
				$('#productName').val(data.model.productName);
				$('#makeNumberCode').val(data.model.makeNumberCode);
				$('#productModel').val(data.model.productModel);
				$('#fcount').val(data.model.fcount);
				$('#fmark').val(data.model.fmark);
				$('#planendtime').val(data.model.planendtime);
				$("#departmentIdHidden").val(data.model.departmentId);
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
		var url = ctx+"/designAssist/design-assist!deleteToJson.htm";
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
		newAlert('请选择要关闭的记录！');
		return;
	}
	openDiv('closeinfoDiv');
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
	param['fstatus'] = $("input[name='closestatus']:checked").val();
	var flag = window.confirm("确定关闭吗？");
	if (flag) {
		openblockdiv();
		var url = ctx+"/designAssist/design-assist!closeToJson.htm";
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
 * 反审
 */
function toUnexamine(){
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	var unpush = '';
	$.each(delareas, function(i, o){	
		if($('#fstatushidden'+$(o).val()).val()==0){
			unpush += $('#designAssistCode'+$(o).val()).text()+" ";
		}
		param['designAssistList[' + cnt + '].id'] = $(o).val();
		param['designAssistList[' + cnt + '].fstatus'] = parseInt($('#fstatushidden'+$(o).val()).val());
		cnt++;
	});
	if(cnt==0){
		newAlert("请选择要反审的单据!");
		return;
	}
	if(unpush!=''){
		newAlert(unpush+"单据还未结束,不用反审!");
		return;
	}
	//param['fstatus'] = $("input[name='closestatus']:checked").val();
	var flag = window.confirm("确定反审吗？");
	if (flag) {
		openblockdiv();
		var url = ctx+"/designAssist/design-assist!unexamineAllToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('closeinfoDiv');
					newAlert("反审成功!");
					closeblockdiv();
					search();
				}else{
					newAlert(data.resultInfo[1]);
				}
			}
		});
	}
}
/**
 * 选择物料编码
 */
function finditemcode(){
	$("#selectItemcodeDiv").css("display","");
	var code = $("#productCode").val();
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
}
/**
 * 添加物料
 */
function addItemcode(){
	var selectValue = $('#itemcodeSelect').val();
	var selectTxt = $("#itemcodeSelect").find('option:selected').text();
	$('#productCode').val(selectValue);
	$('#productName').val(selectTxt.split('|')[1]);
	$("#selectItemcodeDiv").css("display","none");
}
/**
 * 选择物料名称
 */
function finditemname(){
	$("#selectItemnameDiv").css("display","");
	var name = $("#productName").val();
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
}
/**
 * 添加物料名称
 */
function addItemname(){
	var selectValue = $('#itemnameSelect').val();
	var selectTxt = $("#itemnameSelect").find('option:selected').text();
	$('#productCode').val(selectValue);
	$('#productName').val(selectTxt.split('|')[1]);
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
function counttaishu(){
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
}
/**
 * 打开复制单据窗口
 */
function toCopy(){
	openblockdiv();
	var editid;
	var param = {};
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		cnt++;
		editid = $(o).val();
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要复制的记录！');
		closeblockdiv();
		return;
	}
	var url = ctx+"/designAssist/design-assist!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"designAssistId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#copyhiddenId').val(data.model.id);
				$('#copyproductCode').val(replaceNull(data.model.productCode));
				$('#copyproductName').val(data.model.productName);
				$('#copymakeNumberCode').val(data.model.makeNumberCode);
				$('#copyproductModel').val(data.model.productModel);
				$('#copyfcount').val(data.model.fcount);
				$('#copyfmark').val(data.model.fmark);
				$('#copyplanendtime').val(data.model.planendtime);
				$("#copydepartmentIdHidden").val(data.model.departmentId);
				closeblockdiv();
				openDiv('copyDiv');
			}
		}
	});
}
/**
 * 执行复制单据
 */
function exeCopy(){
	if($('#copyprojectName').val().trim()==''){
		alert("请输入项目名称!");
		return;
	}
	var flag = window.confirm("确定复制吗？");
	if (flag) {
		openblockdiv();
		var copyForm = $('#copyForm').serialize();
		var url = ctx+"/designAssist/design-assist!copyToJson.htm";
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
}