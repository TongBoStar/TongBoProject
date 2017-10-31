
$(document).ready(function() {
	/**设置点击弹出框之外的元素 弹出框消失*/
	document.body.onclick = function(e){
	 e = e || window.event;
	 var target = e.target || e.srcElement;
	 if(target.id.indexOf("itemcode")==0) {
		 return;
	 }else{
		 $('.itemDiv').css("display","none");
		
	 }
	};
	//selectStock();
	loadcallslip();
});
var j = 0;
var entity=new Array();
function loadcallslip(){
	openblockdiv();
	j=0;
	var url = ctx+"/callslip/callslip!showToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: 'callslipId='+$('#sourceId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#productCode').text(replaceNull(data.model.productCode));
				$('#productName').text(replaceNull(data.model.productName));
				$('#fcount').text(replaceNull(data.model.fcount));
				$('#makeNumberCode').text(replaceNull(data.model.makeNumberCode));
				//loadtools(data.model);
				//loadexestatus(data.model);
				if(data.model.fstatus==null||data.model.fstatus=='null'){
					$("#saveBtn").css("display","");
					$("#pushBtn").css("display","none");
					$("#closeBtn").css("display","none");
					$("#showstatus").css("display","none");
					$("#th1").css("display","");
				}else if(data.model.fstatus==0){
					$("#saveBtn").css("display","");
					$("#pushBtn").css("display","");
					$("#closeBtn").css("display","");
					$("#showstatus").css("display","none");
					$("#th1").css("display","");
				}else{
					$("#saveBtn").css("display","none");
					$("#pushBtn").css("display","none");
					$("#closeBtn").css("display","none");
					$("#showstatus").css("display","");
					$('#showstatus_sp').text("已关闭");
					$("#th1").css("display","none");
					
				}
				
				loadboms(data.model.id,data.model.fstatus,data.model.callType,data.model.sourceId);
				
			}
		}
	});
}
function loadboms(callslipId,status,type,sourceId){
	var url = '';
	if(status==null || status== 'null'){
		url = ctx+"/modelList/model-list!listToCallslipNew.htm";
		loadByDesign(url,type,sourceId,callslipId,status);
	}else{
		url = ctx+"/callslipDetail/callslip-detail!listToQuery.htm";
		loadByDetail(url,callslipId,status);
	}
	closeblockdiv();
}
function loadByDesign(url,type,sourceId,callslipId,status){
	var html = '';
	var mark = '';
	if(type=="TO_BRACKET_STOREROOM_TASK"){
		mark = "t_bracket_list";
	}else if(type=="TO_BAIT_STOREROOM_TASK"){
		mark = "t_bait_list";
	}else if(type=="TO_ASSWELD_STOREROOM_TASK"){
		mark = "t_assweld_list";
	}else if(type=="TO_ASSEMBLE_STOREROOM_TASK"){
		mark = "t_assemble_list";
	}else if(type=="TO_DELIVERY_STOREROOM_TASK"){
		mark = "t_delivery_list";
	}else{}
	$.webAjax({
		type : "post",
		url : url,
		data: 'modelListQuery.modelMark='+mark+'&modelListQuery.designassistId='+sourceId,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$("#tdcol1").css("display","");
				$("#tdcol2").css("display","none");
				$.each(data.modelListList,function(i,o){
					entity.push(o);
					html += '<tr id="tr'+i+'">';
					//操作
					html+='<td><a href="javascript:addtrs('+i+','+callslipId+')"><img  src="../images/add_small.gif" border=0 "/></a>';
					html+='<a href="javascript:deltr1('+i+')"><img src="../images/delete_small.gif"/></a></td>';
					//物料编码
					html += '<td><input type="hidden" id="itemcode'+i+'" name="callslipDetailList['+i+'].itemcode" value="'+o.itemcode+'" ref="itemcodes"/>';
					html += '<input type="hidden" name="callslipDetailList['+i+'].callslipId" value="'+callslipId+'"/>';
					html += o.itemcode+'</td>';
					
					//物料名称
					if(o.fmodel==null){
						html += '<td><input type="hidden" name="callslipDetailList['+i+'].itemname" value=""/>';
						html += '</td>';
					}else{
						html += '<td><input type="hidden" name="callslipDetailList['+i+'].itemname" value="'+o.fmodel+'"/>';
						html += o.fmodel+'</td>';
					}
					//物料规格
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].fmodel" value=""/>';
					html += '</td>';
					//单位
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].unitname" value="'+o.unitname+'"/>';
					html += o.unitname+'</td>';
					//数量
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].alen" value="'+o.sumnum+'"/>';
					html += o.sumnum+'</td>';
					//应发数量
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].shouldoutcount" value="'+o.sumnum+'"/>';
					html += o.sumnum+'</td>';
					//计划投料数
					html += '<td><input type="text" id="planoutcount'+i+'" name="callslipDetailList['+i+'].planoutcount" value="0" class="inputall" style="width:96%"/></td>';
					//已领数量
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].callcount" value="0"/>0</td>';
					//库存
					html += '<td><input type="hidden" id="stocks'+i+'" name="callslipDetailList['+i+'].stocks" value=""/>';
					html += '<div id="stocksDiv'+i+'"></div></td>';
					//检字管理
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].ischeckno" value=""/>';
					html += '是</td>';
					//序列管理
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].isserialize" value=""/>';
					html += '否</td>';
					//仓库
					html += '<td><input  type="text" class="inputall" style="width:96%" name="callslipDetailList['+i+'].stockname" value="" id="stockname'+i+'" onclick="selectStock('+i+');" ref="stocknames"/>';
					html += '<input type="hidden"  name="callslipDetailList['+i+'].stockid" value="" id="stockid'+i+'"/></td>';
					//批号
					html += '<td><input type="hidden" id="batchno'+i+'" name="callslipDetailList['+i+'].batchno" value=""/>';
					html += '<div id="batchnoDiv'+i+'"></div></td>';
					html +='</tr>';
					j++;
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}

function loadByDetail(url,callslipId,status){
	var html = '';
	$.webAjax({
		type : "post",
		url : url,
		data: 'callslipDetailQuery.callslipId='+callslipId,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(status==0){
					$("#tdcol1").css("display","");
					$("#tdcol2").css("display","none");
				}else{
					$("#tdcol2").css("display","");
					$("#tdcol1").css("display","none");
				}
				$.each(data.callslipDetailList,function(i,o){
					entity.push(o);
					html += '<tr id="tr'+i+'" >';
					//操作
					if(status==0){
						html+='<td><a href="javascript:addtrs('+i+','+callslipId+')"><img  src="../images/add_small.gif" border=0 "/></a>';
						html+='<a href="javascript:deltr('+o.id+')"><img src="../images/delete_small.gif"/></a></td>';
					}
					//物料编码
					html += '<td><input type="hidden" id="itemcode'+i+'" name="callslipDetailList['+i+'].itemcode" value="'+o.itemcode+'" ref="itemcodes"/>';
					html += '<input type="hidden" name="callslipDetailList['+i+'].callslipId" value="'+callslipId+'"/>';
					html += '<input type="hidden" name="callslipDetailList['+i+'].id" value="'+o.id+'"/>';
					html += o.itemcode+'</td>';
					//物料名称
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].itemname" '+changeValue(o.itemname)+'/>';
					html += o.itemname+'</td>';
					//物料规格
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].fmodel" '+changeValue(o.fmodel)+'/>';
					html += replaceNull(o.fmodel)+'</td>';
					//物料单位
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].unitname" '+changeValue(o.unitname)+'/>';
					html += replaceNull(o.unitname)+'</td>';
					//数量（总长）
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].alen" '+changeValue(o.alen)+'/>';
					html += replaceNull(o.alen)+'</td>';
					//应发数量
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].shouldoutcount" '+changeValue(o.shouldoutcount)+'/>';
					html += replaceNull(o.shouldoutcount)+'</td>';
					//计划投料数
					if(status==0){
						html += '<td><input type="text" id="planoutcount'+i+'" name="callslipDetailList['+i+'].planoutcount" '+changeValue(o.planoutcount)+' class="inputall" style="width:96%"/></td>';
					}else{
						html += '<td><input type="hidden" id="planoutcount'+i+'" name="callslipDetailList['+i+'].planoutcount" '+changeValue(o.planoutcount)+'/>';
						html += ''+replaceNull(o.planoutcount)+'</td>';
					}
					//已领数量
					if(o.callcount==null){
						html += '<td><input type="hidden" name="callslipDetailList['+i+'].callcount" value="0"/>0</td>';
					}else{
						html += '<td><input type="hidden" name="callslipDetailList['+i+'].callcount" value="'+o.callcount+'"/>'+o.callcount+'</td>';
					}
					//库存
					if(status==0){
						html += '<td><input type="hidden" id="stocks'+i+'" name="callslipDetailList['+i+'].stocks" '+changeValue(o.stock)+'/>';
						html += '<div id="stocksDiv'+i+'">'+replaceNull(o.stock)+'</div></td>';
					}else{
						html += '<td><input type="hidden" id="stocks'+i+'" name="callslipDetailList['+i+'].stocks" '+changeValue(o.stocks)+'/>';
						html += replaceNull(o.stocks)+'</td>';
					}
					//检字管理
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].ischeckno" '+changeValue(o.ischeckno)+'/>';
					html += '是</td>';
					//序列管理
					html += '<td><input type="hidden" name="callslipDetailList['+i+'].isserialize" '+changeValue(o.isserialize)+'/>';
					html += '否</td>';
					//仓库
					if(status==0){
						html += '<td><input type="text" class="inputall" style="width:96%" name="callslipDetailList['+i+'].stockname" value="'+replaceNull(o.stockname)+'" id="stockname'+i+'" onclick="selectStock('+i+');" ref="stocknames"/>';
						html += '<input type="hidden"  name="callslipDetailList['+i+'].stockid" '+changeValue(o.stockid)+' id="stockid'+i+'"/></td>';
					}else{
						html += '<td>'+replaceNull(o.stockname)+'</td>'
					}
					//批号
					html += '<td><input type="hidden" id="batchno'+i+'" name="callslipDetailList['+i+'].batchno" '+changeValue(o.batchno)+'/>';
					html += '<div id="batchnoDiv'+i+'">'+replaceNull(o.batchno)+'</div></td>';
					html +='</tr>';
					j++;
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
//已经保存后的添加行
function addtrs(i,callslipId){
	var html='<tr id="trnew'+j+'" >';
	//操作
	html+='<td><a href=\"javascript:delnewtrs('+j+')\">';
	html+='<img src=\"../images/delete_small.gif\" border=0 style=\"margin-bottom: 0px;margin-right: -20px;\"/></a></td>';
	//物料编码
	html+='<td ><input type="hidden" name="callslipDetailList['+j+'].callslipId" value="'+callslipId+'"/><input name="callslipDetailList['+j+'].itemcode" id="itemcode'+j+'" value="" class="inputall" style="width:96%" onclick="enterCheck('+j+');"  onkeyup="searchResult('+j+');"  ref="itemcodes"/><div id="itemcodeDiv'+j+'"  class="itemDiv" style="position:absolute;width: 320px;height: 180px;background: #ccc;display: none; "><table><tbody id="selectsbody'+j+'"></tbody></table></div></td>';
	//物料名称
	html += '<td><input name="callslipDetailList['+j+'].itemname" id="itemname'+j+'" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html +='</td>';
	//物料规格
	html += '<td><input  name="callslipDetailList['+j+'].fmodel" id="fmodel'+j+'"  value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html +='</td>';
	//物料单位
	html += '<td><input  name="callslipDetailList['+j+'].unitname" id="unitname'+j+'" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	//数量（总长）
	html += '<td><input id="alen'+j+'"  name="callslipDetailList['+j+'].alen" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	//应发数量
	html += '<td><input id="shouldoutcount'+j+'" name="callslipDetailList['+j+'].shouldoutcount" value=""  style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	//计划投料数
	html += '<td><input id="planoutcount'+j+'" type="text" name="callslipDetailList['+j+'].planoutcount" value="0" class="inputall" style="width:96%"/></td>';
	//已领数量
	html += '<td><input type="hidden" name="callslipDetailList['+j+'].callcount" value="0"/>0</td>';
	//库存
	html += '<td><input type="hidden" id="stocks'+j+'" name="callslipDetailList['+j+'].stocks" value=""/>';
	html += '<div id="stocksDiv'+j+'"></div></td>';
	//检字管理
	html += '<td><input type="hidden" name="callslipDetailList['+j+'].ischeckno" value=""/>';
	html += '是</td>';
	//序列管理
	html += '<td><input type="hidden" name="callslipDetailList['+j+'].isserialize" value=""/>';
	html += '否</td>';
	//仓库
	html += '<td><input type="text" class="inputall" style="width:96%" name="callslipDetailList['+j+'].stockname" value="" id="stockname'+j+'" onclick="selectStock('+j+');"  ref="stocknames"/>';
	html += '<input type="hidden"  name="callslipDetailList['+j+'].stockid" value="" id="stockid'+j+'"/></td>';
	//批号
	html += '<td><input type="hidden" id="batchno'+j+'" name="callslipDetailList['+j+'].batchno" value=""/>';
	html += '<div id="batchnoDiv'+j+'"></div></td>';
	html +='</tr>';
	
	$("#tr"+i).after(html);
	j++;
	
}
/*//未保存之前的添加行
function addtrs1(i,callslipId){
	var  html = '<tr id="trnew'+j+'">';
	html+='<td><a href=\"javascript:delnewtrs('+j+')\">';
	html+='<img src=\"../images/delete_small.gif\" border=0 style=\"margin-bottom: 0px;margin-right: -20px;\"/></a></td>';
	html+='<td ><input type="hidden" name="callslipDetailList['+j+'].callslipId" value="'+callslipId+'"/><input name="callslipDetailList['+j+'].itemcode" id="itemcode'+j+'" value="" class="inputall" style="width:96%;text-align:center;" onclick="enterCheck('+j+');"  onkeyup="searchResult('+j+');"  ref="itemcodes"/><div id="itemcodeDiv'+j+'"  class="itemDiv" style="position:absolute;width: 320px;height: 180px;background: #ccc;display: none; "><table><tbody id="selectsbody'+j+'"></tbody></table></div></td>';
	html += '<td><input id="itemname'+j+'" name="callslipDetailList['+j+'].itemname" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	html += '<td><input id="fmodel'+j+'" name="callslipDetailList['+j+'].fmodel" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	html += '<td><input id="unitname'+j+'" name="callslipDetailList['+j+'].unitname" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	html += '<td><input id="slen'+j+'" name="callslipDetailList['+j+'].slen" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	html += '<td><input id="shouldoutcount'+j+'" name="callslipDetailList['+j+'].shouldoutcount" value="" style="border-style:none;text-align:center;width:95%;"  readonly="readonly"/>';
	html += '</td>';
	html += '<td><input id="planoutcount'+j+'" type="text" name="callslipDetailList['+j+'].planoutcount" value="0" class="inputall" style="width:96%"/></td>';
	html += '<td><input type="hidden" name="callslipDetailList['+j+'].callcount" value="0"/>0</td>';
	html += '<td><input type="hidden" id="stocks'+j+'" name="callslipDetailList['+j+'].stocks" value=""/>';
	html += '<div id="stocksDiv'+j+'"></div></td>';
	html += '<td><input type="hidden" name="callslipDetailList['+j+'].ischeckno" value=""/>';
	html += '是</td>';
	html += '<td><input type="hidden" name="callslipDetailList['+j+'].isserialize" value=""/>';
	html += '否</td>';
	html += '<td><input  type="text" class="inputall" style="width:96%" name="callslipDetailList['+j+'].stockname" value="" id="stockname'+j+'" onclick="selectStock('+j+');" ref="stocknames"/>';
	html += '<input type="hidden"  name="callslipDetailList['+j+'].stockid" value="" id="stockid'+j+'"/></td>';
	html += '<td><input type="hidden" id="batchno'+i+'" name="callslipDetailList['+j+'].batchno" value=""/>';
	html += '<div id="batchnoDiv'+j+'"></div></td>';
	html += '</td>';
	html +='</tr>';
	$("#tr"+i).after(html);
	j++;
}*/

//删除行（状态为未保存时）
function deltr1(i){
	$("#tr"+i).remove();
}
//删除未保存的行（状态为已保存时）
function delnewtrs(i){
	$("#trnew"+i).remove();
}
//删除已保存的行
function deltr(id){
	var param = {};
	if(id) {
		param['checkedIdList[0]'] = id;
	} 
	if(!confirm('确定删除此条信息吗？')) {
		return;
	}
	var url = ctx + '/callslipDetail/callslip-detail!deleteToJson.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("删除成功");
				loadcallslip();
			} else {
				alert('删除项目失败！');
			}
		}
	});
}

//保存
function saveCallslipDetail(){
	if(!checkdata()){
		return;
	}
	block_viewport("请稍等...");
	var queryForm = $('#queryForm').serialize();
	var url = ctx+"/callslipDetail/callslip-detail!saveAllToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: queryForm,
		success : function(data) {
			xval.remove();
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("保存成功！");
				//window.location.reload();
				loadcallslip();
			}
		}
	});
}
//下推数据:下推数据之前先将数据保存，保存后再将数据下推
function pushData(){
	if(!checkdata()){
		return;
	}
	var flag=0;
	for(var i=0;i<j;i++){
		if($("#planoutcount"+i).val()!=null&&$("#planoutcount"+i).val()>0){
			flag=1;
		}
	}
	if(flag==0){
		alert("没有计划投料数>0的数据，请修改计划投料数后再下推");
		return;
	}
	
	
	if(confirm('确定下推吗？')) {
		block_viewport("请稍等...");
		var queryForm = $('#queryForm').serialize();
		var url = ctx+"/callslipDetail/callslip-detail!saveAllToJson.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: queryForm,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					var url = ctx+"/callslip/callslip!pushData.htm";
					var param = 'entity.id='+$('#sourceId').val();
					$.webAjax({
						type : "post",
						url : url,
						data:param,
						success : function(data) {
							xval.remove();
							data = $.parseJSON(data);
							if(data.resultInfo[0]=='0'){
								alert("操作成功!");
								//window.location.reload();
								loadcallslip();
							}else{
								alert(data.resultInfo[1]);
							}
						}
					});
				}
			}
		});
		
	}
}
//关闭数据
function closeData(){
	if(!checkdata()){
		return;
	}
	block_viewport("请稍等...");
	var queryForm = $('#queryForm').serialize();
	var url = ctx+"/callslipDetail/callslip-detail!saveAllToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: queryForm,
		success : function(data) {
			
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var url = ctx+"/callslip/callslip!closeData.htm";
				var param = 'entity.id='+$('#sourceId').val();
				$.webAjax({
					type : "post",
					url : url,
					data:param,
					success : function(data) {
						xval.remove();
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0'){
							alert("操作成功!");
							//window.location.reload();
							loadcallslip();
						}else{
							alert(data.resultInfo[1]);
						}
					}
				});
				
			}
		}
	});
	
}



function enterCheck(i){
	searchResult(i);
}

function searchResult(i){
	var offsettop=$("#itemcode"+i).offset().top;   
 	var offsetleft=$("#itemcode"+i).offset().left;
	$("#itemcodeDiv"+i).css({position: "absolute",'top':offsettop-20,'left':offsetleft-205}); 
	$(".itemDiv").css("display","none");
	$("#itemcodeDiv"+i).css("display","");
	var code = $("#itemcode"+i).val();
	var html='<td><select id="selectCode'+i+'" onchange="changeCode('+i+');" style="width: 320px; height: 180px;background-color: #ccc;" multiple="true">';
	var data = 'baseItemQuery.itemcode='+code; 
	var url =ctx+'/baseItem/base-item!findBaseItemCallslip.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.baseItemList;
									if(list.length==0){
										alert("无此物料代码请重新输入");
										$("#itemcode"+i).attr("value","");
									}
									$.each(list,function(i,o){
										html+='<option value="'+o.aid+'" >'+o.itemcode+'|'+o.itemname+'|'+o.formatno+'|'+o.unitname+'</option>';
									});
								
							html+='</select></td>';
							$('#selectsbody'+i).html(html);
					}
		});	
	
}
//选择完物料代码后回显物料信息
function changeCode(i){
	var sel = $("#selectCode"+i).val();
	var txt = $('#selectCode'+i).find('option:selected').text();
	var itemcode="";
	var itemname="";
	var formatno = "";
	var unitname = "";
	var fqty = "";
	if(txt.toString().split('|')[0]!=null&&txt.toString().split('|')[0]!="null"){
		itemcode = txt.toString().split('|')[0];
	}
	if(txt.toString().split('|')[1]!=null&&txt.toString().split('|')[1]!="null"){
		itemname = txt.toString().split('|')[1];
	}
	if(txt.toString().split('|')[2]!=null&&txt.toString().split('|')[2]!="null"){
		formatno = txt.toString().split('|')[2];
	}
	if(txt.toString().split('|')[3]!=null&&txt.toString().split('|')[3]!="null"){
		unitname = txt.toString().split('|')[3];
	}
	
	$("#itemcode"+i).val(itemcode);
	$("#itemname"+i).val(itemname);
	$("#fmodel"+i).val(formatno);
    $("#unitname"+i).val(unitname);
    $("#slen"+i).val("");
    $("#shouldoutcount"+i).val("");
	$("#itemcodeDiv"+i).css("display","none");
}
function changeValue(value){
	if(value==null){
		return 'value=""';
	}else{
		return 'value="'+value+'"';
	}
}
function checkdata(){
	var itemcodes = $("input[ref='itemcodes']");
	var codes = new Array();
	var ispass=0;
	$.each(itemcodes,function(i,o){
		if(!$(o).val()){
			ispass=1;
		}else{
			codes.push($(o).val());
		}
	});
	if(ispass==1){
		alert("物料编码不能为空!");
		return false;
	}else{
		/*if(isRepeat(codes)){
			alert("物料编码不能重复！");
			return false;
		}*/
	}
	var flag=0;
	for(var i=0;i<j;i++){
		//alert($("#planoutcount"+i).val()+"***"+$("#stocks"+i).val());
		if($("#planoutcount"+i).val()!=null&&$("#planoutcount"+i).val()>0&&$("#stocks"+i).val()!=null&&$("#stocks"+i).val()!=""){
			if(parseFloat($("#planoutcount"+i).val())>parseFloat($("#stocks"+i).val())){
				flag=1;
			}
		}else if($("#planoutcount"+i).val()!=null&&$("#planoutcount"+i).val()>0&&$("#stocks"+i).val()==null){
			flag=1;
		}else if($("#planoutcount"+i).val()!=null&&$("#planoutcount"+i).val()>0&&$("#stocks"+i).val()==""){
			flag=1;
		}
		
	}
	if(flag==1){
		alert("计划投料数不能大于库存数量，请修改计划投料数！");
		return false;
	}
	
	var stocknames = $("input[ref='stocknames']");
	var stockpass=0;
	$.each(stocknames,function(i,o){
		if($(o).val()==null||$.trim($(o).val())==""){
			stockpass=1;
		}
	});
	if(stockpass==1){
		alert("仓库不能为空!");
		return false;
	}
	
	return true;
}
//判断数组中是否有重复元素
function isRepeat(arr) {
   var hash = {};
   for(var i in arr) {
       if(hash[arr[i]])
       {
           return true;
       }
       // 不存在该元素，则赋值为true，可以赋任意值，相应的修改if判断条件即可
       hash[arr[i]] = true;
    }
   return false;
} 


function selectStock(trid){
	var itemcode = $("#itemcode"+trid).val();
	if(itemcode==null||$.trim(itemcode)==""){
		alert("物料编码为空，不能选择物料对应的仓库");
		return;
	}
	
	var html = '';
	var url = ctx+"/inventoryBatch/inventory-batch!findStockList.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: 'inventoryBatchQuery.itemcode='+itemcode,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.inventoryBatchList,function(i,o){
					//alert(o.itemcode+"**"+o.batchno+"**"+o.fitemid+"**"+o.fqty+"**"+o.stockname);
					html+='<tr>';
					html+='<td>'+replaceNull(o.itemcode)+'</td>';
					html+='<td>'+replaceNull(o.stockname)+'</td>';
					html+='<td>'+replaceNull(o.fqty)+'</td>';
					html+='<td>'+replaceNull(o.batchno)+'</td>';
					var stockname = null;
					var batchno = null;
					if(o.stockname!=null&&o.stockname!=""){
						stockname = o.stockname;
					}
					if(o.batchno!=null&&$.trim(o.batchno)!=""){
						batchno = o.batchno;
					}
					html+='<td><button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="chooseStock('+(o.stockname==null?null:'\''+o.stockname+'\'')+','+(o.fitemid==null?null:o.fitemid)+','+(o.fqty==null?null:o.fqty)+','+(o.batchno==null?null:'\''+o.batchno+'\'')+','+trid+');">确定</button></td>';
					html+='</tr>';
				});
				$('#stockcontent').html(html);
			}
		}
	});
	openDiv("stockDiv");
}
function chooseStock(stockname,stockid,fqty,batchno,trid){
	//仓库
	$("#stockname"+trid).val(stockname==null?"":stockname);
	if(stockid!=null){
		$("#stockid"+trid).val(stockid);
	}
	//库存
	if(fqty!=null){
		$("#stocks"+trid).val(fqty);
		$("#stocksDiv"+trid).html(fqty);
	}
	//批号
	$("#batchno"+trid).val(batchno==null?"":batchno);
	$("#batchno"+trid).html(batchno==null?"":batchno);
	closeDiv("stockDiv");
}







function loadtools(data){
	if(data.fstatus==-1){//驳回
		$("#saveBtn").css("display","none");//隐藏保存按钮
		$('#rebackinfo_start_bracket').text("被驳回,原因:"+(data.bracketStatusDesc==null?"":data.bracketStatusDesc)).css("display","").css("color","red");
		$('#pushbtn_bracket').css("display","");
		$("#th1").css("display","none");
		/*$("#th2").css("display","none");*/
	}else if(data.fstatus==100){//流程结束
		$("#saveBtn").css("display","none");
		$('#examinestatusdiv_bracket').css("display","");
		$('#currentprocess_bracket').text("流程结束!");
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","none");
		$("#th1").css("display","none");
		/*$("#th2").css("display","none");*/
	}else if(data.fstatus==0){//已保存
		$("#saveBtn").css("display","");
		$('#pushbtn_bracket').css("display","");
		$("#th1").css("display","");
		/*$("#th2").css("display","");*/
	}else if(data.fstatus==null || data.fstatus== 'null'){
		$("#th1").css("display","");
		$("#saveBtn").css("display","");
	}else{
		var text = $('#currentprocess_bracket').text();
		var name = $.trim(text.substring(text.indexOf(":")+1,text.length));
		if(name==realName){
			$('#examinebtn_bracket').css("display","");
		}else{
			$('#examinebtn_bracket').css("display","none");
		}
	}
	//loadexestatus(data);
}

/**
 * 装载正在执行的流程
 */
function loadexestatus(model){
	var url = ctx+"/processExetask/process-exetask!listToQuery.htm";
	var param = 'processExetaskQuery.sourceId='+$('#sourceId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(null!=data.processExetaskList&&data.processExetaskList.length>0){
					$.each(data.processExetaskList,function(i,o){
						if(o.taskCode=='TO_CALLSLIP_TASK'){
							$('#exeTaskId_bracket').val(o.id);
							$('#nodeSeq_bracket').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bracket').text(spantxt);
							$('#examinestatusdiv_bracket').css("display","");
							$('#examinebtn_bracket').css("display","");
							$('#pushbtn_bracket').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bracket').text("(被驳回,原因:"+(o.fmark==null?"":o.fmark)+")");
								$('#rebackinfo_bracket').css("color","red");
							}
						}
					});
				}
			}
			
			loadtools(model);
		}
	});
}
/**
 * 查看流程
 */
function checkprocesshis(mark){
	var url = ctx+"/processHistask/process-histask!listToQuery.htm";
	var param = 'processHistaskQuery.taskCode='+$('#taskcode_'+mark).val()+
				"&processHistaskQuery.sourceId="+$('#sourceId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				if(null!=data.processHistaskList&&data.processHistaskList.length>0){
					$.each(data.processHistaskList,function(i,o){
						var status = '';
						if(o.examineStatus==0){
							status = '驳回';
						}else if(o.examineStatus==1){
							status = '审批通过';
						}else{
							
						}
						html += "<tr>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td>"+o.operaterName+"</td>";
						html += "<td>"+o.nodeName+"</td>";
						html += "<td>"+status+"</td>";
						html += "<td>"+o.operateTime+"</td>";
						html += "<td>"+replaceNull(o.fmark)+"</td>";
						html += "</tr>";
					});
				}
				$('#processcontent').html(html);
				openDiv('checkDiv');
			}
		}
	});
}

/**
 * 进行下推，启动下料下推的流程
 * @param type 是下推还是审核 0下推 1审核
 */
var examineMark = '';
function exeprocess(type,mark){
	var flag=0;
	for(var i=0;i<j;i++){
		if($("#planoutcount"+i).val()!=null&&$("#planoutcount"+i).val()>0){
			flag=1;
		}
	}
	if(flag==0){
		alert("没有计划投料数>0的数据，请修改计划投料数后再下推");
		return;
	}
	
	if(!checkdata()){
		return;
	}
	if(type==0){//是下推
		if(confirm('确定下推吗？')) {
			var queryForm = $('#queryForm').serialize();
			var url = ctx+"/callslipDetail/callslip-detail!saveAllToJson.htm";
			$.webAjax({
				type : "post",
				url : url,
				data: queryForm,
				success : function(data) {
					data = $.parseJSON(data);
					if(data.resultInfo[0]=='0'){
						saveexamine(type,mark);
					}
				}
			});
			
		}
		
	}else{//是审核
		$('#fmark').val('');
		examineMark = mark;
		openDiv("examineAddDiv");
	}
}

function saveexamine(type,mark){
	var examineinfo = '';
	if(type==0){//如果是下推按钮则不传审核类的信息
	}else if(type==1&&mark=='_blank'){//如果是审核操作要将信息传入
		mark = examineMark;
	}else{}
	var nodeseq = $('#nodeSeq_'+mark).val();
	if(nodeseq==undefined || nodeseq==null || nodeseq==''){
		nodeseq = 0;
	}
	var examineAddForm = $('#examineAddForm').serialize();
	var url = ctx+"/callslip/callslip!exeProcess.htm";
	var param = 'processExetask.sourceId='+$('#sourceId').val()+
				'&processExetask.sourceCode='+$('#sourceCode').val()+
				'&processExetask.nodeSeq='+nodeseq+
				'&processExetask.id='+$('#exeTaskId_'+mark).val()+
				'&processExetask.taskCode='+$('#taskcode_'+mark).val()+
				'&id='+$('#sourceId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: examineAddForm+"&"+param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("操作成功!");
				//window.location.reload();
				loadcallslip();
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
//驳回和通过
function selectAccess(rv){
	if(rv==1){
		$('#rebackTR').css("display","none");
	}else if(rv==0){
		var nodeseq = $('#nodeSeq_'+examineMark).val();
		if(nodeseq==1){
			$('#rebackNode').html("<option value='0'>开始</option>");
			$('#rebackTR').css("display","");
		}else if(nodeseq>1){
			var url = ctx+"/processDetail/process-detail!findByCode.htm";
			$.webAjax({
				type : "post",
				url : url,
				data: 'processDetailQuery.processCode='+$('#taskcode_'+examineMark).val(),
				success : function(data) {
				data = $.parseJSON(data);
					if(data.resultInfo[0]=='0'){
						var options = "<option value='0'>开始</option>";
						$.each(data.processDetailList,function(i,o){
							if(o.nodeSeq<nodeseq){
								options += "<option value='"+o.nodeSeq+"'>"+o.nodeName+"</option>";
							}
						});
						$('#rebackNode').html(options);
						$('#rebackTR').css("display","");
					}
				}
			});
		}else{
			
		}
	}else{
		
	}
}
