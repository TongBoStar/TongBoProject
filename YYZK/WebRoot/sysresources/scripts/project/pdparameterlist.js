
$(document).ready(function() {
			window.simpleTable =$(document).SimpleTable({
				id:'propage',
				formId: 'queryForm',
				pageNo: '1',
				pageSize : '10',
				order: 'desc',
				orderBy: 'paramid',
				submitForm : submitForm//分页回调函数
				});
			loadMeasureCategory();
			search();
});


function loadMeasureCategory(){
	$('#navigation').html('<img src="../images/icon_load.gif"/>');
		var html='';
		var url = ctx+"/pdparameter/pdparameter!listToTree.htm";
			$.webAjax( {
				type : "post",
				url : url,
				success : function(data) {
				data = $.parseJSON(data);
					if(data.resultInfo[0]=='0')
					{
						$('#navigation').html(data.tree);
						inittreeview();
						bindright();
					}else{
						alert(data.resultInfo[1]);
					}				
				}
			});
}
function inittreeview()
{
	$("#navigation").treeview({
			animated: "fast",
		collapsed: true,
		unique: true,
		control: "#treecontrol",
		persist: "cookie",
		cookieId: "treeview-black"
	});
}

function bindright()
{
	$('#navigation span:first').contextMenu('myMenu1', {
		bindings: {
			'add1': function(t) {
				var strid = $(t).attr('id');
				strid = strid.substring(2,strid.length);
				$('#paramid').attr("value","");
				cancel();
				$("#fparentid").val(strid);
				openDiv("inputDiv");				
			 }
		}
	});	
	
	
	
	$('#navigation span[id!=li0]').contextMenu('myMenu', {
		bindings: {
			'add': function(t) {
				var strid = $(t).attr('ref');
				$('#paramid').attr("value","");
				cancel();
				$("#fparentid").val(strid);
				openDiv("inputDiv");				
			 },
			 'edit': function(t) {
				var strid = $(t).attr('ref');
				var url = ctx+"/pdparameter/pdparameter!showToJson.htm";
				$.webAjax( {
					type : "post",
					url : url,
					data:'pdparameterId='+strid,
					success : function(data) {
						data = $.parseJSON(data);
						var model=data.model;
						//paramid  parametername parametercode flevels seqno  fdescript fparentid
						$("#paramid").val(model.paramid==null?"":model.paramid);
						$("#parametername").val(model.parametername==null?"":model.parametername);
						$("#parametercode").val(model.parametercode==null?"":model.parametercode);
						$("#flevels").val(model.flevels==null?"":model.flevels);
						$("#seqno").val(model.seqno==null?"":model.seqno);
						$("#fdescript").val(model.fdescript==null?"":model.fdescript);
						$("#fparentid").val(model.fparentid==null?"":model.fparentid);
					}
				});	
				openDiv('inputDiv');	
				 
			 },
			 'delete': function(t) {
				var blocid = $(t).attr('ref');
				/*var param = {};
				if(blocid) {
					param['checkedIdList[0]'] = blocid;
				}
				if(!param['checkedIdList[0]']) {
					alert('请选择要删除的基础数据！');
					return;
				}*/
				if(!confirm('确定删除基础数据以及子节点吗？')) {
					return;
				}
				var url = ctx + '/pdparameter/pdparameter!deleteAlone.htm?pdparameterId='+blocid;
				$.webAjax( {
					type : 'post',
					url : url,
					success : function(data) {
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0'){
							$('#navigation').html(data.tree);
							inittreeview();
							bindright();
							search();
						} else {
							alert('删除基础数据失败！');
						}
					}
				});
			 }
		}
	});	
	
}
function submitForm()
{
	search();
}

function search()
{
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/pdparameter/pdparameter!listToJson.htm";
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
					/*html += '<td><input type="checkbox" id="checkedpro" name="checkedpro" value="' + o.paramid + '"/></td>';*/
					html+='<td>'+(o.parametername==null?"":o.parametername)+'</td>';
					html+='<td>'+(o.parametercode==null?"":o.parametercode)+'</td>';
					html+='<td>'+(o.flevels==null?"":o.flevels)+'</td>';
					html+='<td>'+(o.seqno==null?"":o.seqno)+'</td>';
					html+='<td>'+(o.fdescript==null?"":o.fdescript)+'</td>';
					if(o.isshow!=null&&$.trim(o.isshow)!=""){
						if(o.isshow==0){
							html+='<td>是</td>';
						}else{
							html+='<td>否</td>';
						}
					}else{
						html+='<td></td>';
					}
					html+='<td><a href="javascript:editstr('+o.paramid+');"><img src="'+ctx+'/images/icon01.gif"/></a></td>';
					html+='</tr>';
				});
				$('#plantable').html(html);
				//createTree();
			}
		}
	});
}

function editstr(strid)
{
	var url = ctx+"/pdparameter/pdparameter!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'pdparameterId='+strid,
		success : function(data) {
			data = $.parseJSON(data);
			var model=data.model;
			//paramid  parametername parametercode flevels seqno  fdescript fparentid
			$("#paramid").val(model.paramid==null?"":model.paramid);
			$("#parametername").val(model.parametername==null?"":model.parametername);
			$("#parametercode").val(model.parametercode==null?"":model.parametercode);
			$("#flevels").val(model.flevels==null?"":model.flevels);
			$("#seqno").val(model.seqno==null?"":model.seqno);
			$("#fdescript").val(model.fdescript==null?"":model.fdescript);
			$("#fparentid").val(model.fparentid==null?"":model.fparentid);
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
		var cnt = 0;
		$.each(delBlocs, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的基础数据！');
		return;
	}
	
	if(!confirm('确定删除基础数据吗？')) {
		return;
	}
	var url = ctx + '/pdparameter/pdparameter!deleteToJson.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				search();
			} else {
				alert('删除基础数据失败！');
			}
		}
	});
}
function addDiv()
{
	//清空数据
	$('#paramid').attr("value","");
	cancel();
	openDiv("inputDiv");
}
function closeAddDiv()
{
	closeDiv("inputDiv");
}
function cancel(){
	$("#parametername").attr("value","");
	$("#parametercode").attr("value","");
	$("#flevels").attr("value","");
	$("#seqno").attr("value","");
	$("#fdescript").attr("value","");
	$("#fparentid").attr("value",""); 
	
}
function save()
{
	if(checkFrom()){
		var formParam = $('#inputForm').serialize();
		var url =ctx+ "/pdparameter/pdparameter!saveToJson.htm";
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
					$('#navigation').html(data.tree);
					inittreeview();
					bindright();
					search();
					closeAddDiv();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
//检验各个输入项是否为空
function checkFrom(){
	var parametername = $("#parametername").val();
	if(parametername==null||$.trim(parametername)==""){
		alert("参数名称不能为空！");
		$("#parametername").focus();
		return false;
	}
	var parametercode = $("#parametercode").val();
	if(parametercode==null||$.trim(parametercode)==""){
		alert("参数编号不能为空！");
		$("#parametercode").focus();
		return false;
	}
	var flevels = $("#flevels").val();
	if(flevels==null||$.trim(flevels)==""){
		alert("级别不能为空！");
		$("#flevels").focus();
		return false;
	}
	var seqno = $("#seqno").val();
	if(seqno==null||$.trim(seqno)==""){
		alert("顺序号不能为空！");
		$("#seqno").focus();
		return false;
	}
	var fparentid = $("#fparentid").val();
	if(fparentid==null||$.trim(fparentid)==""){
		alert("父级ID不能为空！");
		$("#fparentid").focus();
		return false;
	}
	var isshow = $("input[name='isshow']:checked").val();
	if(isshow==null||$.trim(isshow)==""){
		alert("请选择是否显示！");
		return false;
	}
	return true;
}
function searchlist(paramid){
	$("#qfparentid").val(paramid);
	$("#navigation a").css("color","#07F");
	$("#li"+paramid+" a").css("color","red");
	search();
}