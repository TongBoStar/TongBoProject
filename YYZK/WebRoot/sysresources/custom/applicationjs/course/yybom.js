$(document).ready(function() {
	closeblockdiv();
	search();
	/**设置点击弹出框之外的元素 弹出框消失 开始*/
	document.body.onclick = function(e){
		 e = e || window.event;
		 var target = e.target || e.srcElement;
		 if(target.id == "selectItemCodeDiv"||target.id == "itemCodeQuery"
			 ||target.id == "selectItemNameDiv"||target.id == "itemNameQuery"||
			 target.id == "selectItemCodeDivTop"||target.id == "citemCode"
				 ||target.id == "selectItemNameDivTop"||target.id == "citemName") {
			 return;
		 }else{
			 $('#selectItemCodeDivTop').css("display","none");
			 $('#selectItemNameDivTop').css("display","none");
			 $('#selectItemCodeDiv').css("display","none");
			 $('#selectItemNameDiv').css("display","none");
		 }
	}; 
});
/**
 * 加载列表
 */
function search(){
	if($('#itemCodeQuery').val()==''){
		return;
	}
	openblockdiv();
	var html='';
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/yyitem/yyitem!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.yyitemList,function(i,o){
					html+='<tr align="center">';
					html+='<td>'+replaceNull(o.itemCode)+'</td>';
					html+='<td>'+replaceNull(o.itemName)+'</td>';
					html+='<td>'+replaceNull(o.itemMode)+'</td>';
					html+='<td>'+replaceNull(o.funit)+'</td>';
					html+='<td>'+replaceNull(o.supplier)+'</td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
					isadd = 1;
					searchBom(o.itemCode,o.id);
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
var isadd = 0;
/**
 * 加载列表
 */
function searchBom(pitemCode,pid){
	openblockdiv();
	$('#pidHidden').val(pid);
	$('#pitemCodeHidden').val(pitemCode);
	var html='';
	var url = ctx+"/yybom/yybom!listToBom.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"yybomQuery.pitemCode="+pitemCode,
		success : function(data) {
			data = $.parseJSON(data);
			if(null==data.yyitemList||data.yyitemList.length==0){
				closeblockdiv();
			}
			if(data.resultInfo[0]=='0'){
				$.each(data.yybomList,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.citemCode)+'</td>';
					html+='<td>'+replaceNull(o.citemName)+'</td>';
					html+='<td>'+replaceNull(o.citemMode)+'</td>';
					html+='<td>'+replaceNull(o.fqty)+'</td>';
					html+='<td>'+replaceNull(o.funit)+'</td>';
					html+='<td>'+replaceNull(o.fmark)+'</td>';
				});
				$('#data-body-bom').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	if(isadd==0){
		alert("请输入并查询要添加BOM对象的物料");
		reutrn;
	}
	$('#hiddenId').val("");
	$('#itemCode').val("");
	$('#itemName').val("");
	$('#itemMode').val("");
	$('#funit').val("");
	$('#fqty').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/yybom/yybom!saveToJson.htm";
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
	$('#hiddenId').val("");
	$('#itemCode').val("");
	$('#fqty').val("");
	$('#funit').val("");
	$('#fmark').val("");
	var url = ctx+"/yybom/yybom!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yybomId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#citemCode').val(replaceNull(data.model.citemCode));
				$('#citemName').val(replaceNull(data.model.citemName));
				$('#citemMode').val(replaceNull(data.model.citemMode));
				$('#fqty').val(replaceNull(data.model.fqty));
				$('#funit').val(data.model.funit);
				$('#fmark').val(replaceNull(data.model.fmark));
				openDiv('inputDiv');
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
//去掉左边的空白  
function trimLeft(s){  
    if(s == null) {  
        return "";  
    }  
    var whitespace = new String(" \t\n\r");  
    var str = new String(s);  
    if (whitespace.indexOf(str.charAt(0)) != -1) {  
        var j=0, i = str.length;  
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){  
            j++;  
        }  
        str = str.substring(j, i);  
    }  
    return str;  
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
		var url = ctx+"/yybom/yybom!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					search();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}

/**
 * 弹出物料编码
 */
function toAddItemCode(){
	$("#selectItemCodeDiv").css("display","");
	var citemcode = $("#citemCode").val();
	var data = 'yyitemQuery.itemCodeQuery='+citemcode+"&page.pageSize=10&page.pageNo=1&page.orderBy=t_yyitem.id&page.order=asc";
	var html='<td><select id="itemCodeSelect" onchange="addItemCode();" style="width: 370px; height: 108px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+"/yyitem/yyitem!listToJson.htm";
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.each(page.result,function(i,o){
				html+='<option value="'+o.id+'">'+o.itemCode+'|'+o.itemName+'|'+o.itemMode+'|'+o.funit+'</option>';
			});
			html+='</select></td>';
			$('#selectItemCode').html(html);
		}
	});	
}
/**
 * 添加物料编码
 */
function addItemCode(){
	var selectValue = $('#itemCodeSelect').val();
	var selectTxt = $('#itemCodeSelect').find('option:selected').text();
	$('#cidHidden').val(selectValue);
	$('#citemCode').val(selectTxt.split('|')[0]);
	$('#citemName').val(selectTxt.split('|')[1]);
	$('#citemMode').val(selectTxt.split('|')[2]);
	$('#funit').val(selectTxt.split('|')[3]);
	$("#selectItemCodeDiv").css("display","none");
}
/**
 * 弹出物料编码
 */
function toAddItemName(){
	$("#selectItemNameDiv").css("display","");
	var citemName = $("#citemName").val();
	var data = 'yyitemQuery.itemName='+citemName+"&page.pageSize=20&page.pageNo=1&page.orderBy=t_yyitem.id&page.order=asc";
	var html='<td><select id="itemNameSelect" onchange="addItemName();" style="width: 370px; height: 108px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+"/yyitem/yyitem!listToJson.htm";
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.each(page.result,function(i,o){
				html+='<option value="'+o.id+'">'+o.itemCode+'|'+o.itemName+'|'+o.itemMode+'|'+o.funit+'</option>';
			});
			html+='</select></td>';
			$('#selectItemName').html(html);
		}
	});	
}
/**
 * 添加物料编码
 */
function addItemName(){
	var selectValue = $('#itemNameSelect').val();
	var selectTxt = $('#itemNameSelect').find('option:selected').text();
	$('#cidHidden').val(selectValue);
	$('#citemCode').val(selectTxt.split('|')[0]);
	$('#citemName').val(selectTxt.split('|')[1]);
	$('#citemMode').val(selectTxt.split('|')[2]);
	$('#funit').val(selectTxt.split('|')[3]);
	$("#selectItemNameDiv").css("display","none");
}
/**
 * 弹出物料编码
 */
function toAddItemCodeTop(){
	$("#selectItemCodeDivTop").css("display","");
	var pitemcode = $("#itemCodeQuery").val();
	var data = 'yyitemQuery.itemCodeQuery='+pitemcode+"&page.pageSize=10&page.pageNo=1&page.orderBy=t_yyitem.id&page.order=asc";
	var html='<td><select id="itemCodeSelectTop" onchange="addItemCodeTop();" style="width: 370px; height: 108px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+"/yyitem/yyitem!listToJson.htm";
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.each(page.result,function(i,o){
				html+='<option value="'+o.id+'">'+o.itemCode+'|'+o.itemName+'|'+o.itemMode+'|'+o.funit+'</option>';
			});
			html+='</select></td>';
			$('#selectItemCodeTop').html(html);
		}
	});	
}
/**
 * 添加物料编码
 */
function addItemCodeTop(){
	var selectValue = $('#itemCodeSelectTop').val();
	var selectTxt = $('#itemCodeSelectTop').find('option:selected').text();
	$('#itemCodeQuery').val(selectTxt.split('|')[0]);
	$('#itemNameQuery').val(selectTxt.split('|')[1]);
	$("#selectItemCodeDivTop").css("display","none");
}

/**
 * 弹出物料编码
 */
function toAddItemNameTop(){
	$("#selectItemNameDivTop").css("display","");
	var pitemName = $("#itemNameQuery").val();
	var data = 'yyitemQuery.itemName='+pitemName+"&page.pageSize=20&page.pageNo=1&page.orderBy=t_yyitem.id&page.order=asc";
	var html='<td><select id="itemNameSelectTop" onchange="addItemNameTop();" style="width: 370px; height: 108px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+"/yyitem/yyitem!listToJson.htm";
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.each(page.result,function(i,o){
				html+='<option value="'+o.id+'">'+o.itemCode+'|'+o.itemName+'|'+o.itemMode+'|'+o.funit+'</option>';
			});
			html+='</select></td>';
			$('#selectItemNameTop').html(html);
		}
	});	
}
/**
 * 添加物料编码
 */
function addItemNameTop(){
	var selectValue = $('#itemNameSelectTop').val();
	var selectTxt = $('#itemNameSelectTop').find('option:selected').text();
	$('#itemCodeQuery').val(selectTxt.split('|')[0]);
	$('#itemNameQuery').val(selectTxt.split('|')[1]);
	$("#selectItemNameDivTop").css("display","none");
}
