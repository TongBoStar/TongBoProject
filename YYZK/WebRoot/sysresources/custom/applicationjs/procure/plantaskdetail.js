$(document).ready(function() {
	openblockdiv();
	loaddesignassist();
});
var titleObj;
function loaddesignassist(){
	var url = ctx+"/planTask/plan-task!showToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data: 'planTaskId='+$('#sourceId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			titleObj = data;
			if(data.resultInfo[0]=='0'){
				addHead(data.model);
				dispatchData(data.model);
				loadtools(data.model);
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
		/*html+='<td>'+replaceNull(o.checkno)+'</td>';
		html+='<td>'+replaceNull(o.dispenserName)+'</td>';
		html+='<td>'+replaceNull(o.receiverName)+'</td>';
		html+='<td>'+replaceNull(o.checkerName)+'</td>';
		html+='<td>'+replaceNull(o.baitDate)+'</td>';*/
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
		/*html+='<td>'+replaceNull(o.checkno)+'</td>';
		html+='<td>'+replaceNull(o.dispenserName)+'</td>';
		html+='<td>'+replaceNull(o.receiverName)+'</td>';
		html+='<td>'+replaceNull(o.checkerName)+'</td>';
		html+='<td>'+replaceNull(o.planreachTime)+'</td>';
		html+='<td>'+replaceNull(o.baitDate)+'</td>';*/
		html+='</tr>';
	});
	return html;
}
/*function loadtools(data){
	if(data.bracketStatus==-1){
		$('#rebackinfo_start_bracket').text("被驳回,原因:"+data.bracketStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bracket').css("display","");
		$('#changebtn_bracket').css("display","none");
	}else if(data.bracketStatus==100||data.bracketStatus==50){
		if(data.bracketStatus==50){
			$('#changebtn_bracket').css("display","");
		}
		$('#examinestatusdiv_bracket').css("display","");
		$('#unexaminebtn_bracket').css("display","");
		$('#currentprocess_bracket').text("流程结束!");
	}else if(data.bracketLists.length==0){
	}else{
		$('#changebtn_bracket').css("display","none");
		$('#pushbtn_bracket').css("display","");
		$('#unexaminebtn_bracket').css("display","none");
	}
	
	if(data.baitStatus==-1){
		$('#rebackinfo_start_bait').text("被驳回,原因:"+data.baitStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bait').css("display","");
		$('#changebtn_bait').css("display","none");
	}else if(data.baitStatus==100||data.baitStatus==50){
		if(data.baitStatus==50){
			$('#changebtn_bait').css("display","");
		}
		$('#examinestatusdiv_bait').css("display","");
		$('#unexaminebtn_bait').css("display","");
		$('#currentprocess_bait').text("流程结束!");
	}else if(data.baitLists.length==0){
	}else{
		$('#changebtn_bait').css("display","none");
		$('#pushbtn_bait').css("display","");
		$('#unexaminebtn_bait').css("display","none");
	}
	
	
	if(data.assweldStatus==-1){
		$('#rebackinfo_start_assweld').text("被驳回,原因:"+data.assweldStatusDesc).css("display","").css("color","red");
		$('#pushbtn_assweld').css("display","");
		$('#changebtn_assweld').css("display","none");
	}else if(data.assweldStatus==100||data.assweldStatus==50){
		if(data.assweldStatus==50){
			$('#changebtn_assweld').css("display","");
		}
		$('#examinestatusdiv_assweld').css("display","");
		$('#unexaminebtn_assweld').css("display","");
		$('#currentprocess_assweld').text("流程结束!");
	}else if(data.assweldLists.length==0){
	}else{
		$('#changebtn_assweld').css("display","none");
		$('#pushbtn_assweld').css("display","");
		$('#unexaminebtn_assweld').css("display","none");
	}
	
	if(data.assembleStatus==-1){
		$('#rebackinfo_start_assemble').text("被驳回,原因:"+data.assembleStatusDesc).css("display","").css("color","red");
		$('#pushbtn_assemble').css("display","");
		$('#changebtn_assemble').css("display","none");
	}else if(data.assembleStatus==100||data.assembleStatus==50){
		if(data.assembleStatus==50){
			$('#changebtn_assemble').css("display","");
		}
		$('#examinestatusdiv_assemble').css("display","");
		$('#unexaminebtn_assemble').css("display","");
		$('#currentprocess_assemble').text("流程结束!");
	}else if(data.assembleLists.length==0){
	}else{
		$('#changebtn_assemble').css("display","none");
		$('#pushbtn_assemble').css("display","");
		$('#unexaminebtn_assemble').css("display","none");
	}
	
	if(data.deliveryStatus==-1){
		$('#rebackinfo_start_delivery').text("被驳回,原因:"+data.deliveryStatusDesc).css("display","").css("color","red");
		$('#pushbtn_delivery').css("display","");
		$('#changebtn_delivery').css("display","none");
	}else if(data.deliveryStatus==100||data.deliveryStatus==50){
		 if(data.deliveryStatus==50){
			$('#changebtn_delivery').css("display","");
		}
		$('#examinestatusdiv_delivery').css("display","");
		$('#unexaminebtn_delivery').css("display","");
		$('#currentprocess_delivery').text("流程结束!");
	}else if(data.deliveryLists.length==0){
	}else{
		$('#changebtn_delivery').css("display","none");
		$('#pushbtn_delivery').css("display","");
		$('#unexaminebtn_delivery').css("display","none");
	}
	loadexestatus(data);
}*/
function loadtools(data){
	if(data.bracketStatus==-1){
		$('#rebackinfo_start_bracket').text("被驳回,原因:"+data.bracketStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bracket').css("display","");
		$('#examinebtn_bracket').css("display","none");
	}else if(data.bracketStatus==100||data.bracketStatus==50){
		if(data.bracketStatus==50){
			$('#changebtn_bracket').removeClass("btn btn-info");
			$('#changebtn_bracket').addClass("btn btn-primary");
		}
		if(data.bracketStatus==100){
			$('#changebtn_bracket').removeClass("btn btn-primary");
			$('#changebtn_bracket').addClass("btn btn-info");
		}
		$('#changebtn_bracket').css("display","");
		$('#examinestatusdiv_bracket').css("display","");
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","none");
		$('#unexaminebtn_bracket').css("display","");
		$('#currentprocess_bracket').text("流程结束!");
	}else if(data.bracketLists.length==0){
		//$('#uploadDiv_bracket').css("display","");
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","none");
		$('#detialdiv_bracket').css("display","none");
	}else if(null==data.bracketStatus||data.bracketStatus==0){
		$('#pushbtn_bracket').css("display","");
		$('#examinebtn_bracket').css("display","none");
		$('#unexaminebtn_bracket').css("display","none");
	}else{
		$('#pushbtn_bracket').css("display","none");
		$('#examinebtn_bracket').css("display","");
	}
	if(data.baitStatus==-1){
		$('#rebackinfo_start_bait').text("被驳回,原因:"+data.baitStatusDesc).css("display","").css("color","red");
		$('#pushbtn_bait').css("display","");
	}else if(data.baitStatus==100||data.baitStatus==50){
		if(data.baitStatus==50){
			$('#changebtn_bait').removeClass("btn btn-info");
			$('#changebtn_bait').addClass("btn btn-primary");
		}
		if(data.baitStatus==100){
			$('#changebtn_bait').removeClass("btn btn-primary");
			$('#changebtn_bait').addClass("btn btn-info");
		}
		$('#changebtn_bait').css("display","");
		$('#examinestatusdiv_bait').css("display","");
		$('#pushbtn_bait').css("display","none");
		$('#examinebtn_bait').css("display","none");
		$('#unexaminebtn_bait').css("display","");
		$('#currentprocess_bait').text("流程结束!");
	}else if(data.baitLists.length==0){
		//$('#uploadDiv_bait').css("display","");
		$('#pushbtn_bait').css("display","none");
		$('#examinebtn_bait').css("display","none");
		$('#detialdiv_bait').css("display","none");
	}else if(null==data.baitStatus||data.baitStatus==0){
		$('#pushbtn_bait').css("display","");
		$('#examinebtn_bait').css("display","none");
		$('#unexaminebtn_bait').css("display","none");
	}else{
		$('#pushbtn_bait').css("display","none");
		$('#examinebtn_bait').css("display","");
	}
	if(data.assweldStatus==-1){
		$('#rebackinfo_start_assweld').text("被驳回,原因:"+data.assweldStatusDesc).css("display","").css("color","red");
		$('#pushbtn_assweld').css("display","");
		$('#examinebtn_assweld').css("display","none");
	}else if(data.assweldStatus==100||data.assweldStatus==50){
		if(data.assweldStatus==50){
			$('#changebtn_assweld').removeClass("btn btn-info");
			$('#changebtn_assweld').addClass("btn btn-primary");
		}
		if(data.assweldStatus==100){
			$('#changebtn_assweld').removeClass("btn btn-primary");
			$('#changebtn_assweld').addClass("btn btn-info");
		}
		$('#changebtn_assweld').css("display","");
		$('#examinestatusdiv_assweld').css("display","");
		$('#pushbtn_assweld').css("display","none");
		$('#examinebtn_assweld').css("display","none");
		$('#unexaminebtn_assweld').css("display","");
		$('#currentprocess_assweld').text("流程结束!");
	}else if(data.assweldLists.length==0){
		//$('#uploadDiv_assweld').css("display","");
		$('#pushbtn_assweld').css("display","none");
		$('#examinebtn_assweld').css("display","none");
		$('#detialdiv_assweld').css("display","none");
	}else if(null==data.assweldStatus||data.assweldStatus==0){
		$('#pushbtn_assweld').css("display","");
		$('#examinebtn_assweld').css("display","none");
		$('#unexaminebtn_assweld').css("display","none");
	}else{
		$('#pushbtn_assweld').css("display","none");
		$('#examinebtn_assweld').css("display","");
	}
	if(data.assembleStatus==-1){
		$('#rebackinfo_start_assemble').text("被驳回,原因:"+data.assembleStatusDesc).css("display","").css("color","red");
		$('#pushbtn_assemble').css("display","");
		$('#examinebtn_assemble').css("display","none");
	}else if(data.assembleStatus==100||data.assembleStatus==50){
		if(data.assembleStatus==50){
			$('#changebtn_assemble').removeClass("btn btn-info");
			$('#changebtn_assemble').addClass("btn btn-primary");
		}
		if(data.assembleStatus==100){
			$('#changebtn_assemble').removeClass("btn btn-primary");
			$('#changebtn_assemble').addClass("btn btn-info");
		}
		$('#changebtn_assemble').css("display","");
		$('#examinestatusdiv_assemble').css("display","");
		$('#pushbtn_assemble').css("display","none");
		$('#examinebtn_assemble').css("display","none");
		$('#unexaminebtn_assemble').css("display","");
		$('#currentprocess_assemble').text("流程结束!");
	}else if(data.assembleLists.length==0){
		//$('#uploadDiv_assemble').css("display","");
		$('#pushbtn_assemble').css("display","none");
		$('#examinebtn_assemble').css("display","none");
		$('#detialdiv_assemble').css("display","none");
	}else if(null==data.assembleStatus||data.assembleStatus==0){
		$('#pushbtn_assemble').css("display","");
		$('#examinebtn_assemble').css("display","none");
		$('#unexaminebtn_assemble').css("display","none");
	}else{
		$('#pushbtn_assemble').css("display","none");
		$('#examinebtn_assemble').css("display","");
	}
	if(data.deliveryStatus==-1){
		$('#rebackinfo_start_delivery').text("被驳回,原因:"+data.deliveryStatusDesc).css("display","").css("color","red");
		$('#pushbtn_delivery').css("display","");
		$('#examinebtn_delivery').css("display","none");
	}else if(data.deliveryStatus==100||data.deliveryStatus==50){
		if(data.deliveryStatus==50){
			$('#changebtn_delivery').removeClass("btn btn-info");
			$('#changebtn_delivery').addClass("btn btn-primary");
		}
		if(data.deliveryStatus==100){
			$('#changebtn_delivery').removeClass("btn btn-primary");
			$('#changebtn_delivery').addClass("btn btn-info");
		}
		$('#changebtn_delivery').css("display","");
		$('#examinestatusdiv_delivery').css("display","");
		$('#pushbtn_delivery').css("display","none");
		$('#examinebtn_delivery').css("display","none");
		$('#unexaminebtn_delivery').css("display","");
		$('#currentprocess_delivery').text("流程结束!");
	}else if(data.deliveryLists.length==0){
		//$('#uploadDiv_delivery').css("display","");
		$('#pushbtn_delivery').css("display","none");
		$('#examinebtn_delivery').css("display","none");
		$('#detialdiv_delivery').css("display","none");
	}else if(null==data.deliveryStatus||data.deliveryStatus==0){
		$('#pushbtn_delivery').css("display","");
		$('#examinebtn_delivery').css("display","none");
		$('#unexaminebtn_delivery').css("display","none");
	}else{
		$('#pushbtn_delivery').css("display","none");
		$('#examinebtn_delivery').css("display","");
	}
	loadexestatus(data);
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
	var value = $("input[name='processExetask.examineStatus'][type='radio']:checked").val();
	var fmark = $("#fmark").val();
	if(value=='0'){
		if(fmark==null||$.trim(fmark)==""){
			alert("请输入驳回原因！");
			$("#fmark").focus();
			return;
		}
	}
	block_viewport("请稍等...");
	var examineAddForm = $('#examineAddForm').serialize();
	var url = ctx+"/planTask/plan-task!exeProcess.htm";
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
				xval.remove();
				window.location.reload();
			}else{
				alert(data.resultInfo[1]);
				xval.remove();
			}
		}
	});
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
						if(o.taskCode=='TO_BRACKET_PUSHPLAN_TASK'){
							$('#exeTaskId_bracket').val(o.id);
							$('#nodeSeq_bracket').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bracket').text(spantxt);
							$('#examinestatusdiv_bracket').css("display","");
							$('#examinebtn_bracket').css("display",parseApproer(o.handlers));
							$('#pushbtn_bracket').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bracket').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_bracket').css("color","red");
							}
						}else if(o.taskCode=='TO_BAIT_PUSHPLAN_TASK'){
							$('#exeTaskId_bait').val(o.id);
							$('#nodeSeq_bait').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_bait').text(spantxt);
							$('#examinestatusdiv_bait').css("display","");
							$('#examinebtn_bait').css("display",parseApproer(o.handlers));
							$('#pushbtn_bait').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_bait').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_bait').css("color","red");
							}
						}else if(o.taskCode=='TO_ASSWELD_PUSHPLAN_TASK'){
							$('#exeTaskId_assweld').val(o.id);
							$('#nodeSeq_assweld').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_assweld').text(spantxt);	
							$('#examinestatusdiv_assweld').css("display","");
							$('#examinebtn_assweld').css("display",parseApproer(o.handlers));
							$('#pushbtn_assweld').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_assweld').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_assweld').css("color","red");
							}
						}else if(o.taskCode=='TO_ASSEMBLE_PUSHPLAN_TASK'){
							$('#exeTaskId_assemble').val(o.id);
							$('#nodeSeq_assemble').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_assemble').text(spantxt);
							$('#examinestatusdiv_assemble').css("display","");
							$('#examinebtn_assemble').css("display",parseApproer(o.handlers));
							$('#pushbtn_assemble').css("display","none");
							if(o.isreback==1){
								$('#rebackinfo_assemble').text("(被驳回,原因:"+o.fmark+")");
								$('#rebackinfo_assemble').css("color","red");
							}
						}else if(o.taskCode=='TO_DELIVERY_PUSHPLAN_TASK'){
							$('#exeTaskId_delivery').val(o.id);
							$('#nodeSeq_delivery').val(o.nodeSeq);
							var spantxt = o.nodeName+",执行人:"+o.handlers;
							$('#currentprocess_delivery').text(spantxt);
							$('#examinestatusdiv_delivery').css("display","");
							$('#examinebtn_delivery').css("display",parseApproer(o.handlers));
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
	var statusmark = 0;
	if(mark=="bracket"&&titleObj.model.bracketStatus!=null){
		statusmark= titleObj.model.bracketStatus;
	}else if(mark=="bait"&&titleObj.model.baitStatus!=null){
		statusmark= titleObj.model.baitStatus;
	}else if(mark=="assweld"&&titleObj.model.assweldStatus!=null){
		statusmark= titleObj.model.assweldStatus;
	}else if(mark=="assemble"&&titleObj.model.assembleStatus!=null){
		statusmark= titleObj.model.assembleStatus;
	}else if(mark=="delivery"&&titleObj.model.deliveryStatus!=null){
		statusmark= titleObj.model.deliveryStatus;
	}else{
		
	}
	var url = ctx+"/processHistask/process-histask!listToQueryAll.htm";
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
							status = '已执行:驳回';
						}else if(o.examineStatus==1){
							status = '已执行:审批通过';
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
						if(i==data.processHistaskList.length-1){
							//html += parseProcessDetails(data.processDetails,o.nodeSeq,i+1);
							var seqnum=0;
							if(o.examineStatus==0){
								if(o.backnode!=null&&o.backnode>0){
									seqnum =o.backnode-1;
								}
							}else{
								if(statusmark==0){
									seqnum=0;
								}else{
									seqnum = o.nodeSeq;
								}
							}
							html += parseProcessDetails(data.processDetails,seqnum,i+1);
						}
					});
				}else{
					html += parseProcessDetails(data.processDetails,0,0);
				}
				$('#processcontent').html(html);
				openDiv('checkDiv');
			}
		}
	});
}
/**
 * 将要执行的流程
 * @param obj 流程明细
 * @param seq 流程顺序
 * @param index 序号
 * @returns {String} 返回一条记录
 */
function parseProcessDetails(obj,seq,index){
	var indextemp = index+1;
	var html = '';
	var stye = ' style="background-color:#A8B6E8;"';
	$.each(obj,function(i,o){
		if(o.nodeSeq>seq&&o.nodeType==1){
			html += "<tr>";
			html += "<td "+stye+">"+indextemp+"</td>";
			html += "<td "+stye+">";
			$.each(o.processHandleList,function(n,m){
				html +=m.handlerName+" ";
			});
			html += "</td "+stye+">";
			html += "<td "+stye+">"+o.nodeName+"</td>";
			html += "<td "+stye+">未进行</td>";
			html += "<td "+stye+"></td>";
			html += "<td "+stye+"></td>";
			html += "</tr>";
			indextemp++;
		}
	});
	return html;
}

function parseApproer(approers){
	var show = "none";
	if(approers.length>1){
		var approves = approers.split(" ");
		$.each(approves,function(n,m){
			if(m==realName){
				show = "";
			}
		});
	}
	return show;
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
 * 反审单据
 * @param type
 * @param modelmark
 */
function unexamine(type,modelmark){
	var flag = window.confirm("确定反审吗？");
	if(flag){
		var url = ctx+"/planTask/plan-task!unexamineToJson.htm";
		$.webAjax({
			type : "post",
			url : url,
			data:  "planTaskQuery.fmark="+modelmark+"&planTaskQuery.id="+$('#sourceId').val(),
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("反审成功!");
					loaddesignassist();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
var pushmark = '';
/**
 * 查看变更内容
 * @param sourceid 源单的ID
 */
function checkchanges(sourceid,mark){
	pushmark = mark;
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
					var changedesc = '';
					if(o.changestatus==1){
						changedesc = '新增';
					}else if(o.changestatus==2){
						changedesc = '修改';
					}else if(o.changestatus==3){
						changedesc = '删除';
					}else{
						
					}
					html+='<tr align="center">';
					html+='<td>'+(i+1);
					html+='<input type="hidden" name="modelLists['+i+'].changestatus" value="'+replaceNull(o.changestatus)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].designassistId" value="'+replaceNull(o.designassistId)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].id" value="'+replaceNull(o.id)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].modelMark" value="'+mmark+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].alen" value="'+replaceNull(o.alen)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].slen" value="'+replaceNull(o.slen)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].aweight" value="'+replaceNull(o.aweight)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].sweight" value="'+replaceNull(o.sweight)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].itemname" value="'+replaceNull(o.itemname)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].itemcode" value="'+replaceNull(o.itemcode)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].fcount" value="'+replaceNull(o.fcount)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].modifycount" value="'+replaceNull(o.modifycount)+'"/>';
					html+='<input type="hidden" name="modelLists['+i+'].fmatrial" value="'+replaceNull(o.fmatrial)+'"/>';
					html +='</td>';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.fmatrial==null?"":o.fmatrial)+'</td>';
					html+='<td>'+(o.fcount==null?"":o.fcount)+'</td>';
					html+='<td>'+(o.modifycount==null?"":o.modifycount)+'</td>';
					html+='<td>'+changedesc+'</td>';
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
/**
 * 下推变更
 */
function pushchange(){
	var paramForm = $('#changecontentForm').serialize();
	var flag = window.confirm("确定下推变更吗？");
	if(flag){
		var url = ctx+"/planTask/plan-task!pushchange.htm";
		$.webAjax({
			type : "post",
			url : url,
			data: paramForm,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("变更下推成功!");
				}else{
					alert(data.resultInfo[1]);
				}
				closeDiv('changecontentDiv');
			}
		});
	}
}