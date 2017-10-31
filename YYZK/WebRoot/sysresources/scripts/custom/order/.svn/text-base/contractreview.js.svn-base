$(document).ready(function() {
	//openblockdiv();
	closeblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'contractreviewpage',
		formId: 'queryform',
		pageNo: '1',
		pageSize : '10',
		order: 'desc',
		orderBy: 'contractReviewId',
		submitForm : submitQueryForm//分页回调函数
		});
	/**设置点击弹出框之外的元素 弹出框消失*/
	document.body.onclick = function(e){
	 e = e || window.event;
	 var target = e.target || e.srcElement;
	 if(target.id == "selectSalePrincipalDiv"||target.id == "salePrincipal"
		 ||target.id == "selectExamineUserDiv"||target.id == "userName") {
		 return;
	 }else{
		 $('#selectSalePrincipalDiv').css("display","none");
		 $('#selectExamineUserDiv').css("display","none");
	 }
	};
	var currenturl = window.document.location.href;
	if(currenturl.indexOf('contractreview-list.htm')>=0){
		loadContractReviews();
	}
});
function submitQueryForm(simpleTable, param){
	loadContractReviews();
}
function toAddContractReview(){
	window.location.href = ctx+"/order/contractreview-add.htm";
}

/**
 * 查询合同评审单信息
 */
function loadContractReviews() {
	
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx + '/contractReview/contract-review!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"contractreviewpage",simpleTable);
			//组装table
			$.each(page.result, function(i, o){
				var status;
				var reviewType = "";
				var editorder = "";
				var submitorder = "";
				var examineorder = "";
				var checkurl = '<a href="javascript:toCheckFinal('+o.contractReviewId+',\''+o.orderCode+'\');">查看</a>|';
				if(o.reviewType=='1'){
					reviewType = "评审方式一";
				}else if(o.reviewType=='2'){
					reviewType = "评审方式二";
				}else{
					reviewType = "评审方式三";
				}
				if(o.reviewStatus==0){
					status= "待提交";
					editorder = '<a href="javascript:toEditContractReview('+o.contractReviewId+',\''+o.orderCode+'\');">修改</a>|';
					submitorder = '<a href="javascript:submitContractReview('+o.contractReviewId+');">提交</a>|';
				}else if(o.reviewStatus==1){
					status= "正在审核";
					examineorder = '<a href="javascript:toExamineContractReview('+o.contractReviewId+',\''+o.orderCode+'\');">审核</a>|';
				}else if(o.reviewStatus==2){
					status= "已生效";
					checkurl = '<a href="javascript:toCheckFinal('+o.contractReviewId+',\''+o.orderCode+'\');">查看</a>|';
				}else if(o.reviewStatus==3){
					status= "被驳回";
					editorder = '<a href="javascript:toEditContractReview('+o.contractReviewId+',\''+o.orderCode+'\');">修改</a>|';
					submitorder = '<a href="javascript:submitContractReview('+o.contractReviewId+');">提交</a>|';
				}else{
					status= "未知";
				}
				
				html += '<tr>';
				html += '<td><input type="checkbox"  id="checkedOrder" name="checkedContractReview" value="' + o.contractReviewId + '"/></td>';
				html += '<td>'+replaceNull(o.orderCode)+'</td><td>' + replaceNull(o.contractCode) + '</td><td>' + replaceNull(o.customerName) + '</td>';
				html += '<td>' + reviewType + '</td><td>' + replaceNull(o.projectName) + '</td><td>' + replaceNull(o.contractFee) + '</td>';
				html +=  '</td><td>'+replaceNull(o.salePrincipal)+'</td><td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.createTime) +'</td><td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.examineTime) +'</td><td>' + status +'</td>';
				html += '<td>'+editorder+submitorder+examineorder+checkurl+'</td>';
				html += '</tr>';
			});
			$('#data-body').html(html);
			
		}
	});
}
/**
 * 保存评审单
 */
function savecontractreview(){
	var examinerListObj = $('td[name="userNameTD"]');
	var examinerList = "";
	for(var i=0;i<examinerListObj.length;i++){
		examinerList += $('input[name="creviewExInfoIdTD"]').eq(i).val()+",";
		examinerList += $('td[name="userNameTD"]').eq(i).text()+",";
		examinerList += $('td[name="departmentTD"]').eq(i).text()+",";
		examinerList += $('td[name="roleNameTD"]').eq(i).text()+",";
		examinerList += $('input[name="hiddenUserId"]').eq(i).val()+"|";
	}
	$('#examinerList').val(examinerList);
	$('#delList').val(delList);
	if(checkOrderParams()){
		submitForm();
	}
}
/**
 * 执行保存
 */
function submitForm() {
	var pageParam = simpleTable.bindPageParam();
	var queryForm = $('#queryForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/contractReview/contract-review!save.htm',
			data :pageParam +'&'+queryForm,
			success : function(data) {
				window.location.href = ctx+"/order/contractreview-list.htm";
			}
		});
	}
}
/**
 * 校验订单各参数
 * @returns {Boolean}
 */
function checkOrderParams(){
	if($.trim($('#orderCode').val())==""){
		alert("订单编号不能为空!");
	}else if($.trim($('#contractCode').val())==""){
		alert("合同编号不能为空!");
	}else if($.trim($('#customerName').val())==""){
		alert("客户名称不能为空!");
	}else if($.trim($('#projectName').val())==""){
		alert("项目名称不能为空!");
	}else if($.trim($('#contractFee').val())==""){
		alert("合同金额不能为空!");
	}else if(isNaN($.trim($('#contractFee').val()))){
		alert("合同金额必须为数字!");
	}else if($.trim($('#salePrincipal').val())==""){
		alert("销售负责人不能为空!");
	}else{
		return true;
	}
	return false;
	/**
	else if($.trim($('#saleManager').val())==""){
		alert("必须指定销售部门审核人!");
	}else if($.trim($('#financeManager').val())==""){
		alert("必须指定财务部门审核人!");
	}else if($.trim($('#customerServiceManager').val())==""){
		alert("必须指定售后部门审核人!");
	}else if($.trim($('#materialControlManager').val())==""){
		alert("必须指定计划物控部门审核人!");
	}else if($.trim($('#makeManager').val())==""){
		alert("必须指定制造部门审核人!");
	}else if($.trim($('#purchaseManager').val())==""){
		alert("必须指定采购部门审核人!");
	}else if($.trim($('#projectSupporter').val())==""){
		alert("必须指定项目部技术支持审核人!");
	}else if($.trim($('#projectManager').val())==""){
		alert("必须指定项目部门审核人!");
	}else if($.trim($('#orderWorker').val())==""){
		alert("必须指定订单管理员!");
	}else if($.trim($('#orderManager').val())==""){
		alert("必须指定订单部门审核人!");
	}else if($.trim($('#qualityManager').val())==""){
		alert("必须指定品管部门审核人!");
	}else if($.trim($('#manager').val())==""){
		alert("必须指定最后审核人!");
	}*/
}
/**
 * 跳转到变更合同评审单页面
 * @param id 要编辑的评审单的id
 */
function toEditContractReview(id,orderCode){
	window.location.href = ctx+"/order/contractreview-add.htm?contractReviewId="+id+"&orderCode="+orderCode;
}
var delList = "";
/**
 * 编辑变更通知单
 * @param id 要编辑的通知单的id
 */
function editContractReview(id,orderCode){
	delList = "";
	if(null!=id&&id!=""){
		$.webAjax({
			type : 'post',
			url : ctx + '/contractReview/contract-review!input.htm',
			data:{"contractreviewId":id,"creviewExamineInfoQuery.orderCode":orderCode},
			success : function(data) {
				var cExamineInfos = data.cExamineInfos;
				var contractReview = data.contractReview;
				$('#contractReviewIdHidden').val(contractReview.contractReviewId);
				$('#orderCode').val(contractReview.orderCode);
				$('#contractCode').val(contractReview.contractCode);
				$('#customerName').val(contractReview.customerName);
				$('#reviewType').val(contractReview.reviewType);
				$('#projectName').val(contractReview.projectName);
				$('#contractFee').val(contractReview.contractFee);
				$('#salePrincipal').val(contractReview.salePrincipal);
				$('#salePrincipalId').val(contractReview.salePrincipalId);
				var html = "";
				for(var i=0;i<cExamineInfos.length;i++){
					html += "<tr id='TR"+i+"'>";
					html += '<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delExamineTr('+i+','+cExamineInfos[i].examineInfoId+');"/>';
					html += '<input name="creviewExInfoIdTD" type="hidden" value="'+cExamineInfos[i].examineInfoId+'"/><input type="hidden" name="hiddenUserId" value="'+cExamineInfos[i].userId+'"/></td>';
					html += "<td name='userNameTD' colspan='2'>"+cExamineInfos[i].userName+"</td>";
					html += "<td name='departmentTD' colspan='2'>"+cExamineInfos[i].department+"</td>";
					html += "<td name='roleNameTD' colspan='2'>"+cExamineInfos[i].roleName+"</td>";
					html += "</tr>";
				}
				$('#addExaminePersonBefore').before(html);
			}
		});
	}
}
/**
 * 返回到合同评审单列表
 */
function toContractReviewList(){
	window.location.href = ctx+"/order/contractreview-list.htm";
}
/**
 * 跳转到审核页面
 */
function toExamineContractReview(contractReviewId,orderCode){
	window.location.href=ctx+"/order/questionandreply.htm?contractReviewId="+contractReviewId+"&orderCode="+orderCode;
}
var tempid = "";
var tempOrderCode = "";
/**
 * 编辑问题回复列表并进行审核
 * @param id
 */
function editQuestionAndReply(id,orderCode){
	tempid = id;
	tempOrderCode = orderCode;
	window.simpleTableTmp =$(document).SimpleTable({
		id:'questionandreplypage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '10',
		order: 'desc',
		orderBy: 'questionAndReplyId',
		submitForm : qrlistFor//分页回调函数
		});
	if(null!=id&&id!=""){
		baseReview(id);
		qrlist(id,orderCode);
	}
}
function qrlistFor(){
	qrlist(tempid,tempOrderCode);
}
function baseReview(id){
	$.webAjax({
		type : 'post',
		url : ctx + '/contractReview/contract-review!input.htm?contractreviewId='+id,
		success : function(data) {
			var contractReview = data.contractReview;
			var reviewType = "";
			if(contractReview.reviewType=='1'){
				reviewType = "评审方式一";
			}else if(contractReview.reviewType=='2'){
				reviewType = "评审方式二";
			}else{
				reviewType = "评审方式三";
			}
			$('#contractReviewIdHidden').val(contractReview.contractReviewId);
			$('#orderCode').html(contractReview.orderCode);
			$('#contractCode').html(contractReview.contractCode);
			$('#customerName').html(contractReview.customerName);
			$('#reviewType').html(reviewType);
			$('#projectName').html(contractReview.projectName);
			$('#contractFee').html(contractReview.contractFee);
			$('#salePrincipal').html(contractReview.salePrincipal);
		}
	});
}
function qrlist(id,orderCode){
	var formParam = $('#queryForm').serialize();
	var pageParam = simpleTableTmp.bindPageParam();
	$.webAjax({
		type : 'post',
		url : ctx + '/contractReview/contract-review!findQRPage.htm?questionAndReplyQuery.orderCode='+orderCode,
		data :formParam+"&"+pageParam,
		success : function(data) {
			var qrdata = $.parseJSON(data);
			var page = qrdata.qrPage;
			//刷新分页控件
			$.refreshPageToolbar(page,"questionandreplypage",simpleTableTmp);
			var html = "";
			var status = "";
			var isanswer = "";
			$.each(page.result, function(i, o){
				if(o.fstatus==1){
					status = "通过";
					isanswer = "";
				}else{
					status = "不通过";
					isanswer = "<a href='#' onclick='answerQuestion("+o.questionAndReplyId+");'>回复</a>";
				}
				html += "<tr>";
				html += "<td colspan='3'>"+o.question+"</td>";
				html += "<td>"+status+"&nbsp;&nbsp;"+o.questioner+"&nbsp;&nbsp;"+formatDate("yyyy-MM-dd HH:mm:ss",o.questionTime)+"&nbsp;&nbsp;"+isanswer+"</td>";
				html += "</tr>";
				if(null!=o.replyer){
					html += "<tr>";
					html += "<td colspan='3'>"+o.reply+"</td>";
					html += "<td>回复人:"+o.replyer+"&nbsp;&nbsp;"+ formatDate("yyyy-MM-dd HH:mm:ss",o.replyTime)+"</td>";
					html += "</tr>";
				}
			});
			$('#qr').html(html);
		}
	});
}
var number = 0;
var globlUserId = "";
/**
 * 添加指定的审核人的信息
 */
function savereviewto(){
	var userName = $('#userName').val();
	if(userName==''||null==userName){
		alert("请输入指定人!");
		return;
	}
	var department = $('#department').val();
	var departmentTxt = $("#department").find('option:[value='+department+']').text();
	var roleName = $('#roleName').val();
	var roleNameTxt = $("#roleName").find('option:[value='+roleName+']').text();
	var html = "<tr id='TR"+number+"'>";
	html += '<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delExamineTr('+number+',0);"/>';
	html += '<input name="creviewExInfoIdTD" type="hidden" value="null"/><input type="hidden" name="hiddenUserId" value="'+globlUserId+'"/></td>';
	html += "<td name='userNameTD' colspan='2'>"+userName+"</td>";
	html += "<td name='departmentTD' colspan='2'>"+departmentTxt+"</td>";
	html += "<td name='roleNameTD' colspan='2'>"+roleNameTxt+"</td>";
	html += "</tr>";
	$('#addExaminePersonBefore').before(html);
	number++;
	globlUserId = "";
	$('#userName').val('');
}
/**
 * 删除指定的审核人的信息
 * @param number 删除的行号
 * @param id 删除的id
 */
function delExamineTr(number,id){
	if(id!=0){
		delList += id+",";
	}
	$('#TR'+number).remove();
}
/**
 * 部门发生变化时，角色有相应的变化
 * @param selectIndex 下拉菜单索引值
 */
function selectDepartment(selectIndex){
	var option = "";
	if(selectIndex==7){
		option += "<option value='1'>部门经理</option>";
		option += "<option value='2'>项目技术支持</option>";
	}else if(selectIndex==8){
		option += "<option value='1'>部门经理</option>";
		option += "<option value='2'>订单管理员</option>";
	}else{
		option += "<option value='1'>部门经理</option>";
	}
	$('#roleName').html(option);
}
/**
 * 提交审核意见和状态
 */
function examineContractReview(){
	var orderCode = $('#orderCode').text();
	var examineStatus= $('input[name="examineStatus"]:checked').val();
	var question = $('#question').val();
	var questioner = $('#questioner').val();
	if(question==''){
		alert("请填写审核意见!");
		return;
	}else if(questioner==''){
		alert("请填写审核人!");
		return;
	}else if(examineStatus==undefined){
		alert("请选择是否同意!");
		return;
	}
	var contractReviewId = $('#contractReviewIdHidden').val();
	$.webAjax({
		type : 'post',
		url : ctx + '/contractReview/contract-review!saveOrUpdateqr.htm',
		data:{"questionAndReply.orderCode":orderCode,
			  "questionAndReply.questioner":questioner,
			  "questionAndReply.contractReviewId":contractReviewId,
			  "questionAndReply.fstatus":examineStatus,
			  "creviewExamineInfo.examineStatus":examineStatus,
			  "questionAndReply.question":question},
		success : function(data) {
			toContractReviewList();
		}
	});
}
/**
 * 弹出回复模块
 * @param id 要回复的问题的id
 */
function answerQuestion(id){
	$('#answerDiv').css("display","");
	$('#questionDiv').css("display","none");
	$('#questionAndReplyIdHidden').val(id);
}
/**
 * 提交回复内容
 */
function answerContractReview(){
	var orderCode = $('#orderCode').text();
	var reply = $('#reply').val();
	var replyer = $('#replyer').val();
	if(reply==''){
		alert("请填写回复内容!");
		return;
	}else if(replyer==''){
		alert("请填写回复人!");
		return;
	}
	var questionAndReplyId = $('#questionAndReplyIdHidden').val();
	$.webAjax({
		type : 'post',
		url : ctx + '/contractReview/contract-review!saveOrUpdateqr.htm',
		data:{"questionAndReply.orderCode":orderCode,
			  "questionAndReply.questionAndReplyId":questionAndReplyId,
			  "questionAndReply.replyer":replyer,
			  "questionAndReply.reply":reply},
		success : function(data) {
			toContractReviewList();
		}
	});
}
/**
 * 跳转到查看评审单页面
 * @param contractReviewId 评审单ID
 * @param orderCode 订单编号
 */
function toCheckContractReview(contractReviewId,orderCode){
	window.location.href = ctx+"/order/contractreview-check.htm?contractReviewId="+contractReviewId+"&orderCode="+orderCode;
}
/**
 * 查看评审单
 * @param contractReviewId 评审单id
 * @param orderCode 订单编号
 */
function checkContractReview(id,orderCode){
	$.webAjax({
		type : 'post',
		url : ctx + '/contractReview/contract-review!input.htm',
		data:{"contractreviewId":id,"creviewExamineInfoQuery.orderCode":orderCode},
		success : function(data) {
			var cExamineInfos = data.cExamineInfos;
			var contractReview = data.contractReview;
			$('#contractReviewIdHidden').val(contractReview.contractReviewId);
			$('#orderCode').html(contractReview.orderCode);
			$('#contractCode').html(contractReview.contractCode);
			$('#customerName').html(contractReview.customerName);
			$('#reviewType').html(contractReview.reviewType);
			$('#projectName').html(contractReview.projectName);
			$('#contractFee').html(contractReview.contractFee);
			$('#salePrincipal').html(contractReview.salePrincipal);
			$('#salePrincipalId').html(contractReview.salePrincipalId);
			var html = "";
			for(var i=0;i<cExamineInfos.length;i++){
				html += "<tr id='TR"+i+"'>";
				html += "<td name='userNameTD' colspan='2'>"+cExamineInfos[i].userName+"</td>";
				html += "<td name='departmentTD' colspan='2'>"+cExamineInfos[i].department+"</td>";
				html += "<td name='roleNameTD' colspan='2'>"+cExamineInfos[i].roleName+"</td>";
				html += "</tr>";
			}
			$('#addExaminePersonBefore').before(html);
		}
	});
}
/**
 * 提交评审单
 * @param id 提交的评审单的id
 */
function submitContractReview(id){
	var flag = window.confirm("确定提交吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/contractReview/contract-review!submitContractReview.htm?contractreviewId='+id,
			data:{"contractReview.contractReviewId":id,"creviewExamineInfoQuery.contractReviewId":id,"contractReview.reviewStatus":1},
			success : function(data) {
				loadContractReviews();
			}
		});
	}
}
/**
 * 单个、批量删除变更单
 * @param id 单个变更单的id
 */
function delContractReviews(id){
	var param = {};
	if(null!=id&&id!='') {
		param['checkedIdList[0]'] = id;
	} else {		
		var reviews = $('[name="checkedContractReview"]:checked');
		var cnt = 0;
		$.each(reviews, function(i, o){		
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的评审单！');
		return;
	}
	
	if(!confirm('确定删除评审单？')) {
		return;
	}
	var url = ctx + '/contractReview/contract-review!delete.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			var datainfo = $.parseJSON(data);
			if((datainfo.resultInfo)[0]==0) {
				alert(datainfo.resultInfo[1]);
				loadContractReviews();
			} else {
				alert('删除评审单失败！');
			}
		}
	});
}
/**
 * 查看最终界面
 */
function toCheckFinal(contractReviewId,orderCode){
	window.location.href = ctx+"/order/contractreview-final.htm?contractReviewId="+contractReviewId+"&orderCode="+orderCode;
}
function checkFinalContractReview(id,orderCode){
	$.webAjax({
		type : 'post',
		url : ctx + '/contractReview/contract-review!input.htm',
		data:{"contractreviewId":id,"creviewExamineInfoQuery.orderCode":orderCode},
		success : function(data) {
			var cExamineInfos = data.cExamineInfos;
			var contractReview = data.contractReview;
			$('#contractReviewIdHidden').val(contractReview.contractReviewId);
			$('#orderCode').html(contractReview.orderCode);
			$('#contractCode').html(contractReview.contractCode);
			$('#customerName').html(contractReview.customerName);
			$('#reviewType').html(contractReview.reviewType);
			$('#projectName').html(contractReview.projectName);
			$('#contractFee').html(contractReview.contractFee);
			$('#salePrincipal').html(contractReview.salePrincipal);
			$('#salePrincipalId').html(contractReview.salePrincipalId);
			var html = "";
			var last = "";
			for(var i=0;i<cExamineInfos.length;i++){
				html += "<tr>";
				if(i+1<cExamineInfos.length&&cExamineInfos[i].department==cExamineInfos[i+1].department){
					html += "<td>"+cExamineInfos[i].department+"</td>";
					html += "<td colspan='5'>";
					html += "<div>"+replaceNull(cExamineInfos[i].examineAdvice)+"</div>";
					html += "<div>"+replaceNull(cExamineInfos[i+1].examineAdvice)+"</div>";
					html += "<div align='right' style='text-align: right;margin-right:50px;'>";
					html += "<span>"+cExamineInfos[i].roleName+":"+cExamineInfos[i].userName+"</span>&nbsp;&nbsp;";
					html += "<span>"+cExamineInfos[i+1].roleName+":"+cExamineInfos[i+1].userName+"</span>";
					html += "</div>";
					html += "</td>";
					i=i+1;
				}else if(cExamineInfos[i].department=="副总级以上"){
					last += "<tr>";
					last += "<td>"+cExamineInfos[i].department+"</td>";
					last += "<td colspan='5'>";
					last += "<div>"+replaceNull(cExamineInfos[i].examineAdvice)+"</div>";
					last += "<div align='right' style='text-align: right;margin-right:50px;'>";
					last += "<span>签名:"+cExamineInfos[i].userName+"</span>&nbsp;&nbsp;";
					last += "<span>时间:"+formatDate("yyyy-MM-dd HH:mm:ss",cExamineInfos[i].examineTime)+"</span>";
					last += "</div>";
					last += "</td>";
					last += "</tr>";
				}else{
					html += "<td>"+cExamineInfos[i].department+"</td>";
					html += "<td colspan='5'>";
					html += "<div>"+replaceNull(cExamineInfos[i].examineAdvice)+"</div>";
					html += "<div align='right' style='text-align: right;margin-right:50px;'>";
					html += "<span>"+cExamineInfos[i].roleName+":"+cExamineInfos[i].userName+"</span>";
					html += "</div>";
					html += "</td>";
				}
				html += "</tr>";
			}
			html += last;
			$('#detailBefore').after(html);
		}
	});
}
/**
 * 弹出指定评审人列表
 */
function toAddExamineUser(){
	$("#selectExamineUserDiv").css("display","");
	var name = $("#userName").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="examineUserSelect" onchange="addExamineUser();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/adminList.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			//data = $.parseJSON(data);
			//var list = data.adminList;
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectExamineUser').html(html);
		}
	});	
}
/**
 * 添加指定评审人
 */
function addExamineUser(){
	var selectValue = $('#examineUserSelect').val();
	var selectTxt = $("#examineUserSelect").find('option:[value='+selectValue+']').text();
	$('#userName').val(selectTxt);
	globlUserId = selectValue;
	$("#selectExamineUserDiv").css("display","none");
}
/**
 * 弹出销售负责人列表
 */
function toAddSalePrincipal(){
	$("#selectSalePrincipalDiv").css("display","");
	var name = $("#salePrincipal").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="salePrincipalSelect" onchange="addSalePrincipal();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/adminList.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			//data = $.parseJSON(data);
			//var list = data.adminList;
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectSalePrincipal').html(html);
		}
	});	
}
/**
 * 添加销售负责人
 */
function addSalePrincipal(){
	var selectValue = $('#salePrincipalSelect').val();
	var selectTxt = $("#salePrincipalSelect").find('option:[value='+selectValue+']').text();
	$('#salePrincipal').val(selectTxt);
	$('#salePrincipalId').val(selectValue);
	$("#selectSalePrincipalDiv").css("display","none");
}