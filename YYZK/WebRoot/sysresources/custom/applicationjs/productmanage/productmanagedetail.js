$(document).ready(function() {
	loaddesignassist();
});
function loaddesignassist(){
	openblockdiv();
	var url = ctx+"/productmanageTask/productmanage-task!showToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: 'productmanageTaskId='+$('#productmanagetaskId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				addHead(data.model);
				dispatchData(data.model);
				loadtools(data.model);
				//loadexestatus(data.model);
			}
		}
	});
}
function addHead(data){
	if(null==data.bracketStatus){
		$('#bracket-slider-tab').css("display","none");
	}else{
		$('#productCode_bracket').val(data.productCode);
		$('#productName_bracket').val(data.productName);
		$('#productModel_bracket').val(data.productModel);
		$('#makeNumberCode_bracket').val(data.makeNumberCode);
		$('#fcount_bracket').val(data.fcount);
		$('#baitDate_bracket').val(formatDate("yyyy-MM-dd",data.bracketDate));
	}
	if(null==data.baitStatus){
		$('#bait-slider-tab').css("display","none");
	}else{
		$('#productCode_bait').val(data.productCode);
		$('#productName_bait').val(data.productName);
		$('#productModel_bait').val(data.productModel);
		$('#makeNumberCode_bait').val(data.makeNumberCode);
		$('#fcount_bait').val(data.fcount);
		$('#baitDate_bait').val(formatDate("yyyy-MM-dd",data.baitDate));
	}
	if(null==data.assweldStatus){
		$('#assweld-slider-tab').css("display","none");
	}else{
		$('#productCode_assweld').val(data.productCode);
		$('#productName_assweld').val(data.productName);
		$('#productModel_assweld').val(data.productModel);
		$('#makeNumberCode_assweld').val(data.makeNumberCode);
		$('#fcount_assweld').val(data.fcount);
		$('#baitDate_assweld').val(formatDate("yyyy-MM-dd",data.assweldDate));
	}
	if(null==data.assembleStatus){
		$('#assemble-slider-tab').css("display","none");
	}else{
		$('#productCode_assemble').val(data.productCode);
		$('#productName_assemble').val(data.productName);
		$('#productModel_assemble').val(data.productModel);
		$('#makeNumberCode_assemble').val(data.makeNumberCode);
		$('#fcount_assemble').val(data.fcount);
		$('#baitDate_assemble').val(formatDate("yyyy-MM-dd",data.assembleDate));
	}
	if(null==data.deliveryStatus){
		$('#delivery-slider-tab').css("display","none");
	}else{
		$('#productCode_delivery').val(data.productCode);
		$('#productName_delivery').val(data.productName);
		$('#productModel_delivery').val(data.productModel);
		$('#makeNumberCode_delivery').val(data.makeNumberCode);
		$('#fcount_delivery').val(data.fcount);
		$('#baitDate_delivery').val(formatDate("yyyy-MM-dd",data.deliveryDate));
	}
}
function dispatchData(data){
	var obj = null;
	var hid = '';
	var html = '';
	for(var i=0;i<5;i++){
		if(i==0){
			obj = data.bracketLists;
			hid = 'bracketlistcontent';
			html = addContent_zx(obj);
		}else if(i==1){
			obj = data.baitLists;
			hid = 'baitlistcontent';
			html = addContent_zx(obj);
		}else if(i==2){
			obj = data.assweldLists;
			hid = 'assweldlistcontent';
			html = addContent_zzf(obj);
		}else if(i==3){
			obj = data.assembleLists;
			hid = 'assemblelistcontent';
			html = addContent_zzf(obj);
		}else{
			obj = data.deliveryLists;
			hid = 'deliverylistcontent';
			html = addContent_zzf(obj);
		}
		$('#'+hid).html(html);
		closeblockdiv();
	}
}
function addContent_zx(obj){
	var html = '';
	$.each(obj,function(i,o){
		html+='<tr align="center">';
		html+='<td>'+(i+1)+'</td>';
		html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
		html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
		html+='<td>'+(o.sweight==null?"":o.sweight)+'</td>';
		html+='<td>'+(o.aweight==null?"":o.aweight)+'</td>';
		html+='<td>'+(o.slen==null?"":o.slen)+'</td>';
		html+='<td>'+(o.alen==null?"":o.alen)+'</td>';
		//html+='<td>'+replaceNull(o.checkno)+'</td>';
		//html+='<td>'+replaceNull(o.dispenserName)+'</td>';
		//html+='<td>'+replaceNull(o.receiverName)+'</td>';
		//html+='<td>'+replaceNull(o.checkerName)+'</td>';
		//html+='<td>'+replaceNull(o.baitDate)+'</td>';
		html+='</tr>';
	});
	return html;
}
function addContent_zzf(obj){
	var html = '';
	$.each(obj,function(i,o){
		html+='<tr align="center">';
		html+='<td>'+(i+1)+'</td>';
		html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
		html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
		html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
		html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
		html+='<td>'+(o.fmark==null?"":o.fmark)+'</td>';
		//html+='<td>'+replaceNull(o.checkno)+'</td>';
		//html+='<td>'+replaceNull(o.dispenserName)+'</td>';
		//html+='<td>'+replaceNull(o.receiverName)+'</td>';
		//html+='<td>'+replaceNull(o.checkerName)+'</td>';
		//html+='<td>'+replaceNull(o.planreachTime)+'</td>';
		//html+='<td>'+replaceNull(o.baitDate)+'</td>';
		html+='</tr>';
	});
	return html;
}
function loadtools(data){
	if(data.bracketStatus==-1){
		$('#rebackinfo_start_bracket').text("被驳回,原因:"+data.bracketStatusDesc).css("display","").css("color","red");
	}else if(data.bracketStatus==100){
		$('#examinestatusdiv_bracket').css("display","");
		$('#unexaminebtn_bait').css("display","");
		$('#currentprocess_bracket').text("已完工!");
		$('#endwork_bracket').css("display","none");
		$('#examinestatusdiv_bracket').css("display","");
		$('#changebtn_bracket').css("display","");
	}else if(data.bracketLists.length==0){
		$('#uploadDiv_bracket').css("display","");
	}else if(data.bracketStatus==99){
		$('#startwork_bracket').css("display","none");
		$('#endwork_bracket').css("display","");
		$('#examinestatusdiv_bracket').css("display","");
		$('#currentprocess_bracket').text("已开工!");
		$('#changebtn_bracket').css("display","");
	}else{
		$('#changebtn_bracket').css("display","none");
		$('#startwork_bracket').css("display","");
		//$('#pushbtn_bracket').css("display","");
	}
	if(data.baitStatus==-1){
		$('#rebackinfo_start_bait').text("被驳回,原因:"+data.baitStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bait').css("display","");
	}else if(data.baitStatus==100){
		$('#examinestatusdiv_bait').css("display","");
		$('#endwork_bait').css("display","none");
		$('#currentprocess_bait').text("已完工!");
		$('#changebtn_bait').css("display","");
	}else if(data.baitLists.length==0){
		$('#uploadDiv_bait').css("display","");
	}else if(data.baitStatus==99){
		$('#startwork_bait').css("display","none");
		$('#endwork_bait').css("display","");
		$('#examinestatusdiv_bait').css("display","");
		$('#currentprocess_bait').text("已开工!");
		$('#changebtn_bait').css("display","");
	}else{
		$('#changebtn_bait').css("display","none");
		$('#startwork_bait').css("display","");
		//$('#pushbtn_bait').css("display","");
	}
	if(data.assweldStatus==100){
		$('#examinestatusdiv_assweld').css("display","");
		$('#endwork_assweld').css("display","none");
		$('#currentprocess_assweld').text("已完工!");
		$('#changebtn_assweld').css("display","");
	}else if(data.assweldLists.length==0){
		$('#uploadDiv_assweld').css("display","");
	}else if(data.assweldStatus==99){
		$('#startwork_assweld').css("display","none");
		$('#endwork_assweld').css("display","");
		$('#examinestatusdiv_assweld').css("display","");
		$('#currentprocess_assweld').text("已开工!");
		$('#changebtn_assweld').css("display","");
	}else{
		$('#changebtn_assweld').css("display","none");
		$('#startwork_assweld').css("display","");
		//$('#pushbtn_assweld').css("display","");
	}
	if(data.assembleStatus==100){
		$('#examinestatusdiv_assemble').css("display","");
		$('#endwork_assemble').css("display","none");
		$('#currentprocess_assemble').text("已完工!");
		$('#changebtn_assemble').css("display","");
	}else if(data.assembleLists.length==0){
		$('#uploadDiv_assemble').css("display","");
	}else if(data.assembleStatus==99){
		$('#startwork_assemble').css("display","none");
		$('#endwork_assemble').css("display","");
		$('#examinestatusdiv_assemble').css("display","");
		$('#currentprocess_assemble').text("已开工!");
		$('#changebtn_assemble').css("display","");
	}else{
		$('#changebtn_assemble').css("display","none");
		$('#startwork_assemble').css("display","");
		//$('#pushbtn_assemble').css("display","");
	}
	if(data.deliveryStatus==100){
		$('#examinestatusdiv_delivery').css("display","");
		$('#endwork_delivery').css("display","none");
		$('#currentprocess_delivery').text("已完工!");
		$('#changebtn_delivery').css("display","");
	}else if(data.deliveryLists.length==0){
		$('#uploadDiv_delivery').css("display","");
	}else if(data.deliveryStatus==99){
		$('#startwork_delivery').css("display","none");
		$('#endwork_delivery').css("display","");
		$('#examinestatusdiv_delivery').css("display","");
		$('#currentprocess_delivery').text("已开工!");
		$('#changebtn_delivery').css("display","none");
	}else{
		$('#changebtn_delivery').css("display","none");
		$('#startwork_delivery').css("display","");
		//$('#pushbtn_delivery').css("display","");
	}
	//loadexestatus(data);
}
/**
 * 进行下推，启动下料下推的流程
 * @param type 是下推还是审核 0下推 1审核
 */
var examineMark = '';
function exeprocess(type,mark){
	if(type==0){//是下推
		saveexamine(type,mark);
	}else{//是审核
		$('#fmark').val('');
		examineMark = mark;
		openDiv("examineAddDiv");
	}
}
function selectAccess(rv){
	if(rv==1){
		$('#rebackTR').css("display","none");
	}else if(rv==0){
		var nodeseq = $('#nodeSeq_'+examineMark).val();
		if(nodeseq==1){
			$('#rebackNode').html("<option value='0'>开始</option>");
			$('#rebackTR').css("display","");
		}else if(nodeseq>1){
			var url = ctx+"/processDetail/process-detail!listToQuery.htm";
			$.webAjax({
				type : "post",
				url : url,
				data: 'processDetailQuery.processId='+$('#productmanagetaskId').val(),
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
function saveexamine(type,mark){
	var examineinfo = '';
	if(type==0){//如果是下推按钮则不传审核类的信息
	}else if(type==1&&mark=='_blank'){//如果是审核操作要将信息传入
		mark = examineMark;
		//examineinfo = '&processExetask.examineStatus='+$('input[name="processExetask.examineStatus"]:checked').val()+
		//			  '&processExetask.fmark='+$('#fmark').val();
	}else{}
	var nodeseq = $('#nodeSeq_'+mark).val();
	if(nodeseq==undefined || nodeseq==null || nodeseq==''){
		nodeseq = 0;
	}
	var examineAddForm = $('#examineAddForm').serialize();
	var url = ctx+"/designAssist/design-assist!exeProcess.htm";
	var param = 'processExetask.productmanagetaskId='+$('#productmanagetaskId').val()+
				'&processExetask.sourceCode='+$('#sourceCode').val()+
				'&processExetask.nodeSeq='+nodeseq+
				'&processExetask.id='+$('#exeTaskId_'+mark).val()+
				'&processExetask.taskCode='+$('#taskcode_'+mark).val()+
				'&id='+$('#productmanagetaskId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: examineAddForm+"&"+param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("操作成功!");
				window.location.reload();
			}
		}
	});
}
/**
 * 装载正在执行的流程
 */
function loadexestatus(model){
	var url = ctx+"/processExetask/process-exetask!listToQuery.htm";
	var param = 'processExetaskQuery.productmanagetaskId='+$('#productmanagetaskId').val();
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(null!=data.processExetaskList&&data.processExetaskList.length>0){
					$.each(data.processExetaskList,function(i,o){
						if(o.taskCode=='TO_BRACKET_TASK'){
							$('#exeTaskId_bracket').val(o.id);
							$('#nodeSeq_bracket').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bracket').text(spantxt);
							$('#examinestatusdiv_bracket').css("display","");
							$('#examinebtn_bracket').css("display","");
							$('#pushbtn_bracket').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bracket').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_bracket').css("color","red");
							}
						}else if(o.taskCode=='TO_BAIT_TASK'){
							$('#exeTaskId_bait').val(o.id);
							$('#nodeSeq_bait').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bait').text(spantxt);
							$('#examinestatusdiv_bait').css("display","");
							$('#examinebtn_bait').css("display","");
							$('#pushbtn_bait').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bait').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_bait').css("color","red");
							}
						}else if(o.taskCode=='TO_ASSWELD_TASK'){
							$('#exeTaskId_assweld').val(o.id);
							$('#nodeSeq_assweld').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_assweld').text(spantxt);	
							$('#examinestatusdiv_assweld').css("display","");
							$('#examinebtn_assweld').css("display","");
							$('#pushbtn_assweld').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_assweld').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_assweld').css("color","red");
							}
						}else if(o.taskCode=='TO_ASSEMBLE_TASK'){
							$('#exeTaskId_assemble').val(o.id);
							$('#nodeSeq_assemble').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_assemble').text(spantxt);
							$('#examinestatusdiv_assemble').css("display","");
							$('#examinebtn_assemble').css("display","");
							$('#pushbtn_assemble').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_assemble').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_assemble').css("color","red");
							}
						}else if(o.taskCode=='TO_DELIVERY_TASK'){
							$('#exeTaskId_delivery').val(o.id);
							$('#nodeSeq_delivery').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_delivery').text(spantxt);
							$('#examinestatusdiv_delivery').css("display","");
							$('#examinebtn_delivery').css("display","");
							$('#pushbtn_delivery').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_delivery').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_delivery').css("color","red");
							}
						}else{
							
						}
					});
				}
			}
		}
	});
}
/**
 * 查看流程
 */
function checkprocesshis(mark){
	var url = ctx+"/processHistask/process-histask!listToQuery.htm";
	var param = 'processHistaskQuery.taskCode='+$('#taskcode_'+mark).val()+
				"&processHistaskQuery.productmanagetaskId="+$('#productmanagetaskId').val();
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
 * 加载相关的图纸
 * @param id
 * @param tabtype
 */
function loadFile(id,tabtype){
	var url = ctx+"/bomDrawTitle/bom-draw-title!loadFileList.htm";
	var param = 'bomDrawTitleQuery.tabType='+tabtype+"&bomDrawTitleQuery.designassistId="+id;
	$.webAjax({
		type : "post",
		url : url,
		data: param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.bomDrawTitleList,function(i,o){
					html+='<tr align="center">';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</a></td>';
					html+='<td>'+(o.fileName==null?"":o.fileName)+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="downLoadBomDraw('+o.id+');">下载</a></td>';
					html+='</tr>';
				});
				$('#bomdrawlistcontent').html(html);
				if(html == ''){
					alert("还没有图纸!");
				}else{
					openDiv('downLoadListDiv');
				}
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
	/*var elemIF = document.createElement("iframe");
	elemIF.src = ctx+"/bomDrawTitle/bom-draw-title!loadFiles.htm?designassistId="+id+"&tabType="+tabtype;
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);*/
}
/**
 * 下载文件
 * @param id 文件的ID
 */
function downLoadBomDraw(id){
	 var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+"/bomDrawTitle/bom-draw-title!downLoadBomDraw.htm?bomDrawTitleId="+id;
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
/**
 * 开工或者完工
 * @param type 1开工 2完工
 * @param modelMark tab标识
 */
function exework(type,modelMark){
	var url = ctx+"/productmanageTask/productmanage-task!save.htm";
	var param = "";
	var tip = '';
	if(type==1){
		tip = "确定开工吗?";
		if(modelMark=='bracket'){
			param = "bracketStatus=99&&bracketStatusDesc=开工";
		}else if(modelMark=='bait'){
			param = "baitStatus=99&&baitStatusDesc=开工";
		}else if(modelMark=='assweld'){
			param = "assweldStatus=99&&assweldStatusDesc=开工";
		}else if(modelMark=='assemble'){
			param = "assembleStatus=99&&assembleStatusDesc=开工";
		}else if(modelMark=='delivery'){
			param = "deliveryStatus=99&&deliveryStatusDesc=开工";
		}
	}else{
		tip = "确定完工吗?"
		if(modelMark=='bracket'){
			param = "bracketStatus=100&&bracketStatusDesc=完工";
		}else if(modelMark=='bait'){
			param = "baitStatus=100&&baitStatusDesc=完工";
		}else if(modelMark=='assweld'){
			param = "assweldStatus=100&&assweldStatusDesc=完工";
		}else if(modelMark=='assemble'){
			param = "assembleStatus=100&&assembleStatusDesc=完工";
		}else if(modelMark=='delivery'){
			param = "deliveryStatus=100&&deliveryStatusDesc=完工";
		}
	}
	param += "&id="+$('#productmanagetaskId').val();
	var flag = window.confirm(tip);
	if(flag){
		$.webAjax({
			type : "post",
			url : url,
			data: param,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("操作成功!");
					loaddesignassist();
				}
			}
		});
	}
}
/**
 * 查看变更内容
 * @param sourceid 源单的ID
 */
function checkchanges(sourceid,mark){
	var html='';
	var url = ctx+"/modelList/model-list!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data: "modelListQuery.modelMark=t_bomchange_list&modelListQuery.designassistId="+sourceid+"&modelListQuery.sortColumns=t_bomchange_list.changemark",
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.modelListList,function(i,o){
					var belong = '';
					var mmark = 't_'+mark+'_list';
					if(o.changemark!=mmark){
						return true;
					}
					if(o.changemark.trim()=='t_bracket_list'){
						belong = '支架';
					}else if(o.changemark.trim()=='t_bait_list'){
						belong = '下料';
					}else if(o.changemark.trim()=='t_assweld_list'){
						belong = '组焊';
					}else if(o.changemark.trim()=='t_assemble_list'){
						belong = '装配';
					}else{
						belong = '发货';
					}
					html+='<tr align="center">';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+(o.changestatus==1?"新增":"删除")+'</td>';
					html+='<td>'+belong+'</td>';
					html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.createTime)+'</td>';
					html += '</tr>';
				});
				$('#changecontentbody').html(html);
				openDiv("changecontentDiv");
			}
		}
	});
}