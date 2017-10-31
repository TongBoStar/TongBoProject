$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'orderpage',
		formId: 'queryform',
		pageNo: '1',
		pageSize : '10',
		order: 'asc',
		orderBy: 'orderId',
		submitForm : submitQueryForm//分页回调函数
		});	
	
	/**设置点击弹出框之外的元素 弹出框消失*/
	document.body.onclick = function(e){
	 e = e || window.event;
	 var target = e.target || e.srcElement;
	 if(target.id == "selectProjectDiv"||target.id == "projectName"
		 ||target.id == "selectSystemConsumerDiv"||target.id == "systemConsumer"
			 ||target.id == "selectCheckProjectDiv"||target.id == "billUserName"
				 ||target.id == "selectBillUserDiv"||target.id == "businessUser"
					    ||target.id.indexOf("selectProductDiv")==0||target.id.indexOf("productCode")==0) {
		 return;
	 }else{
		 $('#selectProjectDiv').css("display","none");
		 $('#selectSystemConsumerDiv').css("display","none");
		 $('#selectBillUserDiv').css("display","none");
		 $('.selectProduct').css("display","none");
		 
		 $('#selectUserNameDiv').css("display","none");
	 }
	};
	loadOrders();
});
function submitQueryForm(simpleTable, param){
	loadOrders();
}
 
/**
 * 查询标准订单列表
 */
function loadOrders() {
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx + '/order/order!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			//alert("data:"+data+",data.arList:"+data.arList);
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"orderpage",simpleTable);
			//alert(",data.arList:"+data.arList);//无值,显示未定义
			
			//按权限显示添加订单按钮
			//var addVal = false;
			
			var editVal = false;
			var examineVal = false;
			/**
			 * $.each(data.arList, function(i, o){
			 * $.each(data.authorityList, function(i, o){
				if(o.authorityKey=='ROLE_ORDER_EDIT'){//authorityList
					editVal = true;//编辑
				}
				if(o.authorityKey=='ROLE_ORDER_EXAMINE'){
					examineVal = true;//审核
				}
			});
			 * **/
			//$.each(data.arList, function(i, o){
			$.each(data.authorityList, function(i, o){
				if(o.authorityKey=='ROLE_BASEORDER_EDIT'){//authorityList
					editVal = true;//编辑
					//addVal = true;//有添加
				}
				if(o.authorityKey=='ROLE_BASEORDER_EXAMINE'){
					//新流程 区域经理,财务经理,售后服务部经理,副总及以上都有审核权限
					//只要对该用户设置了角色权限,就会显示
					examineVal = true;//审核
					
					/**
					//再判断下当前用户
					var adminType = data.adminType;
					var userType=adminType+'';
					//alert("userType:"+userType);
					if('3'!=userType){//销售经理以上不是 一般用户 类别
						examineVal = true;//审核
					}**/
					
				}
			});
			
			//editVal = true;
			//examineVal = true;
			
			//alert("page:"+page);
			//组装table
			$.each(page.result, function(i, o){
				/****/
				var status= "";
				var editorder = "";
				var submitorder = "";
				var examineorder = "";
				var freightSide = "";
				var transportType = "";
				var productPackage = "";
				
				//通知邮件
				var noticeemail = "";
				
				if(o.freightSide==1){
					freightSide = "供方承担";
				}else{
					freightSide = "需方承担";
				}
				//alert("o.freightSide:"+o.freightSide);
				if(o.transportType==1){
					transportType = "公路";
				}else if(o.transportType==2){
					transportType = "铁路";
				}else if(o.transportType==3){
					transportType = "航空";
				}else{
					transportType = "其他";
				}
				//alert("o.transportType:"+o.transportType);
				if(o.productPackage==0){
					productPackage = "无包装";
				}else if(o.productPackage==1){
					productPackage = "纸箱";
				}else{
					productPackage = "木箱";
				}
				//alert("o.productPackage:"+o.productPackage);
				//alert("o.orderStatus:"+o.orderStatus);
				
				// 0 待提交 1 销售经理待审核 2 销售经理驳回 3副总经理待审核4副总经理驳回5总经理待审核6总经理驳回7 已生效
				
				//新流程基本订单状态:0 待提交 1 区域经理和财务经理待审核 2 区域经理驳回 3财务经理驳回 
				//4 售后服务部经理待审核5售后服务部经理驳回
				//6 副总经理及以上待审核    7 副总经理驳回8总经理驳回9 已生效  10 区域经理已审核 11 财务经理已审核
				
				if(o.orderStatus==0){//未提交状态
					status= "待提交";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						
						//var adminId = data.adminId+'';
						//if(    o.orderCloseUserId==adminId   ){	
							var pdfFilePath=o.pdfFilePath;
						    if(null!=o.pdfFilePath){
						    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
						    }
							noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
						//}
					}
				}else if(o.orderStatus==1){
					//status= "销售经理待审核";
					//新流程状态做了改变
					status= "区域经理和财务经理待审核";
					var adminDutyKey = data.adminDutyKey+'';
					//副总经理兼职区域经理的情况
					var asAreaSaleManager = data.asAreaSaleManager+'';
					var orderViceGeneralManagerFlag = o.orderViceGeneralManagerFlag+'';//副总经理兼职区域经理是当前单据人的区域经理
					//alert("orderViceGeneralManagerFlag:"+o.orderViceGeneralManagerFlag);
					if( examineVal && ( 'FZJL'==adminDutyKey )&& ( '1'==asAreaSaleManager )
					//if( examineVal && ( '副总经理'==adminDutyKey )&& ( '1'==asAreaSaleManager )
							&& ( '1'==orderViceGeneralManagerFlag ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核'
						//+o.orderId+
						//+orderViceGeneralManagerFlag+asAreaSaleManager+adminDutyKey+
						+'</a></td>';
						//+asAreaSaleManager+'-'+orderViceGeneralManagerFlag+'</a></td>';
					}
					//if(examineVal&&('18'==adminDuty)){
					//新流程状态做了改变,有审核权限不需要判断职位
					if( examineVal && ( 'QYXSJL'==adminDutyKey||'CWJL'==adminDutyKey ) ){	
					//if( examineVal && ( '区域销售经理'==adminDutyKey||'财务经理'==adminDutyKey ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核'
						+'</a></td>';
						//+asAreaSaleManager+'-'+orderViceGeneralManagerFlag+'</a></td>';
					}
				}
				else if(o.orderStatus==12){//12 订单管理部经理和财务经理待审核
					status= "订单管理部经理和财务经理待审核";
					
					var adminDutyKey = data.adminDutyKey+'';
					if( examineVal && ( 'DDGLBJL'==adminDutyKey||'CWJL'==adminDutyKey ) ){
					//if( examineVal && ( '订单管理部经理'==adminDutyKey||'财务经理'==adminDutyKey ) ){
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}
				else if(o.orderStatus==13){//13 订单管理部经理驳回
					status= "订单管理部经理驳回";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						//noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
						noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
					}
				}
				else if(o.orderStatus==14){//14 订单管理部经理已审核财务经理待审核
					status= "订单管理部经理已审核财务经理待审核";
					var adminDutyKey = data.adminDutyKey+'';
					if( examineVal && (  'CWJL'==adminDutyKey ) ){	
					//if( examineVal && (  '财务经理'==adminDutyKey ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}
				else if(o.orderStatus==15){//15 财务经理已审核订单管理部经理待审核
					status= "财务经理已审核订单管理部经理待审核";
					var adminDutyKey = data.adminDutyKey+'';
					if( examineVal && (  'DDGLBJL'==adminDutyKey ) ){
					//if( examineVal && (  '订单管理部经理'==adminDutyKey ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}
				else if(o.orderStatus==4){
					status= "售后服务部经理待审核";
					
					var adminDutyKey = data.adminDutyKey+'';
					//alert("adminDutyKey:"+adminDutyKey);
					if(examineVal&&( 'SHFWBJL'==adminDutyKey )){
					//if(examineVal&&( '售后服务部经理'==adminDutyKey )){
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}else if(o.orderStatus==6){
					status= "副总经理及以上待审核";
					var adminDutyKey = data.adminDutyKey+'';
					
					//alert("adminDuty:"+adminDuty);
					if(examineVal&&( 'FZJL'==adminDutyKey||'ZJL'==adminDutyKey ) ){
					//if(examineVal&&( '副总经理'==adminDutyKey||'总经理'==adminDutyKey ) ){
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}
				else if(o.orderStatus==2){
					status= "区域经理驳回";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						//noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
					    noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
					}
				}
				else if(o.orderStatus==3){
					status= "财务经理驳回";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						//noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
						noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
					}
				}
				else if(o.orderStatus==5){
					status= "售后服务部经理驳回";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						//noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
					    noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
					}
				}
				else if(o.orderStatus==7){
					status= "副总经理驳回";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						//noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
						noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
					}
				}
				else if(o.orderStatus==8){
					status= "总经理驳回";
					if(editVal){
						editorder = '<a href="javascript:toEditStandardOrder('+o.orderId+');">修改</a>|';
						submitorder = '<a href="javascript:submitStandOrder('+o.orderId+',\''+o.orderCode+'\');">提交</a>|';
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						//noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
						noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+','+'0'+');">邮件通知</a>';
					}
				}
				else if(o.orderStatus==9){
					status= "已生效";
					//当基本订单已生效后显示发通知生产等的邮件
					/**var adminId = data.adminId+'';
					if(    o.orderCloseUserId==adminId   ){	
						var pdfFilePath=o.pdfFilePath;
					    if(null!=o.pdfFilePath){
					    	pdfFilePath = pdfFilePath.substring(0,pdfFilePath.indexOf("."));
					    }
						noticeemail = '<a href="javascript:openEmailNotify(\''+pdfFilePath+'\','+o.orderId+');">邮件通知</a>';
					}**/
					
					
				}else if(o.orderStatus==10){
					status= "区域经理已审核财务经理未审核";
					var adminDutyKey = data.adminDutyKey+'';
					if( examineVal && (  'CWJL'==adminDutyKey ) ){	
					//if( examineVal && (  '财务经理'==adminDutyKey ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}else if(o.orderStatus==11){
					status= "财务经理已审核区域经理未审核";
					var adminDutyKey = data.adminDutyKey+'';
					//副总经理兼职区域经理的情况
					var asAreaSaleManager = data.asAreaSaleManager+'';
					/**if( examineVal && ( '副总经理'==adminDutyKey )&& ( '1'==asAreaSaleManager ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
					**/
					var orderViceGeneralManagerFlag = o.orderViceGeneralManagerFlag+'';//副总经理兼职区域经理是当前单据人的区域经理
					//alert("orderViceGeneralManagerFlag:"+o.orderViceGeneralManagerFlag);
					if( examineVal && ( 'FZJL'==adminDutyKey )&& ( '1'==asAreaSaleManager )
					//if( examineVal && ( '副总经理'==adminDutyKey )&& ( '1'==asAreaSaleManager )
							&& ( '1'==orderViceGeneralManagerFlag ) ){	
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核'
						//+o.orderId+
						//+orderViceGeneralManagerFlag+asAreaSaleManager+adminDutyKey+
						+'</a></td>';
						//+asAreaSaleManager+'-'+orderViceGeneralManagerFlag+'</a></td>';
					}
					
					//alert("o.orderStatus:"+o.orderStatus+",examineVal:"+examineVal+"adminDutyKey:"+adminDutyKey+( '区域销售经理'==adminDutyKey));
					if( examineVal && ( 'QYXSJL'==adminDutyKey) ){
					//if( examineVal && ( '区域销售经理'==adminDutyKey) ){
						examineorder = '<a href="javascript:examineStandOrder('+o.orderId+',\''+o.orderCode+'\');">审核</a></td>';
					}
				}
				else{
					status= "未知";
				}
				//alert("o.orderStatus:"+o.orderStatus);
                var orderAuther="";
				
				var orderChecker=o.orderChecker;
				//alert("orderChecker:"+orderChecker);
				var orderChecker2=o.orderChecker2;
				//alert("orderChecker2:"+orderChecker2);
				if(null!=orderChecker&&""!=orderChecker&&"null"!=orderChecker){
					orderAuther=orderChecker+"";
				}
				if(null!=orderChecker2&&""!=orderChecker2&&"null"!=orderChecker2){
					orderAuther=orderAuther+" "+orderChecker2+"";
				}
				//alert("orderAuther:"+orderAuther);
				html += '<tr>';
				
				html += '<td><input type="checkbox"  id="checkedOrder" name="checkedOrder" value="' + o.orderCode + '"/></td>';
				//alert("o.orderCode:"+o.orderCode);
				html += '<td><a href="javascript:toStandardOrderCheck('+o.orderId+');" style="color: blue;">'+replaceNull(o.orderCode)+'</a></td>';
				//alert("o.orderCode:"+o.orderId);
				//html += '<td>' + replaceNull(formatDate("yyyy-MM-dd",o.orderTime)) + '</td><td>' + replaceNull(o.userName) + '</td><td>' + replaceNull(o.billUserName) + '</td><td>' + replaceNull(o.projectName) + '</td>';
				
				html += '<td>' + replaceNull(formatDate("yyyy-MM-dd",o.orderTime)) 
				+ '</td><td>' + replaceNull(o.userName) + '</td>' 
				//一级审核人
				+ '</td><td>' + replaceNull(orderAuther) + '</td>' 
				//+ '</td><td>' + replaceNull(o.orderChecker) + '</td>' 
				//审批人
				+ '</td><td>' + replaceNull(o.orderApprover) + '</td>' 
				+  '<td>' + replaceNull(o.projectName) + '</td>';
				
				//alert("o.orderTime:"+o.orderTime);
				//alert("o.userName:"+o.userName);
				//alert("o.projectName:"+o.projectName);
				//alert("o.billUserName:"+o.billUserName);
				html += '<td>' + freightSide + '</td><td>' + transportType + '</td><td>' + productPackage + '</td><td>' + replaceNull(o.gasSource) + '</td>';
				//alert("o.gasSource:"+o.gasSource);
				html += '<td>' + o.payType + '</td><td>' + replaceNull(o.deliveryAdress) + '</td><td>' + replaceNull(o.orderCompanyName) + '</td>';
				//alert("o.deliveryAdress:"+o.deliveryAdress);
				//alert("o.orderCompanyName:"+o.orderCompanyName);
				html += '<td>' + replaceNull(o.userCompanyName) + '</td><td>' + status + '</td>';
				//alert("o.userCompanyName:"+o.userCompanyName);
				
				//发送邮件功能
				//var emailLink = '<a href="javascript:openEmailNotify();">邮件通知</a>|';
				
				//html += '<td>'+editorder+submitorder+examineorder+emailLink+'</td>';
				html += '<td>'+editorder+submitorder+examineorder+noticeemail+'</td>';
				//alert("o.orderCode:"+o.orderCode);
				html += '</tr>';
				
				//alert("o.productPackage:"+o.productPackage);
			});
			$('#data-body').html(html);
			//alert("html:"+html);
		}
	});
}
/**
 * 打开邮件通知页面BAK
 * @return
 */
function openEmailNotify(pdfFilePath,billid,isreadonly){
	//window.open('showemailnotify.htm?pdfFilePath='+pdfFilePath, 'newwindow', 'height=650, width=1250, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
	window.open('showemailnotify.htm?isreadonly='+isreadonly+'&billid='+billid+'&pdfFilePath='
			+pdfFilePath, 'newwindow', 'height=650, width=1250, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
}

/**
 * 打开邮件通知页面
 * @return
 */
function openEmailNotifyInfo(pdfFilePath,billid,orderStatus){
	window.open('showemailnotify.htm?orderStatus='+orderStatus+'&billid='+billid+'&pdfFilePath='
			+pdfFilePath, 'newwindow', 'height=650, width=1250, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
}


/**
 * 弹出审核人列表
 */
function toAddExamineUser(){
	$("#selectExamineUserDiv").css("display","");
	var name = $("#userName").val();
	var data = 'adminQuery.adminName='+name;
	//var data = 'adminQuery.adminName='+name+'&adminQuery.teamname='+'财务部';
	var html='<td><select id="examineUserSelect" onchange="addExamineUser();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
	///system/findListByDepart
	var url =ctx+'/system/findListByDepart.htm';
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
 * 添加审核人
 */
function addExamineUser(){
	var selectValue = $('#examineUserSelect').val();
	var selectTxt = $("#examineUserSelect").find('option:[value='+selectValue+']').text();
	$('#userName').val(selectTxt);//页面中显示的人名
	$('#userId').val(selectValue);//页面中影藏域的人名的ID
	$("#selectExamineUserDiv").css("display","none");
	/**
	var data = 'userId='+selectValue;
	$.webAjax({
		type : "post",
		url : ctx+'/department/department!showDepartmentByUser.htm',
		data:data,
		success : function(data) {
			//data = $.parseJSON(data);
			$('#department').val(data.teamname);
			$('#departmentId').val(data.teamid);
		}
	});	
	**/
}

function submitForm() {
	var productLength = $('#productDetail').find('tr').length;//查找关联的产品一共有多少行
	
	var products = "";
	var isHaveProductCTemp=false;
	
	for(var i=0;i<productLength;i++){
		products += $('input[name="productIdHiddenTD"]').eq(i).val()+",";//影藏域值
		
		products += $('input[name="specifications"]').eq(i).val()+",";//产品规格型号
		
		products += $('select[name="productType"]').find("option:selected").eq(i).val()+",";// 分类 
		
		if('C'==$('select[name="productType"]').find("option:selected").eq(i).val()){
			isHaveProductCTemp=true;
		}
		
		//products += $('input[name="baseUnitCount"]').eq(i).val()+",";//数量
		
		products += $('input[name="productCount"]').eq(i).val()+",";//数量
		
		//products += $('input[name="saleprice"]').eq(i).val()+",";// 销售单价
		products += $('input[name="unitPrice"]').eq(i).val()+",";// 销售单价
		
		products += $('input[name="servicecharge"]').eq(i).val()+",";// 服务费
		products += $('input[name="listprice"]').eq(i).val()+",";// 列表价
		products += $('input[name="balanceprice"]').eq(i).val()+",";// 结算价
		
		products += $('input[name="discount"]').eq(i).val()+",";//折扣
		
		products += $('input[name="discountRate"]').eq(i).val()+",";//折扣率
		//products += $('input[name="salefee"]').eq(i).val()+" |";//销售金额
		
		
		//products += $('input[name="totalFee"]').eq(i).val()+" |";//销售金额
		//新需求存的是 价税合计
		products += $('input[name="priceTaxTotal"]').eq(i).val()+",";//价税合计
		//新需求加入结算金额
		products += $('input[name="balancefee"]').eq(i).val()+",";//结算金额
		//新需求加入 交货时间
		products += $('input[name="deliveryTime"]').eq(i).val()+" |";//交货时间   
		
		//products += $('input[name="specifications"]').eq(i).val()+",";//规格型号 6
		/**
		products += $('input[name="productName"]').eq(i).val()+",";//产品名称 2
		products += $('input[name="productCount"]').eq(i).val()+",";//产品数量 11
		products += $('input[name="unitPrice"]').eq(i).val()+",";//含税单价 15 
		products += $('input[name="discount"]').eq(i).val()+",";//折扣额 20
		products += $('input[name="totalFee"]').eq(i).val()+",";//总金额 17
		products += $('input[name="deliveryTime"]').eq(i).val()+",";//交货时间 26 
		products += $('input[name="productCode"]').eq(i).val()+" |";//产品代码 1
		**/
		//products += $('input[name="baseUnitName"]').eq(i).val()+",";//
		//products += $('input[name="baseUnitCount"]').eq(i).val()+",";//
		//products += $('input[name="productUnit"]').eq(i).val()+",";//单位 10
		//products += $('input[name="adviceDeliveryTime"]').eq(i).val()+",";//建议交货时间 27
		//products += $('input[name="unitRemoveTax"]').eq(i).val()+",";//不含税单价 16
		//products += $('input[name="convertRate"]').eq(i).val()+",";//换算率 13
		//products += $('input[name="taxRate"]').eq(i).val()+",";//税率 18
		//products += $('input[name="discountRate"]').eq(i).val()+",";//折扣率 19
		//products += $('input[name="factUnitPrice"]').eq(i).val()+",";//实际含税单价 21
		//products += $('input[name="saleTax"]').eq(i).val()+",";//销项税额 22
		//products += $('input[name="priceTaxTotal"]').eq(i).val()+",";//价税合计 23
		//products += $('input[name="makeNumberCode"]').eq(i).val()+",";//制令号 24
		//products += $('input[name="taskCode"]').eq(i).val()+",";// 任务单号 25
		//products += $('input[name="referCount"]').eq(i).val()+",";//关联数量 删除 29
		//products += $('input[name="assistUnitReferCount"]').eq(i).val()+",";// 辅助单位关联数量 删除 30
		//products += $('input[name="assistUnitOutHouseCount"]').eq(i).val()+",";//辅助单位出库数量 关联出库单 31
		//products += $('input[name="outHouseCount"]').eq(i).val()+",";//
		//products += $('input[name="material"]').eq(i).val()+",";//材质 4
		//products += $('input[name="productAssistCount"]').eq(i).val()+",";//辅助数量 14
		//products += $('select[name="productType"]').find("option:selected").eq(i).val()+",";//分类 7
		//products += $('input[name="outSaleName"]').eq(i).val()+",";//对外销售名称 3
		//products += $('input[name="proProjectName"]').eq(i).val()+",";//项目名称 8
		//products += $('input[name="assistAttribute"]').eq(i).val()+",";//辅助属性 9
		//products += $('input[name="excuteStandard"]').eq(i).val()+",";//执行标准 5
		//products += $('input[name="assistUnit"]').eq(i).val()+",";//辅助单位 12
		//products += $('input[name="remarks"]').eq(i).val()+",";//备注 28
		//products += $('input[name="customBOM"]').eq(i).val()+",";//客户BOM 32
		//products += $('input[name="costObj"]').eq(i).val()+",";//成本对象 33
		//products += $('input[name="sourceOrderCode"]').eq(i).val()+",";//源单单号 删除 34
		//products += $('input[name="contactCode"]').eq(i).val()+",";//合同单号 删除 35
		//products += $('input[name="billCount"]').eq(i).val()+",";//开票数量 关联开票 36
		//products += $('input[name="assistCompanyBillCount"]').eq(i).val()+",";//辅助单位开票数量 37
		//products += $('input[name="assistCompanyFitCount"]').eq(i).val()+",";//辅助单位组装数量 38
		//products += $('input[name="baseCompanyFitCount"]').eq(i).val()+",";//基本单位组装数量 39
		//products += $('input[name="fitCount"]').eq(i).val()+",";//组装数量 40
		//products += $('input[name="qualityFeeRate"]').eq(i).val()+",";//质保金率 41
		//products += $('input[name="qualityFee"]').eq(i).val()+" |";//质保金 42
		
	}
	$('#productsHidden').val(products);
	if(true==isHaveProductCTemp){//设置影藏域的值
		$('#isHaveProductC').val(isHaveProductCTemp);
	}else{
		$('#isHaveProductC').val(isHaveProductCTemp);
	}
	var nostraightcoeff=$('#nostraightcoeff').val();
	if(null==nostraightcoeff||""==nostraightcoeff){
		$('#nostraightcoeff').val("1");
	}
	var operatorrate=$('#operatorrate').val();
	if(null==operatorrate||""==operatorrate){
		$('#operatorrate').val("1");
	}
	
	var pageParam = simpleTable.bindPageParam();
	var inputForm = $('#inputForm').serialize();
	var flag = window.confirm("确定保存吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/order/order!saveOrUpdateOrderEntity.htm',
			data :pageParam +'&'+inputForm,
			success : function(data) {
			    data = $.parseJSON(data);
			    if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					window.location.href = ctx+"/order/standardorder-list.htm";
					$.closeDiv('inputDiv');
				} else {
					alert(data.resultInfo[1]);
				}
				
			}
		});
	}
}
/**
 * 搜索订单
 * @return
 */
function searchorder(){
	
}
/**
 * 跳转到标准订单
 */
function addorder(){
	$('#orderIdHidden').val("");
	//window.location.href = ctx+"/order/standardorder-add.htm";
	window.location.href = ctx+"/order/standardorder-new.htm?id=0";
}
/**
 * 保存标准订单
 */
function save(){
	if(checkOrderParams()){
		$('#orderStatusHidden').val(0);
		submitForm();
	}
}
/**
 * 保存并提交标准订单
 */
function saveAndCheck(){
	if(checkOrderParams()){
		$('#orderStatusHidden').val(1);
		submitForm();
	}
}
/**
 * 校验订单各参数
 * @returns {Boolean}
 */
function checkOrderParams(){
	var regtel = /^1[3,4,5,8]\d{9}$/g;				
	var tel = $.trim($('#userCompanyPhone').val());
	
	var productLength = $('#productDetail').find('tr').length;//查找关联的产品一共有多少行
	
	if($.trim($('#orderCode').val())==""){
		alert("订单编号不能为空!");
	}else if($.trim($('#orderTime').val())==""){
		alert("订单时间不能为空!");
	}else if($.trim($('#orderCompanyName').val())==""){
		alert("订货单位不能为空!");
	}
	else if($.trim($('#userCompanyName').val())==""){
		alert("使用单位不能为空!");
	}else if($.trim($('#userCompanyPerson').val())==""){
		alert("使用单位负责人不能为空!");
	}else if($.trim($('#userCompanyAdress').val())==""){
		alert("使用单位地址不能为空!");
	}else if(tel==""){
		alert("联系电话不能为空!");
	}else if(isNaN(tel)){
		alert("手机号码必须为11位数字");
	}else if(tel.length!=11){
		alert("请输入长度为11位的手机号码");
	}else if(!tel.match(regtel)){
		alert("手机号码格式不正确");
	}
	//else if($.trim($('#gasSource').val())==""){
		//alert("气源不能为空!");
	//}
	//else if($.trim($('#projectName').val())==""){
		//alert("工程项目不能为空!");
	//}
	else if($.trim($('#systemConsumer').val())==""){
		alert("体系客户不能为空!");
	}else if($.trim($('#gasSource').val())==""){
		alert("气源不能为空!");
	}else if($.trim($('#payType').val())==""){
		alert("付款方式不能为空!");
	}else if($.trim($('#deliveryAdress').val())==""){
		alert("交货地点不能为空!");
	}
	else if($.trim($('#billWriterName').val())==""){
		alert("发票签收人不能为空!");
	}
	else if($.trim($('#userId').val())==""){//负责人
		alert("负责人不能为空!");
	}
	else if(!checkSalemethod()){//校验销售模式
		
	}
	//基本订单中必须有产品
	else if( 0>=productLength ){
		alert("请选择产品!");
		return false;
	}
	else if(!checkProductParams()){
		
	}else{
		return true;
	}
	return false;
}
/**
 * 校验销售模式
 */
function checkSalemethod(){
	if($.trim($('#salemethod').val())=="2"){//直销
		if(""!=$.trim($('#nostraightcoeff').val()) ){//奖励系数
			if("1"!=$.trim($('#nostraightcoeff').val()) ){//奖励系数
				alert("销售模式为直销时奖励系数为1!");
				return false;
		    }
	    }
	    if(""!=$.trim($('#operatorrate').val()) ){//业务费系数
	    	if("1"!=$.trim($('#operatorrate').val()) ){//业务费系数
	    		alert("销售模式为直销时业务费系数为1!");
	    		return false;
		    }
	    }
	}
	return true;
}
/**
 * 校验产品各个参数
 */
function checkProductParams(){
	//var productNameObj = $('input[name="productName"]');
	//var productCodeObj = $('input[name="productCode"]');
	
	var specificationsObj = $('input[name="specifications"]');//产品规格型号 	
	var productCountObj = $('input[name="productCount"]');//数量
	//var salepriceObj = $('input[name="saleprice"]');//销售单价 
	var unitPriceObj = $('input[name="unitPrice"]');//销售单价 
	
	//var unitPriceObj = $('input[name="unitPrice"]');
	
	var deliveryTimeObj = $('input[name="deliveryTime"]');
	
	for(var i=0;i<specificationsObj.length;i++){
		if($.trim(specificationsObj.eq(i).val())==""){
			alert("产品规格型号不能为空!");
			return false;
		}
		if($.trim(productCountObj.eq(i).val())==""){
			alert("数量不能为空!");
			return false;
		}
		if($.trim(unitPriceObj.eq(i).val())==""){
		//if($.trim(salepriceObj.eq(i).val())==""){
			alert("销售单价不能为空!");
			return false;
		}
		if($.trim(deliveryTimeObj.eq(i).val())==""){
			alert("交货期不能为空!");
			return false;
		}
		/**
		if($.trim(productNameObj.eq(i).val())==""){
			alert("产品名称不能为空!");
			return false;
		}**/
		/**else if($.trim(productCodeObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的编码不能为空!");
			return false;
		}*/
		/**
		else if($.trim(productCountObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的数量不能为空!");
			return false;
		}else if($.trim(unitPriceObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的单价不能为空!");
			return false;
		}else if($.trim(deliveryTimeObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的交货时间不能为空!");
			return false;
		}**/
		
		
	}
	return true;
}
/**
 * 跳转到修改标准订单页面
 * @param id 要修改的标准订单的id
 */
function toEditStandardOrder(id){
	//window.location.href = ctx+"/order/standardorder-add.htm?id="+id;
	window.location.href = ctx+"/order/standardorder-new.htm?id="+id;
}
/**
 * 编辑标准订单
 * @param id
 */
function editStandOrder(id){
	if(null!=id&&undefined!=id&&id!=""){//如果id不为空
		if($('.productTR').length!=0){
			$('.productTR').remove();
		}
		var saleMethodHtml="";
		$.webAjax({
			type : 'post',
			url : ctx + '/order/order!input.htm?id='+id,
			success : function(data) {
				data = $.parseJSON(data);
				var orderEntity = data.orderEntity;//订单实体
				var productList = data.productList;//订单产品实体
				var product = "";
				var orderStatusShow = "";
				/**
				if(orderEntity.orderStatus=="0"){//营销部主管意见：
					orderStatusShow = "未提交";
				}else if(orderEntity.orderStatus=="1"){
					orderStatusShow = "未审核";
				}else if(orderEntity.orderStatus=="2"){
					orderStatusShow = "审核通过";
				}else{
					orderStatusShow = "被驳回";
				}**/
				//0 待提交 1 销售经理待审核 2 销售经理驳回 3副总经理待审核4副总经理驳回5总经理待审核6总经理驳回7 已生效
				/**
				if(orderEntity.orderStatus=="0"){//营销部主管意见：
					orderStatusShow = "未提交";
				}else if(orderEntity.orderStatus=="1"){
					orderStatusShow = "销售经理待审核";
				}else if(orderEntity.orderStatus=="2"){
					orderStatusShow = "销售经理驳回";
				}else if(orderEntity.orderStatus=="3"){
					orderStatusShow = "副总经理待审核";
				}else if(orderEntity.orderStatus=="4"){
					orderStatusShow = "副总经理驳回";
				}else if(orderEntity.orderStatus=="5"){
					orderStatusShow = "总经理待审核";
				}else if(orderEntity.orderStatus=="6"){
					orderStatusShow = "总经理驳回";
				}else if(orderEntity.orderStatus=="7"){
					orderStatusShow = "已生效";
				}**/
				
				//新流程基本订单状态:0 待提交 1 区域经理和财务经理待审核 2 区域经理驳回 3财务经理驳回 
				//4 售后服务部经理待审核5售后服务部经理驳回
				//6 副总经理及以上待审核    7 副总经理驳回8总经理驳回9 已生效
				if(orderEntity.orderStatus=="0"){//营销部主管意见：
					orderStatusShow = "未提交";
				}else if(orderEntity.orderStatus=="1"){
					orderStatusShow = "区域经理和财务经理待审核";
				}else if(orderEntity.orderStatus=="2"){
					orderStatusShow = "区域经理驳回";
				}else if(orderEntity.orderStatus=="3"){
					orderStatusShow = "财务经理驳回";
				}else if(orderEntity.orderStatus=="4"){
					orderStatusShow = "售后服务部经理待审核";
				}else if(orderEntity.orderStatus=="5"){
					orderStatusShow = "售后服务部经理驳回";
				}else if(orderEntity.orderStatus=="6"){
					orderStatusShow = "副总经理及以上待审核";
				}else if(orderEntity.orderStatus=="7"){
					orderStatusShow = "副总经理驳回";
				}else if(orderEntity.orderStatus=="8"){
					orderStatusShow = "总经理驳回";
				}else if(orderEntity.orderStatus=="9"){
					orderStatusShow = "已生效";
				}else if(orderEntity.orderStatus=="10"){
					orderStatusShow = "区域经理已审核财务经理未审核";
				}else if(orderEntity.orderStatus=="11"){
					orderStatusShow = "财务经理已审核区域经理未审核";
				}
				else if(orderEntity.orderStatus=="12"){
					orderStatusShow = "订单管理部经理和财务经理待审核";
				}else if(orderEntity.orderStatus=="13"){
					orderStatusShow = "订单管理部经理驳回";
				}else if(orderEntity.orderStatus=="14"){
					orderStatusShow = "订单管理部经理已审核财务经理待审核";
				}else if(orderEntity.orderStatus=="15"){
					orderStatusShow = "财务经理已审核订单管理部经理待审核";
				}
				else{
					orderStatusShow = "订单错误!";
				}
				
				
				$('#orderCode').val(orderEntity.orderCode);//订单号
				
				//$('#userNameShow').val(orderEntity.userName);//去掉的负责人
				$('#userName').val(orderEntity.userName);
				
				$('#userId').val(orderEntity.userId);
				
				$('#orderTime').val(formatDate("yyyy-MM-dd",orderEntity.orderTime));//订货时间
				//$('#orderTime').attr("disabled","disabled");
				$('#orderCompanyName').val(orderEntity.orderCompanyName);//订货单位
				
				$('#userCompanyName').val(orderEntity.userCompanyName);//使用单位(全称)
				$('#userCompanyPerson').val(orderEntity.userCompanyPerson);//使用单位负责人
				
				$('#userCompanyAdress').val(orderEntity.userCompanyAdress);//使用单位地址
				$('#userCompanyPhone').val(orderEntity.userCompanyPhone);//联系电话
				
				$('#projectName').val(orderEntity.projectName);//工程项目名称
				$('#projectId').val(orderEntity.projectId);
				
				//$('#bussinessType').val(orderEntity.bussinessType);//业务类型
				//alert("orderEntity.bussinessType:"+orderEntity.bussinessType);
				//if(null!=orderEntity.bussinessType&&!''==orderEntity.bussinessType){
				if(null!=orderEntity.bussinessType){
					if(orderEntity.bussinessType=='1'){
						 $('#bussinessType').get(0).options[0].selected = true;   
					}
					if(orderEntity.bussinessType=='2'){
						 $('#bussinessType').get(0).options[1].selected = true;   
					}
				}
				
				
				$('#gasSource').val(orderEntity.gasSource);//气源
				$('#systemConsumer').val(orderEntity.systemConsumer);//体系客户
				$('#systemConsumerId').val(orderEntity.systemConsumerId);
				
				/**
				$('#PL3000Count').val(orderEntity.pL3000Count);
				$('#PL3000Unit').val(orderEntity.pL3000Unit);
				
				$('#PL4200Count').val(orderEntity.pL4200Count);
				$('#PL4200Unit').val(orderEntity.pL4200Unit);
				
				$('#SSV3500Count').val(orderEntity.sSV3500Count);
				$('#SSV3500Unit').val(orderEntity.sSV3500Unit);
				
				$('#SPL2000Count').val(orderEntity.sPL2000Count);
				$('#SPL2000Unit').val(orderEntity.sPL2000Unit);
				**/
				if('0'!=replaceNull(orderEntity.pL3000Count)){
				$('#PL3000Count').val(replaceNull(orderEntity.pL3000Count));//国产PL产品
				}
				//$('#PL3000Unit').html(replaceNull(orderEntity.pL3000Unit));
				//$('#PL3000SalePrice').val(replaceNull(orderEntity.pL3000SalePrice));
				//$('#PL3000ListPrice').val(replaceNull(orderEntity.pL3000ListPrice));
				
				if('0'!=replaceNull(orderEntity.pL3000Unit)){
					//$('#PL3000SalePrice').val(replaceNull(orderEntity.pL3000Unit));
					$('#PL3000SalePrice').val(replaceNull(orderEntity.pL3000Unit));
				}
				if('0'!=replaceNull(orderEntity.pL3000ListPrice)){
				$('#PL3000ListPrice').val(replaceNull(orderEntity.pL3000ListPrice));
				}
				if('0'!=replaceNull(orderEntity.pL4200Count)){
				$('#PL4200Count').val(replaceNull(orderEntity.pL4200Count));
				}
				//$('#PL4200Unit').html(replaceNull(orderEntity.pL4200Unit));
				//$('#PL4200SalePrice').val(replaceNull(orderEntity.pL4200SalePrice));
				//$('#PL4200ListPrice').val(replaceNull(orderEntity.pL4200ListPrice));
				
				if('0'!=replaceNull(orderEntity.pL4200Unit)){
					$('#PL4200SalePrice').val(replaceNull(orderEntity.pL4200Unit));
					}
					//alert("orderEntity.pL4200ListPrice:"+orderEntity.pL4200ListPrice);
					if('0'!=replaceNull(orderEntity.pL4200ListPrice)){
					$('#PL4200ListPrice').val(replaceNull(orderEntity.pL4200ListPrice));
					}
					if('0'!=replaceNull(orderEntity.sSV3500Count)){
				$('#SSV3500Count').val(replaceNull(orderEntity.sSV3500Count));
					}
				//$('#SSV3500Unit').html(replaceNull(orderEntity.sSV3500Unit));
				//$('#SSV3500SalePrice').val(replaceNull(orderEntity.sSV3500SalePrice));
				//$('#SSV3500ListPrice').val(replaceNull(orderEntity.sSV3500ListPrice));
				
				if('0'!=replaceNull(orderEntity.sSV3500Unit)){
					$('#SSV3500SalePrice').val(replaceNull(orderEntity.sSV3500Unit));
					}
					if('0'!=replaceNull(orderEntity.sSV3500ListPrice)){
					$('#SSV3500ListPrice').val(replaceNull(orderEntity.sSV3500ListPrice));
					}
					
					if('0'!=replaceNull(orderEntity.sPL2000Count)){
				$('#SPL2000Count').val(replaceNull(orderEntity.sPL2000Count));
					}
				//$('#SPL2000Unit').html(replaceNull(orderEntity.sPL2000Unit));
				//alert("orderEntity.sPL2000SalePrice:"+orderEntity.sPL2000SalePrice);
				//$('#SPL2000SalePrice').val(replaceNull(orderEntity.sPL2000SalePrice));
				//$('#SPL2000ListPrice').val(replaceNull(orderEntity.sPL2000ListPrice));
				
				if('0'!=replaceNull(orderEntity.sPL2000Unit)){
					$('#SPL2000SalePrice').val(replaceNull(orderEntity.sPL2000Unit));
					}
					if('0'!=replaceNull(orderEntity.sPL2000ListPrice)){
					$('#SPL2000ListPrice').val(replaceNull(orderEntity.sPL2000ListPrice));
					}
				
				//salemethod销售模式
				//$('#salemethod').html(replaceNull("经销"));
				
				//if(null!=orderEntity.salemethod&&!''==orderEntity.salemethod){
				if(null!=orderEntity.salemethod){
					if(orderEntity.salemethod=='1'){
						 $('#salemethod').get(0).options[0].selected = true;   
					}
					if(orderEntity.salemethod=='2'){
						 $('#salemethod').get(0).options[1].selected = true;   
					}
					if(orderEntity.salemethod=='3'){
						 $('#salemethod').get(0).options[2].selected = true;   
					}
				}
				
				//nostraightcoeff非直销系数bussinessType
				$('#nostraightcoeff').val(replaceNull(orderEntity.nostraightcoeff));
				//业务费系数
				$('#operatorrate').val(replaceNull(orderEntity.operatorrate));
				//是否年度合同
				var isyearlycontract=orderEntity.isyearlycontract;
				//alert("isyearlycontract:"+isyearlycontract);
				if(true==isyearlycontract){
					//alert("222");
					$("input[name$='orderEntity.isyearlycontract'][value$='true']").attr("checked",true);
				}else{//0
					//alert("22222");
					$("input[name$='orderEntity.isyearlycontract'][value$='false']").attr("checked",true);
				}
				
				
				
				//alert("非直销系数");
				$('#plTotalFee').val(orderEntity.plTotalFee);//国产PL产品合计金额：
				//alert("国产PL产品合计金额");
				$('#payType').val(orderEntity.payType);//付款方式
				//alert("付款方式");
				if(null!=orderEntity.plTotalFee&&!""==orderEntity.plTotalFee){
				$('#rmTotal').val(transfer(orderEntity.plTotalFee));//产品合计
				}
				//alert("产品合计");
				$('#deliveryAdress').val(orderEntity.deliveryAdress);//交货地点：
				//alert("交货地点");
				$("input[name$='orderEntity.freightSide'][value$='"+orderEntity.freightSide+"']").attr("checked",true);
				$("input[name$='orderEntity.transportType'][value$='"+orderEntity.transportType+"']").attr("checked",true);
				$("input[name$='orderEntity.productPackage'][value$='"+orderEntity.productPackage+"']").attr("checked",true);
				
				//$('#billUserName').val(orderEntity.billUserName);//发票签收人
				//alert("发票签收人");
				//$('#billUserId').val(orderEntity.billUserId);
				
				$('#billWriterName').val(orderEntity.billWriterName);//发票签收人
				
				$('#otherNoticeThings').val(orderEntity.otherNoticeThings);
				$('#orderStatus').val(orderStatusShow);
				
				$('#orderIdHidden').val(id);
				
				//alert("11");
				var totalFeeRM = 0;
				var salefeeTotal=0;
				
				for(var i=0;i<productList.length;i++){//订单产品列表
					//product += '<tr id="producttr'+productList[i].productId+'">';//编辑显示改行的id
					product += '<tr id="producttr'+number+'">';//编辑显示改行的id
					//product += '<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delProductTr('+productList[i].productId+',1);"/>'+
					product += '<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delProductTr('+(number)+',1);"/>'+
					'<input type="hidden" name="productIdHiddenTD" value="'+productList[i].productId+'"/></td>';//删除图片
					//序号
					product +='<td>'+(linenum+1)+'</td>';
					//产品规格型号 
					product += '<td><input class="myinputall" id="specifications'+number+'" name="specifications" value="'+replaceNull(productList[i].specifications)+'"/></td>';
					//分类 
					//product += '<td><input class="myinputall" name="productType" value="'+replaceNull(productList[i].productType)+'"/></td>';
					
					//alert("productList[i].productType:"+productList[i].productType);
					//if( null!=productList[i].productType &&!''==productList[i].productType){
					if( null!=productList[i].productType ){
						product += '<td><select class="selectall" name="productType" value="'+productList[i].productType+'">';
					
						if(productList[i].productType=='A'){
							product += '<option value="A" selected="selected">A</option>';
						}else{
							product += '<option value="A">A</option>';
						}
						if(productList[i].productType=='B'){
							product += '<option value="B" selected="selected">B</option>';
						}else{
							product += '<option value="B">B</option>';
						}
						if(productList[i].productType=='C'){
							product += '<option value="C" selected="selected">C</option>';
						}else{
							product += '<option value="C">C</option>';
						}
						if(productList[i].productType=='D'){
							product += '<option value="D" selected="selected">D</option>';
						}else{
							product += '<option value="D">D</option>';
						}
						if(productList[i].productType=='E'){
							product += '<option value="E" selected="selected">E</option>';
						}else{
							product += '<option value="E">E</option>';
						}
						product += '</select></td>';
					}else{
						product += '<td><select class="selectall" name="productType" >';
						product += '<option value="A" selected="selected">A</option>';
						product += '<option value="B">B</option>';
						product += '<option value="C">C</option>';
						product += '<option value="D">D</option>';
						product += '<option value="E">E</option>';
						product += '</select></td>';
					}
					//数量 	
					//product += '<td><input class="myinputall" name="baseUnitCount" value="'+replaceNull(productList[i].baseUnitCount)+'"/></td>';
					product += '<td><input class="myinputall" id="productCount'+number+'" name="productCount" value="'+replaceNull(productList[i].productCount)+'"/></td>';
					
					//销售单价 
					//product += '<td><input class="myinputall" id="saleprice'+number+'" onblur="salepriceChangeOther('+number+');" name="saleprice" value="'+replaceNull(productList[i].saleprice)+'"/></td>';
					product += '<td><input class="myinputall" id="saleprice'+number+'" onblur="salepriceChangeOther('+number+');" name="unitPrice" value="'+replaceNull(productList[i].unitPrice)+'"/></td>';
					//服务费 servicecharge
					product += '<td><input class="myinputall" id="servicecharge'+number+'" onblur="servicechargeChangeOther('+number+');" name="servicecharge" value="'+replaceNull(productList[i].servicecharge)+'"/></td>';
					//列表价 	
					product += '<td><input class="myinputall" id="listprice'+number+'" onblur="listpriceChangeOther('+number+');" name="listprice" value="'+replaceNull(productList[i].listprice)+'"/></td>';
					//结算价 	
					product += '<td><input class="myinputall" id="balanceprice'+number+'" name="balanceprice" readonly="readonly"  value="'+replaceNull(productList[i].balanceprice)+'"/></td>';
					//折扣 	
					//product += '<td><input class="myinputall" id="discount'+number+'" name="discount" readonly="readonly" value="'+replaceNull(productList[i].discount)+'"/></td>';
					//折扣率 	
					product += '<td><input type="hidden" id="discount'+number+'" name="discount"  value="'+replaceNull(productList[i].discount)+'"/><input class="myinputall" id="discountRate'+number+'" name="discountRate" readonly="readonly" value="'+replaceNull(productList[i].discountRate)+'"/></td>';
					
					//销售金额
					//product += '<td><input class="myinputall" id="salefee'+number+'" name="salefee" readonly="readonly" value="'+replaceNull(productList[i].salefee)+'"/></td>';
					//product += '<td><input class="myinputall" id="salefee'+number+'" name="totalFee" readonly="readonly" value="'+replaceNull(productList[i].totalFee)+'"/></td>';
					//新需求值存的是价税合计
					product += '<td><input class="myinputall" id="salefee'+number+'" name="priceTaxTotal" readonly="readonly" value="'+replaceNull(productList[i].priceTaxTotal)+'"/></td>';

					//新需求加入结算金额
					product += '<td><input class="myinputall" id="balancefee'+number+'" name="balancefee" readonly="readonly" value="'+replaceNull(productList[i].balancefee)+'"/></td>';
					
					//新需求加入交货日期
					product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="deliveryTime" value="'+replaceNull(productList[i].deliveryTime)+'"/></td>';
					
					//salefeeTotal = (Number( (  salefeeTotal+productList[i].salefee  ).toFixed(2) )  );
					//新需求值存的是价税合计
					salefeeTotal = (Number( (  salefeeTotal+productList[i].priceTaxTotal  ).toFixed(2) )  );
					/**
					product += '<td><input class="myinputall" id="productCode'+i+'" name="productCode" value="'+replaceNull(productList[i].productCode)+'" onkeyup="toLoadItem('+i+');" onclick="toLoadItem('+i+');"/>';
					product += '<div class="selectProduct" id="selectProductDiv'+i+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProduct'+i+'"></tbody></table></div></td>';
					product += '<td><input class="myinputall" id="productName'+i+'" name="productName" value="'+replaceNull(productList[i].productName)+'"/></td>';
					**/
					
					//product += '<td><input class="myinputall" name="outSaleName" value="'+replaceNull(productList[i].outSaleName)+'"/></td>';
					//product += '<td><input class="myinputall" name="proProjectName" value="'+replaceNull(productList[i].proProjectName)+'"/></td>';
					//product += '<td><input class="myinputall" name="assistAttribute" value="'+replaceNull(productList[i].assistAttribute)+'"/></td>';
					//product += '<td><input class="myinputall" id="excuteStandard'+i+'" name="excuteStandard" value="'+replaceNull(productList[i].excuteStandard)+'" readonly="readonly"/></td>';
					//product += '<td><input class="myinputall" id="specifications'+i+'" name="specifications" value="'+replaceNull(productList[i].specifications)+'" readonly="readonly"/></td>';
					//product += '<td><input class="myinputall" id="material'+i+'" name="material" value="'+replaceNull(productList[i].material)+'" readonly="readonly"/></td>';
					//product += '<td><input class="myinputall" id="productUnit'+i+'" name="productUnit" value="'+replaceNull(productList[i].productUnit)+'" readonly="readonly"/></td>';
					/**
					product += '<td><select class="selectall" name="productType" value="'+productList[i].productType+'">';
					if(productList[i].productType=='A'){
						product += '<option value="A" selected="selected">A</option>';
					}else{
						product += '<option value="A">A</option>';
					}
					if(productList[i].productType=='B'){
						product += '<option value="B" selected="selected">B</option>';
					}else{
						product += '<option value="B">B</option>';
					}
					if(productList[i].productType=='C'){
						product += '<option value="C" selected="selected">C</option>';
					}else{
						product += '<option value="C">C</option>';
					}
					if(productList[i].productType=='D'){
						product += '<option value="D" selected="selected">D</option>';
					}else{
						product += '<option value="D">D</option>';
					}
					if(productList[i].productType=='E'){
						product += '<option value="E" selected="selected">E</option>';
					}else{
						product += '<option value="E">E</option>';
					}
					product += '</select></td>';*/
					/**
					product += '<td ><input class="myinputall" name="productCount" value="'+replaceNull(productList[i].productCount)+'" onblur="countOrderTotalFee();"/></td>';
					product += '<td ><input class="myinputall" name="unitPrice" value="'+replaceNull(productList[i].unitPrice)+'" onblur="countOrderTotalFee();"/></td>';
					**/
					//product += '<td ><input class="myinputall" name="taxRate" value="'+replaceNull(productList[i].taxRate)+'" onblur="countOrderTotalFee();"/></td>';
					//product += '<td ><input class="myinputall" name="unitRemoveTax" value="'+replaceNull(productList[i].unitRemoveTax)+'" readonly="readonly"/></td>';
					/**
					product += '<td ><input class="myinputall" name="discount" value="'+replaceNull(productList[i].discount)+'" onblur="countOrderTotalFee();"/></td>';
					product += '<td ><input class="myinputall" name="totalFee" value="'+replaceNull(productList[i].totalFee)+'" readonly="readonly"/></td>';
					product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="deliveryTime" value="'+replaceNull(productList[i].deliveryTime)+'"/></td>';
					**/
					//product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="adviceDeliveryTime" value="'+replaceNull(productList[i].adviceDeliveryTime)+'"/></td>';
					//product += '<td ><input class="myinputall" name="discountRate" value="'+replaceNull(productList[i].discountRate)+'"/></td>';
					//product += '<td ><input class="myinputall" name="priceTaxTotal" value="'+replaceNull(productList[i].priceTaxTotal)+'"/></td>';
					//product += '<td ><input class="myinputall" name="qualityFee" value="'+replaceNull(productList[i].qualityFee)+'"/></td>';
					//product += '<td ><input class="myinputall" name="qualityFeeRate" value="'+replaceNull(productList[i].qualityFeeRate)+'"/></td>';
					//product += '<td ><input class="myinputall" name="baseUnitName" value="'+replaceNull(productList[i].baseUnitName)+'"/></td>';
					//product += '<td ><input class="myinputall" name="baseUnitCount" value="'+replaceNull(productList[i].baseUnitCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistUnit" value="'+replaceNull(productList[i].assistUnit)+'"/></td>';
					//product += '<td ><input class="myinputall" name="productAssistCount" value="'+replaceNull(productList[i].productAssistCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="convertRate" value="'+replaceNull(productList[i].convertRate)+'"/></td>';
					//product += '<td ><input class="myinputall" name="factUnitPrice" value="'+replaceNull(productList[i].factUnitPrice)+'"/></td>';
					//product += '<td ><input class="myinputall" name="saleTax" value="'+replaceNull(productList[i].saleTax)+'"/></td>';
					//product += '<td ><input class="myinputall" name="makeNumberCode" value="'+replaceNull(productList[i].makeNumberCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="taskCode" value="'+replaceNull(productList[i].taskCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="referCount" value="'+replaceNull(productList[i].referCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistUnitReferCount" value="'+replaceNull(productList[i].assistUnitReferCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistUnitOutHouseCount" value="'+replaceNull(productList[i].assistUnitOutHouseCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="outHouseCount" value="'+replaceNull(productList[i].outHouseCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="customBOM" value="'+replaceNull(productList[i].customBOM)+'"/></td>';
					//product += '<td ><input class="myinputall" name="costObj" value="'+replaceNull(productList[i].costObj)+'"/></td>';
					//product += '<td ><input class="myinputall" name="addOrDel" value="'+replaceNull(productList[i].addOrDel)+'"/></td>';
					//product += '<td ><input class="myinputall" name="lockHouseMark" value="'+replaceNull(productList[i].lockHouseMark)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderCode" value="'+replaceNull(productList[i].sourceOrderCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderType" value="'+replaceNull(productList[i].sourceOrderType)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderInnerCode" value="'+replaceNull(productList[i].sourceOrderInnerCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderSplit" value="'+replaceNull(productList[i].sourceOrderSplit)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactCode" value="'+replaceNull(productList[i].contactCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactInnerCode" value="'+replaceNull(productList[i].contactInnerCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactSplit" value="'+replaceNull(productList[i].contactSplit)+'"/></td>';
					//product += '<td ><input class="myinputall" name="billCount" value="'+replaceNull(productList[i].billCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="customOrderCode" value="'+replaceNull(productList[i].customOrderCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistCompanyBillCount" value="'+replaceNull(productList[i].assistCompanyBillCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistCompanyFitCount" value="'+replaceNull(productList[i].assistCompanyFitCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="orderTrNumber" value="'+replaceNull(productList[i].orderTrNumber)+'"/></td>';
					//product += '<td ><input class="myinputall" name="baseCompanyFitCount" value="'+replaceNull(productList[i].baseCompanyFitCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="fitCount" value="'+replaceNull(productList[i].fitCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistAttributeType" value="'+replaceNull(productList[i].assistAttributeType)+'"/></td>';
					//product += '<td ><input class="myinputall" name="priceTaxTotalRM" value="'+replaceNull(productList[i].priceTaxTotalRM)+'"/></td>';
					//product += '<td ><input class="myinputall" name="markForMRP" value="'+replaceNull(productList[i].markForMRP)+'"/></td>';
					//product += '<td ><input class="myinputall" name="markIsForMRP" value="'+replaceNull(productList[i].markIsForMRP)+'"/></td>';
					//product += '<td ><input class="myinputall" name="collectPayReferFee" value="'+replaceNull(productList[i].collectPayReferFee)+'"/></td>';
					//product += '<td ><input class="myinputall" name="remarks" value="'+replaceNull(productList[i].remarks)+'"/></td>';
					product += '</tr>';
					//totalFeeRM +=productList[i].totalFee;
					//新需求值存的是价税合计
					totalFeeRM +=productList[i].priceTaxTotal;
					linenum++;
					number++;
				}
				$('#productDetail').append(product);
				
				//$('#rmTotal').val(transfer(totalFeeRM));
				//设置影藏域中的数值
				//alert("salefeeTotal:"+salefeeTotal);
				$('#rmTotalNumber').val(  salefeeTotal+''  );
				
				//alert("orderEntity.rmTotal:"+orderEntity.rmTotal);
				
				$('#rmTotal').val( replaceNull(orderEntity.rmTotal) );//共计人民币（大写）：
			}
		});
	}
}
/**
 * 删除标准订单
 * @param id 删除的标准订单的id
 */
function delorders(orderCode){
	var param = {};
	if(null!=orderCode&&orderCode!='') {
		param['checkedCodeList[0]'] = orderCode;
	} else {		
		var delDecvices = $('[name="checkedOrder"]:checked');
		var cnt = 0;
		$.each(delDecvices, function(i, o){		
			param['checkedCodeList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedCodeList[0]']) {
		alert('请选择要删除的标准订单！');
		return;
	}
	
	if(!confirm('确定删除？')) {
		return;
	}
	var url = ctx + '/order/order!delete.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			
		   /**
			if(data && data == 'success') {
				loadOrders();
			} else {
				alert('删除标准订单失败！');
			}**/
		//alert('111');
		data = $.parseJSON(data);
		//alert(""+data.resultInfo[0]);
			if(data.resultInfo[0]=='0'){
				alert(data.resultInfo[1]);
				loadOrders();
			} else {
				alert(data.resultInfo[1]);
			}
		}
	});
}

function showValue(){
	//重新载入列表
	loadOrders();
}


/**
 * 删除产品信息
 * @param number
 * @param type
 */
function delProductTr(number,type){
	//alert("number:"+number);
	//同时更新共计人民币价格
	var rmTotalNumberH=$('#rmTotalNumber').val();
	//alert("rmTotalNumberH:"+rmTotalNumberH);
	if(null!=rmTotalNumberH){
		
		//当前行的总金额
		var salefee = $("#salefee"+number).val();
		//alert("salefee:"+salefee);
		if(null==salefee||''==salefee){
		       //alert('销售单价不能为空！');
			if(type==1){
				delproducts += number+",";
			}
			$('#producttr'+number).remove();
		    return;
		}else{
			var orderTotalFeeNew= (Number( (  rmTotalNumberH-salefee ).toFixed(2) )  );
			//alert("orderTotalFeeNew:"+orderTotalFeeNew);
			
			$('#rmTotalNumber').val(orderTotalFeeNew);
			$('#rmTotal').val(transfer(orderTotalFeeNew));
		}
	}
	//var 
	//salepriceChangeOther(number);
	if(type==1){
		delproducts += number+",";
	}
	$('#producttr'+number).remove();
	//linenum=0;
	
}
var number=10000;
var linenum=0;
function addTr(){
	//tabDetail
	var html='<tr id="producttr'+number+'">'+
				//删除图片
				'<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delProductTr('+number+',0);"/>'+
				'<input type="hidden" name="productIdHiddenTD" value="null"/></td>'+//隐藏域
				
				//序号
				'<td>'+(linenum+1)+'</td>'+
				/****/
				//产品规格型号 	
				'<td><input class="myinputall" id="specifications'+number+'" name="specifications"  /></td>'+
				//分类 
				'<td ><select class="selectall"  name="productType"><option value="A">A</option><option value="B">B</option>'+
				'<option value="C">C</option><option value="D">D</option><option value="E">E</option></select></td>'+
				//数量 	
				//'<td ><input class="myinputall" name="baseUnitCount"/></td>'+//
				'<td ><input class="myinputall" id="productCount'+number+'" name="productCount"/></td>'+
				//销售单价  unitPrice
				//'<td ><input class="myinputall" id="saleprice'+number+'" name="saleprice" onblur="salepriceChangeOther('+number+');" /></td>'+
				'<td ><input class="myinputall" id="saleprice'+number+'" name="unitPrice" onblur="salepriceChangeOther('+number+');" /></td>'+
				
				//服务费 servicecharge	
				'<td ><input class="myinputall" id="servicecharge'+number+'"   name="servicecharge"    onblur="servicechargeChangeOther('+number+');" /></td>'+
				//列表价 	
				'<td ><input class="myinputall" id="listprice'+number+'" name="listprice" onblur="listpriceChangeOther('+number+');" /></td>'+
				//结算价 	
				'<td ><input class="myinputall" id="balanceprice'+number+'"  readonly="readonly"    name="balanceprice"   /></td>'+
				//折扣 	
				//'<td ><input class="myinputall" id="discount'+number+'" readonly="readonly" name="discount"/></td>'+
				
				//折扣率	
				'<td ><input type="hidden" id="discount'+number+'"  name="discount"/><input class="myinputall" id="discountRate'+number+'" readonly="readonly" name="discountRate"/></td>'+
				//销售金额
				//'<td ><input class="myinputall" id="salefee'+number+'" readonly="readonly" name="salefee"/></td>'+
				//'<td ><input class="myinputall" id="salefee'+number+'" readonly="readonly" name="totalFee"/></td>'+
				//新需求存的是价税合计
				'<td ><input class="myinputall" id="salefee'+number+'" readonly="readonly" name="priceTaxTotal"/></td>'+
				
				//新需求加入结算金额
				'<td ><input class="myinputall" id="balancefee'+number+'" readonly="readonly" name="balancefee"/></td>'+
				
				//新需求加入交货日期
				'<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" id="deliveryTime" name="deliveryTime"/></td>'+
				
				/**
				'<td><input class="myinputall" id="productCode'+number+'" name="productCode" onkeyup="toLoadItem('+number+');" onclick="toLoadItem('+number+');"/>'+
				'<div class="selectProduct" id="selectProductDiv'+number+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProduct'+number+'"></tbody></table></div></td>'+
				
				'<td><input class="myinputall" id="productName'+number+'" name="productName"/></td>'+
				
				'<td><input class="myinputall" name="outSaleName"/></td>'+
				'<td><input class="myinputall" name="proProjectName"/></td>'+
				'<td><input class="myinputall" name="assistAttribute"/></td>'+
				**/
				//'<td><input class="myinputall" id="excuteStandard'+number+'" name="excuteStandard" readonly="readonly"/></td>'+
				//'<td><input class="myinputall" id="specifications'+number+'" name="specifications" readonly="readonly"/></td>'+
				//'<td><input class="myinputall" id="material'+number+'" name="material" readonly="readonly"/></td>'+
				//'<td><input class="myinputall" id="productUnit'+number+'" name="productUnit" readonly="readonly"/></td>'+
				//'<td ><select class="selectall"  name="productType"><option value="A">A</option><option value="B">B</option>'+
				//'<option value="C">C</option><option value="D">D</option><option value="E">E</option></select></td>'+
				/**
				'<td><input class="myinputall" name="productCount" onblur="countOrderTotalFee();"/></td>'+
				'<td ><input class="myinputall" name="unitPrice" onblur="countOrderTotalFee();"/></td>'+
				**/
				//'<td ><input class="myinputall" name="taxRate" onblur="countOrderTotalFee();"/></td>'+
				//'<td ><input class="myinputall" name="unitRemoveTax" readonly="readonly"/></td>'+
				/**
				 *
				'<td ><input class="myinputall" name="discount" onblur="countOrderTotalFee();"/></td>'+
				'<td ><input class="myinputall" name="totalFee" readonly="readonly"/></td>'+
				'<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" id="deliveryTime" name="deliveryTime"/></td>'+
				**/
				//'<td ><input class="myinputall" name="adviceDeliveryTime" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>'+
				//'<td ><input class="myinputall" name="discountRate"/></td>'+
				//'<td ><input class="myinputall" name="priceTaxTotal"/></td>'+
				//'<td ><input class="myinputall" name="qualityFeeRate"/></td>'+
				//'<td ><input class="myinputall" name="qualityFee"/></td>'+
				//'<td ><input class="myinputall" name="baseUnitName"/></td>'+
				//'<td ><input class="myinputall" name="baseUnitCount"/></td>'+
				//'<td ><input class="myinputall" name="assistUnit"/></td>'+
				//'<td ><input class="myinputall" name="productAssistCount"/></td>'+
				//'<td ><input class="myinputall" name="convertRate"/></td>'+
				//'<td ><input class="myinputall" name="factUnitPrice"/></td>'+
				//'<td ><input class="myinputall" name="saleTax"/></td>'+
				//'<td ><input class="myinputall" name="makeNumberCode"/></td>'+
				//'<td ><input class="myinputall" name="taskCode"/></td>'+
				//'<td ><input class="myinputall" name="referCount"/></td>'+
				//'<td ><input class="myinputall" name="assistUnitReferCount"/></td>'+
				//'<td ><input class="myinputall" name="assistUnitOutHouseCount"/></td>'+
				//'<td ><input class="myinputall" name="outHouseCount"/></td>'+
				//'<td ><input class="myinputall" name="customBOM"/></td>'+
				//'<td ><input class="myinputall" name="costObj"/></td>'+
				//'<td ><input class="myinputall" name="addOrDel"/></td>'+
				//'<td ><input class="myinputall" name="lockHouseMark"/></td>'+
				//'<td ><input class="myinputall" name="sourceOrderCode"/></td>'+
				//'<td ><input class="myinputall" name="sourceOrderType"/></td>'+
				//'<td ><input class="myinputall" name="sourceOrderInnerCode"/></td>'+
				//'<td ><input class="myinputall" name="sourceOrderSplit"/></td>'+
				//'<td ><input class="myinputall" name="contactCode"/></td>'+
				//'<td ><input class="myinputall" name="contactInnerCode"/></td>'+
				//'<td ><input class="myinputall" name="contactSplit"/></td>'+
				//'<td ><input class="myinputall" name="billCount"/></td>'+
				//'<td ><input class="myinputall" name="customOrderCode"/></td>'+
				//'<td ><input class="myinputall" name="assistCompanyBillCount"/></td>'+
				//'<td ><input class="myinputall" name="assistCompanyFitCount"/></td>'+
				//'<td ><input class="myinputall" name="orderTrNumber"/></td>'+
				//'<td ><input class="myinputall" name="baseCompanyFitCount"/></td>'+
				//'<td ><input class="myinputall" name="fitCount"/></td>'+
				//'<td ><input class="myinputall" name="assistAttributeType"/></td>'+
				//'<td ><input class="myinputall" name="priceTaxTotalRM"/></td>'+
				//'<td ><input class="myinputall" name="markForMRP"/></td>'+
				//'<td ><input class="myinputall" name="markIsForMRP"/></td>'+
				//'<td ><input class="myinputall" name="collectPayReferFee"/></td>'+
			    //'<td ><input class="myinputall" name="remarks"/></td>'+
			'</tr>';
	number++;
	linenum++;
	$('#productDetail').append(html);
}
/**
 * 计算产品总金额
 */
function  countOrderTotalFeeNum(){
	/**---------------------------------------产品总额------------------------------------------------------------------------------*/
	var productCountObj = $('input[name="productCount"]');//产品数量
	//var salepriceObj = $('input[name="saleprice"]');//产品销售单价
	var salepriceObj = $('input[name="unitPrice"]');//产品销售单价
	
	//var salefeeObj = $('input[name="salefee"]');//产品销售金额
	//var salefeeObj = $('input[name="totalFee"]');//产品销售金额
	//新需求存的价税合计
	var salefeeObj = $('input[name="priceTaxTotal"]');//产品价税合计
	
	var orderTotalFee = 0;//转换为大写之前的产品合计
	
	for(var i=0;i<productCountObj.length;i++){//通过产品数量遍历每行
		
		//销售金额=销售单价*数量
		var orderTotalFeeline = 0;//每行产品的金额
		//orderTotalFeeline=Number( productCountObj.eq(i).val() )*Number( salepriceObj.eq(i).val() )  ;
		orderTotalFeeline=Number( salefeeObj.eq(i).val() )   ;
		
		orderTotalFee += orderTotalFeeline;
	}
	/**---------------------------------------pl国产总额------------------------------------------------------------------------------*/
	var PL3000Count =   $('#PL3000Count').val()  ;
	var PL3000SalePrice = $('#PL3000SalePrice').val() ;
	//var PL3000ListPrice = Number($('#PL3000ListPrice').val().toFixed(2));
	
	var PL4200Count =  $('#PL4200Count').val() ;
	var PL4200SalePrice =  $('#PL4200SalePrice').val() ;
	//var PL4200ListPrice = Number($('#PL4200ListPrice').val().toFixed(2));
	
	var SSV3500Count =  $('#SSV3500Count').val() ;
	var SSV3500SalePrice = $('#SSV3500SalePrice').val() ;
	//var SSV3500ListPrice = Number($('#SSV3500ListPrice').val().toFixed(2));
	
	var SPL2000Count =  $('#SPL2000Count').val() ;
	var SPL2000SalePrice =  $('#SPL2000SalePrice').val() ;
	//var SPL2000ListPrice = Number($('#SPL2000ListPrice').val().toFixed(2));
	
	var pltotalfee =0;
	//pltotalfee=Number( (PL3000Count*PL3000SalePrice+PL4200Count*PL4200SalePrice+SSV3500Count*SSV3500SalePrice+SPL2000Count*SPL2000SalePrice).toFixed(2) );
	//$('#plTotalFee').val(pltotalfee);//PL产品总计
	
	//设置影藏域中的数值
	$('#rmTotalNumber').val(  orderTotalFee  );
	$('#rmTotal').val(transfer(orderTotalFee));
}
/**
 * 计算产品总金额
 */
function  countOrderTotalFee(){
	/**---------------------------------------产品总额------------------------------------------------------------------------------*/
	var productCountObj = $('input[name="productCount"]');//产品数量
	//var salepriceObj = $('input[name="saleprice"]');//产品销售单价
	
	var salepriceObj = $('input[name="unitPrice"]');//产品销售单价
	
	//var salefeeObj = $('input[name="salefee"]');//产品销售金额
	
	//var salefeeObj = $('input[name="totalFee"]');//产品销售金额
	
	//新需求存的价税合计
	var salefeeObj = $('input[name="priceTaxTotal"]');//产品价税合计
	
	/**
	var unitPriceObj = $('input[name="unitPrice"]');
	var discountObj = $('input[name="discount"]');//折扣
	var totalFeeObj = $('input[name="totalFee"]');
	//var taxRateObj = $('input[name="taxRate"]');
	//var unitRemoveTaxObj = $('input[name="unitRemoveTax"]');
	//var taxRate;
	var productTotalFee = 0;
	var discount;
	**/
	var orderTotalFee = 0;//转换为大写之前的产品合计
	
	for(var i=0;i<productCountObj.length;i++){//通过产品数量遍历每行
		/**
		discount = discountObj.eq(i).val();
		if(discount==""){
			discount = 1;
		}
		productTotalFee = Number(productCountObj.eq(i).val())*Number(unitPriceObj.eq(i).val())*Number(discount);
		totalFeeObj.eq(i).val(Math.round(productTotalFee*1000)/1000);//保留两位小数
		//taxRate = taxRateObj.eq(i).val();
		//if(taxRate==""){
		//	taxRate = 1;
		//}
		//unitRemoveTaxObj.eq(i).val(Math.round(Number(unitPriceObj.eq(i).val())/(1+Number(taxRate))));
		**/
		
		//销售金额=销售单价*数量
		var orderTotalFeeline = 0;//每行产品的金额
		//orderTotalFeeline=Number( productCountObj.eq(i).val() )*Number( salepriceObj.eq(i).val() )  ;
		orderTotalFeeline=Number( salefeeObj.eq(i).val() )   ;
		
		orderTotalFee += orderTotalFeeline;
	}
	/**---------------------------------------pl国产总额------------------------------------------------------------------------------*/
	/**
	var PL3000Count = Number($('#PL3000Count').val());
	var PL3000Unit = Number($('#PL3000Unit').val());
	var PL4200Count = Number($('#PL4200Count').val());
	var PL4200Unit = Number($('#PL4200Unit').val());
	var SSV3500Count = Number($('#SSV3500Count').val());
	var SSV3500Unit = Number($('#SSV3500Unit').val());
	var SPL2000Count = Number($('#SPL2000Count').val());
	var SPL2000Unit = Number($('#SPL2000Unit').val());
	var pltotalfee = PL3000Count*PL3000Unit+PL4200Count*PL4200Unit+SSV3500Count*SSV3500Unit+SPL2000Count*SPL2000Unit;
	
	//orderTotalFee += pltotalfee;
	$('#plTotalFee').val(pltotalfee);
	**/
	var PL3000Count =   $('#PL3000Count').val()  ;
	var PL3000SalePrice = $('#PL3000SalePrice').val() ;
	//var PL3000ListPrice = Number($('#PL3000ListPrice').val().toFixed(2));
	
	var PL4200Count =  $('#PL4200Count').val() ;
	var PL4200SalePrice =  $('#PL4200SalePrice').val() ;
	//var PL4200ListPrice = Number($('#PL4200ListPrice').val().toFixed(2));
	
	var SSV3500Count =  $('#SSV3500Count').val() ;
	var SSV3500SalePrice = $('#SSV3500SalePrice').val() ;
	//var SSV3500ListPrice = Number($('#SSV3500ListPrice').val().toFixed(2));
	
	var SPL2000Count =  $('#SPL2000Count').val() ;
	var SPL2000SalePrice =  $('#SPL2000SalePrice').val() ;
	//var SPL2000ListPrice = Number($('#SPL2000ListPrice').val().toFixed(2));
	
	var pltotalfee =0;
	pltotalfee=Number( (PL3000Count*PL3000SalePrice+PL4200Count*PL4200SalePrice+SSV3500Count*SSV3500SalePrice+SPL2000Count*SPL2000SalePrice).toFixed(2) );
	$('#plTotalFee').val(pltotalfee);//PL产品总计
	
	//$('#rmTotal').val(transfer(orderTotalFee));
}
/**
 * 提交标准订单
 * @param orderid 要提交的标准订单的id
 */
function submitStandOrder(orderid,orderCode){
	var flag = window.confirm("确定提交订单吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/order/order!examineOrderInfo.htm',
			data :{"orderEntity.orderChecker":" ","orderEntity.orderChecker2":" ","orderEntity.orderApprover":" ",
			"orderEntity.orderId":orderid,"orderEntity.orderCode":orderCode,"orderEntity.orderStatus":1},
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					loadOrders();
					//alert("提交成功!");
					//loadOrders();
				} else {
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
/**
 * 返回到标准订单列表
 */
function tostandardorderlist(){
	window.location.href = ctx+"/order/standardorder-list.htm";
}
/**
 * 弹出产品(物料)列表
 */
function toLoadItem(i){
	$("#selectProductDiv"+i).css("display","");
	var fnumber = $("#productCode"+i).val();
	var data = 'itemQuery.fnumber='+fnumber;
	var html='<td><select id="productSelect'+i+'" onchange="addProduct('+i+');" style="width: 285px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/item/item!listToJson.htm';
	if(fnumber.length>=1){
		$.webAjax({
			type : "post",
			url : url,
			data:data,
			success : function(data) {
				data = $.parseJSON(data);
				var page = data.page;
				$.each(page.result,function(i,o){
					html+='<option value="'+o.fnumber+'" >'+o.fnumber+'|'+o.fname+'</option>';
				});
				html+='</select></td>';
				$('#selectProduct'+i).html(html);
			}
		});	
	}
}
/**
 * 添加产品(物料)
 */
function addProduct(i){
	var selectValue = $('#productSelect'+i).val();
	//var selectTxt = $("#productSelect"+i).find('option:[value="'+selectValue+'"]').text();
	if(selectValue==''||selectValue==undefined||selectValue==null){
		var selectTxt = $("#productSelect"+i).find('option:[value="'+selectValue+'"]').text();
		$('#productCode'+i).val(selectTxt);
	}else{
		$('#productCode'+i).val(selectValue);
	}
	$.webAjax({
		type : "post",
		url : ctx+'/item/item!input.htm?',
		data:'itemQuery.fnumber='+selectValue,
		success : function(data) {
			$('#productName'+i).val(data.fname);
			$('#excuteStandard'+i).val(data.f106);
			$('#specifications'+i).val(data.fmodel);
			$('#material'+i).val(data.f105);
			$('#productUnit'+i).val(data.funitid);
		}
	});
	$("#selectProductDiv"+i).css("display","none");
}
/**
 * 弹出审核窗口
 * @param id
 */
function examineStandOrder(id,orderCode){
	$('#orderIdHidden').val(id);
	//订单编号
	$('#orderCodeHidden').val(orderCode);
	
	$.openDiv('examineDiv');
}
/**
 * 审核操作
 */
function examineAgree(){
	var orderid = $('#orderIdHidden').val();
	//订单编号
	var orderCode = $('#orderCodeHidden').val();
	
	var orderStatus = $("input[name='examine']:checked").val();
	
	//审核内容
	var approveCotent = $('#approveCotent').val();
    if("22"==orderStatus){//驳回提示原因必填
		if(null==approveCotent||""==approveCotent){
			alert("请填写驳回原因!");
			return;
		}
	}
	var flag = window.confirm("确定提交吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx + '/order/order!examineOrderInfo.htm',
			data :{"orderEntity.orderId":orderid,"orderEntity.orderCode":orderCode,
				"orderEntity.orderStatus":orderStatus,"orderEntity.approveCotent":approveCotent},
			success : function(data) {
				
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					loadOrders();
					$('#orderIdHidden').val("");
					$.closeDiv('examineDiv');
				} else {
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
/**
 * 弹出列表页中搜索负责人
 */
function toSeachUser(){
	$("#selectUserNameDiv").css("display","");
	var name = $("#userName").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="userNameSelect" onchange="addUserName();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
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
			$('#selectUserName').html(html);
		}
	});	
}
/**
 * 添加发票接收人
 */
function addUserName(){
	var selectValue = $('#userNameSelect').val();
	var selectTxt = $("#userNameSelect").find('option:[value='+selectValue+']').text();
	$('#userName').val(selectTxt);
	//$('#billUserId').val(selectValue);
	$("#selectUserNameDiv").css("display","none");
}
/**
 * 弹出发票接收人列表
 */
function toAddBillUser(){
	$("#selectBillUserDiv").css("display","");
	var name = $("#billUserName").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="billUserSelect" onchange="addBillUser();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
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
			$('#selectBillUser').html(html);
		}
	});	
}
/**
 * 添加发票接收人
 */
function addBillUser(){
	var selectValue = $('#billUserSelect').val();
	var selectTxt = $("#billUserSelect").find('option:[value='+selectValue+']').text();
	$('#billUserName').val(selectTxt);
	$('#billUserId').val(selectValue);
	$("#selectBillUserDiv").css("display","none");
}
/**
 * 弹出集团客户列表
 */
function toAddSystemConsumer(){
	$("#selectSystemConsumerDiv").css("display","");
	var name = $("#systemConsumer").val();
	var data = 'blocQuery.blocname='+name;
	var html='<td><select id="systemConsumerSelect" onchange="addSystemConsumer();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/listbloc.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.blocList;
			$.each(list,function(i,o){
				html+='<option value="'+o.blocid+'" >'+o.blocname+'</option>';
			});
			html+='</select></td>';
			$('#selectSystemConsumer').html(html);
		}
	});	
}
/**
 * 添加集团客户
 */
function addSystemConsumer(){
	var selectValue = $('#systemConsumerSelect').val();
	var selectTxt = $("#systemConsumerSelect").find('option:[value='+selectValue+']').text();
	$('#systemConsumer').val(selectTxt);
	$('#systemConsumerId').val(selectValue);
	$("#selectSystemConsumerDiv").css("display","none");
}
/**
 * 弹出合算项目名称列表
 */
function toAddProject(){
	$("#selectProjectDiv").css("display","");
	var name = $("#projectName").val();
	var data = 'pmQuery.pmname='+name;
	var html='<td><select id="projectSelect" onchange="addProject();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/pm/pm!listToQuery.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.pmList;
			$.each(list,function(i,o){
				html+='<option value="'+o.pmid+'" >'+o.pmname+'</option>';
			});
			html+='</select></td>';
			$('#selectProject').html(html);
		}
	});	
}
/**
 * 添加合算项目
 */
function addProject(){
	var selectValue = $('#projectSelect').val();
	var selectTxt = $("#projectSelect").find('option:[value='+selectValue+']').text();
	$('#projectName').val(selectTxt);
	$('#projectId').val(selectValue);
	$("#selectProjectDiv").css("display","none");
}

/**
 * 跳转到查看页面
 * @param id
 */
function toStandardOrderCheck(id){
	window.location.href = ctx+"/order/standardorder-check.htm?id="+id;
}
/**
 * 查看订单
 * @param id
 */
function standardOrderCheck(id){
	$.webAjax({
		type : 'post',
		url : ctx + '/order/order!input.htm?id='+id,
		success : function(data) {
		    //alert("data1,"+(data));
		    data = $.parseJSON(data);
		    //alert("data2,"+(data));
		    //alert("data,"+(data.order));
		    //alert("data,"+(data.orderEntity));
			//var orderEntity = data.orderEntity;//订单实体
			var orderEntity = data.order;//订单实体
			var productList = data.productList;//订单实体关联的产品实体
			//alert("orderEntity,"+(orderEntity)+",productList"+productList);
			//alert(",productList"+productList);
			var product = "";
			var orderStatus = "";
			var freightSide = "";
			var transportType = "";
			var productPackage = "";
			
			if(orderEntity.freightSide==1){
				freightSide = "供方承担";
			}else{
				freightSide = "需方承担";
			}
			if(orderEntity.transportType==1){
				transportType = "公路";
			}else if(orderEntity.transportType==2){
				transportType = "铁路";
			}else if(orderEntity.transportType==3){
				transportType = "航空";
			}else{
				transportType = "其他";
			}
			if(orderEntity.productPackage==0){
				productPackage = "无包装";
			}else if(orderEntity.productPackage==1){
				productPackage = "纸箱";
			}else{
				productPackage = "木箱";
			}
			/**
			if(orderEntity.orderStatus==0){
				orderStatus= "未提交";
			}else if(orderEntity.orderStatus==1){
				orderStatus= "未审核";
			}else if(orderEntity.orderStatus==2){
				orderStatus= "审核通过,已生效";
			}else if(orderEntity.orderStatus==3){
				orderStatus= "审批不通过,驳回!";
			}else{
				orderStatus= "订单错误!";
			}**/
			//0 待提交 1 销售经理待审核 2 销售经理驳回 3副总经理待审核4副总经理驳回5总经理待审核6总经理驳回7 已生效
			/**
			if(orderEntity.orderStatus==0){
				orderStatus= "未提交";
			}else if(orderEntity.orderStatus==1){
				orderStatus= "销售经理待审核";
			}else if(orderEntity.orderStatus==2){
				orderStatus= " 销售经理驳回";
			}else if(orderEntity.orderStatus==3){
				orderStatus= "副总经理待审核";
			}
			else if(orderEntity.orderStatus==4){
				orderStatus= "副总经理驳回";
			}
			else if(orderEntity.orderStatus==5){
				orderStatus= "总经理待审核";
			}else if(orderEntity.orderStatus==6){
				orderStatus= "总经理驳回";
			}else if(orderEntity.orderStatus==7){
				orderStatus= "已生效";
			}**/
			//alert("orderEntity.orderStatus,"+(orderEntity.orderStatus));
			//alert("orderEntity.orderStatus==0,"+(orderEntity.orderStatus=="0"));
			//新流程基本订单状态:0 待提交 1 区域经理和财务经理待审核 2 区域经理驳回 3财务经理驳回 
			//4 售后服务部经理待审核5售后服务部经理驳回
			//6 副总经理及以上待审核    7 副总经理驳回8总经理驳回9 已生效
			if(orderEntity.orderStatus=="0"){//营销部主管意见：
				orderStatusShow = "未提交";
			}else if(orderEntity.orderStatus=="1"){
				orderStatusShow = "区域经理和财务经理待审核";
			}else if(orderEntity.orderStatus=="2"){
				orderStatusShow = "区域经理驳回";
			}else if(orderEntity.orderStatus=="3"){
				orderStatusShow = "财务经理驳回";
			}else if(orderEntity.orderStatus=="4"){
				orderStatusShow = "售后服务部经理待审核";
			}else if(orderEntity.orderStatus=="5"){
				orderStatusShow = "售后服务部经理驳回";
			}else if(orderEntity.orderStatus=="6"){
				orderStatusShow = "副总经理及以上待审核";
			}else if(orderEntity.orderStatus=="7"){
				orderStatusShow = "副总经理驳回";
			}else if(orderEntity.orderStatus=="8"){
				orderStatusShow = "总经理驳回";
			}else if(orderEntity.orderStatus=="9"){
				orderStatusShow = "已生效";
			}
			else if(orderEntity.orderStatus=="10"){
				orderStatusShow = "区域经理已审核财务经理未审核";
			}
			else if(orderEntity.orderStatus=="11"){
				orderStatusShow = "财务经理已审核区域经理未审核";
			}
			else if(orderEntity.orderStatus=="12"){
				orderStatusShow = "订单管理部经理和财务经理待审核";
			}else if(orderEntity.orderStatus=="13"){
				orderStatusShow = "订单管理部经理驳回";
			}else if(orderEntity.orderStatus=="14"){
				orderStatusShow = "订单管理部经理已审核财务经理待审核";
			}else if(orderEntity.orderStatus=="15"){
				orderStatusShow = "财务经理已审核订单管理部经理待审核";
			}
			else{
				orderStatus= "订单错误!";
			}
			//$('#userName').html(replaceNull(orderEntity.userName));
			
			$('#orderCode').html(replaceNull(orderEntity.orderCode));
			
			$('#orderTime').html(replaceNull(formatDate("yyyy-MM-dd",orderEntity.orderTime)));
			
			$('#orderCompanyName').html(replaceNull(orderEntity.orderCompanyName));
			$('#userCompanyName').html(replaceNull(orderEntity.userCompanyName));
			$('#userCompanyPerson').html(replaceNull(orderEntity.userCompanyPerson));
			$('#userCompanyAdress').html(replaceNull(orderEntity.userCompanyAdress));
			$('#userCompanyPhone').html(replaceNull(orderEntity.userCompanyPhone));
			//alert("orderEntity.projectName:"+orderEntity.projectName);
			$('#projectName').html(replaceNull(orderEntity.projectName));
			
			//$('#bussinessType').html(replaceNull(orderEntity.bussinessType));
			//alert("orderEntity.bussinessType:"+orderEntity.bussinessType
					//+(null!=orderEntity.bussinessType ));
			//alert("orderEntity.bussinessType:"+orderEntity.bussinessType
					//+(  !''==(replaceNull(orderEntity.bussinessType)+'')  ));
			
			//alert("orderEntity.bussinessType:"+orderEntity.bussinessType
					//+(null!=orderEntity.bussinessType&&!''==(replaceNull(orderEntity.bussinessType)+'')));
			//if(null!=orderEntity.bussinessType&&!''==(replaceNull(orderEntity.bussinessType)+'')){
			if(null!=orderEntity.bussinessType ){
				if('1'==(replaceNull(orderEntity.bussinessType)+'')){
					$('#bussinessType').html("基础业务");
				}
				if('2'==(replaceNull(orderEntity.bussinessType)+'')){
					$('#bussinessType').html("大项目业务");
				}
			}
			
			$('#gasSource').html(replaceNull(orderEntity.gasSource));
			
			$('#systemConsumer').html(replaceNull(orderEntity.systemConsumer));
			
			if('0'!=replaceNull(orderEntity.pL3000Count)){
			$('#PL3000Count').html(replaceNull(orderEntity.pL3000Count));
			}
			//$('#PL3000Unit').html(replaceNull(orderEntity.pL3000Unit));
			//alert("orderEntity.pL3000SalePrice:"+orderEntity.pL3000SalePrice);
			if('0'!=replaceNull(orderEntity.pL3000Unit)){
				$('#PL3000SalePrice').html(replaceNull(orderEntity.pL3000Unit));
			}
			if('0'!=replaceNull(orderEntity.pL3000ListPrice)){
			$('#PL3000ListPrice').html(replaceNull(orderEntity.pL3000ListPrice));
			}
			if('0'!=replaceNull(orderEntity.pL4200Count)){
			$('#PL4200Count').html(replaceNull(orderEntity.pL4200Count));
			}
			//$('#PL4200Unit').html(replaceNull(orderEntity.pL4200Unit));
			if('0'!=replaceNull(orderEntity.pL4200Unit)){
			$('#PL4200SalePrice').html(replaceNull(orderEntity.pL4200Unit));
			}
			//alert("orderEntity.pL4200ListPrice:"+orderEntity.pL4200ListPrice);
			if('0'!=replaceNull(orderEntity.pL4200ListPrice)){
			$('#PL4200ListPrice').html(replaceNull(orderEntity.pL4200ListPrice));
			}
			if('0'!=replaceNull(orderEntity.sSV3500Count)){
			$('#SSV3500Count').html(replaceNull(orderEntity.sSV3500Count));
			}
			//$('#SSV3500Unit').html(replaceNull(orderEntity.sSV3500Unit));
			if('0'!=replaceNull(orderEntity.sSV3500Unit)){
			$('#SSV3500SalePrice').html(replaceNull(orderEntity.sSV3500Unit));
			}
			if('0'!=replaceNull(orderEntity.sSV3500ListPrice)){
			$('#SSV3500ListPrice').html(replaceNull(orderEntity.sSV3500ListPrice));
			}
			if('0'!=replaceNull(orderEntity.sPL2000Count)){
			$('#SPL2000Count').html(replaceNull(orderEntity.sPL2000Count));
			}
			//$('#SPL2000Unit').html(replaceNull(orderEntity.sPL2000Unit));
			if('0'!=replaceNull(orderEntity.sPL2000Unit)){
			$('#SPL2000SalePrice').html(replaceNull(orderEntity.sPL2000Unit));
			}
			if('0'!=replaceNull(orderEntity.sPL2000ListPrice)){
			$('#SPL2000ListPrice').html(replaceNull(orderEntity.sPL2000ListPrice));
			}
			
			$('#plTotalFee').html(replaceNull(orderEntity.plTotalFee));
			
			//salemethod销售模式
			//alert("orderEntity.salemethod:"+orderEntity.salemethod+(null!=orderEntity.salemethod&&!''==(replaceNull(orderEntity.salemethod)+'')));
			//if(null!=orderEntity.salemethod&&!''==(replaceNull(orderEntity.salemethod)+'')){
		    if(null!=orderEntity.salemethod){
				if('1'==(replaceNull(orderEntity.salemethod)+'')){
					$('#salemethod').html("经销");
				}
				if('2'==(replaceNull(orderEntity.salemethod)+'')){
					$('#salemethod').html("直销");
				}
				if('3'==(replaceNull(orderEntity.salemethod)+'')){
					$('#salemethod').html("代销");
				}
			}
			//nostraightcoeff非直销系数
			$('#nostraightcoeff').html(replaceNull(orderEntity.nostraightcoeff));
			//alert("非直销系数");
			//业务费系数
			$('#operatorrate').html(replaceNull(orderEntity.operatorrate));
			//是否年度合同
			var isyearlycontract=orderEntity.isyearlycontract;
			//
			//alert("isyearlycontract:"+isyearlycontract);
			//alert("'true'==isyearlycontract:"+'true'==isyearlycontract);
			if(true==isyearlycontract){
				$('#isyearlycontract').html("是");
			}else{//0
				$('#isyearlycontract').html("否");
			}
			
			$('#payType').html(replaceNull(orderEntity.payType));
			
			
			$('#deliveryAdress').html(replaceNull(orderEntity.deliveryAdress));
			$('#freightSide').html(replaceNull(freightSide));
			$('#transportType').html(replaceNull(transportType));
			$('#productPackage').html(replaceNull(productPackage));
			
			//$('#billUserName').html(replaceNull(orderEntity.billUserName));
			//发票签收人
			$('#billWriterName').html(replaceNull(orderEntity.billWriterName));
			//alert("非直销系数");
			/**
			 * //审核人
			alert("审核人:"+orderEntity.orderChecker);
			if(null!=orderEntity.orderChecker){
				$('#orderChecker').html(replaceNull(orderEntity.orderChecker));
			}
			//审批人
			alert("审批人:"+orderEntity.orderApprover);
			if(null!=orderEntity.orderApprover){
				$('#orderApprover').html(replaceNull(orderEntity.orderApprover));
			}**/
			
			//单独显示审核人,审批人,及意见
			//第一个审核人
			if(null!=orderEntity.finmanagername){
				$('#orderChecker1').html(replaceNull(orderEntity.finmanagername));
			}
			//第二个审核人
			if(null!=orderEntity.areamanagername){
				$('#orderChecker2').html(replaceNull(orderEntity.areamanagername));
			}
			//审批人
			if(null!=orderEntity.orderApprover){
				$('#orderApproverName').html(replaceNull(orderEntity.orderApprover));
			}
			//第一个审核人意见
			if(null!=orderEntity.finmanagerapprCotent){
				$('#orderChecker1Msg').html(replaceNull(orderEntity.finmanagerapprCotent));
			}
			//第二个审核人意见
			if(null!=orderEntity.areamanagerappCotent){
				$('#orderChecker2Msg').html(replaceNull(orderEntity.areamanagerappCotent));
			}
			//审批人意见
			if(null!=orderEntity.managerapprCotent){
				$('#orderApproverMsg').html(replaceNull(orderEntity.managerapprCotent));
			}
			
			$('#otherNoticeThings').html(replaceNull(orderEntity.otherNoticeThings));
			//单据状态
			//alert("orderStatusShow:"+orderStatusShow);
			$('#orderStatus').html(orderStatusShow);
			//alert("orderStatus:"+orderStatus);
			//$('#orderStatus').html(replaceNull(orderStatus));
			
			$('#userNameStatus').html(replaceNull(orderEntity.userName));
			//基本订单产品
			//alert("productList.length:"+productList.length);
			for(var i=0;i<productList.length;i++){
				product += '<tr id="producttr'+productList[i].productId+'">';
				product += '<td>'+(i+1)+'</td>';
				//产品规格型号 
				product += '<td><span>'+replaceNull(productList[i].specifications)+'</span></td>';
				//分类 
				product += '<td><span>'+replaceNull(productList[i].productType)+'</span></td>';
				//数量 	
				//product += '<td><span>'+replaceNull(productList[i].baseUnitCount)+'</span></td>';//
				product += '<td><span>'+replaceNull(productList[i].productCount)+'</span></td>';
				//销售单价 
				//product += '<td><span>'+replaceNull(productList[i].saleprice)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].unitPrice)+'</span></td>';
				//服务费 servicecharge
				product += '<td><span>'+replaceNull(productList[i].servicecharge)+'</span></td>';
				//列表价 	
				product += '<td><span>'+replaceNull(productList[i].listprice)+'</span></td>';
				//结算价 	
				product += '<td><span>'+replaceNull(productList[i].balanceprice)+'</span></td>';
				//折扣 	
				//product += '<td><span>'+replaceNull(productList[i].discount)+'</span></td>';
				//折扣率 	
				product += '<td><span>'+replaceNull(productList[i].discountRate)+'</span></td>';
				//销售金额
				//product += '<td><span>'+replaceNull(productList[i].salefee)+'</span></td>';
				
				//product += '<td><span>'+replaceNull(productList[i].totalFee)+'</span></td>';
				//新需求存的价税合计==销售金额
				product += '<td><span>'+replaceNull(productList[i].priceTaxTotal)+'</span></td>';
				//新需求加入结算金额
				product += '<td><span>'+replaceNull(productList[i].balancefee)+'</span></td>';
				//新需求加入交货期
				product += '<td><span>'+replaceNull(productList[i].deliveryTime)+'</span></td>';
				/**
				product += '<td><span>'+replaceNull(productList[i].productCode)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].productName)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].excuteStandard)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].specifications)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].material)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].productUnit)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].productCount)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].unitPrice)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].taxRate)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].unitRemoveTax)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].discount)+'</span></td>';
				product += '<td><span class="productTotalFee">'+replaceNull(productList[i].totalFee)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].deliveryTime)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].adviceDeliveryTime)+'</span></td>';
				product += '<td><span>'+replaceNull(productList[i].remarks)+'</span></td>';
				**/
				
				product += '</tr>';
			}
			//alert("product:"+product);
			$('#productDetail').append(product);
			
			var productTotalFeeObj = $('.productTotalFee');
			
			var productTotalFee = 0;
			for(var i=0;i<productTotalFeeObj.length;i++){
				productTotalFee += parseFloat(productTotalFeeObj.eq(i).text());
			}
			//productTotalFee += parseFloat(orderEntity.plTotalFee);
			//$('#rmTotal').html(transfer(productTotalFee));
			//alert("orderEntity.rmTotal:"+orderEntity.rmTotal);
			$('#rmTotal').html( replaceNull(orderEntity.rmTotal) );//共计人民币（大写）：
			
			//如果有驳回原因显示信息
			//loaditemwait();
		}
	});
}

function transfer(currencyDigits) { //金额大写转换函数  
	var MAXIMUM_NUMBER = 99999999999.99;
	// Predefine the radix characters and currency symbols for output:
	var CN_ZERO = "零";
	var CN_ONE = "壹";
	var CN_TWO = "贰";
	var CN_THREE = "叁";
	var CN_FOUR = "肆";
	var CN_FIVE = "伍";
	var CN_SIX = "陆";
	var CN_SEVEN = "柒";
	var CN_EIGHT = "捌";
	var CN_NINE = "玖";
	var CN_TEN = "拾";
	var CN_HUNDRED = "佰";
	var CN_THOUSAND = "仟";
	var CN_TEN_THOUSAND = "万";
	var CN_HUNDRED_MILLION = "亿";
	// var CN_SYMBOL = "人民币";
	var CN_DOLLAR = "元";
	var CN_TEN_CENT = "角";
	var CN_CENT = "分";
	var CN_INTEGER = "整";

	// Variables:
	var integral; // Represent integral part of digit number.
	var decimal; // Represent decimal part of digit number.
	var outputCharacters; // The output result.
	var parts;
	var digits, radices, bigRadices, decimals;
	var zeroCount;
	var i, p, d;
	var quotient, modulus;

	// Validate input string:
	currencyDigits = currencyDigits.toString();
	if (currencyDigits == "") {
		//alert("Empty input!");
		alert("存在空的输入项!");
		return "";
	}
	if (currencyDigits.match(/[^,.\d]/) != null) {
		//alert("Invalid characters in the input string!");
		alert("输入项存在非合法的数字字符!");
		return "";
	}
	if ((currencyDigits)
			.match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) {
		//alert("Illegal format of digit number!");
		alert("非法数字字符!");
		return "";
	}

	// Normalize the format of input digits:
	currencyDigits = currencyDigits.replace(/,/g, ""); // Remove comma
														// delimiters.
	currencyDigits = currencyDigits.replace(/^0+/, ""); // Trim zeros at the
														// beginning.
	// Assert the number is not greater than the maximum number.
	if (Number(currencyDigits) > MAXIMUM_NUMBER) {
		//alert("Too large a number to convert!");
		alert("转换的数据太大!");
		return "";
	}

	// Process the coversion from currency digits to characters:
	// Separate integral and decimal parts before processing coversion:
	parts = currencyDigits.split(".");
	if (parts.length > 1) {
		integral = parts[0];
		decimal = parts[1];
		// Cut down redundant decimal digits that are after the second.
		decimal = decimal.substr(0, 2);
	} else {
		integral = parts[0];
		decimal = "";
	}
	// Prepare the characters corresponding to the digits:
	digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE,
			CN_SIX, CN_SEVEN, CN_EIGHT, CN_NINE);
	radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND);
	bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION);
	decimals = new Array(CN_TEN_CENT, CN_CENT);
	// Start processing:
	outputCharacters = "";
	// Process integral part if it is larger than 0:
	if (Number(integral) > 0) {
		zeroCount = 0;
		for (i = 0; i < integral.length; i++) {
			p = integral.length - i - 1;
			d = integral.substr(i, 1);
			quotient = p / 4;
			modulus = p % 4;
			if (d == "0") {
				zeroCount++;
			} else {
				if (zeroCount > 0) {
					outputCharacters += digits[0];
				}
				zeroCount = 0;
				outputCharacters += digits[Number(d)] + radices[modulus];
			}
			if (modulus == 0 && zeroCount < 4) {
				outputCharacters += bigRadices[quotient];
			}
		}
		outputCharacters += CN_DOLLAR;
	}
	// Process decimal part if there is:
	if (decimal != "") {
		for (i = 0; i < decimal.length; i++) {
			d = decimal.substr(i, 1);
			if (d != "0") {
				outputCharacters += digits[Number(d)] + decimals[i];
			}
		}
	}
	// Confirm and return the final output string:
	if (outputCharacters == "") {
		outputCharacters = CN_ZERO + CN_DOLLAR;
	}
	if (decimal == "") {
		outputCharacters += CN_INTEGER;
	}
	// outputCharacters = CN_SYMBOL + outputCharacters;
	return outputCharacters;
}