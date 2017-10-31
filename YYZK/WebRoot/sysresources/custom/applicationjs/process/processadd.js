$(document).ready(function() {
	loadnodes($('#processHiddenIdParam').val());
	loadDepartments();
	loadUsers();
	//loadAdminRoles();
});
/**
 * 加载部门信息
 */
function loadDepartments(){
	var html='';
	var url = ctx+"/system/listteam.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'departmentQuery.teamname='+$('#selectHandler').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.departmentList,function(i,o){
					html+='<option id="optdep'+o.teamid+'" value="'+o.teamid+'" onclick="selecttoeddep('+o.teamid+',\''+o.teamname+'\');">'+o.teamname+'</option>';
				});
				$('#dispatchdepsshow').html(html);
			}
		}
	});
}
function loadUsersOrdeps(){
	var val = $('#nodeType').val();
	if(val=="1"){
		loadUsers();
	}else{
		loadDepartments();
	}
}
/**
 * 加载用户信息
 */
function loadUsers(){
	var html='';
	var url = ctx+"/system/adminList.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'adminQuery.adminName='+$('#selectHandler').val(),
		success : function(data) {
			$.each(data,function(i,o){
				html+='<option id="opt'+o.adminId+'" value="'+o.adminId+'" onclick="selecttoed('+o.adminId+',\''+o.adminName+'\');">'+o.adminName+'</option>';
			});
			$('#handlersshow').html(html);
		}
	});
}
function selecttoed(id,name){
	$('#opt'+id).css("display","none");
	$('#handlers').html($('#handlers').html()+'<option id="optrev'+id+'" value="'+id+'" onclick="selecttoedrev('+id+',\''+name+'\');" selected="selected">'+name+'</option>');
}
function selecttoedrev(id,name){
	//$('#optrev'+id).attr("selected",false);
	//$('#optrev'+id).css("display","none");
	$('#handlers option').each(function(){//遍历全部option
        var val = parseInt($(this).val()); //获取option的内容
        if(val == id){
        	$(this).remove();
        }else{
	    	$(this).attr("selected","selected");
        }
    });
	$('#opt'+id).css("display","");
}
function selecttoeddep(id,name){
	$('#optdep'+id).css("display","none");
	$('#dispatchdeps').html($('#dispatchdeps').html()+'<option id="optrevdep'+id+'" value="'+id+'" onclick="selecttoedrevdep('+id+',\''+name+'\');" selected="selected">'+name+'</option>');
}
function selecttoedrevdep(id,name){
	//$('#optrevdep'+id).attr("selected",false);
	//$('#optrevdep'+id).css("display","none");
	$('#dispatchdeps option').each(function(){//遍历全部option
        var val = parseInt($(this).val()); //获取option的内容
        if(val == id){
        	$(this).remove();
        }else{
	    	$(this).attr("selected","selected");
        }
    });
	$('#optdep'+id).css("display","");
}
/**
 * 加载角色信息
 */
function loadAdminRoles(){
	var html='';
	var url = ctx+"/role/role!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		//data:'',
		success : function(data) {
			data = $.parseJSON(data);
			$.each(data.list,function(i,o){
				html+='<option value="'+o.keywords+'">'+o.name+'</option>';
			});
			$('#keep-order').html(html);
			$('#keep-order').multiSelect();
		}
	});
}
/**
 * 根据节点类型不同选择指定处理人还是下发部门
 */
function selectbynodetype(){
	var val = $('#nodeType').val();
	if(val=='1'){
		$('#dispatchDep').css("display","none");
		$('#thehandler').css("display","");
	}else{
		$('#dispatchDep').css("display","");
		$('#thehandler').css("display","none");
	}
}
var seq;
var pdid;
var addtype = 0;
var clickmark = 0;
/**
 * 改变选中节点的颜色
 * @param sequence 选中节点的序号
 * @param id 选中节点的ID
 */
function changeColor(sequence,id){
	if(clickmark == 0){
		$('#a'+sequence).css("background-color","#bfcbd6").css("color","#465c71");
		clickmark = sequence;
		seq = sequence;
		pdid = id;
	}else if(clickmark == sequence){
		$('#a'+sequence).css("background-color","#465c71").css("color","#dde4ec");
		clickmark = 0;
		seq=undefined;
		pdid = undefined;
	}else{
		$('#a'+sequence).css("background-color","#bfcbd6").css("color","#465c71");
		var ali = $('#a'+sequence).parent().siblings().find('a');
		for(var i=0;i<ali.length;i++){
			$(ali.eq(i)).css("background-color","#465c71").css("color","#dde4ec");
		}
		clickmark = sequence;
		seq = sequence;
		pdid = id;
	}
}
/**
 * 在选中节点的前面添加
 */
function addpre(){
	clearaddform();
	addtype = 1;
	pdid = '';
	$('#nodeSeq').val(seq);
	if(seq==0){
		alert("不能再开始节点前添加!");
	}else if(seq==undefined){
		alert("请先选择节点!");
	}else if(seq==1000){
		var ali = $('#li0').siblings().find('a');
		seq = ali.length;
		openDiv('inputDiv');
	}else{
		openDiv('inputDiv');
	}
	$('#dispatchDep').css("display","none");
	$('#thehandler').css("display","");
}
/**
 * 在选中节点的后面添加
 */
function addafter(){
	clearaddform();
	addtype = 2;
	pdid = '';
	$('#nodeSeq').val(seq+1);
	if(seq==1000){
		alert("不能再结束节点后添加!");
	}else if(seq==undefined){
		alert("请先选择节点!");
	}else{
		openDiv('inputDiv');
	}
	$('#dispatchDep').css("display","none");
	$('#thehandler').css("display","");
}
/**
 * 清空添加表单
 */
function clearaddform(){
	$('#hiddenId').val('');
	$('#nodeName').val('');
	$('#nodeType').val('1');
	$('#taskMark').val('');
	$('#handlers').html("");
	$('#dispatchdeps').html("");
}
/**
 * 选择节点(首尾节点)
 * @param sequence 首尾节点的序号
 */
function selectnode(sequence){
	seq = sequence;
}
/**
 * 编辑节点
 */
function edit(){
	if(seq==undefined){
		alert("请先选择节点!");
	}else if(seq==0||seq==1000){
		alert("不能选择开始节点和结束节点!");
	}else{
		var url = ctx+"/processDetail/process-detail!showToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:"processDetailId="+pdid,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					$('#hiddenId').val(data.model.id);
					$('#nodeName').val(data.model.nodeName);
					$('#nodeType').val(data.model.nodeType);
					$('#nodeSeq').val(data.model.nodeSeq);
					$('#taskMark').val(data.model.taskMark);
					$('#handlers').html("");
					$('#dispatchdeps').html("");
					if(data.model.nodeType=='1'){
							$.each(data.model.processHandleList,function(i,o){
								$('#handlersshow option').each(function(){//遍历全部option
							        var val = parseInt($(this).val()); //获取option的内容
							        if(val == o.handler){
							        	$(this).css("display","none");
							        	$('#handlers').html($('#handlers').html()+'<option id="optrev'+$(this).val()+'" value="'+$(this).val()+'" onclick="selecttoedrev('+$(this).val()+',\''+$(this).text()+'\');" selected="selected">'+$(this).text()+'</option>');
							        }else{
							        	$(this).attr("display","");
							        }
							    });
							});
						}else if(data.model.nodeType=='2'){
							$.each(data.model.processHandleList,function(i,o){
								$('#dispatchdepsshow option').each(function(){//遍历全部option
							        var val = parseInt($(this).val()); //获取option的内容
							        if(val == o.dispatchdep){
							        	$(this).css("display","none");
							        	$('#dispatchdeps').html($('#dispatchdeps').html()+'<option id="optrevdep'+$(this).val()+'" value="'+$(this).val()+'" onclick="selecttoedrevdep('+$(this).val()+',\''+$(this).text()+'\');" selected="selected">'+$(this).text()+'</option>');
							        }else{
							        	$(this).attr("display","");
							        }
							    });
							});
						}else{}
					selectbynodetype();
					openDiv('inputDiv');
				}
			}
		});
	}
}
/**
 * 删除流程节点
 */
function del(){
	if(seq==undefined){
		alert("请先选择节点!");
	}else if(seq==0||seq==1000){
		alert("不能选择开始节点和结束节点!");
	}else{
		var flag = window.confirm("确定删除吗？");
		if (flag) {
			var url = ctx+"/processDetail/process-detail!deleteToJson.htm";
			$.webAjax({
				type : "post",
				url : url,
				data:"processDetailId="+pdid+"&processDetailQuery.processId="+$('#processHiddenIdParam').val(),
				success : function(data) {
					data = $.parseJSON(data);
					if(data.resultInfo[0]=='0'){
						closeblockdiv();
						loadnodes($('#processHiddenIdParam').val());
					}
				}
			});
		}
	}
}
/**
 * 保存节点
 */
function savenode(){
	var val = $('#nodeType').val();
	if(val=='1'){
		$('#dispatchdeps').html("");
	}else{
		$('#handlers').html("");
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formparam = $('#inputForm').serialize();
		var url = ctx+"/processDetail/process-detail!saveToJson.htm";
		$.webAjax({
			type : "post",
			url : url,
			data:formparam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeblockdiv();
					loadnodes($('#processHiddenIdParam').val());
					closeDiv('inputDiv');
				}
			}
		});
	}
}
/**
 * 加载流程节点
 * @param processId 流程ID
 */
function loadnodes(processId){
	var html = "";
	var url = ctx+"/processDetail/process-detail!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"processDetailQuery.processId="+processId,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				html += '<li id="li0" style="line-height:4;"><button type="button" class="btn btn-blue btn-outlined btn-square" style="border-radius: 50%!important;height:50px;" onclick="selectnode(0);">开始</button></li>';
				html += '<li id="lia0" style="width:20px;padding:3px 5px;"><i class="fa fa-arrow-right" style="line-height:4;"></i></li>';
				$.each(data.processDetailList,function(i,o){
					html += '<li id="li'+o.nodeSeq+'"><a href="javascript:void(0);" id="a'+o.nodeSeq+'" onclick="changeColor('+o.nodeSeq+','+o.id+');">';
					html += o.nodeSeq+"."+o.nodeName+'<br/>(';
					$.each(o.processHandleList,function(n,m){
						if(o.nodeType=='1'){
							html += m.handlerName +" ";
						}else if(o.nodeType=='2'){
							html += m.dispatchdepName +"<br/>";
						}else{}
					});
					html += ')</a></li>';
					html += '<li id="lia'+o.nodeSeq+'" style="width:20px;padding:3px 5px;"><i class="fa fa-arrow-right" style="line-height:4;"></i></li>';
				});
				html += '<li id="li1000" style="line-height:4;"><button type="button" class="btn btn-blue btn-outlined btn-square" style="border-radius: 50%!important;height:50px;" onclick="selectnode(1000);">结束</button></li>';
				$('#processnodelist').html(html);
				var ali = $('#li0').siblings().find('a');
				$('.processhor').css("margin","15% "+(30-(ali.length*5))+"%");
			}
			closeblockdiv();
		}
	});
}