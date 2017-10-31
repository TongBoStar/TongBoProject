var ruleNameNumber=0;
var ruleDetailNumber=0;
var newruleDetailNumber=0;
var newruleNameNumber=0;
var flagResult=false;//物料代码是否存在标识,默认存在true;

//表格奇偶背景（鼠标移上效果）
$(function() {//定义函数
	$('#leftDiv').css('height',window.innerHeight-38);
	$('#rightDiv').css('height',window.innerHeight-38);
	$('.tab tr').hover(
	  function(){
		$(this).addClass("tr_on");
		$(this).removeClass("tr_off");
	  },
	  function(){
		$(this).addClass("tr_off");
		$(this).removeClass("tr_on");
	  }
	); 
	var applyId = $('#applyIdHidden').val();
	 if(applyId!=''&&applyId!=undefined){
		$.webAjax( {
			type : "post",
			url : ctx+"/baseitemApply/baseitem-apply!showToJson.htm",
			data:"baseitemApplyId="+applyId,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					$('#newitemcodeForOptItem').val(data.model.itemcode);
					$('#newitemnameForOptItem').val(data.model.itemname);
					$('#newitemmodeForOptItem').val(data.model.formatno);
					$('#newitemPcodeForOptItem').val(data.model.parentitemcode);
					$('#fnotes').val(data.model.fnotes);
				}
			}
		});
   }
});

$(document).ready(function(){
	
	
	if("0"==paramValue){//项目信息
		//alert("0");
		$('#projectDiv').css("display","block"); 
		$('#optItemDiv').css("display","none");
	}
	if("1"==paramValue){//物料添加修改信息
		//alert("1");
		$('#projectDiv').css("display","none"); 
		$('#optItemDiv').css("display","block");
	}
	loadpositions();																					
});

function loadpositions(){
	$('#navigation').html('<img src="../images/icon_load.gif"/>');
	var html='';
	var url = ctx+"/items/listToTreeNew.htm";
		$.webAjax( {
			type : "post",
			url : url,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0')
				{
					$('#navigation').html(data.tree);
					inittreeview();
				}else{
					alert(data.resultInfo[1]);
				}				
			}
		});
}
//设置treeview的一些属性
function inittreeview()
{
	$("#navigation").treeview({
		animated: "fast",
		collapsed: true,
		unique: true,
		control: "#treecontrol",
		persist: "cookie",
		cookieId: "treeview-pd"
	});
}



//删除规则详情数据库中已经存在的行
function delDbRuleDetail(detailid,number){
	if(!confirm("确定删除此项？")){
		return ;
	}
	var url = ctx+"/itemRuleDetail/item-rule-detail!deleteAlone.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleDetailQuery.detailid='+detailid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				$("#trdetail"+number).remove();
				if(0<ruleDetailNumber){//数据中二级规则页面显示的减一
					  ruleDetailNumber--;
			    }
				searchrule($.trim($("#ruleDetailitemid").val()));
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}

//（创建规则详情）点击规则页面的详情按钮事件
function showRuleDetail(itemruleid,itemid){
	//先根据itemid找到root节点（父节点为0的节点）
	var url1 = ctx+"/items/items!findRoot.htm";
	$.webAjax( {
		type : "post",
		url : url1,
		data:'itemQuery.itemid='+itemid,
		success : function(data) {
			data = $.parseJSON(data);
			var item = data.model;
			if(data.resultInfo[0]=='0'){
				if(item!=null&&item.itemid==itemid){
					//没有复选框（不能选择不可显示）目前做成不可删除
					loadRuleDetailRoot(itemruleid,itemid);
				}else if(item!=null&&item.itemid!=itemid){
					//有复选框，并且将父节点的id和本节点的id传到后台
					loadRuleDetailChlid(itemruleid,item.itemid,itemid);
				}
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
}
//父级节点加载规则详细
function loadRuleDetailRoot(itemruleid,itemid){
	ruleDetailNumber=0;
	$.openDiv('ruleDetailDiv');
	$("#ruleDetailitemid").val(itemid);
	$("#DetailitemRuleid").val(itemruleid);
	$("#delitemid").val("");
	var html='';			
	var url = ctx+"/itemRuleDetail/item-rule-detail!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleDetailQuery.itemruleid='+itemruleid+'&itemRuleDetailQuery.sortColumns=seq',
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				html+='<tr id="headtr"><th>名称</th><th>代码</th><th>操作</th></tr>';
				$.each(data.itemRuleDetailList,function(i,o){
				    ruleDetailNumber++;//显示某个规则的二级规则
				    //带删除操作
					//html+='<tr id="trdetail'+ruleDetailNumber+'" ><td><img src="/images/delete_small.gif"  onclick="delDbRuleDetail('+o.detailid+','+ruleDetailNumber+')" />';
				    html+='<tr id="trdetail'+ruleDetailNumber+'" ><td>';
				    html+='<input type="text" name="fnamelist" value="'+o.fname+'" class="inputstyle" /><input name="detailidlist" type="hidden" value="'+o.detailid+'"/></td>';
					html+='<td><input type="text" name="fcodelist" value="'+o.fcode+'" class="inputstyle"/></td>';
					html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetail'+ruleDetailNumber+'\')" class="btnall"/></td>';
					html+='</tr>';
					
				});
				$("#ruleDetailTable").html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}
function addRuleDetailNew(trid){
	var ths = $("#headtr>th");
    var itemruleid =$('#DetailitemRuleid').val()
    var mark = $.trim($('#mark'+itemruleid).val());
	var html='';
	newruleDetailNumber++;
	if(ths.length==3){
		html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td><img src="../images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" />';
	}else if(ths.length==4){
		html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td></td><td><img src="../images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" /><input name="delitemidslist" type="hidden" value=""/>';
	}
	html+='<input type="text" name="fnamelist" class="inputstyle" style="width:70%"/><input name="detailidlist" type="hidden"/></td>';
	html+='<td><input type="text" name="fcodelist"  value="'+mark+'"    class="inputstyle"/></td>';
	html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetailnew'+ruleDetailNumber+'\')" class="btnall"/></td></tr>';
	
	$("#"+trid).after(html);
}

//子集节点加载规则详细
function loadRuleDetailChlid(itemruleid,pitemid,itemid){
	//delitemid
	ruleDetailNumber=0;
	$.openDiv('ruleDetailDiv');
	$("#ruleDetailitemid").val(pitemid);
	$("#DetailitemRuleid").val(itemruleid);
	$("#delitemid").val(itemid);
	var html='';			
	var url = ctx+"/itemRuleDetail/item-rule-detail!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleDetailQuery.itemruleid='+itemruleid+'&itemRuleDetailQuery.sortColumns=seq',
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				//html+='<tr><th style="text-align:center;"><input type="checkbox" id="allcheckbox" name="allcheckbox" onclick="$.antiSelectAllCheckboxes(\'ruleDetailForm\', \'checkedpro\')"/>不显示</th><th>名称</th><th>代码</th></tr>';
				var num=0;
				$.each(data.itemRuleDetailList,function(i,o){
				    ruleDetailNumber++;//显示某个规则的二级规则
				    //带删除操作
					//html+='<tr id="trdetail'+ruleDetailNumber+'" ><td><img src="/images/delete_small.gif"  onclick="delDbRuleDetail('+o.detailid+','+ruleDetailNumber+')" />';
				    html+='<tr id="trdetail'+ruleDetailNumber+'" >';
				    
				    if(o.delitemids!=null&&$.trim(o.delitemids)!=""&&$.trim(o.delitemids).indexOf(itemid)>-1){
				    	num++;
				    	html+='<td align="center"><input type="checkbox" name="checkedpro" value="' + o.detailid + '" checked="checked" onchange="selectCheckBox1(\'allcheckbox\', \'checkedpro\')"/></td>';
				    }else{
				    	html+='<td align="center"><input type="checkbox" name="checkedpro" value="' + o.detailid + '" onchange="selectCheckBox1(\'allcheckbox\', \'checkedpro\')"/></td>';
				    }
				    
				    html+='<td><input type="text" name="fnamelist" value="'+o.fname+'" class="inputstyle" readonly="readonly" />';
				    if(o.delitemids!=null&&$.trim(o.delitemids)!=""){
				    	html+='<input name="delitemidslist" type="hidden" value="'+o.delitemids+'"/>';
				    }else{
				    	html+='<input name="delitemidslist" type="hidden" value=""/>';
				    }
				    html+='<input name="detailidlist" type="hidden" value="'+o.detailid+'"/></td>';
					html+='<td><input type="text" name="fcodelist" value="'+o.fcode+'" class="inputstyle" readonly="readonly"/></td>';
					html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetail'+ruleDetailNumber+'\');" class="btnall"/></td></tr>';
				});
				if(num == data.itemRuleDetailList.length){
					html='<tr id="headtr"><th style="text-align:center;"><input type="checkbox" id="allcheckbox" name="allcheckbox" value="全选" checked="checked" onchange="selectCheckBox(\'allcheckbox\', \'checkedpro\')"/>不显示</th><th>名称</th><th>代码</th><th>操作</th></tr>'+html;
				}else{
					html='<tr id="headtr"><th style="text-align:center;"><input type="checkbox" id="allcheckbox" name="allcheckbox" value="全选" onchange="selectCheckBox(\'allcheckbox\', \'checkedpro\')"/>不显示</th><th>名称</th><th>代码</th><th>操作</th></tr>'+html;
				}
				$("#ruleDetailTable").html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}
//规则详细中的全选全不选
function selectCheckBox(select1,select2){
	var checkBoxs = $("input[name='"+select2+"']");
	if($("input[name='"+select1+"']:checked").val()){
		$.each(checkBoxs,function(i,o){
			$(this).attr('checked', 'checked');
		});
	}else{
		$.each(checkBoxs,function(i,o){
			$(this).removeAttr('checked');
		});
	}
}
function selectCheckBox1(select1,select2){
	var checkBoxs = $("input[name='"+select2+"']");
	var checks = $("input[name='"+select2+"']:checked");
	if(checkBoxs.length==checks.length){
		$("input[name='"+select1+"']").attr('checked', 'checked');
	}else{
		$("input[name='"+select1+"']").removeAttr('checked');
	}
	
}

//关闭规则详细
function closeruleDetailDiv(){
	$.closeDiv('ruleDetailDiv');
	
}


//规则详细中的添加事件
function addRuleDetail(){
	var ths = $("#headtr>th");
    var itemruleid =$('#DetailitemRuleid').val()
    var mark = $.trim($('#mark'+itemruleid).val());
	var html='';
	newruleDetailNumber++;
	if(ths.length==3){
		html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td><img src="../images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" />';
	}else if(ths.length==4){
		html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td></td><td><img src="../images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" /><input name="delitemidslist" type="hidden" value=""/>';
	}
	html+='<input type="text" name="fnamelist" class="inputstyle" style="width:70%"/><input name="detailidlist" type="hidden"/></td>';
	html+='<td><input type="text" name="fcodelist"  value="'+mark+'"    class="inputstyle"/></td>';
	html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetailnew'+newruleDetailNumber+'\');" class="btnall"/></td></tr>';
	$("#ruleDetailTable").append(html);

}

//删除规则详情中的一行(未保存的)
function delRuleDetail(number){
	$("#trdetailnew"+number).remove();
	if(0<newruleDetailNumber){
		newruleDetailNumber--;
	}
}

//规则详细中的保存事件
function saveRuleDetail(){
    var fnamelist=$("input[name='fnamelist']");
	var fcodelist=$("input[name='fcodelist']");
	var ispass=0;
	$.each(fnamelist,function(i,o){
		if(!$(o).val()){
			alert("名称不能为空!");ispass=1;return false;
		}
	});
	if(ispass==1){
	return ;
	}
	/*$.each(fcodelist,function(i,o){
		if(!$(o).val()){
			alert("代码不能为空!");ispass=1;return false;
		}
		
	});
	if(ispass==1){
	   return ;
	}*/
	if(0==newruleDetailNumber&&0==ruleDetailNumber){//说明当前没有数据就保存了
	   alert("还没有数据,请添加后再操作!");
	   ispass=1;
	   return false;
	}
	if(ispass==1){
	   return ;
	}
    var newruleDetailNumberParam=newruleDetailNumber;
    var ruleDetailNumberParam=ruleDetailNumber;
    $("#newruleDetailNumber").val(newruleDetailNumberParam);
	$("#ruleDetailNumber").val(ruleDetailNumberParam);
	
	var delIds ="";
	var dels = $('[name="checkedpro"]:checked');
	$.each(dels, function(i, o){	
		if(i==(dels.length-1)){
			delIds+= $(o).val();
		}else{
			delIds+= $(o).val()+",";
		}
		 
	});
	var formParam = $('#ruleDetailForm').serialize();
	var url = ctx+"/itemRuleDetail/item-rule-detail!saveAll.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam+'&delIds='+delIds,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				alert(data.resultInfo[1]);
				newruleDetailNumber=0;
				$.closeDiv('ruleDetailDiv');
				loadRight($("#ruleDetailitemid").val(),$("#delitemid").val());
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}


var id = '';
//显示右侧部分事件
function searchrule(parentid,itemid,code,itemname){
	//如果二级规则框显示
	$.closeDiv('ruleDetailDiv');
	id = itemid;
	//根据传的itemid判断是否是根节点
	var url1 = ctx+"/items/items!findRoot.htm";
	$.webAjax( {
		type : "post",
		url : url1,
		data:'itemQuery.itemid='+itemid,
		success : function(data) {
			data = $.parseJSON(data);
			var item = data.model;
			if(data.resultInfo[0]=='0'){
				if(item!=null&&item.itemid!=null){
					if(item.itemid==itemid){
						//如果为父级节点
						$("#deatilleft").attr("style","float: left;height: 100%;width: 15%;overflow: auto;");
						$("#deatilcenter").attr("style","display: none;");
						$("#deatilright").attr("style","display: none;");
						var html1="";
						$("#leftdetailall").html(html1);
						$("#deatilcenterall").html(html1);
						$("#detailAll").html(html1);
						//加载子节点
						getFristChild(item.itemid);
					}else if(item.itemid!=itemid){
						//当前节点不是父节点
						var html='';
						var url = ctx+"/items/items!listToQuery.htm";
						$.webAjax( {
							type : "post",
							url : url,
							data:'itemQuery.parentid='+itemid+'&itemQuery.deleted=0&itemQuery.sortColumns=itemcode',
							success : function(data) {
								data = $.parseJSON(data);
								if(data.resultInfo[0]=='0'){
									var bitemList = data.itemList;
									if(bitemList!=null&&bitemList.length>0){
										//如果当前子节点下还有子节点
										//加载三级子节点
										$("#deatilleft").attr("style","display:none;");
										$("#deatilcenter").attr("style","float: left;height: 100%;width: 15%;overflow: auto;");
										$("#deatilright").attr("style","float: left;height: 100%;width: 85%;overflow: auto;");
										var html1="";
										$("#leftdetailall").html(html1);
										$("#deatilcenterall").html(html1);
										$("#detailAll").html(html1);
										//显示三级节点
										getChild(bitemList,item.itemid);
									}else{
										//如果当前子节点下没有子节点
										//去掉左侧和中间div只显示右侧Div
										$("#deatilleft").attr("style","display:none;");
										$("#deatilcenter").attr("style","display:none;");
										$("#deatilright").attr("style","float: left;height: 100%;width: 100%;overflow: auto;");
										var html1="";
										$("#leftdetailall").html(html1);
										$("#deatilcenterall").html(html1);
										$("#detailAll").html(html1);
										loadRight(item.itemid,itemid);
									}
								}
							}
						});
					}
					
				}
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
}
var itemruleids;
//加载右侧规则内容（父级节点，当前节点）
function loadRight(fitemid,itemid){
	bitemlist=null;
	var html='';
	var url = ctx+"/itemRule/item-rule!listToitemDetail.htm";
	$.webAjax( {
		type : "post",
		url : url,
		
		data:'itemRuleQuery.itemid='+fitemid+'&itemRuleDetailId='+itemid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				itemruleids = data.itemRuleIds;
				var maxlemgth=0;
				html+='<tr>';
				$.each(data.model.itemRulelist,function(i,o){//遍历一级规则列表
					html+='<th width="180px;"   ><input name="itemdi" id="itemdi'+o.itemruleid+'" ref="'+o.rulename+'" type="hidden" value="'+o.itemruleid+'"/><input type="hidden" name="" id="th'+o.itemruleid+'" value="'+o.rulename+'"/>';
					html+=o.rulename;
					html+='<input type="hidden" value="'+o.sign+'" id="sign'+o.itemruleid+'" />';
					html+='<img align="right"  style="margin-top:5px;margin-right:1px"   src="../images/add_small.gif" onclick="javascript:showRuleDetail('+o.itemruleid+','+itemid+');"/></th>';
					if(o.itemRuleDetaillist.length>maxlemgth){//if 某个规则的子二级规则大于临时变量 ,即最后maxlemgth为某个规则中
						//存在最多子规则的数目
						maxlemgth=o.itemRuleDetaillist.length;
					}
				});						
				html+='</tr>';
				//------表头END----
				html+='<tr>';
				$.each(data.model.itemRulelist,function(i,o){//遍历一级规则
					html+='<td>';
					html+='<div  class="scroll-pane" >';
					html+='<table    border="1"  frame="void"      width="100%"  class="detailAllTable2" >';
					for(var ll=0;ll< o.itemRuleDetaillist.length;ll++){
				     	if(o.itemRuleDetaillist[ll]==null){//如果一级规则的子规则为null
								html+='<tr class="c3"><td><div class="tdleftDiv">'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div></td></tr>';
						}else{//如果一级规则的子规则不为null
							if(o.itemRuleDetaillist.length==1){
								html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio" checked="checked"  onchange="showABC('+o.itemRuleDetaillist[ll].itemruleid+','+itemid+','+paramValue+');"  name="radio'+o.itemRuleDetaillist[ll].itemruleid+'" value="'+o.itemRuleDetaillist[ll].fcode+';'+o.itemRuleDetaillist[ll].fname+'"  />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div></td></tr>';
							}else{
								if($.trim(o.itemRuleDetaillist[ll].fcode)==""){
									html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio" checked="checked"  onchange="showABC('+o.itemRuleDetaillist[ll].itemruleid+','+itemid+','+paramValue+');"  name="radio'+o.itemRuleDetaillist[ll].itemruleid+'" value="'+o.itemRuleDetaillist[ll].fcode+';'+o.itemRuleDetaillist[ll].fname+'"  />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div></td></tr>';
								}else{
									html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio"  onchange="showABC('+o.itemRuleDetaillist[ll].itemruleid+','+itemid+','+paramValue+');"  name="radio'+o.itemRuleDetaillist[ll].itemruleid+'" value="'+o.itemRuleDetaillist[ll].fcode+';'+o.itemRuleDetaillist[ll].fname+'" />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div></td></tr>';
								}
								
							}
//							if(i==0){//如果一级规则的子规则不为null且 如果是第一个一级规则
//							    html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio"  onchange="showABC('+o.itemRuleDetaillist[ll].itemruleid+','+itemid+');"  name="radio'+o.itemRuleDetaillist[ll].itemruleid+'" value="'+o.itemRuleDetaillist[ll].fcode+';'+o.itemRuleDetaillist[ll].fname+'"  />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div></td></tr>';
//							}else{
//								html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio"  onchange="showABC('+o.itemRuleDetaillist[ll].itemruleid+','+itemid+');" disabled="disabled" name="radio'+o.itemRuleDetaillist[ll].itemruleid+'" value="'+o.itemRuleDetaillist[ll].fcode+';'+o.itemRuleDetaillist[ll].fname+'" />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div></td></tr>';
//							}
						}
					}
					for(var temp=o.itemRuleDetaillist.length;temp< 16;temp++){
						html+='<tr class="c3"><td> &nbsp; </td></tr>';
					}
					html+='</table >';
					html+='</div/>';
					html+='</td>';
				});
				html+='</tr>';
				$("#detailAll").html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
//拼接二级子节点
function getFristChild(itemid){
	var html='';
	var url = ctx+"/items/items!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemQuery.parentid='+itemid+'&itemQuery.deleted=0&itemQuery.sortColumns=itemcode',
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var bitemList = data.itemList;
				if(bitemList!=null&&bitemList.length>0){
					html+='<tr><th width="100%px">二级节点</th></tr>';
					//------表头END----
					
					html+='<tr>';
					html+='<td>';
					html+='<div  class="scroll-pane" >';
					html+='<table    border="1"  frame="void"      width="100%"  class="detailAllTable2" >';
					$.each(bitemList,function(i,o){//遍历节点
						html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio"  onchange="getSecondChid('+itemid+','+o.itemid+');"  name="radioChild1" value="'+o.itemid+'"  />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+o.itemcode+'('+o.itemname+')</div></td></tr>';
					});
					html+='</table >';
					html+='</div/>';
					html+='</td>';
					html+='</tr>';
					$("#deatilleft").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
					$("#deatilcenter").attr("style","display:none;");
					$("#deatilright").attr("style","float: left;height: 100%;width: 85%;overflow: auto;");
					$("#leftdetailall").html(html);
					
				}
				
			}
		}
	});
}
//根据选择的节点显示三级节点或是右侧规则的内容（有二级节点时）（父级节点，当前节点）
function getSecondChid(pitemid,fitemid){
	var html='';
	var url = ctx+"/items/items!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemQuery.parentid='+fitemid+'&itemQuery.deleted=0&itemQuery.sortColumns=itemcode',
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var bitemList = data.itemList;
				if(bitemList!=null&&bitemList.length>0){
					html+='<tr><th width="100%px;">三级节点</th></tr>';
					//------表头END----
					
					html+='<tr>';
					html+='<td>';
					html+='<div  class="scroll-pane" >';
					html+='<table    border="1"  frame="void"      width="100%"  class="detailAllTable2" >';
					$.each(bitemList,function(i,o){//遍历节点
						html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio"  onchange="showRightTable('+pitemid+','+o.itemid+');"   name="radioChild2" value="'+o.itemid+'"  />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+o.itemcode+'('+o.itemname+')</div></td></tr>';
					});
					html+='</table >';
					html+='</div/>';
					html+='</td>';
					html+='</tr>';
					$("#deatilcenter").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
					$("#deatilleft").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
					$("#deatilright").attr("style","display:none;");
					$("#deatilcenterall").html(html);
				}else{
					$("#deatilleft").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
					$("#deatilcenter").attr("style","display:none;");
					$("#deatilright").attr("style","float: left;height: 100%;width: 85%;overflow: auto;");
					//父级节点，当前节点
					loadRight(pitemid,fitemid);
				}
			}
		}
	});
}
//没有二级节点只有三级节点(子节点集合，父级节点)
function getChild(bitemList,fitemid){
	var html="";
	html+='<tr><th width="100%px">三级级节点</th></tr>';
	html+='<tr>';
	html+='<td>';
	html+='<div  class="scroll-pane" >';
	html+='<table    border="1"  frame="void"      width="100%"  class="detailAllTable2" >';
	$.each(bitemList,function(i,o){//遍历节点
		html+='<tr class="c3"><td><div class="tdleftDiv">&nbsp;<input type="radio"  onchange="showRight('+fitemid+','+o.itemid+');"   name="radioChild2" value="'+o.itemid+'"  />&nbsp;</div><div class="tdrightDiv" >&nbsp;&nbsp;'+o.itemcode+'('+o.itemname+')</div></td></tr>';
	});
	html+='</table >';
	html+='</div/>';
	html+='</td>';
	html+='</tr>';
	$("#deatilcenterall").html(html);
}
//只显示三级节点和右侧规则(父级节点，当前节点)
function showRight(pitemid,fitemid){
	loadRight(pitemid,fitemid);
	$("#deatilleft").attr("style","display:none;");
	$("#deatilcenter").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
	$("#deatilright").attr("style","float: left;height: 100%;width: 85%;overflow: auto;");
}
//显示二级和三级节点和右侧规则
function showRightTable(pitemid,fitemid){
	loadRight(pitemid,fitemid);
	$("#deatilleft").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
	$("#deatilcenter").attr("style","float:left;height: 100%;overflow: auto;width:15%;");
	$("#deatilright").attr("style","float: left;height: 100%;width: 70%;overflow: auto;");
}

var bitemlist=null;
//显示物料表单编码选择提示框 showABC,会根据选择的在文本框中赋值
function showABC(itemruleid,itemid,type){
	//alert("---"+type);
	var DName = "";
	var PName = "";
	var dCode = "";
	var PCode = "";	
	//根据itemid得到上级所有节点的集合
	if(bitemlist==null||bitemlist.length<=1){
		var html='';
		var url = ctx+"/items/items!findParents.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:'itemQuery.itemid='+itemid,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					bitemlist = data.itemList;
					if(bitemlist!=null&&bitemlist.length>1){
						DName = bitemlist[0].itemname;
						dCode = bitemlist[0].itemcode;
						for(var m=1;m<bitemlist.length;m++){
							if(m==bitemlist.length-1){
								PName += bitemlist[m].itemname;
								PCode += bitemlist[m].itemcode;
							}else{
								PName += bitemlist[m].itemname+":";
								PCode += bitemlist[m].itemcode+".";
							}
						}
						
					}
					if("0"==type){
						getShowValues(DName,PName,dCode,PCode,itemruleid);
					}
					if("1"==type){
						getShowValuesForOptItem(DName,PName,dCode,PCode,itemruleid);
					}
					
				}
			}
		});
	}else{
		if(bitemlist!=null&&bitemlist.length>1){
			DName = bitemlist[0].itemname;
			dCode = bitemlist[0].itemcode;
			for(var m=1;m<bitemlist.length;m++){
				if(m==bitemlist.length-1){
					PName += bitemlist[m].itemname;
					PCode += bitemlist[m].itemcode;
				}else{
					PName += bitemlist[m].itemname+":";
					PCode += bitemlist[m].itemcode+".";
				}
			}
			
		}
		
		if("0"==type){
			getShowValues(DName,PName,dCode,PCode,itemruleid);
		}
		if("1"==type){
			getShowValuesForOptItem(DName,PName,dCode,PCode,itemruleid);
		}
	}
}
//物料添加,修改,复制
//DName二级节点名称,PName一级节点名称,dCode二级节点编号,PCode一级节点编号,itemruleid二级节点ID
function getShowValuesForOptItem(DName,PName,dCode,PCode,itemruleid){
	var ss = '';
	ss = PName + ":" + DName + ";";
	var itemmodel = '';
	var desc='';//描述
	if(DName!=null&&DName!=""){
		desc+=PName+":"+DName+":";
	}
	
	var s = '';//物料代码
	if($.trim(PCode)!=""&&$.trim(dCode)!=""){
		s = $.trim(PCode)  + "." + $.trim(dCode);
	}else if($.trim(PCode)==""&&$.trim(dCode)!=""){
		s =  $.trim(dCode);
	}
	
	
	
	var list = $('input[name="itemdi"]');
	var nextt='';	
	for(var a = 0; a<list.length;a++){
		if(itemruleid==$(list[a]).val()&&a<(list.length-1)){
			nextt=$(list[a+1]).val();
		}
		var c="radio"+$(list[a]).val();
		if (typeof($('input[name="'+c+'"]:checked').val()) == "undefined") { 
			break; 
		}
		var val=$('input[name="'+c+'"]:checked').val().toString().split(";")[1];
		if(a==(list.length-1)){
			if($.trim(val)!=""&&$.trim(val)!="无"){
				desc+=$(list[a]).attr("ref")+":"+$.trim(val);
			}
		}else{
			if($.trim(val)!=""&&$.trim(val)!="无"){
				desc+=$(list[a]).attr("ref")+":"+$.trim(val)+";";
			}
		}
		//将压力等级、生产商、原产地放到指定的输入框中
		var ruleName = $(list[a]).attr("ref");
		var name = $('input[name="radio'+$(list[a]).val()+'"]:checked').val().toString().split(";")[1];
		//var code = $('input[name="radio'+$(list[a]).val()+'"]:checked').val().toString().split(";")[0];
		if(ruleName!=null&&ruleName=="压力等级"){
			//$("#newflevel").val(name);
		}else if(ruleName!=null&&ruleName=="生产商"){
			//$("#newfmaker").val(name);
		}else if(ruleName!=null&&ruleName=="原产地"){
			//$("#newsrcarea").val(name);
		}	
//		var kfc=0;
//		$('input[name="radio'+$(list[a+1]).val()+'"]').each(function(i,o){
//			if($(o).attr("disabled")){
//				kfc=1;
//				return false;
//			}
//		});
//		if(kfc==1){
//				break;
//		}
		
	}
	var listto = $('input[name="radio'+nextt+'"]');
	for(var k=0;k<listto.length;k++){
		$(listto[k]).removeAttr("disabled");
	}
	if(PName!=""&&PName.indexOf(":")!=-1){
		$("#newitemnameForOptItem").val(PName.split(":")[0]);//物料名称
	}else if(PName!=""&&PName.indexOf(":")==-1){
		$("#newitemnameForOptItem").val(PName);//物料名称
	}
	
	//$("#newfdescript").val(desc);
	//只有规则选择完了才设置文本框中的值
	if(selectitemcodeisfull()){
		//选择完成时拼物料代码
		if(itemruleids!=null&&itemruleids.length>0){
			for(var b = 0; b<itemruleids.length;b++){
				var name = $("#itemdi"+itemruleids[b]).attr("ref");
				if(name!=null&&name!="原产地"){
					var c="radio"+itemruleids[b]; 
					var val=$('input[name="'+c+'"]:checked').val().toString().split(";")[0];
					var sign = $("#sign"+itemruleids[b]).val();
					if(val){
						/*if($.trim(val)==""){
							s+=$.trim(val);
						}else{
							s=s+sign+$.trim(val);
						}*/
						if(b==0){
							s+="."+$.trim(val);
						}else{
							if($.trim(val)==""){
								s+=$.trim(val);
							}else{
								s=s+sign+$.trim(val);
							}
						}
					}
				}
				var vall=$('input[name="radio'+itemruleids[b]+'"]:checked').val().split(";")[1];
				if(b==itemruleids.length-1){
				    if(name!=null&&name!="原产地"&&'无'!=vall){
				    	itemmodel+=vall;
					}else{
						itemmodel=itemmodel.substring(0,itemmodel.length-1);
					}
					$('#newitemmodeForOptItem').attr("value",itemmodel);//物料规格型号
				}else{
				    if(name!=null&&name!="原产地"&&'无'!=vall){
				    itemmodel+=vall+"_";
				    }
					$('#newitemmodeForOptItem').attr("value",'');//物料规格型号
				}
			}
		}
		
		$('#newitemcodeForOptItem').attr("value",s);//物料编码
		//searchItemCodeIsExit(s);
		//物料添加,修改,复制判断物料是否存在
		searchItemCodeIsExitFromBaseItem(s);
	}
}
function giveValueForOptItem(){
    /**if(itemcodeisfull()){
       searchNoItemCode();
    }else{
       return false;
    }
    if( ! flagResult ){//说明物料代码已经存在
    
       return false;//不能提交
    }**/
    
var newitemcode = $.trim($('#newitemcodeForOptItem').val());
if(newitemcode == '') {
alert('物料编码不能为空！');
$('#newitemcodeForOptItem').focus();
return false;
} 
var newitemname = $.trim($('#newitemnameForOptItem').val());
if(newitemname == '') {
if(newitemcode != ''){
alert('物料名称不能为空！');
$('#newitemnameForOptItem').focus();
}
return false;
} 
var newitemmode = $.trim($('#newitemmodeForOptItem').val());
if(newitemmode == '') {
alert('物料规格型号不能为空！');
$('#newitemmodeForOptItem').focus();
return false;
} 
var newitemPcode = $.trim($('#newitemPcodeForOptItem').val());
if(newitemPcode == '') {
alert('物料父编码不能为空！');
$('#newitemPcodeForOptItem').focus();
return false;
} 

	var tt = 0;
	var list = $('input[name="itemdi"]');//点击确定
	for(var a = 0; a<list.length;a++){
			var c="radio"+$(list[a]).val();
			var ck =$('input[name="'+c+'"]:checked');
			tt+=ck.length;
	
		}
	if(tt<list.length){
		alert("物料编码不符合规范，请输入相应数据!");
		return false;
	}else{
		var lst = new Array();
		lst.push($('#newitemcodeForOptItem').val());//物料代码
		lst.push($('#newitemnameForOptItem').val());//物料名称
		lst.push($('#newitemPcodeForOptItem').val());//物料父级代码
		lst.push($('#newitemmodeForOptItem').val());//物料型号
		
		closeABC();
		opener.showValue(lst);
		
	}
}
function giveOrderValue(){
	
	var newitemcode = $.trim($('#newitemcodeForOptItem').val());
	if(newitemcode == '') {
		alert('物料编码不能为空！');
		$('#newitemcodeForOptItem').focus();
		return false;
	} 
	var newitemname = $.trim($('#newitemnameForOptItem').val());
	if(newitemname == '') {
		if(newitemcode != ''&&flagResult){
			alert('物料名称不能为空！');
			$('#newitemnameForOptItem').focus();
		}
		return false;
	} 
	var newitemmode = $.trim($('#newitemmodeForOptItem').val());
	if(newitemmode == '') {
		alert('物料规格型号不能为空！');
		$('#newitemmodeForOptItem').focus();
		return false;
	} 

	var tt = 0;
	var list = $('input[name="itemdi"]');//点击确定
	for(var a = 0; a<list.length;a++){
		var c="radio"+$(list[a]).val();
		var ck =$('input[name="'+c+'"]:checked');
		tt+=ck.length;

	}
	if(tt<list.length){
		alert("物料编码不符合规范，请输入相应数据!");
		return false;
	}else{
		var lst = new Array();
		lst.push($('#newitemcodeForOptItem').val());//物料代码

	//	closeABC();
		opener.setValue(lst);
	}
}
function searchItemCodeIsExitFromBaseItem(itemcode){
	var code = itemcode;
	if(''==code){
		 alert("请先选择物料代码!");
		 $("#newitemcodeForOptItem").attr("value","");//物料代码
		 $("#newitemPcodeForOptItem").attr("value","");//物料父级代码
		 $('#newitemcodeForOptItem').focus();//物料代码获取焦点
		 //flagResult=false;
		 return false;
	}
	
	var data = 'baseItemQuery.itemcode='+code;//
	var url =ctx+'/baseItem/base-item!listItemEntity.htm';//查询现有
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var entity = data.entity;
									 
									if(null==entity){
										//flagResult=true;
										 
										if(null!=code){
											 var itemPcode=code.substring(0, code.lastIndexOf('.'));
											 $('#newitemPcodeForOptItem').val(itemPcode) ;//物料父级代码
										}
									}else{
									    alert("该物料编号已经存在!");
									    $("#newitemcodeForOptItem").attr("value","");
									    $("#newitemPcodeForOptItem").attr("value","");
									    //同时清除掉物料名称,规格型号
									    $("#newitemnameForOptItem").attr("value","");
									    $("#newitemmodeForOptItem").attr("value","");
									    
									    $('#newitemcodeForOptItem').focus();
									    //flagResult=false;
									    return false;
									}
					}
		});	
	
}

function getShowValues(DName,PName,dCode,PCode,itemruleid){
	var ss = '';
	ss = PName + ":" + DName + ";";
	var itemmodel = '';
	var desc='';//描述
	if(DName!=null&&DName!=""){
		desc+=PName+":"+DName+":";
	}
	
	var s = '';//物料代码
	if($.trim(PCode)!=""&&$.trim(dCode)!=""){
		s = $.trim(PCode)  + "." + $.trim(dCode);
	}else if($.trim(PCode)==""&&$.trim(dCode)!=""){
		s =  $.trim(dCode);
	}
	
	
	
	var list = $('input[name="itemdi"]');
	var nextt='';	
	for(var a = 0; a<list.length;a++){
		if(itemruleid==$(list[a]).val()&&a<(list.length-1)){
			nextt=$(list[a+1]).val();
		}
		var c="radio"+$(list[a]).val();
		if (typeof($('input[name="'+c+'"]:checked').val()) == "undefined") { 
			break; 
		}
		var val=$('input[name="'+c+'"]:checked').val().toString().split(";")[1];
		if(a==(list.length-1)){
			if($.trim(val)!=""&&$.trim(val)!="无"){
				desc+=$(list[a]).attr("ref")+":"+$.trim(val);
			}
		}else{
			if($.trim(val)!=""&&$.trim(val)!="无"){
				desc+=$(list[a]).attr("ref")+":"+$.trim(val)+";";
			}
		}
		//将压力等级、生产商、原产地放到指定的输入框中
		var ruleName = $(list[a]).attr("ref");
		var name = $('input[name="radio'+$(list[a]).val()+'"]:checked').val().toString().split(";")[1];
		//var code = $('input[name="radio'+$(list[a]).val()+'"]:checked').val().toString().split(";")[0];
		if(ruleName!=null&&ruleName=="压力等级"){
			$("#newflevel").val(name);
		}else if(ruleName!=null&&ruleName=="生产商"){
			$("#newfmaker").val(name);
		}else if(ruleName!=null&&ruleName=="原产地"){
			$("#newsrcarea").val(name);
		}	
//		var kfc=0;
//		$('input[name="radio'+$(list[a+1]).val()+'"]').each(function(i,o){
//			if($(o).attr("disabled")){
//				kfc=1;
//				return false;
//			}
//		});
//		if(kfc==1){
//				break;
//		}
		
	}
	var listto = $('input[name="radio'+nextt+'"]');
	for(var k=0;k<listto.length;k++){
		$(listto[k]).removeAttr("disabled");
	}
	if(PName!=""&&PName.indexOf(":")!=-1){
		$("#newitemname").val(PName.split(":")[0]);
	}else if(PName!=""&&PName.indexOf(":")==-1){
		$("#newitemname").val(PName);
	}
	
	$("#newfdescript").val(desc);
	//只有规则选择完了才设置文本框中的值
	if(selectitemcodeisfull()){
		//选择完成时拼物料代码
		if(itemruleids!=null&&itemruleids.length>0){
			for(var b = 0; b<itemruleids.length;b++){
				var name = $("#itemdi"+itemruleids[b]).attr("ref");
				if(name!=null&&name!="原产地"){
					var c="radio"+itemruleids[b]; 
					var val=$('input[name="'+c+'"]:checked').val().toString().split(";")[0];
					var sign = $("#sign"+itemruleids[b]).val();
					if(val){
						/*if($.trim(val)==""){
							s+=$.trim(val);
						}else{
							s=s+sign+$.trim(val);
						}*/
						if(b==0){
							s+="."+$.trim(val);
						}else{
							if($.trim(val)==""){
								s+=$.trim(val);
							}else{
								s=s+sign+$.trim(val);
							}
						}
						
					}
				}
				var vall=$('input[name="radio'+itemruleids[b]+'"]:checked').val().split(";")[1];
				if(b==itemruleids.length-1){
				    if(name!=null&&name!="原产地"&&'无'!=vall){
				    	itemmodel+=vall;
					}else{
						itemmodel=itemmodel.substring(0,itemmodel.length-1);
					}
					$('#newitemmode').attr("value",itemmodel);
				}else{
				    if(name!=null&&name!="原产地"&&'无'!=vall){
				    itemmodel+=vall+"_";
				    }
					$('#newitemmode').attr("value",'');
				}
			}
		}
		
		$('#newitemcode').attr("value",s);
		searchItemCodeIsExit(s);
	}
}
//判断选择物料规则是否选全了
function selectitemcodeisfull(){

	var tt = 0;
	var list = $('input[name="itemdi"]');
	for(var a = 0; a<list.length;a++){
			var c="radio"+$(list[a]).val();
			var ck =$('input[name="'+c+'"]:checked');
			tt+=ck.length;
	
		}
	if(tt<list.length){
		return false;
	}else{
		return true;
	}
}


//关闭当前窗口
function closeABC(){
 	window.close();
}
//点击下一条
function showProcureABCD(){
	/*//验证是否所有项的radio按钮都选择了
	var tt = 0;
	var list = $('input[name="itemdi"]');
	for(var a = 0; a<list.length;a++){
			var c="radio"+$(list[a]).val();
			var ck =$('input[name="'+c+'"]:checked');
			tt+=ck.length;
	
		}
	if(tt<list.length){
		alert("物料编码不符合规范，请输入相应数据!");
		return false;
	}else{
		opener.showA();
		removProcureShu();//清空输入框
	}*/
	opener.showA();
	removProcureShu();//清空输入框
}

function giveValue(){
	var newitemcode = $.trim($('#newitemcode').val());
	if(newitemcode == '') {
		alert('物料编码不能为空！');
		$('#newitemcode').focus();
		return false;
	} 
	var newitemname = $.trim($('#newitemname').val());
	if(newitemname == '') {
		if(newitemcode != ''&&flagResult){
			alert('物料名称不能为空！');
			$('#newitemname').focus();
		}
		return false;
	} 
	/*var newitemmode = $.trim($('#newitemmode').val());
	if(newitemmode == '') {
		alert('物料规格型号不能为空！');
		$('#newitemmode').focus();
		return false;
	} */
	var tt = 0;
	var list = $('input[name="itemdi"]');//点击确定
	for(var a = 0; a<list.length;a++){
			var c="radio"+$(list[a]).val();
			var ck =$('input[name="'+c+'"]:checked');
			tt+=ck.length;
	
		}
	if(tt<list.length){
		alert("物料编码不符合规范，请输入相应数据!");
		return false;
	}else{
		var lst = new Array();
		lst.push($("#newitemcode").val());
		lst.push($("#newitemname").val());
		lst.push($("#newitemmode").val());
		lst.push($("#newflevel").val());
		lst.push($("#newfmaker").val());
		lst.push($("#newsrcarea").val());
		lst.push($("#newlistamount").val());
		lst.push($("#newcostamount").val());
		lst.push($("#newfdescript").val());	
		opener.showValue(lst);
	}
}

//清空项目清单关联的物料文本信息
function removProcureShu(){
	$("#newitemcode").attr("value","");
    //名称
    $("#newitemname").attr("value","");
    //型号
    $("#newitemmode").attr("value","");
    //压力等级
    $("#newflevel").attr("value","");
    //生产商
    $("#newfmaker").attr("value","");
	//原产地	
	$("#newsrcarea").attr("value","");
	//列表价
	$("#newlistamount").attr("value","");
	//成本价
	$("#newcostamount").attr("value","");
	//性能描述
	$("#newfdescript").attr("value","");
}

//判断通过规则生成的代码是否系统中存在
function searchItemCodeIsExit(itemcode){
	var data = 'proItemQuery.itemcode='+itemcode;
   	var url =ctx+'/proItem/pro-item!listItemEntity.htm';
	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var entity = data.model;
			if(null==entity){
				if(!confirm("该物料编号不存在,是否创建此物料编码？")){
					$("#newitemcode").attr("value","");
				    $('#newitemcode').focus();
				    //名称
				    $("#newitemname").attr("value","");
				    //型号
				    $("#newitemmode").attr("value","");
				    //压力等级
	                $("#newflevel").attr("value","");
				    //生产商
				    $("#newfmaker").attr("value","");
					//原产地	
					$("#newsrcarea").attr("value","");
					//列表价
					$("#newlistamount").attr("value","");
					//成本价
					$("#newcostamount").attr("value","");
					//性能描述
					$("#newfdescript").attr("value","");
				}else{
					//弹出物料编码编辑页面，保存完成后将新增的信息返回到页面
					$('#itemcode').attr("value",itemcode);
					$('#itemname').attr("value",$("#newitemname").val()==null?"":$("#newitemname").val());
					$('#fmode').attr("value",$("#newitemmode").val()==null?"":$("#newitemmode").val());
					$('#flevel').attr("value",$("#newflevel").val()==null?"":$("#newflevel").val());
					$('#fdescript').attr("value",$("#newfdescript").val()==null?"":$("#newfdescript").val());
					$('#fmaker').attr("value",$("#newfmaker").val()==null?"":$("#newfmaker").val());
					$('#fshortname').attr("value",$("#newfmaker").val()==null?"":$("#newfmaker").val());
					$('#srcarea').attr("value",$("#newsrcarea").val()==null?"":$("#newsrcarea").val());
					addproitem();
				}
				
			}else{
				if(confirm("是否保存？")){
					$('#itemcode').attr("value","");
					$('#itemname').attr("value","");
					$('#fmode').attr("value","");
					$('#flevel').attr("value","");
					$('#fdescript').attr("value","");
					$('#fmaker').attr("value","");
					$('#fshortname').attr("value","");
					$('#srcarea').attr("value","");
					$('#buyamount').attr("value","");
					$('#avgamount').attr("value","");
					$('#rpamount').attr("value","");
					$('#costamount').attr("value","");
					$('#listamount').attr("value","");
					$('#aid').attr("value",entity.aid==null?"":entity.aid);
					if(entity.flevel==null||$.trim(entity.flevel)==""){
						if($("#newflevel").val()!=null&&$.trim($("#newflevel").val())!=""){
							$('#flevel').attr("value",$("#newflevel").val());
						}
					}
					if(entity.fmaker==null||$.trim(entity.fmaker)==""){
						if($("#newfmaker").val()!=null&&$.trim($("#newfmaker").val())!=""){
							$('#fmaker').attr("value",$("#newfmaker").val());
						}
					}
					if(entity.fshortname==null||$.trim(entity.fshortname)==""){
						if($("#newfmaker").val()!=null&&$.trim($("#newfmaker").val())!=""){
							$('#fshortname').attr("value",$("#newfmaker").val());
						}
					}
					if(entity.srcarea==null||$.trim(entity.srcarea)==""){
						if($("#newsrcarea").val()!=null&&$.trim($("#newsrcarea").val())!=""){
							$('#srcarea').attr("value",$("#newsrcarea").val());
						}
					}
					if(entity.fdescript==null||$.trim(entity.fdescript)==""){
						if($("#newfdescript").val()!=null&&$.trim($("#newfdescript").val())!=""){
							$('#fdescript').attr("value",$("#newfdescript").val());
						}
					}
					if($('#fdescript').val()==""&&$('#flevel').val()==""&&$('#fmaker').val()==""&&$('#srcarea').val()==""){
						//物料代码
						$("#newitemcode").attr("value",entity.itemcode==null?"":entity.itemcode);
					    //名称
					    $("#newitemname").attr("value",entity.itemname==null?"":entity.itemname);
					    //型号
					    $("#newitemmode").attr("value",entity.fmode==null?"":entity.fmode);
					    //压力等级
		                $("#newflevel").attr("value",entity.flevel==null?"":entity.flevel);
					    //生产商
					    $("#newfmaker").attr("value",entity.fmaker==null?"":entity.fmaker);
						//原产地	
						$("#newsrcarea").attr("value",entity.srcarea==null?"":entity.srcarea);
						//列表价
						$("#newlistamount").attr("value",entity.listamount==null?"":entity.listamount);
						//成本价
						$("#newcostamount").attr("value",entity.costamount==null?"":entity.costamount);
						//性能描述
						$("#newfdescript").attr("value",entity.fdescript==null?"":entity.fdescript);
					}else{
						//保存后更新
						var formParam = $('#inputForm').serialize();
						var url =ctx+ "/proItem/pro-item!saveToJson.htm";
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
									//物料代码
									$("#newitemcode").attr("value",entity.itemcode==null?"":entity.itemcode);
								    //名称
								    $("#newitemname").attr("value",entity.itemname==null?"":entity.itemname);
								    //型号
								    $("#newitemmode").attr("value",entity.fmode==null?"":entity.fmode);
								    //压力等级
								    if(entity.flevel!=null&&$.trim(entity.flevel)!=""){
								    	$("#newflevel").attr("value",entity.flevel);
								    }
					                
								    //生产商
								    if(entity.fmaker!=null&&$.trim(entity.fmaker)!=""){
								    	$("#newfmaker").attr("value",entity.fmaker);
								    }
								    
									//原产地	
								    if(entity.srcarea!=null&&$.trim(entity.srcarea)!=""){
								    	$("#newsrcarea").attr("value",entity.srcarea);
								    }
									
									//列表价
									$("#newlistamount").attr("value",entity.listamount==null?"":entity.listamount);
									//成本价
									$("#newcostamount").attr("value",entity.costamount==null?"":entity.costamount);
									//性能描述
									if(entity.fdescript!=null&&$.trim(entity.fdescript)!=""){
										$("#newfdescript").attr("value",entity.fdescript);
									}
									
								}else{
									//物料代码
									$("#newitemcode").attr("value",entity.itemcode==null?"":entity.itemcode);
								    //名称
								    $("#newitemname").attr("value",entity.itemname==null?"":entity.itemname);
								    //型号
								    $("#newitemmode").attr("value",entity.fmode==null?"":entity.fmode);
								    //压力等级
					                $("#newflevel").attr("value",entity.flevel==null?"":entity.flevel);
								    //生产商
								    $("#newfmaker").attr("value",entity.fmaker==null?"":entity.fmaker);
									//原产地	
									$("#newsrcarea").attr("value",entity.srcarea==null?"":entity.srcarea);
									//列表价
									$("#newlistamount").attr("value",entity.listamount==null?"":entity.listamount);
									//成本价
									$("#newcostamount").attr("value",entity.costamount==null?"":entity.costamount);
									//性能描述
									$("#newfdescript").attr("value",entity.fdescript==null?"":entity.fdescript);
								}
								
							}
						});
					}
					
					
				}else{
					//物料代码
					$("#newitemcode").attr("value",entity.itemcode==null?"":entity.itemcode);
				    //名称
				    $("#newitemname").attr("value",entity.itemname==null?"":entity.itemname);
				    //型号
				    $("#newitemmode").attr("value",entity.fmode==null?"":entity.fmode);
				    //压力等级
	                $("#newflevel").attr("value",entity.flevel==null?"":entity.flevel);
				    //生产商
				    $("#newfmaker").attr("value",entity.fmaker==null?"":entity.fmaker);
					//原产地	
					$("#newsrcarea").attr("value",entity.srcarea==null?"":entity.srcarea);
					//列表价
					$("#newlistamount").attr("value",entity.listamount==null?"":entity.listamount);
					//成本价
					$("#newcostamount").attr("value",entity.costamount==null?"":entity.costamount);
					//性能描述
					$("#newfdescript").attr("value",entity.fdescript==null?"":entity.fdescript);
				}
			}
		}
	});		
}

function changePCode(){
    var itemcodeSelect=document.getElementById("newitemcode").value;
    if(null!=itemcodeSelect){
     var itemPcode=itemcodeSelect.substring(0, itemcodeSelect.lastIndexOf('.'));
     document.getElementById("newitemPcode").value=itemPcode;
    }
}


function addproitem(){
	$('#aid').attr("value","");
	/*$('#itemname').attr("value","");
	$('#fmode').attr("value","");
	$('#flevel').attr("value","");
	$('#fdescript').attr("value","");
	$('#fmaker').attr("value","");
	$('#fshortname').attr("value","");
	$('#srcarea').attr("value","");*/
	$('#buyamount').attr("value","");
	$('#avgamount').attr("value","");
	$('#rpamount').attr("value","");
	$('#costamount').attr("value","");
	$('#listamount').attr("value","");
	$.openDiv('inputDiv');
}
//关闭弹出窗口
function closeAddDiv()
{
	$("#newitemcode").attr("value","");
    $('#newitemcode').focus();
    //名称
    $("#newitemname").attr("value","");
    //型号
    $("#newitemmode").attr("value","");
    //压力等级
    $("#newflevel").attr("value","");
    //生产商
    $("#newfmaker").attr("value","");
	//原产地	
	$("#newsrcarea").attr("value","");
	//列表价
	$("#newlistamount").attr("value","");
	//成本价
	$("#newcostamount").attr("value","");
	//性能描述
	$("#newfdescript").attr("value","");
	$.closeDiv("inputDiv");
}

function updateValue(){
	var costamount = $("#costamount").val();
	var re = /^[0-9]+.?[0-9]*$/;
	if(!re.test($.trim(costamount))){
		alert("指定成本价格式不正确，请输入正确的数字!");
		$('#costamount').focus();
		return false;
	}else{
		var listamount = parseFloat(costamount)*2.5;
		$("#listamount").attr("value",listamount);
	}
	
}
function updateListValue(){
	var rpamount = $("#rpamount").val();
	var re = /^[0-9]+.?[0-9]*$/;
	if(!re.test($.trim(rpamount))){
		alert("参考价格式不正确，请输入正确的数字!");
		$('#rpamount').focus();
		return false;
	}else{
		var costamount = $("#costamount").val();
		if(costamount==0){
			var listamount = parseFloat(rpamount)*2.5;
			$("#listamount").attr("value",listamount);
		}else{
			var sum = parseFloat(costamount)*2.5;
			$("#listamount").attr("value",sum);
		}
		
	}
	
}

function save()
{
	var formParam = $('#inputForm').serialize();
	var itemcode = $('#itemcode').val();
	var itemname = $('#itemname').val();
	var fmode = $('#fmode').val();
	var flevel = $('#flevel').val();
	var fmaker = $('#fmaker').val();
	var srcarea = $('#srcarea').val();
	var listamount = $('#listamount').val();
	var costamount = $('#costamount').val();
	var fdescript = $('#fdescript').val();
	//验证各个输入项
	if($.trim(itemcode)==""){
		alert("物料代码不能为空!");
		$('#itemcode').focus();
		return false;
	}
	
	if($.trim(itemname)==""){
		alert("物料名称不能为空!");
		$('#itemname').focus();
		return false;
	}
	
	var url =ctx+ "/proItem/pro-item!saveToJson.htm";
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
				//物料代码
				$("#newitemcode").attr("value",itemcode==null?"":itemcode);
			    //名称
			    $("#newitemname").attr("value",itemname==null?"":itemname);
			    //型号
			    $("#newitemmode").attr("value",fmode==null?"":fmode);
			    //压力等级
                $("#newflevel").attr("value",flevel==null?"":flevel);
			    //生产商
			    $("#newfmaker").attr("value",fmaker==null?"":fmaker);
				//原产地	
				$("#newsrcarea").attr("value",srcarea==null?"":srcarea);
				//列表价
				$("#newlistamount").attr("value",listamount==null?"":listamount);
				//成本价
				$("#newcostamount").attr("value",costamount==null?"":costamount);
				//性能描述
				$("#newfdescript").attr("value",fdescript==null?"":fdescript);
				$.closeDiv("inputDiv");
			}else{
				$("#newitemcode").attr("value","");
			    $('#newitemcode').focus();
			    //名称
			    $("#newitemname").attr("value","");
			    //型号
			    $("#newitemmode").attr("value","");
			    //压力等级
                $("#newflevel").attr("value","");
			    //生产商
			    $("#newfmaker").attr("value","");
				//原产地	
				$("#newsrcarea").attr("value","");
				//列表价
				$("#newlistamount").attr("value","");
				//成本价
				$("#newcostamount").attr("value","");
				//性能描述
				$("#newfdescript").attr("value","");
				$.closeDiv("inputDiv");
			}
			
		}
	});
}
/**
 * 保存物料申请单
 */
function saveApply(){
	$.webAjax( {
		type : "post",
		url : ctx+"/baseitemApply/baseitem-apply!listToQuery.htm",
		data:"baseitemApplyQuery.itemcode="+$('#newitemcodeForOptItem').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(null!=data.baseitemApplyList&&data.baseitemApplyList.length>0){
					var baseitemApply = data.baseitemApplyList[0];
					if(null!=baseitemApply.iscreate){
						alert("该物料已经存在,不需要申请!");
					}else{
						alert("该物料已经在申请中!");
					}
				}else{
					exesave();
				}
			}else{
				alert(data.resultInfo[0]);
			}
		}
	});
}
/**
 * 执行保存
 */
function exesave(){
	var url = ctx+"/baseitemApply/baseitem-apply!saveToJson.htm";
	var formParam = $('#inputFormValue2').serialize();
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert(data.resultInfo[1]);
				window.location.href = ctx+"/sysdata/itemapply.htm";
			}
		}
	});
}
function reback(){
	window.location.href = ctx+"/sysdata/itemapply.htm";
}