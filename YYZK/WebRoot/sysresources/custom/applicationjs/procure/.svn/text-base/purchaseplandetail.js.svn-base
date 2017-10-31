$(document).ready(function() {
	openblockdiv();
	loaddesignassist();
});
var sourcecode="";
function loaddesignassist(){
	var url = ctx+"/purchasePlan/purchase-plan!showToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: 'purchasePlanId='+$('#sourceId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var data = data.model;
				sourcecode = data.sourceCode;
				$('#productCode_bracket').val((data.productCode==null?"":data.productCode));
				$('#productName_bracket').val(data.productName);
				$('#productModel_bracket').val(data.productModel);
				$('#makeNumberCode_bracket').val(data.makeNumberCode);
				$('#fcount_bracket').val(data.fcount);
				$('#baitDate_bracket').val(data.planendtime==null?"":data.planendtime.substring(0,10));
				loadDetailList(data.id,data.fstatus,data);
			}
		}
	});
}
function loadtools(data){
	if(data.fstatus==-1){//驳回
		$("#saveBtn").css("display","none");//隐藏保存按钮
		$('#examinebtn').css("display","");
		$("#th1").css("display","none");
	}else if(data.fstatus==100){//流程结束
		$("#saveBtn").css("display","none");//隐藏保存按钮
		$('#examinebtn').css("display","none");
		$("#th1").css("display","none");
		$('#closebtn').css("display","none");
		$('#currentprocess_bracket').text("已关闭!");
	}else if(data.fstatus==0){//已保存
		$("#saveBtn").css("display","");//隐藏保存按钮
		$('#examinebtn').css("display","");
		$("#th1").css("display","");
		$('#closebtn').css("display","");
	}else if(data.fstatus==null || data.fstatus== 'null'){
		$("#th1").css("display","");
		$("#saveBtn").css("display","");
		$("#th1").css("display","");
		$('#closebtn').css("display","none");
	}else{
		
	}
}

/**
 * 加载下料的明细列表
 */
function loadDetailList(id,fstatus,plan){
	var html='';
	var url = ctx+"/purchaseplanDetail/purchaseplan-detail!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'purchaseplanDetailQuery.planid='+id,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(null!=data.purchaseplanDetailList&&data.purchaseplanDetailList.length>0){
					//loaddesignassist();
				}else{
					$('#pushbtn').css("display","none");
					$('#examinebtn').css("display","none");
					$('#examinestatusdiv').css("display","none");
				}
				$.each(data.purchaseplanDetailList,function(i,o){
					html+='<tr align="center">';
					if(fstatus==null || fstatus== 'null' || fstatus==0){
						html += '<td><input style="width:17px;height:17px;" type="checkbox" id="checkedpro" name="checkedpro" value="' + o.plandetailid + '"/></td>';
					}
					html+='<td><input type="text" value="'+o.plandetailid+'" name="plandetailids" id="realnum'+i+'" style="display:none;"/>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.formatno==null?"":o.formatno)+'</td>';
					html+='<td>'+(o.youtput==null?"":o.youtput)+'</td>';
					html+='<td>'+(o.cyclename==null?"":o.cyclename)+'</td>';
					html+='<td>'+(o.secinv==null?"":o.secinv)+'</td>';
					html+='<td>'+(o.plannum==null?"":o.plannum)+'</td>';
					html+='<td>'+(o.existednums==null?"":o.existednums)+'</td>';
					/*if(fstatus==null || fstatus== 'null' || fstatus==0){
						if(o.fqtyreal==null){
							html+='<td><input type="hidden" value="0" name="fqtys" id="fqty'+i+'"/>'+(o.fqtyreal==null?0:o.fqtyreal)+'</td>';
						}else{
							html+='<td><input type="hidden" value="'+o.fqtyreal+'" name="fqtys" id="fqty'+i+'"/>'+(o.fqtyreal==null?0:o.fqtyreal)+'</td>';
						}
					}else{
						html+='<td>'+(o.fqty==null?0:o.fqty)+'</td>';
					}*/
					if(fstatus==null || fstatus== 'null' || fstatus==0){
						if(o.fqtyreal==null){
							html+='<td><input type="hidden" value="0" name="fqtys" id="fqty'+i+'"/>'+(o.fqty==null?0:o.fqty)+'</td>';
						}else{
							html+='<td><input type="hidden" value="'+o.fqtyreal+'" name="fqtys" id="fqty'+i+'"/>'+(o.fqty==null?0:o.fqty)+'</td>';
						}
					}else{
						html+='<td>'+(o.fqty==null?0:o.fqty)+'</td>';
					}
					html+='<td>'+(o.makingnums==null?"":o.makingnums)+'</td>';
					html+='<td>'+(o.planednum==null?"":o.planednum)+'</td>';
					html+='<td>'+(o.amount==null?"":o.amount)+'</td>';
					html+='<td>'+(o.innum==null?"":o.innum)+'</td>';
					var realnum=0;
					if(o.realnum!=null) realnum = o.realnum;
					if(fstatus==null || fstatus== 'null' || fstatus==0){
						html+='<td><input type="text" value="'+realnum+'" name="realnums" id="realnum'+i+'" style="width:90%" ref="' + o.plandetailid + '"/></td>';
						html+='<td><input name="planenddates" id="planenddate'+i+'" value="'+(o.planenddate==null?"":o.planenddate)+'"  onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" style="width:98%"/></td>';
					}else{
						html+='<td>'+realnum+'</td>';
						html+='<td>'+(o.planenddate==null?"":o.planenddate)+'</td>';
					}
					html+='</tr>';
				});
				$('#detaillistcontent').html(html);
				loadtools(plan);
				closeblockdiv();
			}
		}
	});
}

function changeDate(){
	var planDate = $("#planDate").val();
	if(planDate!=null&&$.trim(planDate)!=""){
		$('input[name="planenddates"]').each(function(){
			$(this).attr("value",planDate);
		});
	}
	
}
//保存
function saveData(){
	var count=0;
	$('input[name="planenddates"]').each(function(){
		if($(this).val()!=null&&$(this).val()!=""){
			count++;
		}
	});
	if(count!=$('input[name="planenddates"]').length){
		alert("请输入计划交货日期！");
		return;
	}
	block_viewport("请稍等...");
	//先将数据保存
	var formParam = $('#queryForm').serialize();
	var url=ctx+"/purchaseplanDetail/purchaseplan-detail!saveSrcBuy.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
			xval.remove();
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				alert("保存成功！");
				loaddesignassist();
			}else{
			    alert(data.resultInfo[1]);
			}
		}
	  });
}
//下推数据到采购申请单
function pushData(){
	var delBlocs = $('[name="checkedpro"]:checked');
	var param = {};
	var cnt = 0;
	var num=0;
	$.each(delBlocs, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		if($("input[ref='"+$(o).val()+"']") .val()==null||$("input[ref='"+$(o).val()+"']") .val()==0){
			num++;
		}
		
		cnt++;
	});
	if(cnt==0){
		alert("请选择下推的数据");
		return;
	}
	if(cnt==num){
		alert("实际下单数量为零不能下推！");
		return;
	}
	
	var count=0;
	$('input[name="planenddates"]').each(function(){
		if($(this).val()!=null&&$(this).val()!=""){
			count++;
		}
	});
	if(count!=$('input[name="planenddates"]').length){
		alert("请输入计划交货日期！");
		return;
	}

	block_viewport("请稍等...");
	//先将数据保存
	var formParam = $('#queryForm').serialize();
	var url=ctx+"/purchaseplanDetail/purchaseplan-detail!saveSrcBuy.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				//将选择的数据下推到采购申请单
				var url=ctx+"/purchaseplanDetail/purchaseplan-detail!pushDate.htm";
				$.webAjax( {
					type : "post",
					url : url,
					data:param,
					success : function(data) {
						xval.remove();
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0')
						{
							alert("操作成功");
							loaddesignassist();
						}else{
						    alert(data.resultInfo[1]);
						}
					}
				});
			}else{
				xval.remove();
			    alert(data.resultInfo[1]);
			}
		}
	  });
	
}
//关闭
function closeData(){
	var count=0;
	$('input[name="planenddates"]').each(function(){
		if($(this).val()!=null&&$(this).val()!=""){
			count++;
		}
	});
	if(count!=$('input[name="planenddates"]').length){
		alert("请输入计划交货日期！");
		return;
	}
	block_viewport("请稍等...");
	var param = 'entity.id='+$('#sourceId').val();
	//先将数据保存
	var formParam = $('#queryForm').serialize();
	var url=ctx+"/purchaseplanDetail/purchaseplan-detail!saveSrcBuy.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				//将数据关闭
				var url=ctx+"/purchasePlan/purchase-plan!closeDate.htm";
				$.webAjax( {
					type : "post",
					url : url,
					data:param,
					success : function(data) {
						xval.remove();
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0')
						{
							alert("操作成功");
							loaddesignassist();
						}else{
						    alert(data.resultInfo[1]);
						}
					}
				});
			}else{
				xval.remove();
			}
		}
	  });
}

function queryData(){
	var param = 'porequestentryQuery.sourcecode='+sourcecode;
	/*alert(sourcecode);
	window.open('itemcodesumlist.htm', 'newwindow', 'height=650, width=1250, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');*/
	var url = ctx+ '/porequestentry/porequestentry!listItemcodeSum.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data:param,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.porequestentryList;
			if(list!=null&&list.length>0){
				
			}
			//组装table
			$.each(list, function(i, o){
				html += '<tr>';
				html += '<td>'+replaceNull(o.sourcecode) +'</td>';
				html += '<td>'+replaceNull(o.itemcode)+'</td>';
				html += '<td>'+replaceNull(o.qty1)+'</td>';
				html += '<td>'+replaceNull(o.qty2)+'</td>';
				html += '<td>'+replaceNull(o.qty3)+'</td>';
				html += '<td>'+replaceNull(o.qty4)+'</td>';
				html += '<td>'+replaceNull(o.qty5)+'</td>';
				html += '<td>'+replaceNull(o.qty6)+'</td>';
				html += '</tr>';
				
			});
			$('#itemcodesumcontent').html(html);
		}
	});
	openDiv("detailsDiv");
}
