$(document).ready(function() {
			window.simpleTable =$(document).SimpleTable({
				id:'propage',
				formId: 'queryForm',
				pageNo: '1',
				pageSize : '20',
				order: 'desc',
				orderBy: 't_structure.id',
				submitForm : submitForm//分页回调函数
				});	
			search();
});


function submitForm()
{
	search();
}

function search()
{
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/structure/structure!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"propage",simpleTable);
			if(data.resultInfo[0]=='0')
			{
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedpro" name="checkedpro" value="' + o.id + '"/></td>';
					html+='<td>'+(o.structurename==null?"":o.structurename)+'</td>';
					if(o.structuretype!=null&&o.structuretype=="1"){
						html+='<td>调压</td>';
					}else if(o.structuretype!=null&&o.structuretype=="2"){
						html+='<td>计量</td>';
					}else{
						html+='<td></td>';
					}
					html+='<td>'+(o.structuredesc==null?"":o.structuredesc)+'</td>';
					if(o.isuse!=null&&o.isuse==0){
						html+='<td>是</td>';
					}else if(o.isuse!=null&&o.isuse==1){
						html+='<td>否</td>';
					}else{
						html+='<td></td>';
					}
					html+='<td><a href="javascript:editstr('+o.id+');"><img src="'+ctx+'/images/icon01.gif"/></a></td>';
					html+='</tr>';
				});
				$('#plantable').html(html);
				closeblockdiv();
			}
		}
	});
}
function editstr(strid)
{
	var url = ctx+"/structure/structure!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'strId='+strid,
		success : function(data) {
			data = $.parseJSON(data);
			var model=data.model;
			$('#structurename').attr("value",(model.structurename==null?"":model.structurename));
			$('#strid').attr("value",strid);
			if(model.structuretype!=null&&model.structuretype!=""){
				$('input[name="structuretype"]').each(function(){
					if($(this).val()==model.structuretype){
						$(this).attr("checked",'checked');
					}else{
						$(this).removeAttr("checked");
					}
				});
			}
			if(model.isuse!=null&&model.isuse!=""){
				$('input[name="isuse"]').each(function(){
					if($(this).val()==model.isuse){
						$(this).attr("checked",'checked');
					}else{
						$(this).removeAttr("checked");
					}
				});
			}
			$('#structuredesc').attr("value",(model.structuredesc==null?"":model.structuredesc));
			
		}
	});	
	openDiv('inputDiv');	
}
//删除
function del(blocid)
{
	var param = {};
	if(blocid) {
		param['checkedIdList[0]'] = blocid;
	} else {		
		var delBlocs = $('[name="checkedpro"]:checked');
		//console.log('del admin length: ' + delAdmins.length);
		var cnt = 0;
		$.each(delBlocs, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	//console.log('param : ' + param['checkedIdList[0]']);
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的项目！');
		return;
	}
	
	if(!confirm('确定删除项目吗？')) {
		return;
	}
	var url = ctx + '/structure/structure!deleteToJson.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				search();
			} else {
				alert('删除项目失败！');
			}
		}
	});
}
function addDiv()
{
	//清空数据
	$('#strid').attr("value","");
	cancel();
	openDiv("inputDiv");
}
function closeAddDiv()
{
	$.closeDiv("inputDiv");
}
function cancel(){
	$("#structurename").attr("value","");
	$("#structuredesc").attr("value","");
	$("#structuretype1").attr("checked","checked");
	$("#structuretype2").removeAttr("checked");
	$("#isuse1").attr("checked","checked");
	$("#isuse2").removeAttr("checked");
}
function save()
{
	
	var formParam = $('#inputForm').serialize();
	//验证各个输入项
	var structurename = $("#structurename").val();
	if(structurename==null||structurename==""){
		alert("请输入结构型式名称!");
	}
	
	var structuretype = $('input[name="structuretype"]:checked ').val();
	if(structuretype==null||structuretype==""){
		alert("请选择结构型式类型!");
	}
	
	var url =ctx+ "/structure/structure!saveToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
			if(data.resultInfo[0]=='0')
			{
				alert("操作成功！");
				search();
				closeAddDiv();
			}
			if(data.resultInfo[0]=='-2')
			{
				alert(data.resultInfo[1]);
			}
		}
	});
}