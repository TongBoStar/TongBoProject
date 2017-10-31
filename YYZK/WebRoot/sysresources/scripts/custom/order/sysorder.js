function erpTongBuData(){
	block_viewport("");
	var url = ctx+ '/sysOrder/sys-order!changZhouErpDatasWith.htm';
	$.webAjax({
		type : 'post',
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var url = ctx+ '/sysOrder/sys-order!changZhouErpDatasWithDif.htm';
				$.webAjax({
					type : 'post',
					url : url,
					success : function(data) {
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0'){
							var url = ctx+ '/sysOrder/sys-order!changZhouErpDatasWithNoOrderNum.htm';
							$.webAjax({
								type : 'post',
								url : url,
								success : function(data) {
									data = $.parseJSON(data);
									if(data.resultInfo[0]=='0'){
										alert("同步成功！");
										loadOrders();
										xval.remove();
									}
									
								}
							});
						}
						
					}
				});
			}
			
		}
	});
}

//同步常州ERP中订单编号和合同编号存在且编号相同的情况
function erpTongBuData1(){
	block_viewport("");
	var url = ctx+ '/sysOrder/sys-order!changZhouErpDatasWith.htm';
	$.webAjax({
		type : 'post',
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				//erpTongBuData2();
				//erpTongBuData3();
				alert("同步成功！");
				loadOrders();
				xval.remove();
			}else{
				alert(data.resultInfo[1]);
			}
			
			
		}
	});
}
//同步订单编号和合同编号存在但编号不相同的情况
function erpTongBuData2(){
	var url = ctx+ '/sysOrder/sys-order!changZhouErpDatasWithDif.htm';
	$.webAjax({
		type : 'post',
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("同步成功！");
				loadOrders();
				xval.remove();
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
}
//同步常州ERP中订单编号不存在,合同编号存在的情况
function erpTongBuData3(){
	var url = ctx+ '/sysOrder/sys-order!changZhouErpDatasWithNoOrderNum.htm';
	$.webAjax({
		type : 'post',
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("同步成功！");
				loadOrders();
				xval.remove();
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
}
/**
 * 提交查询表单
 * @param simpleTable 查询表单
 * @param param 参数
 */
function submitQueryForm(simpleTable, param){
	loadOrders();
}
/**
 * 查询系统订单信息
 */
/**
 * 显示系统订单审核后该订单的奖励人信息
 */
function getSysorderSaleInfo(orderCode) {
	var url = ctx+ '/sysOrder/getSysorderSaleInfo.htm';
	var html = '';
	var salename='';
	var salenum=1;
	//某个人员的合计
	var salenameTotaloutlay=0;
	var salenameTotalblance=0;
	var salenameTotalovers=0;
	var salenameTotalplbonus=0;
	var salenameTotallineTotal=0;
	
	//最后总合计
	var totaloutlay=0;
	var totalblance=0;
	var totalovers=0;
	var totalplbonus=0;
	var totallineTotal=0;
	
//	var saleManagename='';
//	var saleAreaManagename='';
	$.webAjax({
		type : 'post',
		url : url,
		data :'performanceQuery.ordercode='+orderCode,
		success : function(data) {
			data = $.parseJSON(data);
			var performanceList = data.performanceList;
			if(null!=performanceList&&0<performanceList.length){//说明有值
				salename=performanceList[0].operatorName;
			}
			$.each(performanceList, function(i, o){
				var operatorName=o.operatorName;
				var salestype=o.salestype;
				var blance=o.blance;
				var overs=o.overs;
				var outlay=o.outlay;
				var plbonus=o.plbonus;
				//超额奖和PL奖取最大者
				var maxValue=Math.max(overs,plbonus);
				//当前行合计
				var outlayblanceadd=Number(outlay)+Number(blance) ;
				var lineTotal=Number(outlayblanceadd)+Number(maxValue) ;
				lineTotal= (Number( (  lineTotal ).toFixed(2) )  );
				
				if(operatorName==salename){//是当前人的数据了
					html+='<tr align="center">';
					html+='<td width="30px;" >'+operatorName+'</td>';
					html+='<td width="30px;" >'+salestype+'</td>';
					html+='<td width="30px;" >'+outlay+'</td>';
					html+='<td width="30px;" >'+blance+'</td>';
					html+='<td width="30px;" >'+overs+'</td>';
					html+='<td width="30px;" >'+plbonus+'</td>';
					//当前行合计
					html+='<td width="30px;" >'+lineTotal+'</td>';
					html+='</tr>';
					salenameTotaloutlay=Number(salenameTotaloutlay)+Number(outlay) ;
					salenameTotalblance=Number(salenameTotalblance)+Number(blance) ;
					salenameTotalovers=Number(salenameTotalovers)+Number(overs) ;
					salenameTotalplbonus=Number(salenameTotalplbonus)+Number(plbonus) ;
					salenameTotallineTotal=Number(salenameTotallineTotal)+Number(lineTotal) ;
					//总合计
					totaloutlay=Number(totaloutlay)+Number(outlay) ;
					totalblance=Number(totalblance)+Number(blance) ;
					totalovers=Number(totalovers)+Number(overs) ;
					totalplbonus=Number(totalplbonus)+Number(plbonus) ;
					totallineTotal=Number(totallineTotal)+Number(lineTotal) ;
					
				}else{//是下一个人的数据了
					//先插入上一个人的合计
					html+='<tr align="center">';
					html+='<td width="30px;" >'+"合计"+'</td>';
					html+='<td width="30px;" >'+''+'</td>';
					html+='<td width="30px;" >'+salenameTotaloutlay+'</td>';
					html+='<td width="30px;" >'+salenameTotalblance+'</td>';
					html+='<td width="30px;" >'+salenameTotalovers+'</td>';
					html+='<td width="30px;" >'+salenameTotalplbonus+'</td>';
					//当前行合计
					html+='<td width="30px;" >'+salenameTotallineTotal+'</td>';
					html+='</tr>';
					//置为空
					salenameTotaloutlay=Number(0) ;
					salenameTotalblance=Number(0) ;
					salenameTotalovers=Number(0) ;
					salenameTotalplbonus=Number(0) ;
					salenameTotallineTotal=Number(0) ;
					//将当前的人员的数据更新到临时存放的销售人员变量中
					salename=operatorName;
					
					html+='<tr align="center">';
					html+='<td width="30px;" >'+operatorName+'</td>';
					html+='<td width="30px;" >'+salestype+'</td>';
					html+='<td width="30px;" >'+outlay+'</td>';
					html+='<td width="30px;" >'+blance+'</td>';
					html+='<td width="30px;" >'+overs+'</td>';
					html+='<td width="30px;" >'+plbonus+'</td>';
					//当前行合计
					html+='<td width="30px;" >'+lineTotal+'</td>';
					html+='</tr>';
					salenameTotaloutlay=Number(salenameTotaloutlay)+Number(outlay) ;
					salenameTotalblance=Number(salenameTotalblance)+Number(blance) ;
					salenameTotalovers=Number(salenameTotalovers)+Number(overs) ;
					salenameTotalplbonus=Number(salenameTotalplbonus)+Number(plbonus) ;
					salenameTotallineTotal=Number(salenameTotallineTotal)+Number(lineTotal) ;
					
					//总合计
					totaloutlay=Number(totaloutlay)+Number(outlay) ;
					totalblance=Number(totalblance)+Number(blance) ;
					totalovers=Number(totalovers)+Number(overs) ;
					totalplbonus=Number(totalplbonus)+Number(plbonus) ;
					totallineTotal=Number(totallineTotal)+Number(lineTotal) ;
					salenum++;
				}
				
				if(i==(performanceList.length-1)){//最后一个人最后一行数据
					html+='<tr align="center">';
					html+='<td width="30px;" >'+"合计"+'</td>';
					html+='<td width="30px;" >'+''+'</td>';
					html+='<td width="30px;" >'+salenameTotaloutlay+'</td>';
					html+='<td width="30px;" >'+salenameTotalblance+'</td>';
					html+='<td width="30px;" >'+salenameTotalovers+'</td>';
					html+='<td width="30px;" >'+salenameTotalplbonus+'</td>';
					//当前行合计
					html+='<td width="30px;" >'+salenameTotallineTotal+'</td>';
					html+='</tr>';
				}
				
			});
			//最后一行显示总合计
			if(null!=performanceList&&0<performanceList.length&&1<salenum){//说明有值
				html+='<tr align="center">';
				html+='<td width="30px;" >'+"总计"+'</td>';
				html+='<td width="30px;" >'+''+'</td>';
				html+='<td width="30px;" >'+totaloutlay+'</td>';
				html+='<td width="30px;" >'+totalblance+'</td>';
				html+='<td width="30px;" >'+totalovers+'</td>';
				html+='<td width="30px;" >'+totalplbonus+'</td>';
				//当前行合计
				html+='<td width="30px;" >'+totallineTotal+'</td>';
				html+='</tr>';
			}
			$('#performancetable').html(html);
		}
	});
}
function request(paras){ 
	var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {}  
	for (i=0; j=paraString[i]; i++){  
	paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
	return "";  
	}else{  
	return returnValue; 
	}
}
	
/**
 * 查询系统订单信息
 */
function loadOrders() {
	openblockdiv();
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	//如你给出的地址可以这样
	/*var menuidparam = request("menuidparam");
	//alert("menuidparam:"+menuidparam);
	if(!menuidparam){
		menuidparam = 0;
	}*/
	//var menuidparam =0;
	//alert("menuidparam:"+menuidparam);
	//var toCheckSysOrderparamAdd='0'+','+menuidparam;
	//alert("menuidparam:"+menuidparam);
	//var url = ctx+ '/sysOrder/sys-order!listToJson.htm?sysOrderQuery.menuidparam='+menuidparam;
	var url = ctx+ '/sysOrder/sys-order!listToJson.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			//刷新分页控件
			$.refreshPageToolbar(page,"sysorderpage",simpleTable);
			
			var editVal = false;
			var examineVal = false;
			//$.each(data.authorityList, function(i, o){
//				if(o.authorityKey=='ROLE_SYSORDER_EDIT'){//authorityList
//					editVal = true;//编辑
//				}
//				if(o.authorityKey=='ROLE_SYSORDER_EXAMINE'){
//					examineVal = true;//审核
//				}
			//});
			//var addVal = false;
			//var delVal = false;
//			alert("data.grantedAuthorityList:"+data.grantedAuthorityList);
//			$.each(data.grantedAuthorityList, function(i, o){
//				alert("o:"+o);
//                  if(o=='ROLE_SYSORDER_EDIT'){
//                	  alert("编辑");
//                  }				
//			}
			
			$.each(data.menuOperatelist, function(i, o){
				//alert("o.functionName:"+o.functionName);
				if(o.functionName=='ROLE_SYSORDER_ADD'){// 
					//addVal = true;//添加
					//$('#addOrderBtn').html(''+'<input type="button" value="创建系统订单" onclick="toEditSysOrder('+toCheckSysOrderparamAdd+');" class="btnall"  style="margin-left: 1em;"  />');
					//var ui1 = document.getElementById("addOrderBtn");
				    //ui1.style.visibility="visibility";//设置隐藏 
				}
				if(o.functionName=='ROLE_SYSORDER_EDIT'){// 
					editVal = true;//编辑
				}
				if(o.functionName=='ROLE_SYSORDER_DEL'){// 
					//delVal = true;//删除
					//$('#delOrderBtn').html(''+'<input type="button" value="删除" class="btnall" onclick="delsysorders(\'\');" style="margin-left: 1em;" />');
				}
				//if(o.functionName=='exam()'){// 
					//examineVal = true;//审核
				//}
		    });
			
			//alert("1"+page.result);
			//组装table
			$.each(page.result, function(i, o){
				//alert("i:"+i);
				var status = "";//列表页 订单状态
				var contractType = "";//列表页 合同类型
				var bussinessType = "";//列表页 业务类型
				
				var editorder = "";//列表页中 显示 修改 系统 订单状态
				var submitorder = "";//列表页中 显示 提交 系统 订单状态
				var examineorder = "";//列表页中 显示 审核 系统 订单状态
				var changeer = "";//列表页中 显示 关联 系统 订单状态
				var contractTypetemp=o.contractType;
				//var toCheckSysOrderparam=o.sysOrderId+','+menuidparam;
				if(null!=contractTypetemp){
				
					if(o.contractType==1){
						contractType = "年度合同";
					}else if(o.contractType==1){
						contractType = "合同正本";
					}else{
						contractType = "内部订单";
					}
				}
				//alert("o.contractType:"+o.contractType);
				
				if(o.bussinessType==1){
					bussinessType = "基础业务";
				}else{
					bussinessType = "大项目业务";
				}
				//alert("o.bussinessType:"+o.bussinessType);
				if(o.sysOrderStatus==0){
					status= "待提交";
					editorder = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>';
					/*if(editVal){
						editorder = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>';
						//submitorder = '<a href="javascript:toSubmitSysOrder('+o.sysOrderId+');">提交</a>|';
						//submitorder = '<a href="javascript:exeprocess(0);">下推</a>|';
						
					}*/
					//editorder = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>|';
					//submitorder = '<a href="javascript:toSubmitSysOrder('+o.sysOrderId+');">提交</a>|';
				}else if(o.sysOrderStatus==200){//关联了变更、可修改
					status= "可变更";
					changeer = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>';
					//editorder = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>|';
					//submitorder = '<a href="javascript:toSubmitSysOrder('+o.sysOrderId+');">提交</a>|';
				}else if(o.sysOrderStatus!=100&&o.sysOrderStatus!=200&&o.sysOrderStatus!=-1){
					status= "待审核";
					//examineorder = '<a href="javascript:examineSysOrder('+o.sysOrderId+');">审核</a>|';
					/*if( examineVal  ){	
						examineorder = '<a href="javascript:examineSysOrder('+o.sysOrderId+');">审核</a>|';
					}
					*/
					//examineorder = '<a href="javascript:examineSysOrder('+o.sysOrderId+');">审核</a>|';
				}else if(o.sysOrderStatus==100){
					status= "已生效";
					if(null!=o.changeordercode&&o.relativestatus!=1){
						//changeer = '<a href="javascript:toRelativeSysOrder(\''+o.orderCode+'\','+o.sysOrderId+','+menuidparam+');">关联</a>|';
						changeer = '<a href="javascript:toRelativeSysOrder(\''+o.orderCode+'\','+o.sysOrderId+');">关联</a>|';
					}else{
						changeer= '';
					}
				}else{
					status= "被驳回";
					editorder = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>|';
					/*if(editVal){
						editorder = '<a href="javascript:toEditSysOrder('+o.sysOrderId+');">修改</a>|';
						//submitorder = '<a href="javascript:toSubmitSysOrder('+o.sysOrderId+');">提交</a>|';
					}*/
				}
				//alert("o.sysOrderStatus:"+o.sysOrderStatus);?sysOrderQuery.menuidparam='+menuidparam;
				html += '<tr>';
				html += '<td><input type="checkbox" id="checkedSysOrder" name="checkedSysOrder" value="' + o.orderCode + '" orderid="'+o.sysOrderId+'"/></td>';
				html += '<td id="TDCC'+o.sysOrderId+'">'+editorder+submitorder+examineorder+changeer+
				'<a href="javascript:toSysOrderHistory(\''+o.orderCode+'\');">历史记录</a></td>';
				html += '<td><a href="javascript:toCheckSysOrder('+o.sysOrderId+');" style="color: blue;">'+o.orderCode+'</a></td><td>' + (o.contractCode==null?"":o.contractCode) + '</td>';
				html += '<td>' + (o.contractTime==null?"":formatDate("yyyy-MM-dd",o.contractTime)) + '</td><td>' + (o.changeUserName==null?"":o.changeUserName) + '</td><td>' + (o.examineUserName==null?"":o.examineUserName) + '</td><td>' + (o.checkProject==null?"":o.checkProject) + '</td>';
				html += '<td>' + contractType + '</td><td>' + bussinessType + '</td><td>' + (o.coinType==null?"":o.coinType) + '</td>';
				html += '<td>' + (o.exchangeRate==null?"":o.exchangeRate) + '</td><td>' + (o.contractVersion==null?"":o.contractVersion) + '</td><td>' + (o.systemConsumer==null?"":o.systemConsumer) + '</td><td>' + (o.finalConsumer==null?"":o.finalConsumer) + '</td>';
				html += '<td>' + (o.changeTime==null?"":formatDate("yyyy-MM-dd",o.changeTime)) + '</td><td>' + status + '</td>';
				
				html += '</tr>';
				//alert("html:"+html);
			});
			//alert("2");
			//alert("html:"+html);
			$('#data-body').html(html);
			closeblockdiv();
		}
	});
}
var delproducts = "";
var delcollectPays = "";
/**
 * 提交表单
 */
function submitForm() {
	//alert("1");
	$('#bussinessType').removeAttr("disabled");
	var productLength = $('#productDetail').find('tr').length;
	//alert($('select[name="product.productType"]').eq(0).html());
	var products = "";
	//alert("2");
	for(var i=0;i<productLength;i++){
		/**
		 * products:
			84,1,,2,3,0,,2015-06-05 00:00:00.0,,
			undefined,undefined,,,,,,1,,,3,,,undefined,
			undefined,,undefined,,,A,,,,,,,,,undefined,
			undefined,,,,,,,2,1,1,,, |
			---
			86,,不锈钢温度计(轴向) Φ100 -10~100℃ NPT1/2〞传感器Φ6,3,1000,300,2454.55,
				2015-06-05 00:00:00.0,24.01A.100/N15/1/2/04/-10-100/100/C,undefined,undefined,
				只,,909.0909,,10,10,900,245.45,2700,1,,undefined,undefined,,undefined,组合件,,
				A,对2外销售名称,项目2名称,,德国WIKA标定 插深100mm,,,,,undefined,undefined,,,,,,
				1,0,10000,1000,27,154,2315 
		 */
		/**
		 * 1行号? 2产品代码3产品名称4对外销售名称5材质6执行标准7规格型号8类别9项目名称10辅助属性
		11单位名12数量13辅助单位 14换算率 15辅助数量 16单价(不含税)17含税单价18服务/工程费单价19列表单价20结算单价
		21总金额（元）22税率(%)23折扣率(%)24折扣25实际含税单价26销项税额27价税合计28交货时间29建议交货时间30质保金率(%)
		31质保金32制令号33任务单号34辅助单位出库数量35客户BOM36成本对象37开票数量38辅助单位开票数量39辅助单位组装数量40基本单位组装数量
		41组装数量42备注
		 */
		products += $('input[name="productIdHiddenTD"]').eq(i).val()+"-spit-";//影藏域中产品ID
		
		products += $('input[name="specifications"]').eq(i).val()+"-spit-";//规格型号 6
		products += $('input[name="productName"]').eq(i).val()+"-spit-";//产品名称 2
		products += $('input[name="productCount"]').eq(i).val()+"-spit-";//产品数量 11
		products += $('input[name="unitPrice"]').eq(i).val()+"-spit-";//含税单价 15 
		products += $('input[name="discount"]').eq(i).val()+"-spit-";//折扣额 20
		
		products += $('input[name="totalFee"]').eq(i).val()+"-spit-";//总金额 17
		products += $('input[name="deliveryTime"]').eq(i).val()+"-spit-";//交货时间 26 
		products += $('input[name="productCode"]').eq(i).val()+"-spit-";//产品代码 1
		products += $('input[name="baseUnitName"]').eq(i).val()+"-spit-";//undefined
		products += $('input[name="baseUnitCount"]').eq(i).val()+"-spit-";//undefined
		
		products += $('input[name="measureunitname"]').eq(i).val()+"-spit-";//单位名 10
		products += $('input[name="adviceDeliveryTime"]').eq(i).val()+"-spit-";//建议交货时间 27
		products += $('input[name="unitRemoveTax"]').eq(i).val()+"-spit-";//不含税单价 16
		products += $('input[name="convertRate"]').eq(i).val()+"-spit-";//换算率 13
		products += $('input[name="taxRate"]').eq(i).val()+"-spit-";//税率 18
		
		products += $('input[name="discountRate"]').eq(i).val()+"-spit-";//折扣率 19
		products += $('input[name="factUnitPrice"]').eq(i).val()+"-spit-";//实际含税单价 21
		products += $('input[name="saleTax"]').eq(i).val()+"-spit-";//销项税额 22
		products += $('input[name="priceTaxTotal"]').eq(i).val()+"-spit-";//价税合计 23
		products += $('input[name="makeNumberCode"]').eq(i).val()+"-spit-";//制令号 24
		
		products += $('input[name="taskCode"]').eq(i).val()+"-spit-";// 任务单号 25
		products += $('input[name="referCount"]').eq(i).val()+"-spit-";//关联数量 删除 29undefined
		products += $('input[name="assistUnitReferCount"]').eq(i).val()+"-spit-";// 辅助单位关联数量 删除 30undefined
		products += $('input[name="assistUnitOutHouseCount"]').eq(i).val()+"-spit-";//辅助单位出库数量 关联出库单 31
		products += $('input[name="outHouseCount"]').eq(i).val()+"-spit-";//undefined
		
		products += $('input[name="materialname"]').eq(i).val()+"-spit-";//材质 4
		products += $('input[name="productAssistCount"]').eq(i).val()+"-spit-";//辅助数量 14
		products += $('select[name="productType"]').find("option:selected").eq(i).val()+"-spit-";//分类 7
		products += $('input[name="outSaleName"]').eq(i).val()+"-spit-";//对外销售名称 3
		products += $('input[name="proProjectName"]').eq(i).val()+"-spit-";//项目名称 8
		
		products += $('input[name="assistAttribute"]').eq(i).val()+"-spit-";//辅助属性 9
		products += $('input[name="excuteStandard"]').eq(i).val()+"-spit-";//执行标准 5
		products += $('input[name="assistUnit"]').eq(i).val()+"-spit-";//辅助单位 12
		products += $('input[name="remarks"]').eq(i).val()+"-spit-";//备注 28
		products += $('input[name="customBOM"]').eq(i).val()+"-spit-";//客户BOM 32
		
		products += $('input[name="costObj"]').eq(i).val()+"-spit-";//成本对象 33
		products += $('input[name="sourceOrderCode"]').eq(i).val()+"-spit-";//源单单号 删除 34undefined
		products += $('input[name="contactCode"]').eq(i).val()+"-spit-";//合同单号 删除 35undefined
		products += $('input[name="billCount"]').eq(i).val()+"-spit-";//开票数量 关联开票 36
		products += $('input[name="assistCompanyBillCount"]').eq(i).val()+"-spit-";//辅助单位开票数量 37
		
		products += $('input[name="assistCompanyFitCount"]').eq(i).val()+"-spit-";//辅助单位组装数量 38
		products += $('input[name="baseCompanyFitCount"]').eq(i).val()+"-spit-";//基本单位组装数量 39
		products += $('input[name="fitCount"]').eq(i).val()+"-spit-";//组装数量 40
		products += $('input[name="qualityFeeRate"]').eq(i).val()+"-spit-";//质保金率 41
		products += $('input[name="servicecharge"]').eq(i).val()+"-spit-";//服务费
		
		products += $('input[name="listprice"]').eq(i).val()+"-spit-";//列表价
		products += $('input[name="balanceprice"]').eq(i).val()+"-spit-";//结算价
		products += $('input[name="qualityFee"]').eq(i).val()+"-spit-";//质保金 42
		products += $('input[name="productUnit"]').eq(i).val()+"-spit-";//单位 10
		products += $('input[name="material"]').eq(i).val()+"-spit-";//材质 4
		
		products += $('input[name="priceTaxTotalRM"]').eq(i).val()+"-spit-";//价税合计(本位币)
		products += $('input[name="fbusinessdiscount"]').eq(i).val()+"-spit-";//折扣额(本位币)
		products += $('input[name="ftax"]').eq(i).val()+"-spit-";//税额(本币)
		products += $('input[name="famountfor"]').eq(i).val()+"-spit-";//金额(本币)
		
		products += $('input[name="ftaxprice"]').eq(i).val()+"-spit-";//含税单价(本币)
		
		products += $('input[name="pLProducts"]').eq(i).val()+"-spit-";//产品关联PL产品JSON串
		
		products += $('input[name="listpricecurrency"]').eq(i).val()+"-spit-";//产品列表价本位币
		
		products += $('input[name="unitRemoveTaxH"]').eq(i).val()+" |";//不含税单价
		
		
	}
	//alert("3");
	var collectPayLength = $('#collectPayDetail').find('tr').length;
	var collectPays = "";
	for(var i=0;i<collectPayLength;i++){
		collectPays += $('input[name="collectPayIdHiddenTD"]').eq(i).val()+",";
		collectPays += $('input[name="planCollectTime"]').eq(i).val()+",";
		collectPays += $('input[name="shouldCollectTime"]').eq(i).val()+",";
		collectPays += $('input[name="shouldCollectFee"]').eq(i).val()+",";
		collectPays += $('input[name="shouldCollectFeeRm"]').eq(i).val()+",";
		collectPays += $('input[name="collectPayType"]').eq(i).val()+",";
		collectPays += $('input[name="guaranteeLetterType"]').eq(i).val()+",";
		collectPays += $('input[name="guaranteeLetterStart"]').eq(i).val()+",";
		collectPays += $('input[name="guaranteeLetterEnd"]').eq(i).val()+" |";
	}
	//alert("301");
	//alert("products:"+products);
	$('#productstringHidden').val(products);
	//$('#productsHidden').val(products);
	$('#collectPaysHidden').val(collectPays);
	$('#delproductsHidden').val(delproducts);
	$('#delcollectPaysHidden').val(delcollectPays);
	//alert("302");
//	var changeAreaType = $('#changeAreaTypeHidden').val();
//	if(changeAreaType==1){
//		$('#changeAreaTypeHidden').val(0);
//	}
	var pageParam = simpleTable.bindPageParam();
	//alert("303");
	var sysOrderForm = $('#sysOrderForm').serialize();
	//alert("5");
	var collectPayForm = $('#collectPayForm').serialize();
	//var productForm = $('#productForm').serialize();
	//alert("productForm:"+productForm);;
	var manageForm = $('#manageForm').serialize();
	
	var flag = window.confirm("确定提交吗？");
	//alert("系统订单:"+sysOrderForm );;
	//alert(sysOrderForm +'&'+collectPayForm+'&'+productForm+'&'+manageForm+'&'+pageParam);
	
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/sysOrder/sys-order!saveOrUpdateSysOrder.htm',
			data :sysOrderForm+'&'+collectPayForm+'&'+manageForm+'&'+pageParam,
			//data :sysOrderForm +'&'+collectPayForm+'&'+productForm+'&'+manageForm+'&'+pageParam,
			success : function(data) {
			    //alert("data1:"+data);
				data = $.parseJSON(data);
				//alert("data2:"+data);
				if(data.resultInfo[0]=='0')
				{
					//alert("操作成功");
					alert(data.resultInfo[1]);
					//window.location.href = ctx+"/order/sysorder-list.htm";
					//var menuidparamH = $('#menuidparamH').val();
					window.location.href = ctx+"/order/sysorder-list.htm";
					//window.location.href = ctx+"/order/sysorder-list.htm?menuidparam="+menuidparamH;
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
/**
 * 校验订单各参数
 * @returns {Boolean}
 */
function checkOrderParams(){
	var ratioAll=0;
	var businessratio=$.trim($('#businessratio').val());
	var salemanagerratio=$.trim($('#salemanagerratio').val());
	var areamanagerratio=$.trim($('#areamanagerratio').val());
	ratioAll = parseFloat(businessratio)+parseFloat(salemanagerratio)+parseFloat(areamanagerratio);
	var fbratioAll=0;
	var fbselfratio=$.trim($('#fbselfratio').val());
	var fbsmratio=$.trim($('#fbsmratio').val());
	var fbamratio=$.trim($('#fbamratio').val());
	fbratioAll = parseFloat(fbselfratio)+parseFloat(fbsmratio)+parseFloat(fbamratio);
	if($.trim($('#orderCode').val())==""){
		alert("订单编号不能为空!");
	}else if($.trim($('#contractCode').val())==""){
		alert("合同编号不能为空!");
	}else if($.trim($('#contractName').val())==""){
		alert("合同名称不能为空!");
	}else if($.trim($('#contractTime').val())==""){
		alert("合同日期不能为空!");
	}else if($.trim($('#checkProject').val())==""){
		alert("核算项目不能为空!");
	}else if($.trim($('#systemConsumer').val())==""){
		alert("集团客户不能为空!");
	}else if($.trim($('#finalConsumer').val())==""){
		alert("最终用户不能为空!");
	}else if($.trim($('#department').val())==""){
		alert("部门不能为空!");
	}else if($.trim($('#province').val())==""){
		alert("省份不能为空!");
	}else if($.trim($('#manager').val())==""){
		alert("主管不能为空!");
	}else if($.trim($('#businessUser').val())==""){
		alert("业务员不能为空!");
	}else if($.trim($('#businessratio').val())==""){
		alert("业务员标准产品比例不能为空!");
	}else if (businessratio.match(/[^,.\d]/) != null) {
		alert("业务员标准产品比例为非负数字!");
		return false;
	}else if($.trim($('#fbselfratio').val())==""){
		alert("业务员非标产品比例不能为空!");
	}else if (fbselfratio.match(/[^,.\d]/) != null) {
		alert("业务员非标产品比例为非负数字!");
		return false;
	}else if($.trim($('#salemanagerName').val())==""){
		alert("销售经理不能为空!");
	}else if($.trim($('#salemanagerratio').val())==""){
		alert("销售经理标准产品比例不能为空!");
	}else if (salemanagerratio.match(/[^,.\d]/) != null) {
		alert("销售经理标准产品比例为非负数字!");
		return false;
	}else if($.trim($('#fbsmratio').val())==""){
		alert("销售经理非标产品比例不能为空!");
	}else if (fbsmratio.match(/[^,.\d]/) != null) {
		alert("销售经理非标产品比例为非负数字!");
		return false;
	}else if($.trim($('#areamanagerName').val())==""){
		alert("区域经理不能为空!");
	}else if($.trim($('#areamanagerratio').val())==""){
		alert("区域经理标准产品比例不能为空!");
	}else if (areamanagerratio.match(/[^,.\d]/) != null) {
		alert("区域经理标准产品比例为非负数字!");
		return false;
	}else if($.trim($('#fbamratio').val())==""){
		alert("区域经理非标产品比例不能为空!");
	}else if (fbamratio.match(/[^,.\d]/) != null) {
		alert("区域经理非标产品比例为非负数字!");
		return false;
	}else if (ratioAll != 100) {
		alert("请核对业务员标准产品比例、销售经理标准产品比例、区域经理标准产品比例，三个比例总和为100!");
		return false;
	}else if (fbratioAll != 100) {
		alert("请核对业务员非标产品比例、销售经理非标产品比例、区域经理非标产品比例，三个比例总和为100!");
		return false;
	}
	
	//begin modify  for  添加系统订单审核人不需要校验  by tianliyuan at 201508101703
	//else if($.trim($('#examineUserName').val())==""){
		//alert("审核人不能为空!");
	//}
	//end modify  for  添加系统订单审核人不需要校验  by tianliyuan at 201508101703
	else if($.trim($('#payCondition').val())==""){
		alert("付款条件不能为空!");
	}else if($.trim($('#coinType').val())=="*"){
		alert("请选择币种!");
	}
	else if($.trim($('#exchangeRate').val())=="*"){
		alert("请选择汇率!");
	}
	else if(!checkCoinInfo()){//检查币种和汇率选得是否一致
	}
	//检验系统订单关联的产品
	else if(!checkProductParams()){
		
	}else if(!checkCollectPayInfo()){
		//检验右上角的
	}
	else{
		return true;
	}
	return false;
}

/**
 * 查看系统订单显示产品合计
 */
function showCollectPayInfo(){
	
	 
	var shouldCollectFeeObj = $('input[name="shouldCollectFee"]');//应收金额 	
	var shouldCollectFeeRmObj = $('input[name="shouldCollectFeeRm"]');//应收金额(本位币)
	//计算系统订单关联的产品的价税合计金额
	var totalPriceTaxTotal= 0;
	var priceTaxTotal = $('input[name="priceTaxTotal"]');
	for(var i=0;i<priceTaxTotal.length;i++){
		if(priceTaxTotal.eq(i).val()!=''){
			totalPriceTaxTotal += parseFloat(priceTaxTotal.eq(i).val());
		}
	}
}

/**
 * 检验右上角的应收款总额等信息
 */
function checkCollectPayInfo(){
	
	var planCollectTimeObj = $('input[name="planCollectTime"]');//计划应收日期
	var shouldCollectTimeObj = $('input[name="shouldCollectTime"]');//应收日期
	var shouldCollectFeeObj = $('input[name="shouldCollectFee"]');//应收金额 	
	var shouldCollectFeeRmObj = $('input[name="shouldCollectFeeRm"]');//应收金额(本位币)
	var collectPayTypeObj = $('input[name="collectPayType"]');//收款方式
	var guaranteeLetterTypeObj = $('input[name="guaranteeLetterType"]');//保函种类 	
	
	//var guaranteeLetterStartObj = $('input[name="guaranteeLetterStart"]');//保函起始时间 	
	//var guaranteeLetterEndObj = $('input[name="guaranteeLetterEnd"]');//保函终止时间
	
//	if(null==planCollectTimeObj||0==planCollectTimeObj.length){
//		alert("请填写计划应收日期!");
//		return false;
//	}
	if(null==shouldCollectTimeObj||0==shouldCollectTimeObj.length){
		alert("请填写应收日期!");
		return false;
	}
	//for(var i=0;i<planCollectTimeObj.length;i++){
	for(var i=0;i<shouldCollectTimeObj.length;i++){
//		if($.trim(planCollectTimeObj.eq(i).val())==""){
//			alert("计划应收日期不能为空!");
//			return false;
//		}
		if($.trim(shouldCollectTimeObj.eq(i).val())==""){
			alert("应收日期不能为空!");
			return false;
		}else if($.trim(shouldCollectFeeObj.eq(i).val())==""){
			alert("应收金额不能为空!");
			return false;
		}else if($.trim(shouldCollectFeeRmObj.eq(i).val())==""){
			alert("应收金额(本位币)不能为空!");
			return false;
		}else if($.trim(collectPayTypeObj.eq(i).val())==""){
			alert("收款方式不能为空!");
			return false;
		}else if($.trim(guaranteeLetterTypeObj.eq(i).val())==""){
			alert("保函种类不能为空!");
			return false;
		}
	}
	/**
	alert("应收日期长度:"+shouldCollectTimeObj.length);
	if(null==shouldCollectTimeObj||0==shouldCollectTimeObj.length){
		alert("请填写应收日期!");
		return false;
	}
	if(null==shouldCollectFeeObj||0==shouldCollectFeeObj.length){
		alert("请填写应收金额 !");
		return false;
	}
	if(null==shouldCollectFeeRmObj||0==shouldCollectFeeRmObj.length){
		alert("请填写应收金额(本位币)!");
		return false;
	}
	if(null==collectPayTypeObj||0==collectPayTypeObj.length){
		alert("请填写收款方式!");
		return false;
	}
	if(null==guaranteeLetterTypeObj||0==guaranteeLetterTypeObj.length){
		alert("请填写保函种类!");
		return false;
	}
	**/
	
	//应收金额总计
	var totalFee= 0;
	var shouldCollectFee = $('input[name="shouldCollectFee"]');
	for(var i=0;i<shouldCollectFee.length;i++){
		if(shouldCollectFee.eq(i).val()!=''){
			totalFee += parseFloat(shouldCollectFee.eq(i).val());
		}
	}
	var shouldTotalTemp=totalFee;
	if(0>=shouldTotalTemp){
		alert("应收金额总计大于0!");
		return false;
	}
	//计算系统订单关联的产品的价税合计金额
	var totalPriceTaxTotal= 0;
	var priceTaxTotal = $('input[name="priceTaxTotal"]');
	for(var i=0;i<priceTaxTotal.length;i++){
		if(priceTaxTotal.eq(i).val()!=''){
			totalPriceTaxTotal += parseFloat(priceTaxTotal.eq(i).val());
		}
	}
	if(0>=totalPriceTaxTotal){
		alert("系统订单关联的产品的价税合计总金额大于0!");
		return false;
	}
	//alert("shouldTotalTemp:"+shouldTotalTemp);
	//alert("totalPriceTaxTotal:"+totalPriceTaxTotal);
	//alert("priceTaxTotalShowTxt:"+priceTaxTotalShowTxt);
	var priceTaxTotalShowTxt=$('#priceTaxTotalShowTxt').val();
	
	//if((shouldTotalTemp+'')!=(totalPriceTaxTotal+'')){
	if((shouldTotalTemp+'')!=(priceTaxTotalShowTxt+'')){
		alert("应收金额总计应与系统订单关联的产品的价税合计总金额相等!");
		return false;
	}
	 
	//应收金额(本位币)总计
	/**var totalFeeRM= 0;
	var shouldCollectFeeRM = $('input[name="shouldCollectFeeRm"]');
	for(var i=0;i<shouldCollectFeeRM.length;i++){
		if(shouldCollectFeeRM.eq(i).val()!=''){
			totalFeeRM += parseFloat(shouldCollectFeeRM.eq(i).val());
		}
	}
	var shouldTotalRMTemp=totalFeeRM;
	**/
	return true;
}
/**
 * 检查币种和汇率选得是否一致
 */
function checkCoinInfo(){
	var coinType=$.trim( $('#coinType').val() );
	var exchangeRate=$.trim( $('#exchangeRate').val() );
	if("RMB"==coinType){
		var strs= new Array(); //定义一数组 
		var optextTemp="";
       	strs=exchangeRate.split("|");
       	//alert("strs.length:"+strs.length);
       	if(null!=strs&&2<strs.length){
       		optextTemp=exchangeRate.split("|")[1]; //字符分割
       		//alert("optextTemp:"+optextTemp);
       		if (optextTemp != ("01.Native")) {
       			alert("币种的汇率不正确!");
    			return false;
            }
       	}
	}
	else{
		var strs= new Array(); //定义一数组 
		var optextTemp="";
       	strs=exchangeRate.split("|");
       	//alert("strs.length:"+strs.length);
       	if(null!=strs&&2<strs.length){
       		optextTemp=exchangeRate.split("|")[1]; //字符分割
       		if (optextTemp.indexOf(coinType) < 0 ) {
       			alert("币种的汇率不正确!");
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
	var productNameObj = $('input[name="productName"]');
	var productCodeObj = $('input[name="productCode"]');
	var productCountObj = $('input[name="productCount"]');
	var unitPriceObj = $('input[name="unitPrice"]');
	var deliveryTimeObj = $('input[name="deliveryTime"]');
	var makeNumberCodeObj = $('input[name="makeNumberCode"]');
	
	var convertRateObj = $('input[name="convertRate"]');
	var productAssistCountObj = $('input[name="productAssistCount"]');
	var servicechargeObj = $('input[name="servicecharge"]');
	var listpriceObj = $('input[name="listprice"]');
	var taxRateObj = $('input[name="taxRate"]');
	var qualityFeeRateObj = $('input[name="qualityFeeRate"]');
	var unitRemoveTaxObj = $('input[name="unitRemoveTax"]');
	var balancepriceObj = $('input[name="balanceprice"]');
	var totalFeeObj = $('input[name="totalFee"]');
	var discountRateObj = $('input[name="discountRate"]');
	var discountObj = $('input[name="discount"]');
	//var factUnitPriceObj = $('input[name="factUnitPrice"]');
	var saleTaxObj = $('input[name="saleTax"]');
	var priceTaxTotalObj = $('input[name="priceTaxTotal"]');
	var qualityFeeObj = $('input[name="qualityFee"]');
	
	
	if(null==productNameObj||0==productNameObj.length){
		alert("请添加产品!");
		return false;
	}
	for(var i=0;i<productNameObj.length;i++){
		if($.trim(productNameObj.eq(i).val())==""){
			alert("产品名称不能为空!");
			return false;
		}else if($.trim(productCodeObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的编码不能为空!");
			return false;
		}else if($.trim(productCountObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的数量不能为空!");
			return false;
		}else if($.trim(unitPriceObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的单价不能为空!");
			return false;
		}else if($.trim(listpriceObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的列表价不能为空!");
			return false;
		}
		else if($.trim(deliveryTimeObj.eq(i).val())==""){
			alert("产品"+productNameObj.eq(i).val()+"的交货时间不能为空!");
			return false;
		}else if($.trim(makeNumberCodeObj.eq(i).val())==""){
			alert("产品"+makeNumberCodeObj.eq(i).val()+"的制令号不能为空!");
			return false;
		}
		//判断产品中的金额等
		if ($.trim(productCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		//换算率
		if( $.trim(convertRateObj.eq(i).val())!="" ){
			if ($.trim(convertRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("换算率是非负数字!");
				return false;
			}
		}
		//辅助数量
		if( $.trim(productAssistCountObj.eq(i).val())!="" ){
			if ($.trim(productAssistCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("辅助数量是非负数字!");
				return false;
			}
		}
		//服务/工程费单价
		if( $.trim(servicechargeObj.eq(i).val())!="" ){
			if ($.trim(servicechargeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("服务/工程费单价是非负数字!");
				return false;
			}
		}
		//列表单价
		if( $.trim(listpriceObj.eq(i).val())!="" ){
			if ($.trim(listpriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("列表单价是非负数字!");
				return false;
			}
		}
		//税率(%)
		if( $.trim(taxRateObj.eq(i).val())!="" ){
			if ($.trim(taxRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("税率是非负数字!");
				return false;
			}
			if ( Number(taxRateObj.eq(i).val()) >100||Number(taxRateObj.eq(i).val()) <0) {
				alert("税率值不应大于100或小于0!");
				return false;
			}
		}
		//质保金率(%)
		if( $.trim(qualityFeeRateObj.eq(i).val())!="" ){
			if ($.trim(qualityFeeRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("质保金率是非负数字!");
				return false;
			}
			if ( Number(qualityFeeRateObj.eq(i).val()) >100||Number(qualityFeeRateObj.eq(i).val()) <0) {
				alert("质保金率值不应大于100或小于0!");
				return false;
			}
		}
		//单价(不含税)
		if( $.trim(unitRemoveTaxObj.eq(i).val())!="" ){
			if ($.trim(unitRemoveTaxObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("单价(不含税)是非负数字!");
				return false;
			}
		}
		//结算单价
		if( $.trim(balancepriceObj.eq(i).val())!="" ){
			if ($.trim(balancepriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("结算单价是非负数字!");
				return false;
			}
		}
		//结算单价
		if( $.trim(balancepriceObj.eq(i).val())!="" ){
			if ($.trim(balancepriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("结算单价是非负数字!");
				//balancepriceObj.eq(i).val('');
				return false;
			}
		}
		//总金额
		if( $.trim(totalFeeObj.eq(i).val())!="" ){
			if ($.trim(totalFeeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("总金额是非负数字!");
				//totalFeeObj.eq(i).val()='';
				return false;
			}
		}
		//折扣率(%)
		if( $.trim(discountRateObj.eq(i).val())!="" ){
			if ($.trim(discountRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("折扣率是非负数字!");
				return false;
			}
			if ( Number(discountRateObj.eq(i).val()) >100||Number(discountRateObj.eq(i).val()) <0) {
				alert("折扣率值不应大于100或小于0!");
				return false;
			}
		}
		//折扣
		if( $.trim(discountObj.eq(i).val())!="" ){
			if ($.trim(discountObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("折扣是非负数字!");
				return false;
			}
		}
		//实际含税单价
		/*if( $.trim(factUnitPriceObj.eq(i).val())!="" ){
			if ($.trim(factUnitPriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("实际含税单价是非负数字!");
				return false;
			}
		}*/
		//销项税额
		if( $.trim(saleTaxObj.eq(i).val())!="" ){
			if ($.trim(saleTaxObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("销项税额是非负数字!");
				return false;
			}
		}
		//价税合计
		if( $.trim(priceTaxTotalObj.eq(i).val())!="" ){
			if ($.trim(priceTaxTotalObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("价税合计是非负数字!");
				return false;
			}
		}
		//质保金
		if( $.trim(qualityFeeObj.eq(i).val())!="" ){
			if ($.trim(qualityFeeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("质保金是非负数字!");
				return false;
			}
		}
		
	}
	return true;
}
function toRelativeSysOrder(orderCode,sysorderid){
	$('#loadingcontent').text("正在关联......");
	$('.spinner.demo').show();
	$('.spinner.demo').css("opacity","0.6").css("zIndex","9999");
	$.webAjax({
		type : 'post',
		url : ctx+"/contractChange/contract-change!save.htm",
		data :'orderCode='+orderCode+"&relativestatus=1",
		success : function(data) {
			if("success"==data){
				//将sysorder表中的sysOrderStatus状态为200
				$.webAjax({
					type : 'post',
					url : ctx+"/sysOrder/sys-order!update.htm",
					data :"sysOrder.changeAreaType=0&sysOrder.sysOrderStatus=200&sysOrder.sysOrderId="+sysorderid,
					success : function(data) {
						if("success"==data){
							$('#loadingcontent').text("关联成功!");
							$('.spinner.demo').fadeOut('slow');
							var html = '<a href="javascript:toEditSysOrder('+sysorderid+');">修改</a>|'+
							'<a href="javascript:toSysOrderHistory(\''+orderCode+'\');">历史记录</a>';
							$('#TDCC'+sysorderid).html(html);
						}else{
							alert("关联失败!");
						}
					}
				});
				/*$('#loadingcontent').text("关联成功!");
				$('.spinner.demo').fadeOut('slow');
				var html = '<a href="javascript:toEditSysOrder('+sysorderid+');">修改</a>|'+
				'<a href="javascript:toSysOrderHistory(\''+orderCode+'\');">历史记录</a>';
				$('#TDCC'+sysorderid).html(html);*/
			}else{
				alert("关联失败!");
			}
		}
	});
}
function toRelativeSysOrderBak(orderCode,sysorderid,menu){
	$('#loadingcontent').text("正在关联......");
	$('.spinner.demo').show();
	$('.spinner.demo').css("opacity","0.6").css("zIndex","9999");
	$.webAjax({
		type : 'post',
		url : ctx+"/contractChange/contract-change!save.htm",
		data :'orderCode='+orderCode+"&relativestatus=1",
		success : function(data) {
			if("success"==data){
				$('#loadingcontent').text("关联成功!");
				$('.spinner.demo').fadeOut('slow');
				var html = '<a href="javascript:toEditSysOrder('+sysorderid+','+menu+');">修改</a>|'+
				'<a href="javascript:toSysOrderHistory(\''+orderCode+'\');">历史记录</a>';
				$('#TDCC'+sysorderid).html(html);
			}else{
				alert("关联失败!");
			}
		}
	});
}
function checkOrderProductInfo(){
	//alert("111");
	var productNameObjTemp = $('input[name="productName"]');
	
	var convertRateObjTemp = $('input[name="convertRate"]');
	var productAssistCountObjTemp = $('input[name="productAssistCount"]');
	var servicechargeObjTemp = $('input[name="servicecharge"]');
	var listpriceObjTemp = $('input[name="listprice"]');
	var taxRateObjTemp = $('input[name="taxRate"]');
	var qualityFeeRateObjTemp = $('input[name="qualityFeeRate"]');
	var unitRemoveTaxObjTemp = $('input[name="unitRemoveTax"]');
	var balancepriceObjTemp = $('input[name="balanceprice"]');
	var totalFeeObjTemp = $('input[name="totalFee"]');
	var discountRateObjTemp = $('input[name="discountRate"]');
	var discountObjTemp = $('input[name="discount"]');
	var factUnitPriceObjTemp = $('input[name="factUnitPrice"]');
	var saleTaxObjTemp = $('input[name="saleTax"]');
	var priceTaxTotalObjTemp = $('input[name="priceTaxTotal"]');
	var qualityFeeObjTemp = $('input[name="qualityFee"]');
	
	for(var i=0;i<productNameObjTemp.length;i++){
		alert("2221");
//		if($.trim(productNameObj.eq(i).val())==""){
//			alert("产品名称不能为空!");
//			return false;
//		}
     alert("数量2221"+productCountObjTemp.eq(i).val());	
	//判断产品中的金额等
	if ($.trim(productCountObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
		alert("数量是非负数字!");
		return false;
	}
	 alert("换算率2221");	
	//换算率
	if( $.trim(convertRateObjTemp.eq(i).val())!="" ){
		if ($.trim(convertRateObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("换算率是非负数字!");
			return false;
		}
	}
	 alert("辅助数量2221");	
	//辅助数量
	if( $.trim(productAssistCountObjTemp.eq(i).val())!="" ){
		if ($.trim(productAssistCountObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("辅助数量是非负数字!");
			return false;
		}
	}
	 alert("服务/工程费单价2221");	
	//服务/工程费单价
	if( $.trim(servicechargeObjTemp.eq(i).val())!="" ){
		if ($.trim(servicechargeObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("服务/工程费单价是非负数字!");
			return false;
		}
	}
	alert("列表单价2221");	
	//列表单价
	if( $.trim(listpriceObjTemp.eq(i).val())!="" ){
		if ($.trim(listpriceObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("列表单价是非负数字!");
			return false;
		}
	}
	alert("税率2221");	
	//税率(%)
	if( $.trim(taxRateObjTemp.eq(i).val())!="" ){
		if ($.trim(taxRateObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("税率是非负数字!");
			return false;
		}
		if ( Number(taxRateObjTemp.eq(i).val()) >100||Number(taxRateObjTemp.eq(i).val()) <0) {
			alert("税率值不应大于100或小于0!");
			return false;
		}
	}
	alert("质保金率2221");	
	//质保金率(%)
	if( $.trim(qualityFeeRateObjTemp.eq(i).val())!="" ){
		if ($.trim(qualityFeeRateObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("质保金率是非负数字!");
			return false;
		}
		if ( Number(qualityFeeRateObjTemp.eq(i).val()) >100||Number(qualityFeeRateObjTemp.eq(i).val()) <0) {
			alert("质保金率值不应大于100或小于0!");
			return false;
		}
	}
	alert("单价(不含税)2221");	
	//单价(不含税)
	if( $.trim(unitRemoveTaxObjTemp.eq(i).val())!="" ){
		if ($.trim(unitRemoveTaxObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("单价(不含税)是非负数字!");
			return false;
		}
	}
	alert("结算单价2221");	
	//结算单价
	if( $.trim(balancepriceObjTemp.eq(i).val())!="" ){
		if ($.trim(balancepriceObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("结算单价是非负数字!");
			return false;
		}
	}
	alert("结算-单价2221");	
	//结算单价
	if( $.trim(balancepriceObjTemp.eq(i).val())!="" ){
		if ($.trim(balancepriceObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("结算单价是非负数字!");
			return false;
		}
	}
	alert("总金额2221");	
	//总金额
	if( $.trim(totalFeeObjTemp.eq(i).val())!="" ){
		if ($.trim(totalFeeObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("总金额是非负数字!");
			totalFeeObjTemp.eq(i).val('');
			return false;
		}
	}
	alert("折扣率2221");	
	//折扣率(%)
	if( $.trim(discountRateObjTemp.eq(i).val())!="" ){
		if ($.trim(discountRateObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("折扣率是非负数字!");
			return false;
		}
		if ( Number(discountRateObjTemp.eq(i).val()) >100||Number(discountRateObjTemp.eq(i).val()) <0) {
			alert("折扣率值不应大于100或小于0!");
			return false;
		}
	}
	alert("折扣2221");	
	//折扣
	if( $.trim(discountObjTemp.eq(i).val())!="" ){
		if ($.trim(discountObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("折扣是非负数字!");
			return false;
		}
	}
	alert("实际含税单价2221");	
	//实际含税单价
	if( $.trim(factUnitPriceObjTemp.eq(i).val())!="" ){
		if ($.trim(factUnitPriceObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("实际含税单价是非负数字!");
			return false;
		}
	}
	alert("销项税额2221");	
	//销项税额
	if( $.trim(saleTaxObjTemp.eq(i).val())!="" ){
		if ($.trim(saleTaxObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("销项税额是非负数字!");
			return false;
		}
	}
	alert("价税合计2221");	
	//价税合计
	if( $.trim(priceTaxTotalObjTemp.eq(i).val())!="" ){
		if ($.trim(priceTaxTotalObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("价税合计是非负数字!");
			return false;
		}
	}
	alert("质保金2221");	
	//质保金
	if( $.trim(qualityFeeObjTemp.eq(i).val())!="" ){
		if ($.trim(qualityFeeObjTemp.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("质保金是非负数字!");
			return false;
		}
	}
	}
	return true;
}

/**
 * 保存系统订单
 */
function saveSysOrder(){
	//checkCollectPayInfo();
	//alert("1");
	if(checkOrderParams()){
		//return false;
		//alert("3");
		submitForm();
	}
}

/**
 * 跳转到编辑系统订单页面
 * @param id 要编辑的系统订单的id
 */
function toEditSysOrder(id){
	if(null!=id&&id!=""){
		//alert("id!=null"+id);
		//alert("url:"+ctx+"/order/sysorder-edit.htm?id="+id+"&menuidparam="+menuidparam);
		window.open(ctx+"/order/sysorder-edit.htm?id="+id,"系统订单编辑");
		//window.location.href = ctx+"/order/sysorder-edit.htm?id="+id;
	}else{
		//alert("id==null");
		window.open(ctx+"/order/sysorder-edit.htm?id="+id,"系统订单编辑");
		//window.location.href = ctx+"/order/sysorder-edit.htm";
	}
}
function toAddSysOrder(id){
	//window.location.href = ctx+"/order/sysorder-edit.htm?id="+id;
	window.open(ctx+"/order/sysorder-edit.htm?id="+id,"系统订单编辑");
}
function toEditSysOrderBak(id,menuidparam){
	if(null!=id&&id!=""){
		//alert("id!=null"+id);
		//alert("url:"+ctx+"/order/sysorder-edit.htm?id="+id+"&menuidparam="+menuidparam);
		window.open(ctx+"/order/sysorder-edit.htm?id="+id+"&menuidparam="+menuidparam,"系统订单编辑");
	}else{
		//alert("id==null");
		window.open(ctx+"/order/sysorder-edit.htm"+"?menuidparam="+menuidparam,"系统订单编辑");
	}
}
/*function toEditSysOrder(id){
	if(null!=id&&id!=""){
		//alert("id!=null"+id);
		window.location.href = ctx+"/order/sysorder-edit.htm?id="+id;
	}else{
		//alert("id==null");
		window.location.href = ctx+"/order/sysorder-edit.htm";
	}
}*/
var PLlinenum=0;
function openPLDiv(lineNum,optType){
    //init
	//如果是修改页面,判断是否有值
	
    load(5,lineNum,optType);
    //设置是哪行产品的PL产品
    $('#productLineNum').val(lineNum);
    openDiv('designDiv');
}
//查看弹出PL框
function openShowPLDiv(lineNum,optType){
	loadShow(5,lineNum,optType);
	$('#productLineNum').val(lineNum);
    openShowDiv('designDiv');
}


function loadShow(num,productLineNum,optType){
	//PL4200数量
	var productPLCountShow=0;
	//PL4200合同价
	var fpriceShow=0;
	
	//PL3000数量
	var pL3000CountShow=0;
	//PL3000合同价
	var pL3000UnitShow=0;
	
	//sSV3500数量
	var sSV3500CountShow=0;
	//sSV3500合同价
	var sSV3500UnitShow=0;
	
	//sPL2000数量
	var sPL2000CountShow=0;
	//sPL2000合同价
	var sPL2000UnitShow=0;
	
	var html='';
	var pLProductJsonStr=$('#pLProduct'+productLineNum).val();
	if(''!=pLProductJsonStr&&"1"==optType){//说明是新添加了产品行,并设置了子PL产品值
		optType="2";
	}
	//如果是修改操作
	if("2"==optType){
	
	if(''!=pLProductJsonStr){//存在JSON字符串
		var pLProductJsonObj = $.parseJSON(pLProductJsonStr);
		var pLProductJsonList = pLProductJsonObj.value;
		for(var i = 0 ;i <pLProductJsonList.length ;i++){
			
			html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
			//PL产品弹出层中的删除行按钮
			//html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
			
			html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
			
			html+='<td >'+pLProductJsonList[i].fmodel+'</td>';
			html+='<td >'+pLProductJsonList[i].fnum+'</td>';
			html+='<td >'+pLProductJsonList[i].fprice+'</td>';
			html+='<td >'+pLProductJsonList[i].flistprice+'</td>';
									
			html+='<td >'+pLProductJsonList[i].pl3000fmodel+'</td>';
			html+='<td >'+pLProductJsonList[i].pl3000fnum+'</td>';
			html+='<td >'+pLProductJsonList[i].pl3000fprice+'</td>';
			html+='<td >'+pLProductJsonList[i].pl3000flistprice+'</td>';
									
			html+='<td >'+pLProductJsonList[i].ssv3500fmodel+'</td>';
			html+='<td >'+pLProductJsonList[i].ssv3500fnum+'</td>';
			html+='<td >'+pLProductJsonList[i].ssv3500fprice+'</td>';
			html+='<td >'+pLProductJsonList[i].ssv3500flistprice+'</td>';
									
			html+='<td >'+pLProductJsonList[i].pl2000fmodel+'</td>';
			html+='<td >'+pLProductJsonList[i].pl2000fnum+'</td>';
			html+='<td >'+pLProductJsonList[i].pl2000fprice+'</td>';
			html+='<td >'+pLProductJsonList[i].pl2000flistprice+'</td>';
			
			html+='</tr>';
			//add 新增显示合计行
			//产品数量合计
			var productPLCountTemp=Number(productPLCountShow)+Number(replaceNull(pLProductJsonList[i].fnum));
			//alert("11"+productCountTemp);
			productPLCountShow= Number( ( productPLCountTemp ).toFixed(4) );
			
			//PL4200产品合同合计
			var fpriceTemp=Number(fpriceShow)+Number(replaceNull(pLProductJsonList[i].fprice));
			//alert("11"+productCountTemp);
			fpriceShow= Number( ( fpriceTemp ).toFixed(4) );
			
			//PL3000产品数量合计
			var pL3000CountTemp=Number(pL3000CountShow)+Number(replaceNull(pLProductJsonList[i].pl3000fnum));
			pL3000CountShow= Number( ( pL3000CountTemp ).toFixed(4) );
			//PL3000产品合同合计
			var pL3000UnitTemp=Number(pL3000UnitShow)+Number(replaceNull(pLProductJsonList[i].pl3000fprice));
			pL3000UnitShow= Number( ( pL3000UnitTemp ).toFixed(4) );
			
			//sSV3500产品数量合计
			var sSV3500CountTemp=Number(sSV3500CountShow)+Number(replaceNull(pLProductJsonList[i].ssv3500fnum));
			sSV3500CountShow= Number( ( sSV3500CountTemp ).toFixed(4) );
			//sSV3500产品合同合计
			var sSV3500UnitTemp=Number(sSV3500UnitShow)+Number(replaceNull(pLProductJsonList[i].ssv3500fprice));
			sSV3500UnitShow= Number( ( sSV3500UnitTemp ).toFixed(4) );
			
			//sPL2000产品数量合计
			var sPL2000CountTemp=Number(sPL2000CountShow)+Number(replaceNull(pLProductJsonList[i].pl2000fnum));
			sPL2000CountShow= Number( ( sPL2000CountTemp ).toFixed(4) );
			//sPL2000产品合同合计
			var sPL2000UnitTemp=Number(sPL2000UnitShow)+Number(replaceNull(pLProductJsonList[i].pl2000fprice));
			sPL2000UnitShow= Number( ( sPL2000UnitTemp ).toFixed(4) );
			
			//end 新增显示合计行
			PLlinenum++;
		}
		//补全默认加载的行
		for(var i = PLlinenum ;i <num ;i++){
			/*html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
			//PL产品弹出层中的删除行按钮
			//html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
			
			html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
			
			html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" "/></td>';
			
			html+='</tr>';*/
			PLlinenum++;
			}
	}
	else{//改行没有子PL产品
		for(var i = 0 ;i <num ;i++){
			/*html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
			//PL产品弹出层中的删除行按钮
			//html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
			
			html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
			
			html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" "/></td>';
			
			html+='</tr>';*/
			PLlinenum++;
			}
		
	}
	//TEST
	}
	else{//添加操作
	
	for(var i = 0 ;i <num ;i++){
	/*html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
	//PL产品弹出层中的删除行按钮
	//html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
	
	html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
	
	html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" "/></td>';
							
	html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" "/></td>';
							
	html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" "/></td>';
							
	html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" "/></td>';
	
	html+='</tr>';*/
	PLlinenum++;
	}
	
	}
	//显示数量合计
	if('0'!=productPLCountShow+''){
		$('#productPLCountShowTxt').html(productPLCountShow+'');
	}
	//显示PL4200合同合计
	if('0'!=fpriceShow+''){
		$('#fpriceShowTxt').html(fpriceShow+'');
	}
	
	//pL3000显示数量合计
	if('0'!=pL3000CountShow+''){
		$('#pL3000CountShowTxt').html(pL3000CountShow+'');
	}
	//显示pL3000合同合计
	if('0'!=pL3000UnitShow+''){
		$('#pL3000UnitShowTxt').html(pL3000UnitShow+'');
	}
	
	//sSV3500显示数量合计
	if('0'!=sSV3500CountShow+''){
		$('#sSV3500CountShowTxt').html(sSV3500CountShow+'');
	}
	//显示sSV3500合同合计
	if('0'!=sSV3500UnitShow+''){
		$('#sSV3500UnitShowTxt').html(sSV3500UnitShow+'');
	}
	
	//sPL2000显示数量合计
	if('0'!=sPL2000CountShow+''){
		$('#sPL2000CountShowTxt').html(sPL2000CountShow+'');
	}
	//显示sPL2000合同合计
	if('0'!=sPL2000UnitShow+''){
		$('#sPL2000UnitShowTxt').html(sPL2000UnitShow+'');
	}
	
	/*//显示数量合计
	if('0'!=productPLCountShow+''){
		$('#productPLCountShowTxt').val(productPLCountShow+'');
	}
	//显示PL4200合同合计
	if('0'!=fpriceShow+''){
		$('#fpriceShowTxt').val(fpriceShow+'');
	}
	
	//pL3000显示数量合计
	if('0'!=pL3000CountShow+''){
		$('#pL3000CountShowTxt').val(pL3000CountShow+'');
	}
	//显示pL3000合同合计
	if('0'!=pL3000UnitShow+''){
		$('#pL3000UnitShowTxt').val(pL3000UnitShow+'');
	}
	
	//sSV3500显示数量合计
	if('0'!=sSV3500CountShow+''){
		$('#sSV3500CountShowTxt').val(sSV3500CountShow+'');
	}
	//显示sSV3500合同合计
	if('0'!=sSV3500UnitShow+''){
		$('#sSV3500UnitShowTxt').val(sSV3500UnitShow+'');
	}
	
	//sPL2000显示数量合计
	if('0'!=sPL2000CountShow+''){
		$('#sPL2000CountShowTxt').val(sPL2000CountShow+'');
	}
	//显示sPL2000合同合计
	if('0'!=sPL2000UnitShow+''){
		$('#sPL2000UnitShowTxt').val(sPL2000UnitShow+'');
	}*/
	
	
	
	$("#PLProductDetail").html(html);
}

function openShowDiv (divId) {
	if(!$('#'+divId).is(':hidden')) {
		return;
	}
	var top = $(window).height() / 4;
	var left = $(window).width() / 4;
	var scroolTop=$(document).scrollTop();
	var divWidth = $('#'+divId).width();
	var divHeight = $('#'+divId).height();
	
	var windowWidth = $(parent.window).width();
	
	var windowHeight = $(parent.window).height();
	//alert("windowHeight:"+windowHeight);
	//windowHeight =623;
	var windowScrollTop = $(parent.document).scrollTop();
	var p = $("#right", window.parent.document);
	var mainFramePosition = p.offset();
	//alert('windowHeight/2:'+windowHeight/2+'divHeight/2 :'+divHeight/2 + 'mainFramePosition.top*2'+mainFramePosition.top*2+'windowScrollTop:'+windowScrollTop);
	var divTop = (top)+scroolTop;
	var divLeft = (left);
	if(mainFramePosition)
	{
		//divTop = windowHeight/2  - mainFramePosition.top*2 + windowScrollTop ;
		divTop = (windowHeight - divHeight)/2 - mainFramePosition.top +windowScrollTop;
		divLeft = windowWidth/2- divWidth/2 - mainFramePosition.left;				
	}
	//alert(windowHeight + '--'+divHeight);
	//divTop = (windowHeight - divHeight)/2 - mainFramePosition.top +windowScrollTop;
	
	if(divTop <0) {
		divTop = 0;
	}
	if(divLeft < 0) {
		divLeft = 0;
	}
	//var div_title_a = $('<a id="div_title_close" class="butnOrange"><span style="float:right;">关闭</span></a>');
	var div_title_a = $('<a class="butnOrange"><span>关闭</span></a>');
	var div_title = $('<h2 class="titleh2"><b>操作提示</b></h2>');
	div_title_a.appendTo(div_title);
	div_title_a.bind('click', function() {
		$.closeDiv(divId);
	});
	var h2 = $('#' + divId).find('h2').first();
	h2.addClass('titleh2');
	h2.css({cursor: 'move'});
	//alert($('#' + divId).find('h2').first().attr("ID"));
	if($('#' + divId).find('h2').first().html() == null) {
		div_title.prependTo($('#' + divId));
		div_title.css({cursor: 'move'});
	}
	
	$('#' + divId).draggable({containment: 'document',handle: "h2.titleh2"});
	/*$('#' + divId).Drags({
			  handler: '#div_title',                
			  zIndex:200,
			  opacity:.9
		  });
	*/
	//alert("$(window).height():"+$(window).height());
	$('#backgroundDiv').height(windowHeight);
	
	$('#backgroundDiv').width($(document).width());
	$('#backgroundDiv').show();
	//new SimpleDrag(divId);
	//$('#' + divId).css({ top: divTop, left: divLeft });
	$('#' + divId).center();
	$('#' + divId).show();
	//alert('top:'+ divTop+', left: '+divLeft);
	//$.scrollDiv(divId);
}
//
   function openDiv (divId) {
	     
	     var ui1 = document.getElementById("contractTxtFile");
	     ui1.style.visibility="hidden";
	     var ui2 = document.getElementById("contractReviewFile");
	     ui2.style.visibility="hidden";
	     var ui3 = document.getElementById("biddingNoticeFile");
	     ui3.style.visibility="hidden";
	        
			if(!$('#'+divId).is(':hidden')) {
				return;
			}
			var top = $(window).height() / 4;
			var left = $(window).width() / 4;
			var scroolTop=$(document).scrollTop();
			var divWidth = $('#'+divId).width();
			var divHeight = $('#'+divId).height();
			
			var windowWidth = $(parent.window).width();
			
			var windowHeight = $(parent.window).height();
			//alert("windowHeight:"+windowHeight);
			//windowHeight =623;
			var windowScrollTop = $(parent.document).scrollTop();
			var p = $("#right", window.parent.document);
			var mainFramePosition = p.offset();
			//alert('windowHeight/2:'+windowHeight/2+'divHeight/2 :'+divHeight/2 + 'mainFramePosition.top*2'+mainFramePosition.top*2+'windowScrollTop:'+windowScrollTop);
			var divTop = (top)+scroolTop;
			var divLeft = (left);
			if(mainFramePosition)
			{
				//divTop = windowHeight/2  - mainFramePosition.top*2 + windowScrollTop ;
				divTop = (windowHeight - divHeight)/2 - mainFramePosition.top +windowScrollTop;
				divLeft = windowWidth/2- divWidth/2 - mainFramePosition.left;				
			}
			//alert(windowHeight + '--'+divHeight);
			//divTop = (windowHeight - divHeight)/2 - mainFramePosition.top +windowScrollTop;
			
			if(divTop <0) {
				divTop = 0;
			}
			if(divLeft < 0) {
				divLeft = 0;
			}
			//var div_title_a = $('<a id="div_title_close" class="butnOrange"><span style="float:right;">关闭</span></a>');
			var div_title_a = $('<a class="butnOrange"><span>关闭</span></a>');
			var div_title = $('<h2 class="titleh2"><b>操作提示</b></h2>');
			div_title_a.appendTo(div_title);
			div_title_a.bind('click', function() {
				$.closeDiv(divId);
			});
			var h2 = $('#' + divId).find('h2').first();
			h2.addClass('titleh2');
			h2.css({cursor: 'move'});
			//alert($('#' + divId).find('h2').first().attr("ID"));
			if($('#' + divId).find('h2').first().html() == null) {
				div_title.prependTo($('#' + divId));
				div_title.css({cursor: 'move'});
			}
			
			$('#' + divId).draggable({containment: 'document',handle: "h2.titleh2"});
			/*$('#' + divId).Drags({
					  handler: '#div_title',                
					  zIndex:200,
					  opacity:.9
				  });
			*/
			//alert("$(window).height():"+$(window).height());
			$('#backgroundDiv').height(windowHeight);
			
			$('#backgroundDiv').width($(document).width());
			$('#backgroundDiv').show();
			//new SimpleDrag(divId);
			//$('#' + divId).css({ top: divTop, left: divLeft });
			$('#' + divId).center();
			$('#' + divId).show();
			//alert('top:'+ divTop+', left: '+divLeft);
			//$.scrollDiv(divId);
		}

var PLlinenum = 0;
function load(num,productLineNum,optType){
	//PL4200数量
	var productPLCountShow=0;
	//PL4200合同价
	var fpriceShow=0;
	
	//PL3000数量
	var pL3000CountShow=0;
	//PL3000合同价
	var pL3000UnitShow=0;
	
	//sSV3500数量
	var sSV3500CountShow=0;
	//sSV3500合同价
	var sSV3500UnitShow=0;
	
	//sPL2000数量
	var sPL2000CountShow=0;
	//sPL2000合同价
	var sPL2000UnitShow=0;
	
	var html='';
	var pLProductJsonStr=$('#pLProduct'+productLineNum).val();
	if(''!=pLProductJsonStr&&"1"==optType){//说明是新添加了产品行,并设置了子PL产品值
		optType="2";
	}
	//如果是修改操作
	if("2"==optType){
	//TEST
	//var tempstr='{"value":[{"productLineNum":"1","fmodel":"1","fnum":"1","fprice":"1","flistprice":"1","pl3000fmodel":"","pl3000fnum":"","pl3000fprice":"","pl3000flistprice":"","ssv3500fmodel":"","ssv3500fnum":"","ssv3500fprice":"","ssv3500flistprice":"","pl2000fmodel":"","pl2000fnum":"","pl2000fprice":"","pl2000flistprice":""}]}';
	/*var test = $.parseJSON(tempstr);
	alert("test:"+test);
	alert("value:"+test.value);
	var value = test.value;
	alert("value.productLineNum:"+value[0].productLineNum);*/
	//var pLProductJsonStr=tempstr;//$('#pLProduct'+productLineNum).val();
	
	if(''!=pLProductJsonStr){//存在JSON字符串
		var pLProductJsonObj = $.parseJSON(pLProductJsonStr);
		var pLProductJsonList = pLProductJsonObj.value;
		
		for(var i = 0 ;i <pLProductJsonList.length ;i++){
			
			html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
			//PL产品弹出层中的删除行按钮
			html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
			
			html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
			
			html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" " value="'+pLProductJsonList[i].fmodel+'"/></td>';
			html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].fnum+'" /></td>';
			html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].fprice+'" /></td>';
			html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" " value="'+pLProductJsonList[i].flistprice+'" /></td>';
									
			html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" " value="'+pLProductJsonList[i].pl3000fmodel+'" /></td>';
			html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].pl3000fnum+'" /></td>';
			html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].pl3000fprice+'" /></td>';
			html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" " value="'+pLProductJsonList[i].pl3000flistprice+'" /></td>';
									
			html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" " value="'+pLProductJsonList[i].ssv3500fmodel+'" /></td>';
			html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].ssv3500fnum+'" /></td>';
			html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].ssv3500fprice+'" /></td>';
			html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" " value="'+pLProductJsonList[i].ssv3500flistprice+'" /></td>';
									
			html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" " value="'+pLProductJsonList[i].pl2000fmodel+'" /></td>';
			html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].pl2000fnum+'" /></td>';
			html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur="countProductPLTotalFee();" value="'+pLProductJsonList[i].pl2000fprice+'" /></td>';
			html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" " value="'+pLProductJsonList[i].pl2000flistprice+'" /></td>';
			
			html+='</tr>';
			
			//add 新增显示合计行
			//产品数量合计
			var productPLCountTemp=Number(productPLCountShow)+Number(replaceNull(pLProductJsonList[i].fnum));
			//alert("11"+productCountTemp);
			productPLCountShow= Number( ( productPLCountTemp ).toFixed(4) );
			
			//PL4200产品合同合计
			var fpriceTemp=Number(fpriceShow)+Number(replaceNull(pLProductJsonList[i].fprice));
			//alert("11"+productCountTemp);
			fpriceShow= Number( ( fpriceTemp ).toFixed(4) );
			
			//PL3000产品数量合计
			var pL3000CountTemp=Number(pL3000CountShow)+Number(replaceNull(pLProductJsonList[i].pl3000fnum));
			pL3000CountShow= Number( ( pL3000CountTemp ).toFixed(4) );
			//alert("pL3000CountShow:"+pL3000CountShow);
			//PL3000产品合同合计
			var pL3000UnitTemp=Number(pL3000UnitShow)+Number(replaceNull(pLProductJsonList[i].pl3000fprice));
			pL3000UnitShow= Number( ( pL3000UnitTemp ).toFixed(4) );
			
			//sSV3500产品数量合计
			var sSV3500CountTemp=Number(sSV3500CountShow)+Number(replaceNull(pLProductJsonList[i].ssv3500fnum));
			sSV3500CountShow= Number( ( sSV3500CountTemp ).toFixed(4) );
			//sSV3500产品合同合计
			var sSV3500UnitTemp=Number(sSV3500UnitShow)+Number(replaceNull(pLProductJsonList[i].ssv3500fprice));
			sSV3500UnitShow= Number( ( sSV3500UnitTemp ).toFixed(4) );
			
			
			//sPL2000产品数量合计
			var sPL2000CountTemp=Number(sPL2000CountShow)+Number(replaceNull(pLProductJsonList[i].pl2000fnum));
			sPL2000CountShow= Number( ( sPL2000CountTemp ).toFixed(4) );
			//sPL2000产品合同合计
			var sPL2000UnitTemp=Number(sPL2000UnitShow)+Number(replaceNull(pLProductJsonList[i].pl2000fprice));
			sPL2000UnitShow= Number( ( sPL2000UnitTemp ).toFixed(4) );
			
			
			//end 新增显示合计行
			
			PLlinenum++;
		}
		//补全默认加载的行
		for(var i = PLlinenum ;i <num ;i++){
			html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
			//PL产品弹出层中的删除行按钮
			html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
			
			html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
			
			html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" "/></td>';
			
			html+='</tr>';
			PLlinenum++;
			}
	}
	else{//改行没有子PL产品
		for(var i = 0 ;i <num ;i++){
			html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
			//PL产品弹出层中的删除行按钮
			html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
			
			html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
			
			html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" "/></td>';
									
			html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" "/></td>';
			html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur="countProductPLTotalFee();"/></td>';
			html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" "/></td>';
			
			html+='</tr>';
			PLlinenum++;
			}
		
	}
	//TEST
	}
	else{//添加操作
	
	for(var i = 0 ;i <num ;i++){
	html+='<tr align="center" id="plproducttr'+PLlinenum+'">';
	//PL产品弹出层中的删除行按钮
	html+='<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delPLProductTr('+PLlinenum+',0);" /></td>';
	
	html+='<td>'+(PLlinenum+1)+'<input name = "plpids" value="" id = "" type="hidden"/></td>';
	
	html+='<td ><input class="myinputall" id="PL4200Model"'+PLlinenum +' name="pL4200Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL4200Count"'+PLlinenum +' name="pL4200Counts" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="PL4200SalePrice"'+PLlinenum +' name="pL4200Units" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="PL4200ListPrice"'+PLlinenum +' name="pL4200ListPrices" onblur=" "/></td>';
							
	html+='<td ><input class="myinputall" id="PL3000Model"'+PLlinenum +' name="pL3000Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="PL3000Count" '+PLlinenum +' name="pL3000Counts" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="PL3000SalePrice"'+PLlinenum +' name="pL3000Units" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="PL3000ListPrice"'+PLlinenum +' name="pL3000ListPrices" onblur=" "/></td>';
							
	html+='<td ><input class="myinputall" id="SSV3500Model"'+PLlinenum +' name="sSV3500Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SSV3500Count"'+PLlinenum +' name="sSV3500Counts" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="SSV3500SalePrice"'+PLlinenum +' name="sSV3500Units" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="SSV3500ListPrice"'+PLlinenum +' name="sSV3500ListPrices" onblur=" "/></td>';
							
	html+='<td ><input class="myinputall" id="SPL2000Model"'+PLlinenum +' name="sPL2000Models" onblur=" "/></td>';
	html+='<td ><input class="myinputall" id="SPL2000Count"'+PLlinenum +' name="sPL2000Counts" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="SPL2000SalePrice"'+PLlinenum +' name="sPL2000Units" onblur="countProductPLTotalFee();"/></td>';
	html+='<td ><input class="myinputall" id="SPL2000ListPrice"'+PLlinenum +' name="sPL2000ListPrices" onblur=" "/></td>';
	
	html+='</tr>';
	PLlinenum++;
	}
	
	}
	//显示数量合计
	if('0'!=productPLCountShow+''){
		$('#productPLCountShowTxt').val(productPLCountShow+'');
	}
	//显示PL4200合同合计
	if('0'!=fpriceShow+''){
		$('#fpriceShowTxt').val(fpriceShow+'');
	}
	
	//pL3000显示数量合计
	if('0'!=pL3000CountShow+''){
		$('#pL3000CountShowTxt').val(pL3000CountShow+'');
	}
	//显示pL3000合同合计
	if('0'!=pL3000UnitShow+''){
		$('#pL3000UnitShowTxt').val(pL3000UnitShow+'');
	}
	
	//sSV3500显示数量合计
	if('0'!=sSV3500CountShow+''){
		$('#sSV3500CountShowTxt').val(sSV3500CountShow+'');
	}
	//显示sSV3500合同合计
	if('0'!=sSV3500UnitShow+''){
		$('#sSV3500UnitShowTxt').val(sSV3500UnitShow+'');
	}
	
	//sPL2000显示数量合计
	if('0'!=sPL2000CountShow+''){
		$('#sPL2000CountShowTxt').val(sPL2000CountShow+'');
	}
	//显示sPL2000合同合计
	if('0'!=sPL2000UnitShow+''){
		$('#sPL2000UnitShowTxt').val(sPL2000UnitShow+'');
	}
	
	$("#PLProductDetail").html(html);
}
function savePLInfo() {
	//var flag=window.confirm("确认信息填写无误吗？");
	//if(flag){
		//set 设置选择的值
		var checkresult=checkPLProductParams();
		if(checkresult){//PL弹出层检验成功保存
			//alert("suc");
			
			var ui1 = document.getElementById("contractTxtFile");
		    ui1.style.visibility="visible";
		    
		    var ui2 = document.getElementById("contractReviewFile");
		    ui2.style.visibility="visible";
		    var ui3 = document.getElementById("biddingNoticeFile");
		    ui3.style.visibility="visible";
		    
		     
		    var productLineNumNow = $("#productLineNum").val();
		    var pLProductJson= $("#pLProduct"+productLineNumNow).val();
		    if(null==pLProductJson||""==pLProductJson){
		    	 //如果没值,关变弹出窗口将文字显示为无
		    	$("#pLProductTxt"+productLineNumNow).html("无");
		    }else{
		    	//如果有值,关变弹出窗口将文字显示为有
		    	$("#pLProductTxt"+productLineNumNow).html("有");
		    }
		    
			$.closeDiv('designDiv');
			PLlinenum=0;
			$("#PLProductDetail").html("");
		}
	//}
	
}

/**
 * 校验PL产品各个参数
 */
function checkPLProductParams(){
	var pL4200ModelsObj = $('input[name="pL4200Models"]');
	var pL4200CountsObj = $('input[name="pL4200Counts"]');
	var pL4200UnitsObj = $('input[name="pL4200Units"]');
	var pL4200ListPricesObj = $('input[name="pL4200ListPrices"]');
	
	var pL3000ModelsObj = $('input[name="pL3000Models"]');
	var pL3000CountsObj = $('input[name="pL3000Counts"]');
	var pL3000UnitsObj = $('input[name="pL3000Units"]');
	var pL3000ListPricesObj = $('input[name="pL3000ListPrices"]');
	
	var sSV3500ModelsObj = $('input[name="sSV3500Models"]');
	var sSV3500CountsObj = $('input[name="sSV3500Counts"]');
	var sSV3500UnitsObj = $('input[name="sSV3500Units"]');
	var sSV3500ListPricesObj = $('input[name="sSV3500ListPrices"]');
	
	var sPL2000ModelsObj = $('input[name="sPL2000Models"]');
	var sPL2000CountsObj = $('input[name="sPL2000Counts"]');
	var sPL2000UnitsObj = $('input[name="sPL2000Units"]');
	var sPL2000ListPricesObj = $('input[name="sPL2000ListPrices"]');
	
	//alert("pL4200ModelsObj:"+pL4200ModelsObj+",pL4200ModelsObj.length:"+pL4200ModelsObj.length);
	/*if( (null==pL4200ModelsObj||0==pL4200ModelsObj.length)
		||(null==pL3000ModelsObj||0==pL3000ModelsObj.length)
		||(null==sSV3500ModelsObj||0==sSV3500ModelsObj.length)
		||(null==sPL2000ModelsObj||0==sPL2000ModelsObj.length)
	    ){//没有添加任何行
			alert("请添加PL产品规格型号!");
			return false;
	}*/
	var pLModelIsNull=false;
	//判断规格型号是否填了
	for(var i=0;i<pL4200ModelsObj.length;i++){
		if(""!=$.trim(pL4200ModelsObj.eq(i).val())){
			pLModelIsNull=true;
			break;
		}
	}
	for(var i=0;i<pL3000ModelsObj.length;i++){
		if(""!=$.trim(pL3000ModelsObj.eq(i).val())){
			pLModelIsNull=true;
			break;
		}
	}
	for(var i=0;i<sSV3500ModelsObj.length;i++){
		if(""!=$.trim(sSV3500ModelsObj.eq(i).val())){
			pLModelIsNull=true;
			break;
		}
	}
	for(var i=0;i<sPL2000ModelsObj.length;i++){
		if(""!=$.trim(sPL2000ModelsObj.eq(i).val())){
			pLModelIsNull=true;
			break;
		}
	}
	/*if(!pLModelIsNull){//为假代表没有填写规格型号
		alert("PL产品规格型号不能为空!");
		return false;
	}*/
	//下面判断的是只要4个产品中一个属性添加了,其他的属性也得跟着一块添加全
	//pL4200
	var pL4200ModelsObjLength=0;
	if( (null!=pL4200ModelsObj&&0!=pL4200ModelsObj.length)){ 
		for(var i=0;i<pL4200ModelsObj.length;i++){
			if(""!=$.trim(pL4200ModelsObj.eq(i).val())){
				pL4200ModelsObjLength++;
			}
		}
	}
	var pL4200CountsObjLength=0;
	if( (null!=pL4200CountsObj&&0!=pL4200CountsObj.length)){ 
		for(var i=0;i<pL4200CountsObj.length;i++){
			if(""!=$.trim(pL4200CountsObj.eq(i).val())){
				pL4200CountsObjLength++;
			}
		}
	}
	var pL4200UnitsObjLength=0;
	if( (null!=pL4200UnitsObj&&0!=pL4200UnitsObj.length)){ 
		for(var i=0;i<pL4200UnitsObj.length;i++){
			if(""!=$.trim(pL4200UnitsObj.eq(i).val())){
				pL4200UnitsObjLength++;
			}
		}
	}
	var pL4200ListPricesObjLength=0;
	if( (null!=pL4200ListPricesObj&&0!=pL4200ListPricesObj.length)){ 
		for(var i=0;i<pL4200ListPricesObj.length;i++){
			if(""!=$.trim(pL4200ListPricesObj.eq(i).val())){
				pL4200ListPricesObjLength++;
			}
		}
	}
	var pL4200lastLineNum=Math.max(pL4200ModelsObjLength,pL4200CountsObjLength,pL4200UnitsObjLength,pL4200ListPricesObjLength);
	//pL4200录入的最大行,去遍历每项不能为空
	//判断pL4200录入的数据
	var pL4200ModelsObjLength=0;
	//if( (null!=pL4200ModelsObj&&0!=pL4200ModelsObj.length)){ 
		//for(var i=0;i<pL4200ModelsObj.length;i++){
			for(var i=0;i<pL4200lastLineNum;i++){
			
			//if(""!=$.trim(pL4200ModelsObj.eq(i).val())){//规格型号不为空的情况下
				if($.trim(pL4200ModelsObj.eq(i).val())==""){
					alert("PL4200产品规格型号不能为空!");
					return false;
				}
				
				if($.trim(pL4200CountsObj.eq(i).val())==""){
					alert("PL4200产品数量不能为空!");
					return false;
				}else{
					//校验必须为数字
				    if(!isFloat( $.trim(pL4200CountsObj.eq(i).val())  )){
				    	 alert('PL4200产品数量是数字！');
					     return false;
				    }
				}
				if($.trim(pL4200UnitsObj.eq(i).val())==""){
					alert("PL4200产品合同单价不能为空!");
					return false;
				}else{
					//校验必须为数字
				    if(!isFloat( $.trim(pL4200UnitsObj.eq(i).val())  )){
				    	 alert('PL4200产品合同单价是数字！');
					     return false;
				    }
				}
				if($.trim(pL4200ListPricesObj.eq(i).val())==""){
					alert("PL4200产品列表单价不能为空!");
					return false;
				}else{
					//校验必须为数字
				    if(!isFloat( $.trim(pL4200ListPricesObj.eq(i).val())  )){
				    	 alert('PL4200产品列表单价是数字！');
					     return false;
				    }
				}
				pL4200ModelsObjLength++;
			//}
		}
		
	//}
	//pL3000
			var pL3000ModelsObjLength=0;
			if( (null!=pL3000ModelsObj&&0!=pL3000ModelsObj.length)){ 
				for(var i=0;i<pL3000ModelsObj.length;i++){
					if(""!=$.trim(pL3000ModelsObj.eq(i).val())){
						pL3000ModelsObjLength++;
					}
				}
			}
			var pL3000CountsObjLength=0;
			if( (null!=pL3000CountsObj&&0!=pL3000CountsObj.length)){ 
				for(var i=0;i<pL3000CountsObj.length;i++){
					if(""!=$.trim(pL3000CountsObj.eq(i).val())){
						pL3000CountsObjLength++;
					}
				}
			}
			var pL3000UnitsObjLength=0;
			if( (null!=pL3000UnitsObj&&0!=pL3000UnitsObj.length)){ 
				for(var i=0;i<pL3000UnitsObj.length;i++){
					if(""!=$.trim(pL3000UnitsObj.eq(i).val())){
						pL3000UnitsObjLength++;
					}
				}
			}
			var pL3000ListPricesObjLength=0;
			if( (null!=pL3000ListPricesObj&&0!=pL3000ListPricesObj.length)){ 
				for(var i=0;i<pL3000ListPricesObj.length;i++){
					if(""!=$.trim(pL3000ListPricesObj.eq(i).val())){
						pL3000ListPricesObjLength++;
					}
				}
			}
	var pL3000lastLineNum=Math.max(pL3000ModelsObjLength,pL3000CountsObjLength,pL3000UnitsObjLength,pL3000ListPricesObjLength);	
	//alert("pL3000lastLineNum:"+pL3000lastLineNum);
	//判断pL3000录入的数据
	var pL3000ModelsObjLength=0;
	//if( (null!=pL3000ModelsObj&&0!=pL3000ModelsObj.length)){ 
		//for(var i=0;i<pL3000ModelsObj.length;i++){
		for(var i=0;i<pL3000lastLineNum;i++){
			//alert("i:"+i);
			//alert("pL3000ModelsObj.eq(i).val():"+$.trim(pL3000ModelsObj.eq(i).val()));
			//alert("pL3000CountsObj.eq(i).val():"+$.trim(pL3000CountsObj.eq(i).val()));
//			if( ($.trim(pL3000ModelsObj.eq(i).val())=="")
//				&&($.trim(pL3000CountsObj.eq(i).val())=="")
//				&&($.trim(pL3000UnitsObj.eq(i).val())=="")
//				&&($.trim(pL3000ListPricesObj.eq(i).val())=="")
//				){
//				alert("1");
//			}else{
				
				//alert("2");
				
				if($.trim(pL3000ModelsObj.eq(i).val())==""){
					alert("PL3000产品规格型号不能为空!");
					return false;
				}
				//if(""!=$.trim(pL3000ModelsObj.eq(i).val())){//规格型号不为空的情况下
				if($.trim(pL3000CountsObj.eq(i).val())==""){
					alert("PL3000产品数量不能为空!");
					return false;
				}else{
					//校验必须为数字
				    if(!isFloat( $.trim(pL3000CountsObj.eq(i).val())  )){
				    	 alert('PL3000产品数量是数字！');
					     return false;
				    }
				}
				if($.trim(pL3000UnitsObj.eq(i).val())==""){
					alert("PL3000产品合同单价不能为空!");
					return false;
				}else{
					//校验必须为数字
				    if(!isFloat( $.trim(pL3000UnitsObj.eq(i).val())  )){
				    	 alert('PL3000产品合同单价是数字！');
					     return false;
				    }
				}
				if($.trim(pL3000ListPricesObj.eq(i).val())==""){
					alert("PL3000产品列表单价不能为空!");
					return false;
				}else{
					//校验必须为数字
				    if(!isFloat( $.trim(pL3000ListPricesObj.eq(i).val())  )){
				    	 alert('PL3000产品列表单价是数字！');
					     return false;
				    }
				}
				pL3000ModelsObjLength++;
			//}
			//}
		}
	//}
		
		//sSV3500
		var sSV3500ModelsObjLength=0;
		if( (null!=sSV3500ModelsObj&&0!=sSV3500ModelsObj.length)){ 
			for(var i=0;i<sSV3500ModelsObj.length;i++){
				if(""!=$.trim(sSV3500ModelsObj.eq(i).val())){
					sSV3500ModelsObjLength++;
				}
			}
		}
		var sSV3500CountsObjLength=0;
		if( (null!=sSV3500CountsObj&&0!=sSV3500CountsObj.length)){ 
			for(var i=0;i<sSV3500CountsObj.length;i++){
				if(""!=$.trim(sSV3500CountsObj.eq(i).val())){
					sSV3500CountsObjLength++;
				}
			}
		}
		var sSV3500UnitsObjLength=0;
		if( (null!=sSV3500UnitsObj&&0!=sSV3500UnitsObj.length)){ 
			for(var i=0;i<sSV3500UnitsObj.length;i++){
				if(""!=$.trim(sSV3500UnitsObj.eq(i).val())){
					sSV3500UnitsObjLength++;
				}
			}
		}
		var sSV3500ListPricesObjLength=0;
		if( (null!=sSV3500ListPricesObj&&0!=sSV3500ListPricesObj.length)){ 
			for(var i=0;i<sSV3500ListPricesObj.length;i++){
				if(""!=$.trim(sSV3500ListPricesObj.eq(i).val())){
					sSV3500ListPricesObjLength++;
				}
			}
		}
		var sSV3500lastLineNum=Math.max(sSV3500ModelsObjLength,sSV3500CountsObjLength,sSV3500UnitsObjLength,sSV3500ListPricesObjLength);	
		
	//判断sSV3500录入的数据
	var sSV3500ModelsObjLength=0;
	//if( (null!=sSV3500ModelsObj&&0!=sSV3500ModelsObj.length)){ 
		//for(var i=0;i<sSV3500ModelsObj.length;i++){
		for(var i=0;i<sSV3500lastLineNum;i++){
			//if(""!=$.trim(sSV3500ModelsObj.eq(i).val())){//规格型号不为空的情况下
			
			if($.trim(sSV3500ModelsObj.eq(i).val())==""){
				alert("sSV3500产品规格型号不能为空!");
				return false;
			}
			
			if($.trim(sSV3500CountsObj.eq(i).val())==""){
				alert("sSV3500产品数量不能为空!");
				return false;
			}else{
				//校验必须为数字
			    if(!isFloat( $.trim(sSV3500CountsObj.eq(i).val())  )){
			    	 alert('sSV3500产品数量是数字！');
				     return false;
			    }
			}
			if($.trim(sSV3500UnitsObj.eq(i).val())==""){
				alert("sSV3500产品合同单价不能为空!");
				return false;
			}else{
				//校验必须为数字
			    if(!isFloat( $.trim(sSV3500UnitsObj.eq(i).val())  )){
			    	 alert('sSV3500产品合同单价是数字！');
				     return false;
			    }
			}
			if($.trim(sSV3500ListPricesObj.eq(i).val())==""){
				alert("sSV3500产品列表单价不能为空!");
				return false;
			}else{
				//校验必须为数字
			    if(!isFloat( $.trim(sSV3500ListPricesObj.eq(i).val())  )){
			    	 alert('sSV3500产品列表单价是数字！');
				     return false;
			    }
			}
			sSV3500ModelsObjLength++;
			//}
		}
	//}
		//sPL2000
		var sPL2000ModelsObjLength=0;
		if( (null!=sPL2000ModelsObj&&0!=sPL2000ModelsObj.length)){ 
			for(var i=0;i<sPL2000ModelsObj.length;i++){
				if(""!=$.trim(sPL2000ModelsObj.eq(i).val())){
					sPL2000ModelsObjLength++;
				}
			}
		}
		var sPL2000CountsObjLength=0;
		if( (null!=sPL2000CountsObj&&0!=sPL2000CountsObj.length)){ 
			for(var i=0;i<sPL2000CountsObj.length;i++){
				if(""!=$.trim(sPL2000CountsObj.eq(i).val())){
					sPL2000CountsObjLength++;
				}
			}
		}
		var sPL2000UnitsObjLength=0;
		if( (null!=sPL2000UnitsObj&&0!=sPL2000UnitsObj.length)){ 
			for(var i=0;i<sPL2000UnitsObj.length;i++){
				if(""!=$.trim(sPL2000UnitsObj.eq(i).val())){
					sPL2000UnitsObjLength++;
				}
			}
		}
		var sPL2000ListPricesObjLength=0;
		if( (null!=sPL2000ListPricesObj&&0!=sPL2000ListPricesObj.length)){ 
			for(var i=0;i<sPL2000ListPricesObj.length;i++){
				if(""!=$.trim(sPL2000ListPricesObj.eq(i).val())){
					sPL2000ListPricesObjLength++;
				}
			}
		}
	var sPL2000lastLineNum=Math.max(sPL2000ModelsObjLength,sPL2000CountsObjLength,sPL2000UnitsObjLength,sPL2000ListPricesObjLength);	
		
	//判断sPL2000录入的数据
	var sPL2000ModelsObjLength=0;
	//if( (null!=sPL2000ModelsObj&&0!=sPL2000ModelsObj.length)){ 
		//for(var i=0;i<sPL2000ModelsObj.length;i++){
		for(var i=0;i<sPL2000lastLineNum;i++){
			//if(""!=$.trim(sPL2000ModelsObj.eq(i).val())){//规格型号不为空的情况下
			if($.trim(sPL2000ModelsObj.eq(i).val())==""){
				alert("sPL2000产品规格型号不能为空!");
				return false;
			}
			
			if($.trim(sPL2000CountsObj.eq(i).val())==""){
				alert("sPL2000产品数量不能为空!");
				return false;
			}else{
				//校验必须为数字
			    if(!isFloat( $.trim(sPL2000CountsObj.eq(i).val())  )){
			    	 alert('sPL2000产品数量是数字！');
				     return false;
			    }
			}
			if($.trim(sPL2000UnitsObj.eq(i).val())==""){
				alert("sPL2000产品合同单价不能为空!");
				return false;
			}else{
				//校验必须为数字
			    if(!isFloat( $.trim(sPL2000UnitsObj.eq(i).val())  )){
			    	 alert('sPL2000产品合同单价是数字！');
				     return false;
			    }
			}
			if($.trim(sPL2000ListPricesObj.eq(i).val())==""){
				alert("sPL2000产品列表单价不能为空!");
				return false;
			}else{
				//校验必须为数字
			    if(!isFloat( $.trim(sPL2000ListPricesObj.eq(i).val())  )){
			    	 alert('sPL2000产品列表单价是数字！');
				     return false;
			    }
			}
			sPL2000ModelsObjLength++;
			//}
		}
	//}
	//上面判断的是只要4个产品中一个属性添加了,其他的属性也得跟着一块添加全
		
	//if(!pLModelIsNull){//为假代表4中PL产品一个都没填没有填写规格型号
		 //放开什么都不添的为了:某行产品添加完PL产品信息了,保存后,又去修改,将PL产品修改为空,考虑目前是点击保存必须有PL产品才能保存
		//上述情况
		//return true;
	//}
	
	//判断哪列PL产品填的多,就以哪列的PL产品的行数为最后的行数
	//var lastLineNum=Math.max(pL4200ModelsObjLength,pL3000ModelsObjLength,sSV3500ModelsObjLength,sPL2000ModelsObjLength);
	//取4类产品中最大的值
	var lastLineNum=Math.max(pL4200lastLineNum,pL3000lastLineNum,sSV3500lastLineNum,sPL2000lastLineNum);
	var productLineNum = $("#productLineNum").val();//当前PL弹出层所属的产品的行号
	//alert("lastLineNum:"+lastLineNum);
	//alert( 0==lastLineNum );
	//alert( "0"==(lastLineNum+"") );
	if("0"==(lastLineNum+"")){
		//说明没有添值就提交了
		$("#pLProduct"+productLineNum).val("");//置为空
		return true;
	}
	//则添值保存了,正常生成JSON
	//alert("lastLineNum:"+lastLineNum);
	var arr = new List();
	//alert("1:");
	
	for(var i=0;i<lastLineNum;i++){
		//alert("2:");
		var productpl = new Object();//新建对象
		//alert("3:");
		
		//alert("productLineNum:"+productLineNum);
		productpl.productLineNum=productLineNum;
		//alert("3 a:");
		productpl.fmodel=pL4200ModelsObj.eq(i).val();//pL4200规格型号
		productpl.fnum=pL4200CountsObj.eq(i).val();//pL4200数量
		productpl.fprice=pL4200UnitsObj.eq(i).val();//pL4200合同价
		productpl.flistprice=pL4200ListPricesObj.eq(i).val();//pL4200列表价
		//alert("5:");
		productpl.pl3000fmodel=pL3000ModelsObj.eq(i).val();//pl3000规格型号
		productpl.pl3000fnum=pL3000CountsObj.eq(i).val();//pl3000数量
		productpl.pl3000fprice=pL3000UnitsObj.eq(i).val();//pl3000合同价
		productpl.pl3000flistprice=pL3000ListPricesObj.eq(i).val();//pl3000列表价
		//alert("6:");
		productpl.ssv3500fmodel=sSV3500ModelsObj.eq(i).val();//sSV3500规格型号
		productpl.ssv3500fnum=sSV3500CountsObj.eq(i).val();//sSV3500数量
		productpl.ssv3500fprice=sSV3500UnitsObj.eq(i).val();//sSV3500合同价
		productpl.ssv3500flistprice=sSV3500ListPricesObj.eq(i).val();//sSV3500列表价
		//alert("7:");
		productpl.pl2000fmodel=sPL2000ModelsObj.eq(i).val();//sPL2000规格型号
		productpl.pl2000fnum=sPL2000CountsObj.eq(i).val();//sPL2000数量
		productpl.pl2000fprice=sPL2000UnitsObj.eq(i).val();//sPL2000合同价
		productpl.pl2000flistprice=sPL2000ListPricesObj.eq(i).val();//sPL2000列表价
		//alert("8:");
		arr.add(productpl);
	}
	//alert("9:");
	var json = JSON.stringify(arr);
	//alert("json:"+json);
	//设置到订单关联的产品行的隐藏域中
	$("#pLProduct"+productLineNum).val(json);
	return true;
}

//测试通过
function isFloat(obj) {
	//alert("obj:"+obj);
	var data=obj;             
	var result=false;                         
	if(typeof data!='undefined') {                
		// 正则表达式 匹配 非负浮点数，小数点后最多10位小数                   
		if(data.match(/^\+{0,1}\d+(\.\d{1,10})?$/)!=null){                    
			result=true;                
		}            
		}                        
	//alert("result:"+result);  
	return result;
}

//自定义LIST
function List(){
    this.value = [];
    /*添加*/
    this.add = function(obj){
        return this.value.push(obj);
    };
     
    /*大小*/
    this.size = function(){
        return this.value.length;
    };
 
    /*返回指定索引的值*/
    this.get = function(index){
        return this.value[index];
    };
 
    /*删除指定索引的值*/
    this.remove = function(index){
        this.value1 = [];                          
        this.value[index]='';                      
        for(var i=0;i<this.size();i++){
            if(this.value[i]!=''){                 
                this.value1.push(this.value[i]);
            }
        }
        this.value = this.value1;  
        delete this.value1;        
        return this.value;         
    };
     
    /*删除全部值*/
    this.removeAll = function(){
        return this.value=[];          
    };
 
    /*是否包含某个对象*/
    this.constains = function(obj){
        for(var i in this.value){
            if( obj == this.value[i] ){
                return true;
            }else{                     
                continue;
            }
        }
        return false;              
    };
}
function closeShowdesign(){
	$.closeDiv('designDiv');
	PLlinenum=0;
	$("#PLProductDetail").html("");//将弹出层置为空
}
function closedesign(){
	
	var ui1 = document.getElementById("contractTxtFile");
    ui1.style.visibility="visible";
    
    var ui2 = document.getElementById("contractReviewFile");
    ui2.style.visibility="visible";
    var ui3 = document.getElementById("biddingNoticeFile");
    ui3.style.visibility="visible";
	
	$.closeDiv('designDiv');
	PLlinenum=0;
	$("#PLProductDetail").html("");//将弹出层置为空
}
function showMenuidparam(menuidparam){
	//$('#menuidparamH').val(menuidparam);//编辑页面系统订单菜单ID
	//alert("showMenuidparam(menuidparam):"+menuidparam);
	//$('#menuidparamH').val(menuidparam);//合同旧编号   
}
/**
 * 编辑系统订单
 * @param id 编辑的系统订单的id
 */
//function editSysOrder(id,menuidparam){
function editSysOrder(id){
	
	//$('#menuidparamH').val(menuidparam);//编辑页面系统订单菜单ID
	//alert("menuidparam:"+menuidparam);
	//alert("menuidparam:"+$('#menuidparamH').val());
	if(null!=id&&undefined!=id&&id!=""){
		if($('.productTR').length!=0){
			$('.productTR').remove();
		}
		//$('#sysOrderIdHidden').val(parseInt(id));
		
		$.webAjax({
			type : 'post',
			url : ctx+ '/sysOrder/sys-order!input.htm?id='+id,
			success : function(data) {
				var sysOrder = data.sysOrder;//系统订单
				var productList = data.productList;//系统订单关联的产品列表,通过基本订单的编号
				var collectPayList = data.collectPayList;//系统订单关联的合同信息,通过基本订单的编号
				
				var productplList = data.productplList;//系统订单关联的产品列表的PL产品
				//alert("productplList:"+productplList);
				var product = "";
				var collectPay = "";
				
				$('#orderCode').val(sysOrder.orderCode);//订单编号
				$('#contractCode').val(sysOrder.contractCode);//合同编号 
				if(null!=sysOrder.contractOldCode){
					$('#contractOldCode').val(sysOrder.contractOldCode);//合同旧编号
				}
				$('#contractTime').val(formatDate("yyyy-MM-dd",sysOrder.contractTime));//合同时间 合同签订时间
				
				//$('#contractOldCode2').val(sysOrder.contractOldCode);//合同旧编号
				//$('#menuidparamH').val(menuidparam);//    
				
				//$('#contractTime').attr("disabled","disabled");
				$('#contractName').val(sysOrder.contractName);//合同名称
				
				$('#checkProject').val(sysOrder.checkProject);//核算项目
				$('#checkProjectId').val(sysOrder.checkProjectId);//核算项目 id
				$('#contractType').val(sysOrder.contractType);//合同类型
				$('#model').val(sysOrder.model);//模式
				$('#saleType').val(sysOrder.saleType);//销售方式
				$('#customContractCode').val(sysOrder.customContractCode);//客户合同号
				$('#coinType').val(sysOrder.coinType);//币种
				//alert("sysOrder.exchangeRate:"+sysOrder.exchangeRate);
				
				 var opList = document.getElementById('exchangeRate').options;
		            for (var i = 0, len = opList.length; i < len; i++) {
		            	//var opValueTemp =opList[i].value;
		            	var optextTemp =opList[i].text;
		            	//alert("opList[i].text:"+opList[i].text+"optextTemp:"+optextTemp+"");
		            	//var strs= new Array(); //定义一数组 
		            	//strs=optextTemp.split("|");
		            	//alert("strs.length:"+strs.length);
		            	/*if(null!=strs&&2<strs.length){
		            		optextTemp=optextTemp.split("|")[2]; //字符分割
		            		if (optextTemp == (sysOrder.exchangeRate+"")) {
			                    opList[i].selected = true;
			                    break;
			                }
		            	}*/
		            	if (optextTemp == (sysOrder.exchangeRate+"")) {
		                    opList[i].selected = true;
		                    break;
		                }
		                
		            }
		            
				//$('#exchangeRate').val(sysOrder.exchangeRate);//汇率
				$('#bussinessType').val(sysOrder.bussinessType);//业务类型
				$('#systemConsumer').val(sysOrder.systemConsumer);//体系客户
				$('#systemConsumerId').val(sysOrder.systemConsumerId);
				
				$('#finalConsumer').val(sysOrder.finalConsumer);//最终客户
				$('#finalConsumerId').val(sysOrder.finalConsumerId);
				
				$('#contractVersion').val(sysOrder.contractVersion);//合同版本
				$('#changeTime').val(formatDate("yyyy-MM-dd",sysOrder.changeTime));//变更日期(yyyy-MM-dd)
				
				$('#changeReason').val(sysOrder.changeReason);//变更原因
				$('#businessUser').val(sysOrder.businessUser);//业务员
				$('#businessUserId').val(sysOrder.businessUserId);
				
				$('#manager').val(sysOrder.manager);//主管
				$('#managerId').val(sysOrder.managerId);
				
				$('#payCondition').val(sysOrder.payCondition);//付款条件
				$('#department').val(sysOrder.department);//部门
				$('#departmentId').val(sysOrder.departmentId);
				
				$('#warrantyTime').val(sysOrder.warrantyTime);//保质时间
				
				$('#examineTime').val(formatDate("yyyy-MM-dd",sysOrder.examineTime));//审核时间
				$('#examineUserName').val(sysOrder.examineUserName);//审核人姓名
				$('#examineUserId').val(sysOrder.examineUserId);
				
				//$('#changeUserName').val(sysOrder.changeUserName);//变更人名称
				
				$('#disCoefficient').val(sysOrder.disCoefficient);//经销系数
				
				$('#operatorrate').val(sysOrder.operatorrate);//业务费系数
				
				$('#dealerName').val(sysOrder.dealerName);//经销商
				
				$('#remarks').val(sysOrder.remarks);//附注
				
				$('#province').val(sysOrder.province);//省份
				$('#provinceId').val(sysOrder.provinceId);
				
				$('#businessratio').val(sysOrder.businessratio);//业务员标准产品比例
				$('#salemanagerId').val(sysOrder.salemanagerId);//销售经理id
				$('#salemanagerName').val(sysOrder.salemanagerName);//销售经理name
				$('#salemanagerratio').val(sysOrder.salemanagerratio);//销售经理标准产品比例
				$('#areamanagerId').val(sysOrder.areamanagerId);//区域经理id
				$('#areamanagerName').val(sysOrder.areamanagerName);//区域经理name
				$('#areamanagerratio').val(sysOrder.areamanagerratio);//区域经理标准产品比例
				$('#fbselfratio').val(sysOrder.fbselfratio);//业务员非标产品比例
				$('#fbsmratio').val(sysOrder.fbsmratio);//销售经理非标产品比例
				$('#fbamratio').val(sysOrder.fbamratio);//区域经理非标产品比例
				
				
				
				$('#biddingNoticeShow').val("投标通知单文件");//sysOrder.biddingNotice
				$('#biddingNoticeHidden').val(sysOrder.biddingNotice);//sysOrder.biddingNotice//中标通知单
				
				$('#contractReviewShow').val("合同评审文件");//sysOrder.contractReview
				$('#contractReviewHidden').val(sysOrder.contractReview);//sysOrder.contractReview//合同评审(链接的形式)
				
				$('#contractTxtShow').val("合同文本文件");//sysOrder.contractTxt
				$('#contractTxtHidden').val(sysOrder.contractTxt);//sysOrder.contractTxt//合同内容(链接的形式)
				
				$('#fheadSelfS0156').val(sysOrder.fheadSelfS0156);//是否有合同
				$('#sysOrderStatusHidden').val(sysOrder.sysOrderStatus);//合同状态 0 待提交 1 待审核 2 已生效 3 被驳回 4 关闭
				
				$('#issummary').val(sysOrder.issummary);//是否已汇总
				
				var addProductImg = "";
				var productOnly = "";
				
				if(sysOrder.changeAreaType==1){//可变范围 0非重要 1重要
					$('#orderCode').attr("readonly","readonly");
					$('#contractTime').attr("readonly","readonly");
					$('#contractName').attr("readonly","readonly");
					
					$('#checkProject').attr("readonly","readonly");
					$('#contractCode').attr("readonly","readonly");
					
					$('#bussinessType').attr("disabled","disabled");
					$('#systemConsumer').attr("readonly","readonly");
					$('#finalConsumer').attr("readonly","readonly");
					
					$('#changeTime').attr("readonly","readonly");
					$('#changeReason').attr("readonly","readonly");
					
					$('#changeUserName').attr("readonly","readonly");
					$('#businessUser').attr("readonly","readonly");
					
					$('#systemConsumer').removeAttr("onclick");
					$('#systemConsumer').removeAttr("onkeyup");
					
					$('#checkProject').removeAttr("onclick");
					$('#checkProject').removeAttr("onkeyup");
					
					$('#finalConsumer').removeAttr("onclick");
					$('#finalConsumer').removeAttr("onkeyup");
					
					$('#addProductTD').html("序号");
					
					//国产P类产品价格
					//PL3000Count PL3000SalePrice PL3000ListPrice 
					//PL4200Count PL4200SalePrice PL4200ListPrice
					//SSV3500Count SSV3500SalePrice SSV3500ListPrice
					//SPL2000Count SPL2000SalePrice SPL2000ListPrice
					$('#PL3000Count').attr("readonly","readonly");
					$('#PL3000SalePrice').attr("readonly","readonly");
					$('#PL3000ListPrice').attr("readonly","readonly");
					
					$('#PL4200Count').attr("readonly","readonly");
					$('#PL4200SalePrice').attr("readonly","readonly");
					$('#PL4200ListPrice').attr("readonly","readonly");
					
					$('#SSV3500Count').attr("readonly","readonly");
					$('#SSV3500SalePrice').attr("readonly","readonly");
					$('#SSV3500ListPrice').attr("readonly","readonly");
					
					$('#SPL2000Count').attr("readonly","readonly");
					$('#SPL2000SalePrice').attr("readonly","readonly");
					$('#SPL2000ListPrice').attr("readonly","readonly");
					
				}
				var productCountShow=0;
				var unitPriceShow=0;
				var priceTaxTotalShow=0;
				
				var exchangeRate=$('#sysOrderForm select[id="exchangeRate"] option:selected').val();
				var strs= new Array(); //定义一数组 
				strs=exchangeRate.split("|"); //字符分割
				exchangeRate=parseFloat(strs[0]);
				
				for(var i=0;i<productList.length;i++){
					linenum++;
					
					if(sysOrder.changeAreaType!=1){
						addProductImg = '<img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delProductTr('+productList[i].productId+',1);"/>';
					}else{
						addProductImg = i+1;
						productOnly = "readonly = 'readonly'";//动态判断是否有删除图片
					}
					product += '<tr id="producttr'+productList[i].productId+'">';//产品ID
					product += '<td>'+addProductImg+
							   '<input type="hidden" name="productIdHiddenTD" value="'+productList[i].productId+'"/></td>';//产品id
					/**
					 * 产品代码productCode 	产品名称productName 	对外销售名称outSaleName 	
					 * 项目名称proProjectName 	辅助属性assistAttribute 	
					 * 执行标准excuteStandard 	规格型号specifications 	
						类别productType 	数量productCount 	含税单价unitPrice 	服务费servicecharge		
						列表价listprice		结算价balanceprice 	--折扣discount
						-总金额（元）totalFee 	材质material 	单位productUnit 	税率taxRate
						 	单价(不含税)unitRemoveTax 	交货时间deliveryTime 	建议交货时间adviceDeliveryTime
						折扣率discountRate 	价税合计priceTaxTotal 	质保金qualityFee 	质保金率(%)qualityFeeRate
						 	辅助单位assistUnit 	辅助数量productAssistCount 	换算率convertRate
						实际含税单价factUnitPrice 	销项税额saleTax 	制令号makeNumberCode 	
						任务单号taskCode 	辅助单位出库数量assistUnitOutHouseCount 	客户BOM customBOM
						 	成本对象costObj
						开票数量billCount 	辅助单位开票数量assistCompanyBillCount
						 	辅助单位组装数量assistCompanyFitCount 	订单行号orderTrNumber
						 	基本单位组装数量baseCompanyFitCount 	
						组装数量fitCount 	备注remarks

					 */
					/**
					 * 1行号
					2产品代码
					3产品名称
					4对外销售名称
					5材质
					6执行标准
					7规格型号
					8类别
					9项目名称
					10辅助属性
					11单位名
					12数量
					13辅助单位
					14换算率
					15辅助数量
					16单价(不含税)
					17含税单价
					18服务/工程费单价		
					19列表单价		
					20结算单价
					21总金额（元）
					22税率(%)
					23折扣率(%)
					24折扣
					25实际含税单价
					26销项税额
					27价税合计
					28交货时间
					29建议交货时间
					30质保金率(%)
					31质保金
					32制令号
					33任务单号
					34辅助单位出库数量
					35客户BOM
					36成本对象
					37开票数量
					38辅助单位开票数量
					39辅助单位组装数量
					40基本单位组装数量
					41组装数量
					42备注
					 */
					product += '<td ><input class="myinputall" readonly="readonly" name="orderTrNumber" value="'+replaceNull(productList[i].orderTrNumber)+'" '+' "/></td>';
					
					product += '<td><input class="myinputall" id="productCode'+i+'" name="productCode" value="'+replaceNull(productList[i].productCode).trim()+'" '+productOnly+' onkeyup="toLoadItem('+i+');" onclick="toLoadItem('+i+');"/>';
					product += '<div class="selectProduct" id="selectProductDiv'+i+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProduct'+i+'"></tbody></table></div></td>';
					/*//产品名
					product += '<td><input class="myinputall" id="productName'+i+'" name="productName" value="'+replaceNull(productList[i].productName)+'" readonly="readonly"/></td>';*/
					product += '<td><input class="myinputall" id="productName'+i+'" name="productName" onkeyup="toLoadItemByName('+i+');" onclick="toLoadItemByName('+i+');" value="'+replaceNull(productList[i].productName)+'"/>';
					product += '<div class="selectProductByName" id="selectProductByNameDiv'+i+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProductByName'+i+'"></tbody></table></div></td>';
					//对外销售名
					product += '<td><input class="myinputall" name="outSaleName" value="'+replaceNull(productList[i].outSaleName)+'" '+productOnly+'/></td>';
					//材质
					//product += '<td><input class="myinputall" id="material'+i+'" name="material" value="'+replaceNull(productList[i].material)+'" readonly="readonly"/></td>';
					//材质名
					product += '<td><input type="hidden" id="material'+i+'" name="material" value="'+replaceNull(productList[i].material)+'"  /><input class="myinputall" id="materialname'+i+'" name="materialname" value="'+replaceNull(productList[i].materialname)+'" readonly="readonly"/></td>';
					//执行标准
					product += '<td><input class="myinputall" id="excuteStandard'+i+'" name="excuteStandard" value="'+replaceNull(productList[i].excuteStandard)+'" readonly="readonly"/></td>';
					//规格型号
					product += '<td><input class="myinputall" id="specifications'+i+'" name="specifications" value="'+replaceNull(productList[i].specifications)+'" readonly="readonly"/></td>';
					//分类
					product += '<td><select class="selectall" name="productType" value="'+productList[i].productType+'">';
					if(productList[i].productType==null||productList[i].productType.trim()=='A'){
						product += '<option value="A" selected="selected">A</option>';
					}else{
						product += '<option value="A">A</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='B'){
						product += '<option value="B" selected="selected">B</option>';
					}else{
						product += '<option value="B">B</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='C'){
						product += '<option value="C" selected="selected">C</option>';
					}else{
						product += '<option value="C">C</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='D'){
						product += '<option value="D" selected="selected">D</option>';
					}else{
						product += '<option value="D">D</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='E'){
						product += '<option value="E" selected="selected">E</option>';
					}else{
						product += '<option value="E">E</option>';
					}
					product += '</select></td>';
					//PL产品添加按钮
					//遍历PL产品找到对应的父产品
					var orderTrNumber=productList[i].orderTrNumber;
					var pLProductInfo="";
					var arr = new List();
					for(var j=0;j<productplList.length;j++){
						if(productplList[j].productId==productList[i].productId){
							var productpl = new Object();//新建对象
							//alert("3:");
							//alert("productLineNum:"+productLineNum);
							productpl.productLineNum=orderTrNumber;
							//alert("3 a:");
							productpl.fmodel=replaceNull(productplList[j].fmodel);//pL4200规格型号
							productpl.fnum=replaceNull(productplList[j].fnum);//pL4200数量
							productpl.fprice=replaceNull(productplList[j].fprice);//pL4200合同价
							productpl.flistprice=replaceNull(productplList[j].flistprice);//pL4200列表价
							//alert("5:");
							productpl.pl3000fmodel=replaceNull(productplList[j].pl3000fmodel);//pl3000规格型号
							productpl.pl3000fnum=replaceNull(productplList[j].pl3000fnum);//pl3000数量
							productpl.pl3000fprice=replaceNull(productplList[j].pl3000fprice);//pl3000合同价
							productpl.pl3000flistprice=replaceNull(productplList[j].pl3000flistprice);//pl3000列表价
							//alert("6:");
							productpl.ssv3500fmodel=replaceNull(productplList[j].ssv3500fmodel);//sSV3500规格型号
							productpl.ssv3500fnum=replaceNull(productplList[j].ssv3500fnum);//sSV3500数量
							productpl.ssv3500fprice=replaceNull(productplList[j].ssv3500fprice);//sSV3500合同价
							productpl.ssv3500flistprice=replaceNull(productplList[j].ssv3500flistprice);//sSV3500列表价
							//alert("7:");
							productpl.pl2000fmodel=replaceNull(productplList[j].pl2000fmodel);//sPL2000规格型号
							productpl.pl2000fnum=replaceNull(productplList[j].pl2000fnum);//sPL2000数量
							productpl.pl2000fprice=replaceNull(productplList[j].pl2000fprice);//sPL2000合同价
							productpl.pl2000flistprice=replaceNull(productplList[j].pl2000flistprice);//sPL2000列表价
							//alert("8:");
							arr.add(productpl);
						}
					}
					var json = JSON.stringify(arr);
					//var isHavePlProduct=false;
					if(0<json.length&&'{"value":[]}'!=json){
						pLProductInfo=json;
					}
					//alert("pLProductInfo:"+pLProductInfo);
					var plProductTipText='';
					var pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts"  />';
					if(null==pLProductInfo||""==pLProductInfo){
						//当前行
						//plProductTipText='<input class="myinputall" id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'" value="无"  />';
						plProductTipText='<span   id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'"  >无</span>';
					}else{
						//plProductTipText='<input class="myinputall" id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'" value="有"  />';
						plProductTipText='<span   id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'"  >有</span>';
						pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts" value='+pLProductInfo+' />';
					}
					//product += '<td><a href="javascript:openPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');"><img src="'+ctx+'/images/add_small.gif" border="0" /></a>'+
					product += '<td><a href="javascript:openPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');">'+plProductTipText+'</a>'+
					
					//PL弹出层中的值,作为隐藏域,是从数据库查出来的需要处理
					pLProductInputStr+
					'</td>';
					//项目名称
					product += '<td><input class="myinputall" name="proProjectName" value="'+replaceNull(productList[i].proProjectName)+'" '+productOnly+'/></td>';
					//辅助属性
					product += '<td><input class="myinputall" name="assistAttribute" value="'+replaceNull(productList[i].assistAttribute)+'" '+productOnly+'/></td>';
					
					//单位
					//product += '<td><input type="hidden"  id="productUnit'+i+'" name="productUnit" value="'+replaceNull(productList[i].productUnit)+'" /></td>';

					//单位名
					product += '<td><input type="hidden"  id="productUnit'+i+'" name="productUnit" value="'+replaceNull(productList[i].productUnit)+'" /><input class="myinputall" id="measureunitname'+i+'" name="measureunitname" value="'+replaceNull(productList[i].measureunitname)+'" readonly="readonly"/></td>';
					
					//数量
					product += '<td ><input class="myinputall" id="productCount'+i+'" name="productCount" value="'+replaceNull(productList[i].productCount)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					
					//产品数量合计
					var productCountTemp=Number(productCountShow)+Number(replaceNull(productList[i].productCount));
					//alert("11"+productCountTemp);
					productCountShow= Number( ( productCountTemp ).toFixed(4) );
					
					//辅助单位
					product += '<td ><input class="myinputall" name="assistUnit" value="'+replaceNull(productList[i].assistUnit)+'" '+productOnly+'/></td>';
					//转换率
					product += '<td ><input class="myinputall" name="convertRate" value="'+replaceNull(productList[i].convertRate)+'" '+productOnly+'/></td>';
					//辅助数量
					product += '<td ><input class="myinputall" name="productAssistCount" value="'+replaceNull(productList[i].productAssistCount)+'" '+productOnly+'/></td>';
					//不含税单价
					product += '<td ><input type="hidden"  id="unitRemoveTaxH'+i+'" name="unitRemoveTaxH"  /><input class="myinputall" name="unitRemoveTax" value="'+replaceNull(productList[i].unitRemoveTax)+'" readonly="readonly"/></td>';
					//含税单价
					product += '<td ><input class="myinputall" id="saleprice'+i+'" name="unitPrice" value="'+replaceNull(productList[i].unitPrice)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					//含税单价(本币)
					product += '<td ><input type="hidden"  id="listpricecurrency'+i+'" name="listpricecurrency"  /><input class="myinputall" id="ftaxprice'+i+'" name="ftaxprice" value="'+replaceNull(productList[i].ftaxprice)+'" readonly="readonly"/></td>';
					
					//自动计算含税单价合计
					var unitPriceTemp=Number(unitPriceShow)+Number(replaceNull(productList[i].unitPrice));
					unitPriceShow= Number( ( unitPriceTemp ).toFixed(4) );
					
					/*//begin 新需求增加
					//服务费 servicecharge
					product += '<td><input class="myinputall" id="servicecharge'+i+'" onblur="servicechargeChangeOther('+i+');" name="servicecharge" value="'+replaceNull(productList[i].servicecharge)+'" '+productOnly+'/></td>';
					//列表价 	
					product += '<td><input class="myinputall" id="listprice'+i+'" onblur="listpriceChangeOther('+i+');" name="listprice" value="'+replaceNull(productList[i].listprice)+'" '+productOnly+'/></td>';
					//结算价 	
					product += '<td><input class="myinputall" id="balanceprice'+i+'" name="balanceprice" readonly="readonly"  value="'+replaceNull(productList[i].balanceprice)+'" '+productOnly+'/></td>';
					//end 新需求增加
*/					
					//begin 新需求增加
					//服务费 servicecharge
					if(!('0'==replaceNull(productList[i].servicecharge)+'')){
						product += '<td><input class="myinputall" id="servicecharge'+i+'" onblur="countProductTotalFee();" name="servicecharge" value="'
						+replaceNull(productList[i].servicecharge)+'" '+productOnly+'/></td>';
					}else{
						product += '<td><input class="myinputall" id="servicecharge'+i+'" onblur="countProductTotalFee();" name="servicecharge" value="'
						+''+'" '+productOnly+'/></td>';
					}
					//列表价 	
					if(!('0'==replaceNull(productList[i].listprice)+'')){
						product += '<td><input class="myinputall" id="listprice'+i+'" onblur="countProductTotalFee();" name="listprice" value="'
						+replaceNull(productList[i].listprice)+'" '+productOnly+'/></td>';
					}else{
						product += '<td><input class="myinputall" id="listprice'+i+'" onblur="countProductTotalFee();" name="listprice" value="'
						+''+'" '+productOnly+'/></td>';
					}
					//结算价 
					if(!('0'==replaceNull(productList[i].balanceprice)+'')){
						product += '<td><input class="myinputall" id="balanceprice'+i+'" name="balanceprice" readonly="readonly"  value="'
						+replaceNull(productList[i].balanceprice)+'" '+productOnly+'/></td>';
					}else{
						product += '<td><input class="myinputall" id="balanceprice'+i+'" name="balanceprice" readonly="readonly"  value="'
						+''+'" '+productOnly+'/></td>';
					}
					
					//end 新需求增加
					
					//product += '<td ><input class="myinputall" name="discount" value="'+replaceNull(productList[i].discount)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					//金额
					//销售总价
					product += '<td ><input class="myinputall" name="totalFee" value="'+replaceNull(productList[i].totalFee)+'" readonly="readonly"/></td>';
					//总金额(本位币)
					product += '<td ><input class="myinputall" name="famountfor" value="'+replaceNull(productList[i].famountfor)+'" readonly="readonly"/></td>';
					
					//税率
					product += '<td ><input class="myinputall" name="taxRate" value="'+replaceNull(productList[i].taxRate)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					//折扣率
					product += '<td ><input class="myinputall" id="discountRate'+i+'" name="discountRate" readonly="readonly" value="'
						+replaceNull(productList[i].discountRate)+'" '+' "/></td>';
					//折扣
					//if(!('0'==replaceNull(productList[i].discount)+'')){
					product += '<td ><input class="myinputall" id="discount'+i+'" name="discount" readonly="readonly" value="'
						+replaceNull(productList[i].discount)+'" '
					+' "/></td>';
					//折扣额(本位币)
					product += '<td ><input class="myinputall" id="fbusinessdiscount'+i+'" name="fbusinessdiscount" readonly="readonly" value="'
					+replaceNull(productList[i].fbusinessdiscount)+'" '
				    +' "/><input type="hidden" id="factUnitPrice'+i+'" name="factUnitPrice" value="'+replaceNull(productList[i].factUnitPrice)+'"  /></td>';
//					}else{
//						product += '<td ><input class="myinputall" id="discount'+i+'" name="discount" readonly="readonly" value="'
//						+''+'" '
//					+' "/></td>';
//					}
					//实际含税单价,新需求去掉
					//product += '<td ><input class="myinputall" name="factUnitPrice" readonly="readonly" value="'+replaceNull(productList[i].factUnitPrice)+'" '+productOnly+'/></td>';
					
					//销项税额
					//if(!('0'==replaceNull(productList[i].saleTax)+'')){
						product += '<td ><input class="myinputall" name="saleTax" readonly="readonly" value="'
							+replaceNull(productList[i].saleTax)+'" '+productOnly+'/></td>';
					//销项税额(本位币)
						product += '<td ><input class="myinputall" name="ftax" readonly="readonly" value="'
								+replaceNull(productList[i].ftax)+'" '+productOnly+'/></td>';
//					}else{
//						product += '<td ><input class="myinputall" name="saleTax" readonly="readonly" value="'
//							+''+'" '+productOnly+'/></td>';
//					}
					
					//价税合计
					product += '<td ><input class="myinputall" name="priceTaxTotal" readonly="readonly" value="'+replaceNull(productList[i].priceTaxTotal)+'" '+productOnly+'/></td>';
					//价税合计(本位币)
					product += '<td ><input class="myinputall" name="priceTaxTotalRM" readonly="readonly" value="'+replaceNull(productList[i].priceTaxTotalRM)+'" '+productOnly+'/></td>';
					
					//价税总合计
					var priceTaxTotalTemp=Number(priceTaxTotalShow)+Number(replaceNull(productList[i].priceTaxTotal));
					//alert("11"+priceTaxTotalTemp);
					priceTaxTotalShow= Number( ( priceTaxTotalTemp ).toFixed(2) );
					
					//28交货时间
					product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="deliveryTime" value="'+replaceNull(productList[i].deliveryTime)+'" '+productOnly+'/></td>';
					//29建议交货时间
					product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="adviceDeliveryTime" value="'+replaceNull(productList[i].adviceDeliveryTime)+'" '+productOnly+'/></td>';
					//30质保金率(%)
					product += '<td ><input class="myinputall" name="qualityFeeRate"  onblur="countProductTotalFee();" value="'+replaceNull(productList[i].qualityFeeRate)+'"/></td>';
					//31质保金
					//if(!('0'==replaceNull(productList[i].qualityFee)+'')){
						product += '<td ><input class="myinputall" name="qualityFee"   readonly="readonly" value="'
							+replaceNull(productList[i].qualityFee)+'"/></td>';
//					}else{
//						product += '<td ><input class="myinputall" name="qualityFee"   readonly="readonly" value="'
//							+''+'"/></td>';
//					}
					
					
					//product += '<td ><input class="myinputall" name="baseUnitName" value="'+replaceNull(productList[i].baseUnitName)+'"/></td>';
					//product += '<td ><input class="myinputall" name="baseUnitCount" value="'+replaceNull(productList[i].baseUnitCount)+'"/></td>';
					//32制令号
					product += '<td ><input class="myinputall" name="makeNumberCode" value="'+replaceNull(productList[i].makeNumberCode)+'" '+productOnly+'/></td>';
					//33任务单号
					product += '<td ><input class="myinputall" name="taskCode" value="'+replaceNull(productList[i].taskCode)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="referCount" value="'+replaceNull(productList[i].referCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistUnitReferCount" value="'+replaceNull(productList[i].assistUnitReferCount)+'"/></td>';
					//34辅助单位出库数量
					product += '<td ><input class="myinputall" name="assistUnitOutHouseCount" value="'+replaceNull(productList[i].assistUnitOutHouseCount)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="outHouseCount" value="'+replaceNull(productList[i].outHouseCount)+'"/></td>';
					//35客户BOM
					product += '<td ><input class="myinputall" name="customBOM" value="'+replaceNull(productList[i].customBOM)+'" '+productOnly+'/></td>';
					//36成本对象
					product += '<td ><input class="myinputall" name="costObj" value="'+replaceNull(productList[i].costObj)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="addOrDel" value="'+replaceNull(productList[i].addOrDel)+'"/></td>';
					//product += '<td ><input class="myinputall" name="lockHouseMark" value="'+replaceNull(productList[i].lockHouseMark)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderCode" value="'+replaceNull(productList[i].sourceOrderCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderType" value="'+replaceNull(productList[i].sourceOrderType)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderInnerCode" value="'+replaceNull(productList[i].sourceOrderInnerCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderSplit" value="'+replaceNull(productList[i].sourceOrderSplit)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactCode" value="'+replaceNull(productList[i].contactCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactInnerCode" value="'+replaceNull(productList[i].contactInnerCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactSplit" value="'+replaceNull(productList[i].contactSplit)+'"/></td>';
					//37开票数量
					product += '<td ><input class="myinputall" name="billCount" value="'+replaceNull(productList[i].billCount)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="customOrderCode" value="'+replaceNull(productList[i].customOrderCode)+'"/></td>';
					//38辅助单位开票数量
					product += '<td ><input class="myinputall" name="assistCompanyBillCount" value="'+replaceNull(productList[i].assistCompanyBillCount)+'" '+productOnly+'/></td>';
					//39辅助单位组装数量
					product += '<td ><input class="myinputall" name="assistCompanyFitCount" value="'+replaceNull(productList[i].assistCompanyFitCount)+'" '+productOnly+'/></td>';
					//40基本单位组装数量
					product += '<td ><input class="myinputall" name="baseCompanyFitCount" value="'+replaceNull(productList[i].baseCompanyFitCount)+'" '+productOnly+'/></td>';
					//41组装数量
					product += '<td ><input class="myinputall" name="fitCount" value="'+replaceNull(productList[i].fitCount)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="assistAttributeType" value="'+replaceNull(productList[i].assistAttributeType)+'"/></td>';
					//product += '<td ><input class="myinputall" name="priceTaxTotalRM" value="'+replaceNull(productList[i].priceTaxTotalRM)+'"/></td>';
					//product += '<td ><input class="myinputall" name="markForMRP" value="'+replaceNull(productList[i].markForMRP)+'"/></td>';
					//product += '<td ><input class="myinputall" name="markIsForMRP" value="'+replaceNull(productList[i].markIsForMRP)+'"/></td>';
					//product += '<td ><input class="myinputall" name="collectPayReferFee" value="'+replaceNull(productList[i].collectPayReferFee)+'"/></td>';
					//42备注
					product += '<td ><input class="myinputall" name="remarks" value="'+replaceNull(productList[i].remarks)+'"/></td>';
					product += '</tr>';
				}
				$('#productDetail').append(product);
				
				//显示数量合计
				$('#productCountShowTxt').val(productCountShow+'');
				//显示含税单价合计
				$('#unitPriceShowTxt').val(unitPriceShow+'');
				//alert("unitPriceShow:"+unitPriceShow);
				var unitPriceRMShowTxt= (Number( (  exchangeRate*unitPriceShow ).toFixed(2) )  );
				//alert("unitPriceRMShowTxt:"+unitPriceRMShowTxt);
				//显示含税单价合计(本位币)
				$('#unitPriceRMShowTxt').val(unitPriceRMShowTxt+'');
				
				//显示价税合计合计
				$('#priceTaxTotalShowTxt').val(priceTaxTotalShow+'');
				var priceTaxTotalRMShowTxt= (Number( (  exchangeRate*priceTaxTotalShow ).toFixed(2) )  );
				//显示价税合计合计(本位币)
				$('#priceTaxTotalRMShowTxt').val(priceTaxTotalRMShowTxt+'');
				
				var totalFee = 0;
				var totalFeeRM = 0;
				
				for(var i=0;i<collectPayList.length;i++){
					collectPay += '<tr id="collectpaytr'+collectPayList[i].collectPayId+'">';
					collectPay += '<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delCollectPayTr('+collectPayList[i].collectPayId+',1);"/>'+
								  '<input type="hidden" name="collectPayIdHiddenTD" value="'+collectPayList[i].collectPayId+'"/></td>';
					collectPay += '<td><input class="myinputall" name="planCollectTime" value="'+replaceNull(collectPayList[i].planCollectTime)+'" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>';
					collectPay += '<td><input class="myinputall" name="shouldCollectTime" value="'+replaceNull(collectPayList[i].shouldCollectTime)+'" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>';
					collectPay += '<td><input class="myinputall" name="shouldCollectFee" value="'+replaceNull(collectPayList[i].shouldCollectFee)+'" onblur="countTotalFee();"/></td>';
					
					//collectPay += '<td><input class="myinputall" name="shouldCollectFeeRm" value="'+replaceNull(collectPayList[i].shouldCollectFeeRm)+'" onblur="countTotalFeeRM();"/></td>';
					collectPay += '<td><input class="myinputall" name="shouldCollectFeeRm" readonly="readonly" value="'+replaceNull(collectPayList[i].shouldCollectFeeRm)+'" /></td>';
					
					collectPay += '<td><input class="myinputall" name="collectPayType" value="'+replaceNull(collectPayList[i].collectPayType)+'"/></td>';
					collectPay += '<td><input class="myinputall" name="guaranteeLetterType" value="'+replaceNull(collectPayList[i].guaranteeLetterType)+'"/></td>';
					collectPay += '<td><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="guaranteeLetterStart" value="'+replaceNull(collectPayList[i].guaranteeLetterStart)+'"/></td>';
					collectPay += '<td><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="guaranteeLetterEnd" value="'+replaceNull(collectPayList[i].guaranteeLetterEnd)+'"/></td>';
					collectPay += '</tr>';
					totalFee += collectPayList[i].shouldCollectFee;
					totalFeeRM += collectPayList[i].shouldCollectFeeRm;
				}
				$('#shouldTotal').html(totalFee);
				$('#shouldTotalRM').html(totalFeeRM);
				$('#collectPayDetail').append(collectPay);
				//显示标准订单中的国产PL产品信息 
				if('0'!=replaceNull(sysOrder.pL3000Count)){
				$('#PL3000Count').val(replaceNull(sysOrder.pL3000Count));//国产PL产品
				}
				if('0'!=replaceNull(sysOrder.pL3000Unit)){
					$('#PL3000SalePrice').val(replaceNull(sysOrder.pL3000Unit));
				}
				if('0'!=replaceNull(sysOrder.pL3000ListPrice)){
				$('#PL3000ListPrice').val(replaceNull(sysOrder.pL3000ListPrice));
				}
				if('0'!=replaceNull(sysOrder.pL4200Count)){
				$('#PL4200Count').val(replaceNull(sysOrder.pL4200Count));
				}
				if('0'!=replaceNull(sysOrder.pL4200Unit)){
					$('#PL4200SalePrice').val(replaceNull(sysOrder.pL4200Unit));
					}
					if('0'!=replaceNull(sysOrder.pL4200ListPrice)){
					$('#PL4200ListPrice').val(replaceNull(sysOrder.pL4200ListPrice));
					}
					if('0'!=replaceNull(sysOrder.sSV3500Count)){
				$('#SSV3500Count').val(replaceNull(sysOrder.sSV3500Count));
					}
				if('0'!=replaceNull(sysOrder.sSV3500Unit)){
					$('#SSV3500SalePrice').val(replaceNull(sysOrder.sSV3500Unit));
					}
					if('0'!=replaceNull(sysOrder.sSV3500ListPrice)){
					$('#SSV3500ListPrice').val(replaceNull(sysOrder.sSV3500ListPrice));
					}
					if('0'!=replaceNull(sysOrder.sPL2000Count)){
				$('#SPL2000Count').val(replaceNull(sysOrder.sPL2000Count));
					}
				if('0'!=replaceNull(sysOrder.sPL2000Unit)){
					$('#SPL2000SalePrice').val(replaceNull(sysOrder.sPL2000Unit));
					}
					if('0'!=replaceNull(sysOrder.sPL2000ListPrice)){
					$('#SPL2000ListPrice').val(replaceNull(sysOrder.sPL2000ListPrice));
					}
					
				$('#sysOrderIdHidden').val(id+"");
				//alert("id:"+id);
				//编辑页面显示时显示出合计
				//alert("1");
				//countProductTotalFee();
				//alert("2");	
			}
		});
		
	}
}
function editSysOrderBAK(id){
	if(null!=id&&undefined!=id&&id!=""){
		if($('.productTR').length!=0){
			$('.productTR').remove();
		}
		//$('#sysOrderIdHidden').val(parseInt(id));
		
		$.webAjax({
			type : 'post',
			url : ctx+ '/sysOrder/sys-order!input.htm?id='+id,
			success : function(data) {
				var sysOrder = data.sysOrder;//系统订单
				var productList = data.productList;//系统订单关联的产品列表,通过基本订单的编号
				var collectPayList = data.collectPayList;//系统订单关联的合同信息,通过基本订单的编号
				
				var productplList = data.productplList;//系统订单关联的产品列表的PL产品
				//alert("productplList:"+productplList);
				var product = "";
				var collectPay = "";
				
				$('#orderCode').val(sysOrder.orderCode);//订单编号
				$('#contractCode').val(sysOrder.contractCode);//合同编号 
				if(null!=sysOrder.contractOldCode){
					$('#contractOldCode').val(sysOrder.contractOldCode);//合同旧编号
				}
				$('#contractTime').val(formatDate("yyyy-MM-dd",sysOrder.contractTime));//合同时间 合同签订时间
				
				//$('#contractTime').attr("disabled","disabled");
				$('#contractName').val(sysOrder.contractName);//合同名称
				
				$('#checkProject').val(sysOrder.checkProject);//核算项目
				$('#checkProjectId').val(sysOrder.checkProjectId);//核算项目 id
				$('#contractType').val(sysOrder.contractType);//合同类型
				$('#model').val(sysOrder.model);//模式
				$('#saleType').val(sysOrder.saleType);//销售方式
				$('#customContractCode').val(sysOrder.customContractCode);//客户合同号
				$('#coinType').val(sysOrder.coinType);//币种
				//alert("sysOrder.exchangeRate:"+sysOrder.exchangeRate);
				
				 var opList = document.getElementById('exchangeRate').options;
		            for (var i = 0, len = opList.length; i < len; i++) {
		            	//var opValueTemp =opList[i].value;
		            	var optextTemp =opList[i].text;
		            	//alert("opList[i].text:"+opList[i].text+"optextTemp:"+optextTemp+"");
		            	//var strs= new Array(); //定义一数组 
		            	//strs=optextTemp.split("|");
		            	//alert("strs.length:"+strs.length);
		            	/*if(null!=strs&&2<strs.length){
		            		optextTemp=optextTemp.split("|")[2]; //字符分割
		            		if (optextTemp == (sysOrder.exchangeRate+"")) {
			                    opList[i].selected = true;
			                    break;
			                }
		            	}*/
		            	if (optextTemp == (sysOrder.exchangeRate+"")) {
		                    opList[i].selected = true;
		                    break;
		                }
		                
		            }
		            
				//$('#exchangeRate').val(sysOrder.exchangeRate);//汇率
				$('#bussinessType').val(sysOrder.bussinessType);//业务类型
				$('#systemConsumer').val(sysOrder.systemConsumer);//体系客户
				$('#systemConsumerId').val(sysOrder.systemConsumerId);
				
				$('#finalConsumer').val(sysOrder.finalConsumer);//最终客户
				$('#finalConsumerId').val(sysOrder.finalConsumerId);
				
				$('#contractVersion').val(sysOrder.contractVersion);//合同版本
				$('#changeTime').val(formatDate("yyyy-MM-dd",sysOrder.changeTime));//变更日期(yyyy-MM-dd)
				
				$('#changeReason').val(sysOrder.changeReason);//变更原因
				$('#businessUser').val(sysOrder.businessUser);//业务员
				$('#businessUserId').val(sysOrder.businessUserId);
				
				$('#manager').val(sysOrder.manager);//主管
				$('#managerId').val(sysOrder.managerId);
				
				$('#payCondition').val(sysOrder.payCondition);//付款条件
				$('#department').val(sysOrder.department);//部门
				$('#departmentId').val(sysOrder.departmentId);
				
				$('#warrantyTime').val(sysOrder.warrantyTime);//保质时间
				
				$('#examineTime').val(formatDate("yyyy-MM-dd",sysOrder.examineTime));//审核时间
				$('#examineUserName').val(sysOrder.examineUserName);//审核人姓名
				$('#examineUserId').val(sysOrder.examineUserId);
				
				//$('#changeUserName').val(sysOrder.changeUserName);//变更人名称
				
				$('#disCoefficient').val(sysOrder.disCoefficient);//经销系数
				
				$('#operatorrate').val(sysOrder.operatorrate);//业务费系数
				
				$('#dealerName').val(sysOrder.dealerName);//经销商
				
				$('#remarks').val(sysOrder.remarks);//附注
				
				$('#province').val(sysOrder.province);//省份
				$('#provinceId').val(sysOrder.provinceId);
				
				$('#biddingNoticeShow').val("投标通知单文件");//sysOrder.biddingNotice
				$('#biddingNoticeHidden').val(sysOrder.biddingNotice);//sysOrder.biddingNotice//中标通知单
				
				$('#contractReviewShow').val("合同评审文件");//sysOrder.contractReview
				$('#contractReviewHidden').val(sysOrder.contractReview);//sysOrder.contractReview//合同评审(链接的形式)
				
				$('#contractTxtShow').val("合同文本文件");//sysOrder.contractTxt
				$('#contractTxtHidden').val(sysOrder.contractTxt);//sysOrder.contractTxt//合同内容(链接的形式)
				
				$('#fheadSelfS0156').val(sysOrder.fheadSelfS0156);//是否有合同
				$('#sysOrderStatusHidden').val(sysOrder.sysOrderStatus);//合同状态 0 待提交 1 待审核 2 已生效 3 被驳回 4 关闭
				
				$('#issummary').val(sysOrder.issummary);//是否已汇总
				
				var addProductImg = "";
				var productOnly = "";
				
				if(sysOrder.changeAreaType==1){//可变范围 0非重要 1重要
					$('#orderCode').attr("readonly","readonly");
					$('#contractTime').attr("readonly","readonly");
					$('#contractName').attr("readonly","readonly");
					
					$('#checkProject').attr("readonly","readonly");
					$('#contractCode').attr("readonly","readonly");
					
					$('#bussinessType').attr("disabled","disabled");
					$('#systemConsumer').attr("readonly","readonly");
					$('#finalConsumer').attr("readonly","readonly");
					
					$('#changeTime').attr("readonly","readonly");
					$('#changeReason').attr("readonly","readonly");
					
					$('#changeUserName').attr("readonly","readonly");
					$('#businessUser').attr("readonly","readonly");
					
					$('#systemConsumer').removeAttr("onclick");
					$('#systemConsumer').removeAttr("onkeyup");
					
					$('#checkProject').removeAttr("onclick");
					$('#checkProject').removeAttr("onkeyup");
					
					$('#finalConsumer').removeAttr("onclick");
					$('#finalConsumer').removeAttr("onkeyup");
					
					$('#addProductTD').html("序号");
					
					//国产P类产品价格
					//PL3000Count PL3000SalePrice PL3000ListPrice 
					//PL4200Count PL4200SalePrice PL4200ListPrice
					//SSV3500Count SSV3500SalePrice SSV3500ListPrice
					//SPL2000Count SPL2000SalePrice SPL2000ListPrice
					$('#PL3000Count').attr("readonly","readonly");
					$('#PL3000SalePrice').attr("readonly","readonly");
					$('#PL3000ListPrice').attr("readonly","readonly");
					
					$('#PL4200Count').attr("readonly","readonly");
					$('#PL4200SalePrice').attr("readonly","readonly");
					$('#PL4200ListPrice').attr("readonly","readonly");
					
					$('#SSV3500Count').attr("readonly","readonly");
					$('#SSV3500SalePrice').attr("readonly","readonly");
					$('#SSV3500ListPrice').attr("readonly","readonly");
					
					$('#SPL2000Count').attr("readonly","readonly");
					$('#SPL2000SalePrice').attr("readonly","readonly");
					$('#SPL2000ListPrice').attr("readonly","readonly");
					
				}
				var productCountShow=0;
				var unitPriceShow=0;
				var priceTaxTotalShow=0;
				
				var exchangeRate=$('#sysOrderForm select[id="exchangeRate"] option:selected').val();
				var strs= new Array(); //定义一数组 
				strs=exchangeRate.split("|"); //字符分割
				exchangeRate=parseFloat(strs[0]);
				
				for(var i=0;i<productList.length;i++){
					linenum++;
					
					if(sysOrder.changeAreaType!=1){
						addProductImg = '<img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delProductTr('+productList[i].productId+',1);"/>';
					}else{
						addProductImg = i+1;
						productOnly = "readonly = 'readonly'";//动态判断是否有删除图片
					}
					product += '<tr id="producttr'+productList[i].productId+'">';//产品ID
					product += '<td>'+addProductImg+
							   '<input type="hidden" name="productIdHiddenTD" value="'+productList[i].productId+'"/></td>';//产品id
					/**
					 * 产品代码productCode 	产品名称productName 	对外销售名称outSaleName 	
					 * 项目名称proProjectName 	辅助属性assistAttribute 	
					 * 执行标准excuteStandard 	规格型号specifications 	
						类别productType 	数量productCount 	含税单价unitPrice 	服务费servicecharge		
						列表价listprice		结算价balanceprice 	--折扣discount
						-总金额（元）totalFee 	材质material 	单位productUnit 	税率taxRate
						 	单价(不含税)unitRemoveTax 	交货时间deliveryTime 	建议交货时间adviceDeliveryTime
						折扣率discountRate 	价税合计priceTaxTotal 	质保金qualityFee 	质保金率(%)qualityFeeRate
						 	辅助单位assistUnit 	辅助数量productAssistCount 	换算率convertRate
						实际含税单价factUnitPrice 	销项税额saleTax 	制令号makeNumberCode 	
						任务单号taskCode 	辅助单位出库数量assistUnitOutHouseCount 	客户BOM customBOM
						 	成本对象costObj
						开票数量billCount 	辅助单位开票数量assistCompanyBillCount
						 	辅助单位组装数量assistCompanyFitCount 	订单行号orderTrNumber
						 	基本单位组装数量baseCompanyFitCount 	
						组装数量fitCount 	备注remarks

					 */
					/**
					 * 1行号
					2产品代码
					3产品名称
					4对外销售名称
					5材质
					6执行标准
					7规格型号
					8类别
					9项目名称
					10辅助属性
					11单位名
					12数量
					13辅助单位
					14换算率
					15辅助数量
					16单价(不含税)
					17含税单价
					18服务/工程费单价		
					19列表单价		
					20结算单价
					21总金额（元）
					22税率(%)
					23折扣率(%)
					24折扣
					25实际含税单价
					26销项税额
					27价税合计
					28交货时间
					29建议交货时间
					30质保金率(%)
					31质保金
					32制令号
					33任务单号
					34辅助单位出库数量
					35客户BOM
					36成本对象
					37开票数量
					38辅助单位开票数量
					39辅助单位组装数量
					40基本单位组装数量
					41组装数量
					42备注
					 */
					product += '<td ><input class="myinputall" readonly="readonly" name="orderTrNumber" value="'+replaceNull(productList[i].orderTrNumber)+'" '+' "/></td>';
					
					product += '<td><input class="myinputall" id="productCode'+i+'" name="productCode" value="'+replaceNull(productList[i].productCode).trim()+'" '+productOnly+' onkeyup="toLoadItem('+i+');" onclick="toLoadItem('+i+');"/>';
					product += '<div class="selectProduct" id="selectProductDiv'+i+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProduct'+i+'"></tbody></table></div></td>';
					//产品名
					product += '<td><input class="myinputall" id="productName'+i+'" name="productName" value="'+replaceNull(productList[i].productName)+'" readonly="readonly"/></td>';
					//对外销售名
					product += '<td><input class="myinputall" name="outSaleName" value="'+replaceNull(productList[i].outSaleName)+'" '+productOnly+'/></td>';
					//材质
					//product += '<td><input class="myinputall" id="material'+i+'" name="material" value="'+replaceNull(productList[i].material)+'" readonly="readonly"/></td>';
					//材质名
					product += '<td><input type="hidden" id="material'+i+'" name="material" value="'+replaceNull(productList[i].material)+'"  /><input class="myinputall" id="materialname'+i+'" name="materialname" value="'+replaceNull(productList[i].materialname)+'" readonly="readonly"/></td>';
					//执行标准
					product += '<td><input class="myinputall" id="excuteStandard'+i+'" name="excuteStandard" value="'+replaceNull(productList[i].excuteStandard)+'" readonly="readonly"/></td>';
					//规格型号
					product += '<td><input class="myinputall" id="specifications'+i+'" name="specifications" value="'+replaceNull(productList[i].specifications)+'" readonly="readonly"/></td>';
					//分类
					product += '<td><select class="selectall" name="productType" value="'+productList[i].productType+'">';
					if(productList[i].productType==null||productList[i].productType.trim()=='A'){
						product += '<option value="A" selected="selected">A</option>';
					}else{
						product += '<option value="A">A</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='B'){
						product += '<option value="B" selected="selected">B</option>';
					}else{
						product += '<option value="B">B</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='C'){
						product += '<option value="C" selected="selected">C</option>';
					}else{
						product += '<option value="C">C</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='D'){
						product += '<option value="D" selected="selected">D</option>';
					}else{
						product += '<option value="D">D</option>';
					}
					if(productList[i].productType==null||productList[i].productType.trim()=='E'){
						product += '<option value="E" selected="selected">E</option>';
					}else{
						product += '<option value="E">E</option>';
					}
					product += '</select></td>';
					//PL产品添加按钮
					//遍历PL产品找到对应的父产品
					var orderTrNumber=productList[i].orderTrNumber;
					var pLProductInfo="";
					var arr = new List();
					for(var j=0;j<productplList.length;j++){
						if(productplList[j].productId==productList[i].productId){
							var productpl = new Object();//新建对象
							//alert("3:");
							//alert("productLineNum:"+productLineNum);
							productpl.productLineNum=orderTrNumber;
							//alert("3 a:");
							productpl.fmodel=replaceNull(productplList[j].fmodel);//pL4200规格型号
							productpl.fnum=replaceNull(productplList[j].fnum);//pL4200数量
							productpl.fprice=replaceNull(productplList[j].fprice);//pL4200合同价
							productpl.flistprice=replaceNull(productplList[j].flistprice);//pL4200列表价
							//alert("5:");
							productpl.pl3000fmodel=replaceNull(productplList[j].pl3000fmodel);//pl3000规格型号
							productpl.pl3000fnum=replaceNull(productplList[j].pl3000fnum);//pl3000数量
							productpl.pl3000fprice=replaceNull(productplList[j].pl3000fprice);//pl3000合同价
							productpl.pl3000flistprice=replaceNull(productplList[j].pl3000flistprice);//pl3000列表价
							//alert("6:");
							productpl.ssv3500fmodel=replaceNull(productplList[j].ssv3500fmodel);//sSV3500规格型号
							productpl.ssv3500fnum=replaceNull(productplList[j].ssv3500fnum);//sSV3500数量
							productpl.ssv3500fprice=replaceNull(productplList[j].ssv3500fprice);//sSV3500合同价
							productpl.ssv3500flistprice=replaceNull(productplList[j].ssv3500flistprice);//sSV3500列表价
							//alert("7:");
							productpl.pl2000fmodel=replaceNull(productplList[j].pl2000fmodel);//sPL2000规格型号
							productpl.pl2000fnum=replaceNull(productplList[j].pl2000fnum);//sPL2000数量
							productpl.pl2000fprice=replaceNull(productplList[j].pl2000fprice);//sPL2000合同价
							productpl.pl2000flistprice=replaceNull(productplList[j].pl2000flistprice);//sPL2000列表价
							//alert("8:");
							arr.add(productpl);
						}
					}
					var json = JSON.stringify(arr);
					//var isHavePlProduct=false;
					if(0<json.length&&'{"value":[]}'!=json){
						pLProductInfo=json;
					}
					//alert("pLProductInfo:"+pLProductInfo);
					var plProductTipText='';
					var pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts"  />';
					if(null==pLProductInfo||""==pLProductInfo){
						//当前行
						//plProductTipText='<input class="myinputall" id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'" value="无"  />';
						plProductTipText='<span   id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'"  >无</span>';
					}else{
						//plProductTipText='<input class="myinputall" id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'" value="有"  />';
						plProductTipText='<span   id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'"  >有</span>';
						pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts" value='+pLProductInfo+' />';
					}
					//product += '<td><a href="javascript:openPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');"><img src="'+ctx+'/images/add_small.gif" border="0" /></a>'+
					product += '<td><a href="javascript:openPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');">'+plProductTipText+'</a>'+
					
					//PL弹出层中的值,作为隐藏域,是从数据库查出来的需要处理
					pLProductInputStr+
					'</td>';
					//项目名称
					product += '<td><input class="myinputall" name="proProjectName" value="'+replaceNull(productList[i].proProjectName)+'" '+productOnly+'/></td>';
					//辅助属性
					product += '<td><input class="myinputall" name="assistAttribute" value="'+replaceNull(productList[i].assistAttribute)+'" '+productOnly+'/></td>';
					
					//单位
					//product += '<td><input type="hidden"  id="productUnit'+i+'" name="productUnit" value="'+replaceNull(productList[i].productUnit)+'" /></td>';

					//单位名
					product += '<td><input type="hidden"  id="productUnit'+i+'" name="productUnit" value="'+replaceNull(productList[i].productUnit)+'" /><input class="myinputall" id="measureunitname'+i+'" name="measureunitname" value="'+replaceNull(productList[i].measureunitname)+'" readonly="readonly"/></td>';
					
					//数量
					product += '<td ><input class="myinputall" id="productCount'+i+'" name="productCount" value="'+replaceNull(productList[i].productCount)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					
					//产品数量合计
					var productCountTemp=Number(productCountShow)+Number(replaceNull(productList[i].productCount));
					//alert("11"+productCountTemp);
					productCountShow= Number( ( productCountTemp ).toFixed(4) );
					
					//辅助单位
					product += '<td ><input class="myinputall" name="assistUnit" value="'+replaceNull(productList[i].assistUnit)+'" '+productOnly+'/></td>';
					//转换率
					product += '<td ><input class="myinputall" name="convertRate" value="'+replaceNull(productList[i].convertRate)+'" '+productOnly+'/></td>';
					//辅助数量
					product += '<td ><input class="myinputall" name="productAssistCount" value="'+replaceNull(productList[i].productAssistCount)+'" '+productOnly+'/></td>';
					//不含税单价
					product += '<td ><input type="hidden"  id="unitRemoveTaxH'+i+'" name="unitRemoveTaxH"  /><input class="myinputall" name="unitRemoveTax" value="'+replaceNull(productList[i].unitRemoveTax)+'" readonly="readonly"/></td>';
					//含税单价
					product += '<td ><input class="myinputall" id="saleprice'+i+'" name="unitPrice" value="'+replaceNull(productList[i].unitPrice)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					//含税单价(本币)
					product += '<td ><input type="hidden"  id="listpricecurrency'+i+'" name="listpricecurrency"  /><input class="myinputall" id="ftaxprice'+i+'" name="ftaxprice" value="'+replaceNull(productList[i].ftaxprice)+'" readonly="readonly"/></td>';
					
					//自动计算含税单价合计
					var unitPriceTemp=Number(unitPriceShow)+Number(replaceNull(productList[i].unitPrice));
					unitPriceShow= Number( ( unitPriceTemp ).toFixed(4) );
					
					/*//begin 新需求增加
					//服务费 servicecharge
					product += '<td><input class="myinputall" id="servicecharge'+i+'" onblur="servicechargeChangeOther('+i+');" name="servicecharge" value="'+replaceNull(productList[i].servicecharge)+'" '+productOnly+'/></td>';
					//列表价 	
					product += '<td><input class="myinputall" id="listprice'+i+'" onblur="listpriceChangeOther('+i+');" name="listprice" value="'+replaceNull(productList[i].listprice)+'" '+productOnly+'/></td>';
					//结算价 	
					product += '<td><input class="myinputall" id="balanceprice'+i+'" name="balanceprice" readonly="readonly"  value="'+replaceNull(productList[i].balanceprice)+'" '+productOnly+'/></td>';
					//end 新需求增加
*/					
					//begin 新需求增加
					//服务费 servicecharge
					if(!('0'==replaceNull(productList[i].servicecharge)+'')){
						product += '<td><input class="myinputall" id="servicecharge'+i+'" onblur="countProductTotalFee();" name="servicecharge" value="'
						+replaceNull(productList[i].servicecharge)+'" '+productOnly+'/></td>';
					}else{
						product += '<td><input class="myinputall" id="servicecharge'+i+'" onblur="countProductTotalFee();" name="servicecharge" value="'
						+''+'" '+productOnly+'/></td>';
					}
					//列表价 	
					if(!('0'==replaceNull(productList[i].listprice)+'')){
						product += '<td><input class="myinputall" id="listprice'+i+'" onblur="countProductTotalFee();" name="listprice" value="'
						+replaceNull(productList[i].listprice)+'" '+productOnly+'/></td>';
					}else{
						product += '<td><input class="myinputall" id="listprice'+i+'" onblur="countProductTotalFee();" name="listprice" value="'
						+''+'" '+productOnly+'/></td>';
					}
					//结算价 
					if(!('0'==replaceNull(productList[i].balanceprice)+'')){
						product += '<td><input class="myinputall" id="balanceprice'+i+'" name="balanceprice" readonly="readonly"  value="'
						+replaceNull(productList[i].balanceprice)+'" '+productOnly+'/></td>';
					}else{
						product += '<td><input class="myinputall" id="balanceprice'+i+'" name="balanceprice" readonly="readonly"  value="'
						+''+'" '+productOnly+'/></td>';
					}
					
					//end 新需求增加
					
					//product += '<td ><input class="myinputall" name="discount" value="'+replaceNull(productList[i].discount)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					//金额
					//销售总价
					product += '<td ><input class="myinputall" name="totalFee" value="'+replaceNull(productList[i].totalFee)+'" readonly="readonly"/></td>';
					//总金额(本位币)
					product += '<td ><input class="myinputall" name="famountfor" value="'+replaceNull(productList[i].famountfor)+'" readonly="readonly"/></td>';
					
					//税率
					product += '<td ><input class="myinputall" name="taxRate" value="'+replaceNull(productList[i].taxRate)+'" '+productOnly+' onblur="countProductTotalFee();"/></td>';
					//折扣率
					product += '<td ><input class="myinputall" id="discountRate'+i+'" name="discountRate" readonly="readonly" value="'
						+replaceNull(productList[i].discountRate)+'" '+' "/></td>';
					//折扣
					//if(!('0'==replaceNull(productList[i].discount)+'')){
					product += '<td ><input class="myinputall" id="discount'+i+'" name="discount" readonly="readonly" value="'
						+replaceNull(productList[i].discount)+'" '
					+' "/></td>';
					//折扣额(本位币)
					product += '<td ><input class="myinputall" id="fbusinessdiscount'+i+'" name="fbusinessdiscount" readonly="readonly" value="'
					+replaceNull(productList[i].fbusinessdiscount)+'" '
				    +' "/><input type="hidden" id="factUnitPrice'+i+'" name="factUnitPrice" value="'+replaceNull(productList[i].factUnitPrice)+'"  /></td>';
//					}else{
//						product += '<td ><input class="myinputall" id="discount'+i+'" name="discount" readonly="readonly" value="'
//						+''+'" '
//					+' "/></td>';
//					}
					//实际含税单价,新需求去掉
					//product += '<td ><input class="myinputall" name="factUnitPrice" readonly="readonly" value="'+replaceNull(productList[i].factUnitPrice)+'" '+productOnly+'/></td>';
					
					//销项税额
					//if(!('0'==replaceNull(productList[i].saleTax)+'')){
						product += '<td ><input class="myinputall" name="saleTax" readonly="readonly" value="'
							+replaceNull(productList[i].saleTax)+'" '+productOnly+'/></td>';
					//销项税额(本位币)
						product += '<td ><input class="myinputall" name="ftax" readonly="readonly" value="'
								+replaceNull(productList[i].ftax)+'" '+productOnly+'/></td>';
//					}else{
//						product += '<td ><input class="myinputall" name="saleTax" readonly="readonly" value="'
//							+''+'" '+productOnly+'/></td>';
//					}
					
					//价税合计
					product += '<td ><input class="myinputall" name="priceTaxTotal" readonly="readonly" value="'+replaceNull(productList[i].priceTaxTotal)+'" '+productOnly+'/></td>';
					//价税合计(本位币)
					product += '<td ><input class="myinputall" name="priceTaxTotalRM" readonly="readonly" value="'+replaceNull(productList[i].priceTaxTotalRM)+'" '+productOnly+'/></td>';
					
					//价税总合计
					var priceTaxTotalTemp=Number(priceTaxTotalShow)+Number(replaceNull(productList[i].priceTaxTotal));
					//alert("11"+priceTaxTotalTemp);
					priceTaxTotalShow= Number( ( priceTaxTotalTemp ).toFixed(2) );
					
					//28交货时间
					product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="deliveryTime" value="'+replaceNull(productList[i].deliveryTime)+'" '+productOnly+'/></td>';
					//29建议交货时间
					product += '<td ><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="adviceDeliveryTime" value="'+replaceNull(productList[i].adviceDeliveryTime)+'" '+productOnly+'/></td>';
					//30质保金率(%)
					product += '<td ><input class="myinputall" name="qualityFeeRate"  onblur="countProductTotalFee();" value="'+replaceNull(productList[i].qualityFeeRate)+'"/></td>';
					//31质保金
					//if(!('0'==replaceNull(productList[i].qualityFee)+'')){
						product += '<td ><input class="myinputall" name="qualityFee"   readonly="readonly" value="'
							+replaceNull(productList[i].qualityFee)+'"/></td>';
//					}else{
//						product += '<td ><input class="myinputall" name="qualityFee"   readonly="readonly" value="'
//							+''+'"/></td>';
//					}
					
					
					//product += '<td ><input class="myinputall" name="baseUnitName" value="'+replaceNull(productList[i].baseUnitName)+'"/></td>';
					//product += '<td ><input class="myinputall" name="baseUnitCount" value="'+replaceNull(productList[i].baseUnitCount)+'"/></td>';
					//32制令号
					product += '<td ><input class="myinputall" name="makeNumberCode" value="'+replaceNull(productList[i].makeNumberCode)+'" '+productOnly+'/></td>';
					//33任务单号
					product += '<td ><input class="myinputall" name="taskCode" value="'+replaceNull(productList[i].taskCode)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="referCount" value="'+replaceNull(productList[i].referCount)+'"/></td>';
					//product += '<td ><input class="myinputall" name="assistUnitReferCount" value="'+replaceNull(productList[i].assistUnitReferCount)+'"/></td>';
					//34辅助单位出库数量
					product += '<td ><input class="myinputall" name="assistUnitOutHouseCount" value="'+replaceNull(productList[i].assistUnitOutHouseCount)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="outHouseCount" value="'+replaceNull(productList[i].outHouseCount)+'"/></td>';
					//35客户BOM
					product += '<td ><input class="myinputall" name="customBOM" value="'+replaceNull(productList[i].customBOM)+'" '+productOnly+'/></td>';
					//36成本对象
					product += '<td ><input class="myinputall" name="costObj" value="'+replaceNull(productList[i].costObj)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="addOrDel" value="'+replaceNull(productList[i].addOrDel)+'"/></td>';
					//product += '<td ><input class="myinputall" name="lockHouseMark" value="'+replaceNull(productList[i].lockHouseMark)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderCode" value="'+replaceNull(productList[i].sourceOrderCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderType" value="'+replaceNull(productList[i].sourceOrderType)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderInnerCode" value="'+replaceNull(productList[i].sourceOrderInnerCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="sourceOrderSplit" value="'+replaceNull(productList[i].sourceOrderSplit)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactCode" value="'+replaceNull(productList[i].contactCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactInnerCode" value="'+replaceNull(productList[i].contactInnerCode)+'"/></td>';
					//product += '<td ><input class="myinputall" name="contactSplit" value="'+replaceNull(productList[i].contactSplit)+'"/></td>';
					//37开票数量
					product += '<td ><input class="myinputall" name="billCount" value="'+replaceNull(productList[i].billCount)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="customOrderCode" value="'+replaceNull(productList[i].customOrderCode)+'"/></td>';
					//38辅助单位开票数量
					product += '<td ><input class="myinputall" name="assistCompanyBillCount" value="'+replaceNull(productList[i].assistCompanyBillCount)+'" '+productOnly+'/></td>';
					//39辅助单位组装数量
					product += '<td ><input class="myinputall" name="assistCompanyFitCount" value="'+replaceNull(productList[i].assistCompanyFitCount)+'" '+productOnly+'/></td>';
					//40基本单位组装数量
					product += '<td ><input class="myinputall" name="baseCompanyFitCount" value="'+replaceNull(productList[i].baseCompanyFitCount)+'" '+productOnly+'/></td>';
					//41组装数量
					product += '<td ><input class="myinputall" name="fitCount" value="'+replaceNull(productList[i].fitCount)+'" '+productOnly+'/></td>';
					//product += '<td ><input class="myinputall" name="assistAttributeType" value="'+replaceNull(productList[i].assistAttributeType)+'"/></td>';
					//product += '<td ><input class="myinputall" name="priceTaxTotalRM" value="'+replaceNull(productList[i].priceTaxTotalRM)+'"/></td>';
					//product += '<td ><input class="myinputall" name="markForMRP" value="'+replaceNull(productList[i].markForMRP)+'"/></td>';
					//product += '<td ><input class="myinputall" name="markIsForMRP" value="'+replaceNull(productList[i].markIsForMRP)+'"/></td>';
					//product += '<td ><input class="myinputall" name="collectPayReferFee" value="'+replaceNull(productList[i].collectPayReferFee)+'"/></td>';
					//42备注
					product += '<td ><input class="myinputall" name="remarks" value="'+replaceNull(productList[i].remarks)+'"/></td>';
					product += '</tr>';
				}
				$('#productDetail').append(product);
				
				//显示数量合计
				$('#productCountShowTxt').val(productCountShow+'');
				//显示含税单价合计
				$('#unitPriceShowTxt').val(unitPriceShow+'');
				//alert("unitPriceShow:"+unitPriceShow);
				var unitPriceRMShowTxt= (Number( (  exchangeRate*unitPriceShow ).toFixed(2) )  );
				//alert("unitPriceRMShowTxt:"+unitPriceRMShowTxt);
				//显示含税单价合计(本位币)
				$('#unitPriceRMShowTxt').val(unitPriceRMShowTxt+'');
				
				//显示价税合计合计
				$('#priceTaxTotalShowTxt').val(priceTaxTotalShow+'');
				var priceTaxTotalRMShowTxt= (Number( (  exchangeRate*priceTaxTotalShow ).toFixed(2) )  );
				//显示价税合计合计(本位币)
				$('#priceTaxTotalRMShowTxt').val(priceTaxTotalRMShowTxt+'');
				
				var totalFee = 0;
				var totalFeeRM = 0;
				
				for(var i=0;i<collectPayList.length;i++){
					collectPay += '<tr id="collectpaytr'+collectPayList[i].collectPayId+'">';
					collectPay += '<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;" onclick="delCollectPayTr('+collectPayList[i].collectPayId+',1);"/>'+
								  '<input type="hidden" name="collectPayIdHiddenTD" value="'+collectPayList[i].collectPayId+'"/></td>';
					collectPay += '<td><input class="myinputall" name="planCollectTime" value="'+replaceNull(collectPayList[i].planCollectTime)+'" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>';
					collectPay += '<td><input class="myinputall" name="shouldCollectTime" value="'+replaceNull(collectPayList[i].shouldCollectTime)+'" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>';
					collectPay += '<td><input class="myinputall" name="shouldCollectFee" value="'+replaceNull(collectPayList[i].shouldCollectFee)+'" onblur="countTotalFee();"/></td>';
					
					//collectPay += '<td><input class="myinputall" name="shouldCollectFeeRm" value="'+replaceNull(collectPayList[i].shouldCollectFeeRm)+'" onblur="countTotalFeeRM();"/></td>';
					collectPay += '<td><input class="myinputall" name="shouldCollectFeeRm" readonly="readonly" value="'+replaceNull(collectPayList[i].shouldCollectFeeRm)+'" /></td>';
					
					collectPay += '<td><input class="myinputall" name="collectPayType" value="'+replaceNull(collectPayList[i].collectPayType)+'"/></td>';
					collectPay += '<td><input class="myinputall" name="guaranteeLetterType" value="'+replaceNull(collectPayList[i].guaranteeLetterType)+'"/></td>';
					collectPay += '<td><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="guaranteeLetterStart" value="'+replaceNull(collectPayList[i].guaranteeLetterStart)+'"/></td>';
					collectPay += '<td><input class="myinputall" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" name="guaranteeLetterEnd" value="'+replaceNull(collectPayList[i].guaranteeLetterEnd)+'"/></td>';
					collectPay += '</tr>';
					totalFee += collectPayList[i].shouldCollectFee;
					totalFeeRM += collectPayList[i].shouldCollectFeeRm;
				}
				$('#shouldTotal').html(totalFee);
				$('#shouldTotalRM').html(totalFeeRM);
				$('#collectPayDetail').append(collectPay);
				//显示标准订单中的国产PL产品信息 
				if('0'!=replaceNull(sysOrder.pL3000Count)){
				$('#PL3000Count').val(replaceNull(sysOrder.pL3000Count));//国产PL产品
				}
				if('0'!=replaceNull(sysOrder.pL3000Unit)){
					$('#PL3000SalePrice').val(replaceNull(sysOrder.pL3000Unit));
				}
				if('0'!=replaceNull(sysOrder.pL3000ListPrice)){
				$('#PL3000ListPrice').val(replaceNull(sysOrder.pL3000ListPrice));
				}
				if('0'!=replaceNull(sysOrder.pL4200Count)){
				$('#PL4200Count').val(replaceNull(sysOrder.pL4200Count));
				}
				if('0'!=replaceNull(sysOrder.pL4200Unit)){
					$('#PL4200SalePrice').val(replaceNull(sysOrder.pL4200Unit));
					}
					if('0'!=replaceNull(sysOrder.pL4200ListPrice)){
					$('#PL4200ListPrice').val(replaceNull(sysOrder.pL4200ListPrice));
					}
					if('0'!=replaceNull(sysOrder.sSV3500Count)){
				$('#SSV3500Count').val(replaceNull(sysOrder.sSV3500Count));
					}
				if('0'!=replaceNull(sysOrder.sSV3500Unit)){
					$('#SSV3500SalePrice').val(replaceNull(sysOrder.sSV3500Unit));
					}
					if('0'!=replaceNull(sysOrder.sSV3500ListPrice)){
					$('#SSV3500ListPrice').val(replaceNull(sysOrder.sSV3500ListPrice));
					}
					if('0'!=replaceNull(sysOrder.sPL2000Count)){
				$('#SPL2000Count').val(replaceNull(sysOrder.sPL2000Count));
					}
				if('0'!=replaceNull(sysOrder.sPL2000Unit)){
					$('#SPL2000SalePrice').val(replaceNull(sysOrder.sPL2000Unit));
					}
					if('0'!=replaceNull(sysOrder.sPL2000ListPrice)){
					$('#SPL2000ListPrice').val(replaceNull(sysOrder.sPL2000ListPrice));
					}
					
				$('#sysOrderIdHidden').val(id+"");
				//alert("id:"+id);
				//编辑页面显示时显示出合计
				//alert("1");
				//countProductTotalFee();
				//alert("2");	
			}
		});
		
	}
}
/**
 * 显示合计信息
 */
function  countProductTotalInfo(){
	
}
/**
 * 系统订单产品弹出PL产品,输入值后自动计算其它值
 */
function  countProductPLTotalFee(){
	var productPLCountObj = $('input[name="pL4200Counts"]');//数量 改变触发计算
	var fpriceObj = $('input[name="pL4200Units"]');//fprice合同价  改变触发计算
	var productPLCount;//产品数量
	var productPLCountShow=0;//产品数量合计
	var fprice;//合同价
	var fpriceShow=0;//合同价合计
	
	//PL3000
	var pL3000CountObj = $('input[name="pL3000Counts"]');//数量 改变触发计算
	var pL3000UnitObj = $('input[name="pL3000Units"]');//fprice合同价  改变触发计算
	var pL3000Count;//产品数量
	var pL3000CountShow=0;//产品数量合计
	var pL3000Unit;//合同价
	var pL3000UnitShow=0;//合同价合计
	
	//sSV3500
	var sSV3500CountObj = $('input[name="sSV3500Counts"]');//数量 改变触发计算
	var sSV3500UnitObj = $('input[name="sSV3500Units"]');//fprice合同价  改变触发计算
	var sSV3500Count;//产品数量
	var sSV3500CountShow=0;//产品数量合计
	var sSV3500Unit;//合同价
	var sSV3500UnitShow=0;//合同价合计
	
	//sPL2000
	var sPL2000CountObj = $('input[name="sPL2000Counts"]');//数量 改变触发计算
	var sPL2000UnitObj = $('input[name="sPL2000Units"]');//fprice合同价  改变触发计算
	var sPL2000Count;//产品数量
	var sPL2000CountShow=0;//产品数量合计
	var sPL2000Unit;//合同价
	var sPL2000UnitShow=0;//合同价合计
	
	
	
	for(var i=0;i<productPLCountObj.length;i++){//遍历产品列表的每行    数量不为空
		
		//("2221");
	    // alert("数量2221"+productCountObj.eq(i).val());	
		//数量
		if ($.trim(productPLCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		//合同价
		if( $.trim(fpriceObj.eq(i).val())!="" ){
			if ($.trim(fpriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("合同单价是非负数字!");
				return false;
			}
		}
		//pL3000 
		if ($.trim(pL3000CountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		//合同价
		if( $.trim(pL3000UnitObj.eq(i).val())!="" ){
			if ($.trim(pL3000UnitObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("合同单价是非负数字!");
				return false;
			}
		}
		//sSV3500
		if ($.trim(sSV3500CountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		//合同价
		if( $.trim(sSV3500UnitObj.eq(i).val())!="" ){
			if ($.trim(sSV3500UnitObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("合同单价是非负数字!");
				return false;
			}
		}
		//sPL2000
		if ($.trim(sPL2000CountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		//合同价
		if( $.trim(sPL2000UnitObj.eq(i).val())!="" ){
			if ($.trim(sPL2000UnitObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("合同单价是非负数字!");
				return false;
			}
		}
		
		//先得到当前行的PL产品数量
		productPLCount = productPLCountObj.eq(i).val();//当前行的产品数量
		if(productPLCount==""){
			productPLCount = 0;
		}
		//PL产品数量合计
		var productPLCountTemp=Number(productPLCountShow)+Number(productPLCount);
		//alert("11"+productCountTemp);
		productPLCountShow= Number( ( productPLCountTemp ).toFixed(4) );
		
		//先得到当前行的PL产品合同价
		fprice = fpriceObj.eq(i).val();//当前行的PL产品合同价
		if(fprice==""){
			fprice = 0;
		}
		//PL产品合同价合计
		var fpriceTemp=Number(fpriceShow)+Number(fprice);
		//alert("11"+productCountTemp);
		fpriceShow= Number( ( fpriceTemp ).toFixed(4) );
		
		
		//PL3000
		//先得到当前行的PL产品数量
		pL3000Count = pL3000CountObj.eq(i).val();//当前行的产品数量
		if(pL3000Count==""){
			pL3000Count = 0;
		}
		//PL产品数量合计
		var pL3000CountTemp=Number(pL3000CountShow)+Number(pL3000Count);
		pL3000CountShow= Number( ( pL3000CountTemp ).toFixed(4) );
		
		//先得到当前行的PL产品合同价
		pL3000Unit = pL3000UnitObj.eq(i).val();//当前行的PL产品合同价
		if(pL3000Unit==""){
			pL3000Unit = 0;
		}
		//PL产品合同价合计
		var pL3000UnitTemp=Number(pL3000UnitShow)+Number(pL3000Unit);
		pL3000UnitShow= Number( ( pL3000UnitTemp ).toFixed(4) );
		
		//sSV3500
		//先得到当前行的PL产品数量
		sSV3500Count = sSV3500CountObj.eq(i).val();//当前行的产品数量
		if(sSV3500Count==""){
			sSV3500Count = 0;
		}
		//PL产品数量合计
		var sSV3500CountTemp=Number(sSV3500CountShow)+Number(sSV3500Count);
		sSV3500CountShow= Number( ( sSV3500CountTemp ).toFixed(4) );
		
		//先得到当前行的PL产品合同价
		sSV3500Unit = sSV3500UnitObj.eq(i).val();//当前行的PL产品合同价
		if(sSV3500Unit==""){
			sSV3500Unit = 0;
		}
		//PL产品合同价合计
		var sSV3500UnitTemp=Number(sSV3500UnitShow)+Number(sSV3500Unit);
		sSV3500UnitShow= Number( ( sSV3500UnitTemp ).toFixed(4) );
		
		//sPL2000
		//先得到当前行的PL产品数量
		sPL2000Count = sPL2000CountObj.eq(i).val();//当前行的产品数量
		if(sPL2000Count==""){
			sPL2000Count = 0;
		}
		//PL产品数量合计
		var sPL2000CountTemp=Number(sPL2000CountShow)+Number(sPL2000Count);
		sPL2000CountShow= Number( ( sPL2000CountTemp ).toFixed(4) );
		
		//先得到当前行的PL产品合同价
		sPL2000Unit = sPL2000UnitObj.eq(i).val();//当前行的PL产品合同价
		if(sPL2000Unit==""){
			sPL2000Unit = 0;
		}
		//PL产品合同价合计
		var sPL2000UnitTemp=Number(sPL2000UnitShow)+Number(sPL2000Unit);
		sPL2000UnitShow= Number( ( sPL2000UnitTemp ).toFixed(4) );
		
		
	}
	//显示数量合计
	$('#productPLCountShowTxt').val(productPLCountShow+'');
	//显示PL产品合同价合计
	$('#fpriceShowTxt').val(fpriceShow+'');
	
	//pL3000显示数量合计
	$('#pL3000CountShowTxt').val(pL3000CountShow+'');
	//显示PL产品合同价合计
	$('#pL3000UnitShowTxt').val(pL3000UnitShow+'');
	
	//sSV3500显示数量合计
	$('#sSV3500CountShowTxt').val(sSV3500CountShow+'');
	//显示PL产品合同价合计
	$('#sSV3500UnitShowTxt').val(sSV3500UnitShow+'');
	
	//sPL2000显示数量合计
	$('#sPL2000CountShowTxt').val(sPL2000CountShow+'');
	//显示PL产品合同价合计
	$('#sPL2000UnitShowTxt').val(sPL2000UnitShow+'');
	
}
/**
 * 系统订单关联产品输入值后自动计算其它值
 */
function  countProductTotalFee(){
	//alert("0");
	var productCountObj = $('input[name="productCount"]');//数量 改变触发计算
	var unitPriceObj = $('input[name="unitPrice"]');//含税单价  改变触发计算
	var convertRateObj = $('input[name="convertRate"]');
	var productAssistCountObj = $('input[name="productAssistCount"]');
	var discountObj = $('input[name="discount"]');//折扣  改变触发计算
	var discountRateObj = $('input[name="discountRate"]');//折扣率  改变触发计算
	var totalFeeObj = $('input[name="totalFee"]');//总金额 自动计算
	var taxRateObj = $('input[name="taxRate"]');// 税率 改变触发计算
	var unitRemoveTaxObj = $('input[name="unitRemoveTax"]');
	var productTotalFee = 0;
	var discount;
	var taxRate;
	
	var unitRemoveTaxObj = $('input[name="unitRemoveTax"]');//不含税单价,自动计算  
	var unitRemoveTax;//不含税单价
	    
	var unitRemoveTaxHObj = $('input[name="unitRemoveTaxH"]');//不含税单价ERP,自动计算  
	var unitRemoveTaxH;//不含税单价ERP
	
	var unitPrice;//含税单价
	var productCount;//产品数量
	var discountRate;//折扣率
	
	var factUnitPriceObj = $('input[name="factUnitPrice"]');//实际含税单价,自动计算  
	var factUnitPrice;//实际含税单价
	
	var saleTaxObj = $('input[name="saleTax"]');//销项税额,自动计算  
	var saleTax;//销项税额
	
	var priceTaxTotalObj = $('input[name="priceTaxTotal"]');//价税合计,自动计算  
	var priceTaxTotal;//价税合计
	
	var qualityFeeRateObj = $('input[name="qualityFeeRate"]');//质保金率(%), 
	var qualityFeeRate;//质保金率(%)
	
	var qualityFeeObj = $('input[name="qualityFee"]');//质保金 ,自动计算  
	var qualityFee;//质保金 
	
	var servicechargeObj = $('input[name="servicecharge"]');//服务费 ,自动计算  
	var servicecharge;//服务费
	var listpriceObj = $('input[name="listprice"]');//列表价 ,自动计算  
	var listprice;//列表价
	var balancepriceObj = $('input[name="balanceprice"]');//结算价 ,自动计算  
	var balanceprice;//结算价
	var priceTaxTotalRMObj = $('input[name="priceTaxTotalRM"]');//价税合计(本位币)	priceTaxTotalRM
	var priceTaxTotalRM;//价税合计(本位币)
	//折扣额(本位币)	fbusinessdiscount
	var fbusinessdiscountObj = $('input[name="fbusinessdiscount"]'); 
	var fbusinessdiscount; 
	//税额(本币)	ftax	decimal(20,10)
	var ftaxObj = $('input[name="ftax"]'); 
	var ftax; 
	//金额(本币)	famountfor
	var famountforObj = $('input[name="famountfor"]'); 
	var famountfor; 
	
	//含税单价(本币)	ftaxprice
	var ftaxpriceObj = $('input[name="ftaxprice"]'); 
	var ftaxprice;
	
	var listpricecurrencyObj = $('input[name="listpricecurrency"]'); 
	var listpricecurrency;
	
	//获取选择的税率
	var exchangeRate=$('#sysOrderForm select[id="exchangeRate"] option:selected').val();
	var strs= new Array(); //定义一数组 
	strs=exchangeRate.split("|"); //字符分割
	exchangeRate=parseFloat(strs[0]);
	
	var unitPriceShow=0;//含税单价合计
	var productCountShow=0;//产品数量合计
	var priceTaxTotalShow=0;//价税总合计
	for(var i=0;i<productCountObj.length;i++){//遍历产品列表的每行    数量不为空
		
		//("2221");
	    // alert("数量2221"+productCountObj.eq(i).val());	
		//判断产品中的金额等
		if ($.trim(productCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		 //alert("换算率2221");	
		//换算率
		if( $.trim(convertRateObj.eq(i).val())!="" ){
			if ($.trim(convertRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("换算率是非负数字!");
				return false;
			}
		}
		 //alert("辅助数量2221");	
		//辅助数量
		if( $.trim(productAssistCountObj.eq(i).val())!="" ){
			if ($.trim(productAssistCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("辅助数量是非负数字!");
				return false;
			}
		}
		// alert("服务/工程费单价2221");	
		//服务/工程费单价
		if( $.trim(servicechargeObj.eq(i).val())!="" ){
			if ($.trim(servicechargeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("服务/工程费单价是非负数字!");
				return false;
			}
		}
		//alert("列表单价2221");	
		//列表单价
		if( $.trim(listpriceObj.eq(i).val())!="" ){
			if ($.trim(listpriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("列表单价是非负数字!");
				return false;
			}
		}
		//("税率2221");	
		//税率(%)
		if( $.trim(taxRateObj.eq(i).val())!="" ){
			if ($.trim(taxRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("税率是非负数字!");
				return false;
			}
			if ( Number(taxRateObj.eq(i).val()) >100||Number(taxRateObj.eq(i).val()) <0) {
				alert("税率值不应大于100或小于0!");
				return false;
			}
		}
		//alert("质保金率2221");	
		//质保金率(%)
		if( $.trim(qualityFeeRateObj.eq(i).val())!="" ){
			if ($.trim(qualityFeeRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("质保金率是非负数字!");
				return false;
			}
			if ( Number(qualityFeeRateObj.eq(i).val()) >100||Number(qualityFeeRateObj.eq(i).val()) <0) {
				alert("质保金率值不应大于100或小于0!");
				return false;
			}
		}
		
		//alert("含税单价2221");	
		//单价(不含税)
		if( $.trim(unitPriceObj.eq(i).val())!="" ){
			if ($.trim(unitPriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("含税单价是非负数字!");
				//return false;
			}
		}
		//alert("单价(不含税)2221");	
		//单价(不含税)
		if( $.trim(unitRemoveTaxObj.eq(i).val())!="" ){
			if ($.trim(unitRemoveTaxObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("单价(不含税)是非负数字!");
				return false;
			}
		}
		//alert("结算单价2221");	
		//结算单价
		if( $.trim(balancepriceObj.eq(i).val())!="" ){
			if ($.trim(balancepriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("结算单价是非负数字!");
				//return false;
			}
		}
		//alert("结算-单价2221");	
		//结算单价
		if( $.trim(balancepriceObj.eq(i).val())!="" ){
			if ($.trim(balancepriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("结算单价是非负数字!");
				//return false;
			}
		}
		//alert("总金额2221");	
		//总金额
		if( $.trim(totalFeeObj.eq(i).val())!="" ){
			if ($.trim(totalFeeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("总金额是非负数字!");
				//return false;
			}
		}
		//alert("折扣率2221");	
		//折扣率(%)
		if( $.trim(discountRateObj.eq(i).val())!="" ){
			if ($.trim(discountRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("折扣率是非负数字!");
				//return false;
			}
//			if ( Number(discountRateObj.eq(i).val()) >100||Number(discountRateObj.eq(i).val()) <0) {
//				alert("折扣率值不应大于100或小于0!");
//				return false;
//			}
		}
		//alert("折扣2221");	
		//折扣
		if( $.trim(discountObj.eq(i).val())!="" ){
			if ($.trim(discountObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("折扣是非负数字!");
				//return false;
			}
		}
		//alert("实际含税单价2221");	
		//实际含税单价
		if( $.trim(factUnitPriceObj.eq(i).val())!="" ){
			if ($.trim(factUnitPriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("实际含税单价是非负数字!");
				//return false;
			}
		}
		//alert("销项税额2221");	
		//销项税额
		if( $.trim(saleTaxObj.eq(i).val())!="" ){
			if ($.trim(saleTaxObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("销项税额是非负数字!");
				//return false;
			}
		}
		//alert("价税合计2221");	
		//价税合计
		if( $.trim(priceTaxTotalObj.eq(i).val())!="" ){
			if ($.trim(priceTaxTotalObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("价税合计是非负数字!");
				//return false;
			}
		}
		//alert("质保金2221");	
		//质保金
		if( $.trim(qualityFeeObj.eq(i).val())!="" ){
			if ($.trim(qualityFeeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("质保金是非负数字!");
				//return false;
			}
		}
		
		/**discount = discountObj.eq(i).val();//当前行的折扣
		if(discount==""){
			discount = 1;//如果为空就置为1
		}**/
		//先得到当前行的含税单价
		unitPrice = unitPriceObj.eq(i).val();//当前行的含税单价
		if(unitPrice==""){
			unitPrice = 0;
		}
		//计算  含税单价(本位币)=含税单价*汇率   |     金额(本位币)= 金额*汇率
		ftaxprice=Number( (unitPrice*exchangeRate).toFixed(2) );
		ftaxpriceObj.eq(i).val(ftaxprice);
		
		//自动计算含税单价合计
		//alert("11");
		//unitPriceShow=Number( (   unitPriceShow + unitPrice    ) .toFixed(4) );
		var unitPriceTemp=Number(unitPriceShow)+Number(unitPrice);
		//alert("11"+unitPriceTemp);
		unitPriceShow= Number( ( unitPriceTemp ).toFixed(4) );
		//alert("unitPriceShow:"+unitPriceShow);
		
		//alert("当前行的含税单价:"+unitPrice);
		
		//当前行的服务费
		servicecharge = servicechargeObj.eq(i).val();//当前行      服务费    的折扣率
		if(servicecharge==""){
			servicecharge = 0;//如果为空就置为1
		}
		//计算 结算价= (销售价=含税单价 -服务费 )
		balanceprice	=Number( (   unitPrice - servicecharge    ) .toFixed(2) );
		balancepriceObj.eq(i).val(balanceprice);
		
		
		//折扣率=结算价/列表价 不让编辑
		discountRate = discountRateObj.eq(i).val();//当前行的折扣率
		if(discountRate==""){
			discountRate = 100;//如果为空就置为1
		}
		//当前行的列表价
		listprice = listpriceObj.eq(i).val();//当前行的列表价  
		//alert("listprice:"+listprice);
		if(listprice==""||null==listprice){
			 //不修改折扣率
			//alert("balanceprice:"+balanceprice);
			//if(0==balanceprice){//结算价不为空
				discountRate=Number( 0 );//折扣率为0
				//alert("discountRate:"+discountRate);
				listprice=Number( 0 );
			//}
		}else{
			if(balanceprice==listprice){
				discountRate=Number( 0 );//折扣率为0
			}else{
				//折扣率=结算价/列表价
				discountRate=Number( (   balanceprice / listprice *100   ) .toFixed(6) );//小数有2位改为为6位
				//discountRate=Number( ( 100-  balanceprice / listprice *100   ) .toFixed(2) );
			}
		}
		//列表价本位币->ERP含税单价用
		listpricecurrency=Number( (listprice*exchangeRate).toFixed(2) );
		listpricecurrencyObj.eq(i).val(listpricecurrency);
		
		//productTotalFee = Number(productCountObj.eq(i).val())*Number(unitPriceObj.eq(i).val())*Number(discount);
		
		taxRate = taxRateObj.eq(i).val();//当前行的税率
		if(taxRate==""){
			//taxRate = 100;//如果为空就置为1
			taxRate = 17;//如果为空就置为17%与ERP中默认的一致
		}
		///alert("当前行的税率:"+taxRate );
		//计算不含税单价 不含税单价=含税单价(列表价)/(1+税率*0.01)
		unitRemoveTax = unitRemoveTaxObj.eq(i).val();//当前行的折扣
		unitRemoveTaxH = unitRemoveTaxHObj.eq(i).val();
		
		if("100"==taxRate){
			//unitRemoveTax=unitPrice;
			unitRemoveTaxH=Number( ( listprice/(2) ).toFixed(4) );
			
			unitRemoveTax=Number( ( unitPrice/(2) ).toFixed(4) );//WEB端
		}else{
			var temptaxRate=Number(taxRate*0.01)+Number(1);
			unitRemoveTaxH= Number( ( listprice/(temptaxRate) ).toFixed(4) );
			
			var temptaxRate=Number(taxRate*0.01)+Number(1);
			unitRemoveTax= Number( ( unitPrice/(temptaxRate) ).toFixed(4) );
		}
		//alert("unitRemoveTax:"+unitRemoveTax);
		//alert("unitRemoveTaxH:"+unitRemoveTaxH);
		//alert("当前行的不含税单价:"+unitRemoveTax);
		
		//先得到当前行的产品数量
		productCount = productCountObj.eq(i).val();//当前行的产品数量
		if(productCount==""){
			productCount = 0;
		}
		//产品数量合计
		var productCountTemp=Number(productCountShow)+Number(productCount);
		//alert("11"+productCountTemp);
		productCountShow= Number( ( productCountTemp ).toFixed(4) );
		//alert("productCountShow:"+productCountShow);
		
		//产品数量*不含税单价*
		//总金额=数量*不含税单价 * (WEB端折扣率*0.01)
		//productTotalFee = Number( productCountObj.eq(i).val() ) * Number( unitPriceObj.eq(i).val()) ;
		if("100"==discountRate){
			//productTotalFee = Number( ( productCount*unitRemoveTax  ).toFixed(2) );
			productTotalFee = Number( 0 );
		}
		else if("0"==discountRate){
			productTotalFee = Number( ( productCount*unitRemoveTaxH * (1)).toFixed(2) );
		}
		else{
			//productTotalFee = Number( ( productCount*unitRemoveTax * (1-discountRate*0.01)).toFixed(2) );
			productTotalFee = Number( ( productCount*unitRemoveTaxH * (discountRate*0.01)).toFixed(2) );
		}
		
		//alert("当前行的总金额:"+productTotalFee);
		
		//将计算的值设置到金额列
		totalFeeObj.eq(i).val(  productTotalFee  );//保留两位小数
		//totalFeeObj.eq(i).val( Math.round( productTotalFee*1000 )/ 1000 );//保留两位小数
		
		//计算  金额(本位币)= 金额*汇率
		famountfor=Number( (productTotalFee*exchangeRate).toFixed(2) );
		famountforObj.eq(i).val(famountfor);
		
		//显示自动计算的不含税单价
		unitRemoveTaxObj.eq(i).val(unitRemoveTax);
		unitRemoveTaxHObj.eq(i).val(unitRemoveTaxH);
		//显示税率
		taxRateObj.eq(i).val(taxRate);
		//显示折扣率
		discountRateObj.eq(i).val(discountRate);
		//计算折扣额并显示
		//折扣额=数量*含税单价(列表价)* (1-WEB端折扣率*0.01)
		//alert("discountRate:"+discountRate);
		if("100"==discountRate){
			//discount=Number( (productCount*unitPrice* (1-discountRate*0.01) ) .toFixed(2) );
			discount=Number( (productCount*listprice* (1) ) .toFixed(2) );
			//alert("discount:"+discount);
			discountObj.eq(i).val(discount);
		}else if("0"==discountRate) {
				//discount=Number( (productCount*unitPrice* (1-discountRate*0.01) ) .toFixed(2) );
			discount=Number( 0 );
			//alert("discount:"+discount);
			discountObj.eq(i).val(discount);
		}
		else{
			//discount=Number( (productCount*unitPrice* discountRate*0.01) .toFixed(2) );
			discount=Number( (productCount*listprice* (100-discountRate)*0.01) .toFixed(2) );
			//alert("discount:"+discount);
			discountObj.eq(i).val(discount);
		}
		//计算 折扣额(本位币)= 折扣额*汇率
		fbusinessdiscount=Number( (discount*exchangeRate).toFixed(2) );
		fbusinessdiscountObj.eq(i).val(fbusinessdiscount);
		
		//alert("当前行的折扣额:"+discount);
		
		//计算实际含税单价=WEB端含税单价
		//实际含税单价=含税单价(列表价)*(WEB端折扣率)/
		/*//计算实际含税单价=含税单价*(1-折扣率)
		if("100"==discountRate){
			//factUnitPrice=Number( ( unitPrice * (1-0) ) .toFixed(4) );
			factUnitPrice=Number( ( unitPrice * (0) ) .toFixed(4) );
			factUnitPriceObj.eq(i).val(factUnitPrice);
		}
		else if("0"==discountRate){
			factUnitPrice=Number( ( unitPrice * (1) ) .toFixed(4) );
			factUnitPriceObj.eq(i).val(factUnitPrice);
		}
		else{
			//factUnitPrice=Number( ( unitPrice * (1-discountRate*0.01) ) .toFixed(4) );
			factUnitPrice=Number( ( unitPrice * (discountRate*0.01) ) .toFixed(4) );
			factUnitPriceObj.eq(i).val(factUnitPrice);
		}
		//alert("实际含税单价:"+discount);
		*/	//计算实际含税单价=WEB端含税单价
		//alert("---计算实际含税单价=WEB端含税单价");
		factUnitPrice=Number( ( unitPrice * (1) ) .toFixed(4) );
		factUnitPriceObj.eq(i).val(factUnitPrice);
		//factUnitPrice=Number( ( unitPrice  ) .toFixed(4) );
		//factUnitPriceObj.eq(i).val(factUnitPrice);
		//alert("---end计算实际含税单价=WEB端含税单价");
		//计算销项税额并显示= (含税总金额-不含税总金额)*(1-折扣率)
		//销项税额= (含税总金额-不含税总金额)*( WEB端折扣率)
		if("100"==discountRate){
			//var unitPriceCountValue=Number(unitPrice*productCount);
			//var unitRemoveTaxCountValue=Number(unitRemoveTax*productCount);
			//alert("含税金额:tempValue:"+unitPriceCountValue);
			//alert("不含税金额:"+unitRemoveTaxCountValue);
			//saleTax	=Number( ( ( unitPriceCountValue-unitRemoveTaxCountValue ) ) .toFixed(2) );
			saleTax	=Number(0);
			saleTaxObj.eq(i).val(saleTax);
			//alert("1");
		}
		else if("0"==discountRate){
			var unitPriceCountValue=Number(listprice*productCount);
			
			var unitRemoveTaxCountValue=Number(unitRemoveTaxH*productCount);
			var tempdiscountRateValue=Number(1);
			saleTax	=Number( ( ( unitPriceCountValue-unitRemoveTaxCountValue ) * (tempdiscountRateValue) ) .toFixed(2) );
			saleTaxObj.eq(i).val(saleTax);
			//alert("2");
		}
		else{
			//alert("3");
			var unitPriceCountValue=Number(listprice*productCount);
			
			var unitRemoveTaxCountValue=Number(unitRemoveTaxH*productCount);
			//alert("含税金额:tempValue:"+unitPriceCountValue);
			//alert("不含税金额:"+unitRemoveTaxCountValue);
			//var tempdiscountRateValue=Number(1)-Number(discountRate*0.01);
			var tempdiscountRateValue=Number(discountRate*0.01);
			//alert("折扣率:"+tempdiscountRateValue);
			//销项税额=(列表总价(含税)-列表总价(不含税))*折扣率
			saleTax	=Number( ( ( unitPriceCountValue-unitRemoveTaxCountValue ) * (tempdiscountRateValue) ) .toFixed(2) );
			saleTaxObj.eq(i).val(saleTax);
		}
		//alert("销项税额:"+saleTax);
		
		//计算 销项税额(本位币)= 销项税额*汇率
		ftax=Number( (saleTax*exchangeRate).toFixed(2) );
		ftaxObj.eq(i).val(ftax);
		
		//计算 价税合计= 数量*实际含税单价
		//价税合计= 数量*实际含税单价=数量*含税单价(列表价)*(WEB端折扣率)=数量*WEB端含税单价
		priceTaxTotal=Number( (productCount*unitPrice).toFixed(2) );
		priceTaxTotalObj.eq(i).val(priceTaxTotal);
		//计算 价税合计(本位币)= 价税合计*汇率
		priceTaxTotalRM=Number( (priceTaxTotal*exchangeRate).toFixed(2) );
		priceTaxTotalRMObj.eq(i).val(priceTaxTotalRM);
		
		//价税总合计
		var priceTaxTotalTemp=Number(priceTaxTotalShow)+Number(priceTaxTotal);
		//alert("11"+priceTaxTotalTemp);
		priceTaxTotalShow= Number( ( priceTaxTotalTemp ).toFixed(2) );
		//alert("priceTaxTotalShow:"+priceTaxTotalShow);
		
		//先得到当前行的质保金率(%)
		qualityFeeRate = qualityFeeRateObj.eq(i).val();//当前行的质保金率(%)
		if(qualityFeeRate==""){
			qualityFeeRate = 0;
		}
		//计算 质保金= 价税合计*质保金率(%) 质保金= 价税合计*质保金率
		qualityFee	=Number( (  priceTaxTotal*qualityFeeRate*0.01    ) .toFixed(2) );
		qualityFeeObj.eq(i).val(qualityFee);
		
		/**
		taxRate = taxRateObj.eq(i).val();//税率
		if(taxRate!=""){
			unitRemoveTaxObj.eq(i).val(Math.round(Number(unitPriceObj.eq(i).val())/(1+Number(taxRate))));
		}else{
			unitRemoveTaxObj.eq(i).val("");
		}**/
		
	}
	//显示数量合计
	//alert("显示数量合计:"+productCountShow);
	//$('#productCountShow').html(productCountShow+'');
	$('#productCountShowTxt').val(productCountShow+'');
	//显示含税单价合计
	//alert("显示含税单价合计:"+unitPriceShow);
	//$('#unitPriceShow').html(unitPriceShow+'');
	$('#unitPriceShowTxt').val(unitPriceShow+'');
	
	var unitPriceRMShowTxt= (Number( (  exchangeRate*unitPriceShow ).toFixed(2) )  );
	//alert("unitPriceRMShowTxt:"+unitPriceRMShowTxt);
	//显示含税单价合计(本位币)
	$('#unitPriceRMShowTxt').val(unitPriceRMShowTxt+'');
	
	//显示价税合计总合计
	//alert("显示价税总合计:"+priceTaxTotalShow);
	//$('#priceTaxTotalShow').html(priceTaxTotalShow+'');
	$('#priceTaxTotalShowTxt').val(priceTaxTotalShow+'');
	
	var priceTaxTotalRMShowTxt= (Number( (  exchangeRate*priceTaxTotalShow ).toFixed(2) )  );
	//显示价税合计合计(本位币)
	$('#priceTaxTotalRMShowTxt').val(priceTaxTotalRMShowTxt+'');
	
}

/**
 * 计算产品总金额等
 */
function  countProductTotalFee201508201125bak(){
	
//	if(!checkOrderProductInfo()){
//		return false;
//	}
	
	
	/**---------------------------------------产品总额------------------------------------------------------------------------------*/
	var productCountObj = $('input[name="productCount"]');//数量 改变触发计算
	var unitPriceObj = $('input[name="unitPrice"]');//含税单价  改变触发计算
	var convertRateObj = $('input[name="convertRate"]');
	var productAssistCountObj = $('input[name="productAssistCount"]');
	
	//if(null!=unitPriceObj){
		//alert("含税单价不能为空");
		//return;
	//}
	var discountObj = $('input[name="discount"]');//折扣  改变触发计算
	
	var discountRateObj = $('input[name="discountRate"]');//折扣率  改变触发计算
	
	var totalFeeObj = $('input[name="totalFee"]');//总金额 自动计算
	
	var taxRateObj = $('input[name="taxRate"]');// 税率 改变触发计算
	var unitRemoveTaxObj = $('input[name="unitRemoveTax"]');
	
	var productTotalFee = 0;
	var discount;
	var taxRate;
	
	var unitRemoveTaxObj = $('input[name="unitRemoveTax"]');//不含税单价,自动计算  
	var unitRemoveTax;//不含税单价
	
	var unitPrice;//含税单价
	var productCount;//产品数量
	var discountRate;//折扣率
	
	var factUnitPriceObj = $('input[name="factUnitPrice"]');//实际含税单价,自动计算  
	var factUnitPrice;//实际含税单价
	
	var saleTaxObj = $('input[name="saleTax"]');//销项税额,自动计算  
	var saleTax;//销项税额
	
	var priceTaxTotalObj = $('input[name="priceTaxTotal"]');//价税合计,自动计算  
	var priceTaxTotal;//价税合计
	
	var qualityFeeRateObj = $('input[name="qualityFeeRate"]');//质保金率(%), 
	var qualityFeeRate;//质保金率(%)
	
	var qualityFeeObj = $('input[name="qualityFee"]');//质保金 ,自动计算  
	var qualityFee;//质保金 
	
	var servicechargeObj = $('input[name="servicecharge"]');//服务费 ,自动计算  
	var servicecharge;//服务费
	var listpriceObj = $('input[name="listprice"]');//列表价 ,自动计算  
	var listprice;//列表价
	var balancepriceObj = $('input[name="balanceprice"]');//结算价 ,自动计算  
	var balanceprice;//结算价
	
	var priceTaxTotalRMObj = $('input[name="priceTaxTotalRM"]');//价税合计(本位币)	priceTaxTotalRM
	var priceTaxTotalRM;//价税合计(本位币)
	//折扣额(本位币)	fbusinessdiscount
	var fbusinessdiscountObj = $('input[name="fbusinessdiscount"]'); 
	var fbusinessdiscount; 
	//税额(本币)	ftax	decimal(20,10)
	var ftaxObj = $('input[name="ftax"]'); 
	var ftax; 
	//金额(本币)	famountfor
	var famountforObj = $('input[name="famountfor"]'); 
	var famountfor; 
	
	//含税单价(本币)	ftaxprice
	var ftaxpriceObj = $('input[name="ftaxprice"]'); 
	var ftaxprice;
	
	//获取选择的税率
	var exchangeRate=$('#sysOrderForm select[id="exchangeRate"] option:selected').val();
	var strs= new Array(); //定义一数组 
	strs=exchangeRate.split("|"); //字符分割
	exchangeRate=parseFloat(strs[0]);
	
	var unitPriceShow=0;//含税单价合计
	var productCountShow=0;//产品数量合计
	var priceTaxTotalShow=0;//价税总合计
	for(var i=0;i<productCountObj.length;i++){//遍历产品列表的每行    数量不为空
		
		//("2221");
	    // alert("数量2221"+productCountObj.eq(i).val());	
		//判断产品中的金额等
		if ($.trim(productCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
			alert("数量是非负数字!");
			return false;
		}
		 //alert("换算率2221");	
		//换算率
		if( $.trim(convertRateObj.eq(i).val())!="" ){
			if ($.trim(convertRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("换算率是非负数字!");
				return false;
			}
		}
		 //alert("辅助数量2221");	
		//辅助数量
		if( $.trim(productAssistCountObj.eq(i).val())!="" ){
			if ($.trim(productAssistCountObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("辅助数量是非负数字!");
				return false;
			}
		}
		// alert("服务/工程费单价2221");	
		//服务/工程费单价
		if( $.trim(servicechargeObj.eq(i).val())!="" ){
			if ($.trim(servicechargeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("服务/工程费单价是非负数字!");
				return false;
			}
		}
		//alert("列表单价2221");	
		//列表单价
		if( $.trim(listpriceObj.eq(i).val())!="" ){
			if ($.trim(listpriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("列表单价是非负数字!");
				return false;
			}
		}
		//("税率2221");	
		//税率(%)
		if( $.trim(taxRateObj.eq(i).val())!="" ){
			if ($.trim(taxRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("税率是非负数字!");
				return false;
			}
			if ( Number(taxRateObj.eq(i).val()) >100||Number(taxRateObj.eq(i).val()) <0) {
				alert("税率值不应大于100或小于0!");
				return false;
			}
		}
		//alert("质保金率2221");	
		//质保金率(%)
		if( $.trim(qualityFeeRateObj.eq(i).val())!="" ){
			if ($.trim(qualityFeeRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("质保金率是非负数字!");
				return false;
			}
			if ( Number(qualityFeeRateObj.eq(i).val()) >100||Number(qualityFeeRateObj.eq(i).val()) <0) {
				alert("质保金率值不应大于100或小于0!");
				return false;
			}
		}
		
		//alert("含税单价2221");	
		//单价(不含税)
		if( $.trim(unitPriceObj.eq(i).val())!="" ){
			if ($.trim(unitPriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("含税单价是非负数字!");
				//return false;
			}
		}
		//alert("单价(不含税)2221");	
		//单价(不含税)
		if( $.trim(unitRemoveTaxObj.eq(i).val())!="" ){
			if ($.trim(unitRemoveTaxObj.eq(i).val()).match(/[^,.\d]/) != null) {
				alert("单价(不含税)是非负数字!");
				return false;
			}
		}
		//alert("结算单价2221");	
		//结算单价
		if( $.trim(balancepriceObj.eq(i).val())!="" ){
			if ($.trim(balancepriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("结算单价是非负数字!");
				//return false;
			}
		}
		//alert("结算-单价2221");	
		//结算单价
		if( $.trim(balancepriceObj.eq(i).val())!="" ){
			if ($.trim(balancepriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("结算单价是非负数字!");
				//return false;
			}
		}
		//alert("总金额2221");	
		//总金额
		if( $.trim(totalFeeObj.eq(i).val())!="" ){
			if ($.trim(totalFeeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("总金额是非负数字!");
				//return false;
			}
		}
		//alert("折扣率2221");	
		//折扣率(%)
		if( $.trim(discountRateObj.eq(i).val())!="" ){
			if ($.trim(discountRateObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("折扣率是非负数字!");
				//return false;
			}
//			if ( Number(discountRateObj.eq(i).val()) >100||Number(discountRateObj.eq(i).val()) <0) {
//				alert("折扣率值不应大于100或小于0!");
//				return false;
//			}
		}
		//alert("折扣2221");	
		//折扣
		if( $.trim(discountObj.eq(i).val())!="" ){
			if ($.trim(discountObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("折扣是非负数字!");
				//return false;
			}
		}
		//alert("实际含税单价2221");	
		//实际含税单价
		if( $.trim(factUnitPriceObj.eq(i).val())!="" ){
			if ($.trim(factUnitPriceObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("实际含税单价是非负数字!");
				//return false;
			}
		}
		//alert("销项税额2221");	
		//销项税额
		if( $.trim(saleTaxObj.eq(i).val())!="" ){
			if ($.trim(saleTaxObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("销项税额是非负数字!");
				//return false;
			}
		}
		//alert("价税合计2221");	
		//价税合计
		if( $.trim(priceTaxTotalObj.eq(i).val())!="" ){
			if ($.trim(priceTaxTotalObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("价税合计是非负数字!");
				//return false;
			}
		}
		//alert("质保金2221");	
		//质保金
		if( $.trim(qualityFeeObj.eq(i).val())!="" ){
			if ($.trim(qualityFeeObj.eq(i).val()).match(/[^,.\d]/) != null) {
				//alert("质保金是非负数字!");
				//return false;
			}
		}
		
		/**discount = discountObj.eq(i).val();//当前行的折扣
		if(discount==""){
			discount = 1;//如果为空就置为1
		}**/
		//先得到当前行的含税单价
		unitPrice = unitPriceObj.eq(i).val();//当前行的含税单价
		if(unitPrice==""){
			unitPrice = 0;
		}
		//计算  金额(本位币)= 金额*汇率
		ftaxprice=Number( (unitPrice*exchangeRate).toFixed(2) );
		ftaxpriceObj.eq(i).val(ftaxprice);
		
		//自动计算含税单价合计
		//alert("11");
		//unitPriceShow=Number( (   unitPriceShow + unitPrice    ) .toFixed(4) );
		var unitPriceTemp=Number(unitPriceShow)+Number(unitPrice);
		//alert("11"+unitPriceTemp);
		unitPriceShow= Number( ( unitPriceTemp ).toFixed(4) );
		//alert("unitPriceShow:"+unitPriceShow);
		
		//alert("当前行的含税单价:"+unitPrice);
		
		//当前行的服务费
		servicecharge = servicechargeObj.eq(i).val();//当前行的折扣率
		if(servicecharge==""){
			servicecharge = 0;//如果为空就置为1
		}
		//计算 结算价= (销售价-服务费 )
		balanceprice	=Number( (   unitPrice - servicecharge    ) .toFixed(2) );
		balancepriceObj.eq(i).val(balanceprice);
		
		
		//折扣率=结算价/列表价 不让编辑
		discountRate = discountRateObj.eq(i).val();//当前行的折扣率
		if(discountRate==""){
			discountRate = 100;//如果为空就置为1
		}
		//当前行的列表价
		listprice = listpriceObj.eq(i).val();//当前行的列表价  
		//alert("listprice:"+listprice);
		if(listprice==""||null==listprice){
			 //不修改折扣率
			//alert("balanceprice:"+balanceprice);
			//if(0==balanceprice){//结算价不为空
				discountRate=Number( 0 );//折扣率为0
				//alert("discountRate:"+discountRate);
			//}
		}else{
			discountRate=Number( (   balanceprice / listprice *100   ) .toFixed(2) );
			//discountRate=Number( ( 100-  balanceprice / listprice *100   ) .toFixed(2) );
		}
		
		//productTotalFee = Number(productCountObj.eq(i).val())*Number(unitPriceObj.eq(i).val())*Number(discount);
		
		taxRate = taxRateObj.eq(i).val();//当前行的税率
		if(taxRate==""){
			//taxRate = 100;//如果为空就置为1
			taxRate = 17;//如果为空就置为17%与ERP中默认的一致
		}
		///alert("当前行的税率:"+taxRate );
		//计算不含税单价
		unitRemoveTax = unitRemoveTaxObj.eq(i).val();//当前行的折扣
		if("100"==taxRate){
			//unitRemoveTax=unitPrice;
			unitRemoveTax=Number( ( unitPrice/(2) ).toFixed(4) );
		}else{
			var temptaxRate=Number(taxRate*0.01)+Number(1);
			unitRemoveTax= Number( ( unitPrice/(temptaxRate) ).toFixed(4) );
		}
		//alert("当前行的不含税单价:"+unitRemoveTax);
		
		//先得到当前行的产品数量
		productCount = productCountObj.eq(i).val();//当前行的产品数量
		if(productCount==""){
			productCount = 0;
		}
		//产品数量合计
		var productCountTemp=Number(productCountShow)+Number(productCount);
		//alert("11"+productCountTemp);
		productCountShow= Number( ( productCountTemp ).toFixed(4) );
		//alert("productCountShow:"+productCountShow);
		
		//产品数量*不含税单价*
		//productTotalFee = Number( productCountObj.eq(i).val() ) * Number( unitPriceObj.eq(i).val()) ;
		if("100"==discountRate){
			//productTotalFee = Number( ( productCount*unitRemoveTax  ).toFixed(2) );
			productTotalFee = Number( 0 );
		}
		else if("0"==discountRate){
			productTotalFee = Number( ( productCount*unitRemoveTax * (1)).toFixed(2) );
		}
		else{
			//productTotalFee = Number( ( productCount*unitRemoveTax * (1-discountRate*0.01)).toFixed(2) );
			productTotalFee = Number( ( productCount*unitRemoveTax * (discountRate*0.01)).toFixed(2) );
		}
		
		//alert("当前行的总金额:"+productTotalFee);
		
		//将计算的值设置到金额列
		totalFeeObj.eq(i).val(  productTotalFee  );//保留两位小数
		//totalFeeObj.eq(i).val( Math.round( productTotalFee*1000 )/ 1000 );//保留两位小数
		
		//计算  金额(本位币)= 金额*汇率
		famountfor=Number( (productTotalFee*exchangeRate).toFixed(2) );
		famountforObj.eq(i).val(famountfor);
		
		//显示自动计算的不含税单价
		unitRemoveTaxObj.eq(i).val(unitRemoveTax);
		//显示税率
		taxRateObj.eq(i).val(taxRate);
		//显示折扣率
		discountRateObj.eq(i).val(discountRate);
		//计算折扣额并显示
		//alert("discountRate:"+discountRate);
		if("100"==discountRate){
			//discount=Number( (productCount*unitPrice* (1-discountRate*0.01) ) .toFixed(2) );
			discount=Number( (productCount*unitPrice* (1) ) .toFixed(2) );
			//alert("discount:"+discount);
			discountObj.eq(i).val(discount);
		}else if("0"==discountRate) {
				//discount=Number( (productCount*unitPrice* (1-discountRate*0.01) ) .toFixed(2) );
			discount=Number( 0 );
			//alert("discount:"+discount);
			discountObj.eq(i).val(discount);
		}
		else{
			//discount=Number( (productCount*unitPrice* discountRate*0.01) .toFixed(2) );
			discount=Number( (productCount*unitPrice* (100-discountRate)*0.01) .toFixed(2) );
			//alert("discount:"+discount);
			discountObj.eq(i).val(discount);
		}
		//计算 折扣额(本位币)= 折扣额*汇率
		fbusinessdiscount=Number( (discount*exchangeRate).toFixed(2) );
		fbusinessdiscountObj.eq(i).val(fbusinessdiscount);
		
		//alert("当前行的折扣额:"+discount);
		
		//计算实际含税单价=含税单价*(1-折扣率)
		if("100"==discountRate){
			//factUnitPrice=Number( ( unitPrice * (1-0) ) .toFixed(4) );
			factUnitPrice=Number( ( unitPrice * (0) ) .toFixed(4) );
			factUnitPriceObj.eq(i).val(factUnitPrice);
		}
		else if("0"==discountRate){
			factUnitPrice=Number( ( unitPrice * (1) ) .toFixed(4) );
			factUnitPriceObj.eq(i).val(factUnitPrice);
		}
		else{
			//factUnitPrice=Number( ( unitPrice * (1-discountRate*0.01) ) .toFixed(4) );
			factUnitPrice=Number( ( unitPrice * (discountRate*0.01) ) .toFixed(4) );
			factUnitPriceObj.eq(i).val(factUnitPrice);
		}
		//alert("实际含税单价:"+discount);
		
		//计算销项税额并显示= (含税总金额-不含税总金额)*(1-折扣率)
		if("100"==discountRate){
			//var unitPriceCountValue=Number(unitPrice*productCount);
			//var unitRemoveTaxCountValue=Number(unitRemoveTax*productCount);
			//alert("含税金额:tempValue:"+unitPriceCountValue);
			//alert("不含税金额:"+unitRemoveTaxCountValue);
			//saleTax	=Number( ( ( unitPriceCountValue-unitRemoveTaxCountValue ) ) .toFixed(2) );
			saleTax	=Number(0);
			saleTaxObj.eq(i).val(saleTax);
		}
		else if("0"==discountRate){
			var unitPriceCountValue=Number(unitPrice*productCount);
			var unitRemoveTaxCountValue=Number(unitRemoveTax*productCount);
			var tempdiscountRateValue=Number(1);
			saleTax	=Number( ( ( unitPriceCountValue-unitRemoveTaxCountValue ) * (tempdiscountRateValue) ) .toFixed(2) );
			saleTaxObj.eq(i).val(saleTax);
		}
		else{
			var unitPriceCountValue=Number(unitPrice*productCount);
			var unitRemoveTaxCountValue=Number(unitRemoveTax*productCount);
			//alert("含税金额:tempValue:"+unitPriceCountValue);
			//alert("不含税金额:"+unitRemoveTaxCountValue);
			//var tempdiscountRateValue=Number(1)-Number(discountRate*0.01);
			var tempdiscountRateValue=Number(discountRate*0.01);
			//alert("折扣率:"+tempdiscountRateValue);
			saleTax	=Number( ( ( unitPriceCountValue-unitRemoveTaxCountValue ) * (tempdiscountRateValue) ) .toFixed(2) );
			saleTaxObj.eq(i).val(saleTax);
		}
		//alert("销项税额:"+saleTax);
		
		//计算 销项税额(本位币)= 销项税额*汇率
		ftax=Number( (saleTax*exchangeRate).toFixed(2) );
		ftaxObj.eq(i).val(ftax);
		
		//计算 价税合计= 数量*实际含税单价
		priceTaxTotal=Number( (productCount*factUnitPrice).toFixed(2) );
		priceTaxTotalObj.eq(i).val(priceTaxTotal);
		//计算 价税合计(本位币)= 价税合计*汇率
		priceTaxTotalRM=Number( (priceTaxTotal*exchangeRate).toFixed(2) );
		priceTaxTotalRMObj.eq(i).val(priceTaxTotalRM);
		
		//价税总合计
		var priceTaxTotalTemp=Number(priceTaxTotalShow)+Number(priceTaxTotal);
		//alert("11"+priceTaxTotalTemp);
		priceTaxTotalShow= Number( ( priceTaxTotalTemp ).toFixed(2) );
		//alert("priceTaxTotalShow:"+priceTaxTotalShow);
		
		//先得到当前行的质保金率(%)
		qualityFeeRate = qualityFeeRateObj.eq(i).val();//当前行的质保金率(%)
		if(qualityFeeRate==""){
			qualityFeeRate = 0;
		}
		//计算 质保金= 价税合计*质保金率(%)
		qualityFee	=Number( (  priceTaxTotal*qualityFeeRate*0.01    ) .toFixed(2) );
		qualityFeeObj.eq(i).val(qualityFee);
		
		/**
		taxRate = taxRateObj.eq(i).val();//税率
		if(taxRate!=""){
			unitRemoveTaxObj.eq(i).val(Math.round(Number(unitPriceObj.eq(i).val())/(1+Number(taxRate))));
		}else{
			unitRemoveTaxObj.eq(i).val("");
		}**/
		
	}
	//显示数量合计
	//alert("显示数量合计:"+productCountShow);
	//$('#productCountShow').html(productCountShow+'');
	$('#productCountShowTxt').val(productCountShow+'');
	//显示含税单价合计
	//alert("显示含税单价合计:"+unitPriceShow);
	//$('#unitPriceShow').html(unitPriceShow+'');
	$('#unitPriceShowTxt').val(unitPriceShow+'');
	
	var unitPriceRMShowTxt= (Number( (  exchangeRate*unitPriceShow ).toFixed(2) )  );
	//alert("unitPriceRMShowTxt:"+unitPriceRMShowTxt);
	//显示含税单价合计(本位币)
	$('#unitPriceRMShowTxt').val(unitPriceRMShowTxt+'');
	
	//显示价税合计总合计
	//alert("显示价税总合计:"+priceTaxTotalShow);
	//$('#priceTaxTotalShow').html(priceTaxTotalShow+'');
	$('#priceTaxTotalShowTxt').val(priceTaxTotalShow+'');
	
	var priceTaxTotalRMShowTxt= (Number( (  exchangeRate*priceTaxTotalShow ).toFixed(2) )  );
	//显示价税合计合计(本位币)
	$('#priceTaxTotalRMShowTxt').val(priceTaxTotalRMShowTxt+'');
	
}
/**
 * 跳转到查看某个订单的历史记录
 * @param orderCode
 */
function toSysOrderHistory(orderCode){
	window.location.href = ctx+"/order/sysorder-history.htm?orderCode="+orderCode;
}
/**
 * 历史记录页面初始化
 */
function sysOrderHistory(){
	window.simpleTableHis =$(document).SimpleTable({
		id:'sysorderhispage',
		formId: 'queryform',
		pageNo: '1',
		pageSize : '15',
		order: 'asc',
		orderBy: 'sysOrderId',
		submitForm : historyPageSubmit//分页回调函数
	});
	sysOrderHistoryList();
}
/**
 * 弹出产品(物料)列表
 */
function toLoadItem(i){
	$("#selectProductDiv"+i).css("display","");
	var fnumber = $("#productCode"+i).val();
	var html='<td><select id="productSelect'+i+'" onchange="addProduct('+i+');" style="width: 285px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	/*var data = 'itemQuery.fnumber='+fnumber;
	var url =ctx+'/item/item!listItemInfo.htm';*/
	var data = 'baseItemQuery.itemcode='+fnumber;
	var url =ctx+'/baseItem/base-item!listItemInfo.htm';
	if(fnumber.length>=1){
		$.webAjax({
			type : "post",
			url : url,
			data:data,
			success : function(data) {
				data = $.parseJSON(data);
				
				var itemList = data.baseItemList;
				//alert("itemList:"+itemList);
				$.each(itemList,function(i,o){
					html+='<option value="'+o.itemcode+'" >'+o.itemcode+'</option>';
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
	$('#productCode'+i).val(selectValue);
	$.webAjax({
		type : "post",
		/*url : ctx+'/item/item!input.htm?',
		data:'itemQuery.fnumber='+selectValue,*/
		url : ctx+'/baseItem/base-item!chooseItem.htm?',
		data:'baseItemQuery.itemcode='+selectValue,
		success : function(data) {
			/*$('#productName'+i).val(data.fname);//产品名称
			$('#excuteStandard'+i).val(data.f106);//执行标准
			$('#specifications'+i).val(data.fmodel);//物料属性
			$('#material'+i).val(data.f105);//材质
			$('#productUnit'+i).val(data.funitid);//计量单位
			
			$('#measureunitname'+i).val(data.measureunitname);//计量单位名*/
			data = $.parseJSON(data);
			data = data.entity;
			$('#productName'+i).val(data.itemname);//产品名称
			$('#excuteStandard'+i).val(data.f101);//执行标准
			$('#specifications'+i).val(data.formatno==null?"":data.formatno);//物料属性
			$('#material'+i).val("");//材质
			$('#productUnit'+i).val(data.unitid);//计量单位
			
			$('#measureunitname'+i).val(data.unitname);//计量单位名
			
			//显示材质
			$('#materialname'+i).val(data.f102);
			//showMaterial(i);
		}
	});
	$("#selectProductDiv"+i).css("display","none");
}
/**
 * 弹出产品(物料)列表
 */
function toLoadItemByName(i){
	$("#selectProductByNameDiv"+i).css("display","");
	var fname = $("#productName"+i).val();
	var html='<td><select id="productSelectByName'+i+'" onchange="addProductByName('+i+');" style="width: 285px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var data = 'baseItemQuery.itemname='+fname;
	var url =ctx+'/baseItem/base-item!listItemInfo.htm';
	if(fname.length>=1){
		$.webAjax({
			type : "post",
			url : url,
			data:data,
			success : function(data) {
				data = $.parseJSON(data);
				
				var itemList = data.baseItemList;
				//alert("itemList:"+itemList);
				$.each(itemList,function(i,o){
					html+='<option value="'+o.itemcode+'" >'+o.itemname+'</option>';
				});
				html+='</select></td>';
				$('#selectProductByName'+i).html(html);
			}
		});	
	}
}
/**
 * 添加产品(物料)
 */
function addProductByName(i){
	var selectValue = $('#productSelectByName'+i).val();
	var text = $('#productSelectByName'+i).find("option:selected").text();
	$('#productCode'+i).val(selectValue);
	$('#productName'+i).val(text);
	$.webAjax({
		type : "post",
		url : ctx+'/baseItem/base-item!chooseItem.htm?',
		data:'baseItemQuery.itemcode='+selectValue,
		success : function(data) {
			data = $.parseJSON(data);
			data = data.entity;
			$('#productName'+i).val(data.itemname);//产品名称
			$('#excuteStandard'+i).val(data.f101);//执行标准
			$('#specifications'+i).val(data.formatno==null?"":data.formatno);//物料属性
			$('#material'+i).val("");//材质
			$('#productUnit'+i).val(data.unitid);//计量单位
			
			$('#measureunitname'+i).val(data.unitname);//计量单位名
			
			//显示材质
			$('#materialname'+i).val(data.f102);
		}
	});
	$("#selectProductByNameDiv"+i).css("display","none");
}
/**
 *  物料材质
 */
function showMaterial(i){
	var selectValue = $('#productSelect'+i).val();
	//var selectTxt = $("#productSelect"+i).find('option:[value="'+selectValue+'"]').text();
	$('#productCode'+i).val(selectValue);
	$.webAjax({
		type : "post",
		url : ctx+'/item/item!inputMaterialInfo.htm?',
		//url : ctx+'/item/item!getItemInfo.htm?',
		data:'itemQuery.fnumber='+selectValue,
		success : function(data) {
			//显示材质
			$('#materialname'+i).val(data.materialname);//
		}
	});
	$("#selectProductDiv"+i).css("display","none");
}

function historyPageSubmit(simpleTable, param){
	sysOrderHistoryList();
}
/**
 * 展示该订单的历史记录
 */
function sysOrderHistoryList(){
	var url = ctx+ '/sysOrder/sys-order!sysOrderHistoryList.htm';
	var formParam = $('#queryForm').serialize();
	var pageParam = simpleTableHis.bindPageParam();
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :formParam+"&"+pageParam,
		success : function(data) {
			//data = $.parseJSON(data);
//		    alert("data:"+data);
			var result = data.result;
			//刷新分页控件
//			alert("result:"+result);
			$.refreshPageToolbar(data,"sysorderhispage",simpleTableHis);
			//组装table
			$.each(result, function(i, o){
				var contractType = "";
				var bussinessType = "";
				if(o.contractType==1){
					contractType = "年度合同";
				}else if(o.contractType==1){
					contractType = "合同正本";
				}else{
					contractType = "内部订单";
				}
				if(o.bussinessType==1){
					bussinessType = "基础业务";
				}else{
					bussinessType = "大项目业务";
				}
				html += '<tr>';
				html += '<td><a href="javascript:toCheckSysOrderHistory('+o.sysOrderId+');" style="color: blue;">'+o.orderCode+'</a></td><td>' + (o.contractCode==null?"":o.contractCode) + '</td>';
				html += '<td>' + (o.contractTime==null?"":formatDate("yyyy-MM-dd",o.contractTime)) + '</td><td>' + (o.changeUserName==null?"":o.changeUserName) + '</td><td>' + (o.examineUserName==null?"":o.examineUserName) + '</td><td>' + (o.checkProject==null?"":o.checkProject) + '</td>';
				html += '<td>' + contractType + '</td><td>' + bussinessType + '</td><td>' + (o.coinType==null?"":o.coinType) + '</td>';
				html += '<td>' + (o.exchangeRate==null?"":o.exchangeRate) + '</td><td>' + (o.contractVersion==null?"":o.contractVersion) + '</td><td>' + (o.systemConsumer==null?"":o.systemConsumer) + '</td><td>' + (o.finalConsumer==null?"":o.finalConsumer) + '</td>';
				html += '<td>' + (o.changeTime==null?"":formatDate("yyyy-MM-dd",o.changeTime)) + '</td>';
				html += '</tr>';
			});
			$('#data-body-history').html(html);
		}
	});
}

/**
 * 添加产品信息
 */
var number=10000;
var linenum=0;

function addTr(){
	linenum++;
	//tabDetail
	var html='<tr id="producttr'+number+'">'+
			'<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;padding:0px 10px;" onclick="delProductTr('+number+',0);"/>'+
			'<input type="hidden" name="productIdHiddenTD" value="null"/></td>'+
			'<td ><input class="myinputall" name="orderTrNumber" value="'+(linenum)+'" readonly="readonly" style="width:30px;" /></td>'+
			
			'<td><input class="myinputall" style="border:red solid 1px;" id="productCode'+number+'" name="productCode" onkeyup="toLoadItem('+number+');" onclick="toLoadItem('+number+');" placeholder="单击可选择"/>'+
			'<div class="selectProduct" id="selectProductDiv'+number+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProduct'+number+'"></tbody></table></div></td>'+
			/*//产品名
			'<td><input class="myinputall" id="productName'+number+'" name="productName" readonly="readonly"/></td>'+*/
			'<td><input class="myinputall" style="border:red solid 1px;" id="productName'+number+'" name="productName" onkeyup="toLoadItemByName('+number+');" onclick="toLoadItemByName('+number+');" placeholder="单击可选择"/>'+
			'<div class="selectProductByName" id="selectProductByNameDiv'+number+'" style="background-color: #eee;width: 300px;height: 125px;position: absolute;overflow: auto;display: none;padding: 5px;"><table><tbody id="selectProductByName'+number+'"></tbody></table></div></td>'+
			//对外销售名
			'<td><input class="myinputall" name="outSaleName"/></td>'+
			//材质
			//'<td></td>'+
			//材质名
			'<td><input type="hidden" id="material'+number+'" name="material" /><input class="myinputall" id="materialname'+number+'" name="materialname" readonly="readonly"/></td>'+
			
			//执行标准
			'<td><input class="myinputall" id="excuteStandard'+number+'" name="excuteStandard" readonly="readonly"/></td>'+
			//规格型号
			'<td><input class="myinputall" id="specifications'+number+'" name="specifications" readonly="readonly"/></td>'+
			//分类
			'<td ><select class="selectall" style="border:red solid 1px;"  name="productType"><option value="A">A</option><option value="B">B</option>'+
			'<option value="C">C</option><option value="D">D</option><option value="E">E</option></select></td>'+
			//PL产品
			//'<td><a href="javascript:openPLDiv('+linenum+','+'1'+');"><img src="'+ctx+'/images/add_small.gif" border="0" /></a>'+
			'<td><a href="javascript:openPLDiv('+linenum+','+'1'+');"><label id="pLProductTxt'+linenum+'"  style="padding:0px 16px;">无</label></a>'+
			
			//PL弹出层中的值,作为隐藏域
			'<input type="hidden" id="pLProduct'+linenum+'" name="pLProducts" />'+
			'</td>'+
			//项目名称
			'<td><input class="myinputall" name="proProjectName"/></td>'+
			//辅助属性
			'<td><input class="myinputall" name="assistAttribute"/></td>'+
			//单位
			//'<td><input class="myinputall" id="productUnit'+number+'" name="productUnit" readonly="readonly"/></td>'+
			
			//单位名
			'<td><input type="hidden" id="productUnit'+number+'" name="productUnit" /><input class="myinputall" id="measureunitname'+number+'" name="measureunitname" readonly="readonly" style="width:40px;"/></td>'+
			
			//数量
			'<td><input class="myinputall" style="border:red solid 1px;width:40px;" id="productCount'+number+'" name="productCount" onblur="countProductTotalFee();"/></td>'+
			//辅助单位
			'<td ><input class="myinputall" name="assistUnit" style="width:50px;"/></td>'+
			//转换率
			'<td ><input class="myinputall" name="convertRate" style="width:40px;"/></td>'+
			//辅助数量
			'<td ><input class="myinputall" name="productAssistCount" style="width:50px;"/></td>'+
			//不含税单价
			'<td ><input type="hidden" id="unitRemoveTaxH'+number+'" name="unitRemoveTaxH" /><input class="myinputall" name="unitRemoveTax" readonly="readonly"/></td>'+
			//含税单价
			'<td ><input class="myinputall" style="border:red solid 1px;" id="saleprice'+number+'" name="unitPrice" onblur="countProductTotalFee();"/></td>'+
			//含税单价(本币)
			'<td ><input type="hidden" id="listpricecurrency'+number+'" name="listpricecurrency" /><input class="myinputall" id="ftaxprice'+number+'" name="ftaxprice" readonly="readonly"/></td>'+
			
			/*//begin 新需求增加
			//服务费 servicecharge
			'<td><input class="myinputall" id="servicecharge'+number+'" onblur="servicechargeChangeOther('+number+');" name="servicecharge"  /></td>'+
			//列表价 	
			'<td><input class="myinputall" id="listprice'+number+'" onblur="listpriceChangeOther('+number+');" name="listprice"  /></td>'+
			//结算价 	
			'<td><input class="myinputall" id="balanceprice'+number+'" name="balanceprice" readonly="readonly"   /></td>'+
			//end 新需求增加*/
			 			
			//begin 新需求增加
			//服务费 servicecharge
			'<td><input class="myinputall" style="border:red solid 1px;" id="servicecharge'+number+'" onblur="countProductTotalFee();" name="servicecharge"  /></td>'+
			//列表价 	
			'<td><input class="myinputall" style="border:red solid 1px;" id="listprice'+number+'" onblur="countProductTotalFee();" name="listprice"  /></td>'+
			//结算价 	
			'<td><input class="myinputall" id="balanceprice'+number+'" name="balanceprice" readonly="readonly"   /></td>'+
			//end 新需求增加
			
			//'<td ><input class="myinputall" name="discount" onblur="countProductTotalFee();"/></td>'+
			
			//金额
			'<td ><input class="myinputall" name="totalFee" readonly="readonly"/></td>'+
			//金额(本位币)
			'<td ><input class="myinputall" name="famountfor" readonly="readonly"/></td>'+
			//税率		
			'<td ><input class="myinputall" style="width:40px;" name="taxRate" onblur="countProductTotalFee();"/></td>'+
			
			//折扣率
			'<td ><input class="myinputall" style="width:50px;" id="discountRate'+number+'" name="discountRate" readonly="readonly" /></td>'+
			
			//折扣
			'<td ><input class="myinputall" style="width:50px;" id="discount'+number+'" name="discount" readonly="readonly" /></td>'+
			//折扣额(本位币)
			'<td ><input class="myinputall" style="width:50px;" id="fbusinessdiscount'+number+'" name="fbusinessdiscount" readonly="readonly" /><input type="hidden" id="factUnitPrice'+number+'" name="factUnitPrice" /></td>'+
			
			//实际含税单价,新需求去掉
			//'<td ><input class="myinputall" name="factUnitPrice" readonly="readonly" /></td>'+
			
			//销项税额
			'<td ><input class="myinputall" name="saleTax" readonly="readonly"/></td>'+
			//销项税额(本位币)
			'<td ><input class="myinputall" name="ftax" readonly="readonly"/></td>'+
			//价税合计
			'<td ><input class="myinputall" name="priceTaxTotal" readonly="readonly" /></td>'+
			//价税合计(本位币)
			'<td ><input class="myinputall" name="priceTaxTotalRM" readonly="readonly" /></td>'+
			
			'<td ><input class="myinputall" style="border:red solid 1px;" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" id="deliveryTime" name="deliveryTime"/></td>'+
			'<td ><input class="myinputall" style="border:red solid 1px;" name="adviceDeliveryTime" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>'+
			//质保金率
			'<td ><input class="myinputall" name="qualityFeeRate" onblur="countProductTotalFee();" /></td>'+
			//质保金
			'<td ><input class="myinputall" name="qualityFee" readonly="readonly" /></td>'+
			
			//'<td ><input class="myinputall" name="baseUnitName"/></td>'+
			//'<td ><input class="myinputall" name="baseUnitCount"/></td>'+
			'<td ><input class="myinputall" style="border:red solid 1px;" name="makeNumberCode"/></td>'+
			'<td ><input class="myinputall" name="taskCode"/></td>'+
			//'<td ><input class="myinputall" name="referCount"/></td>'+
			//'<td ><input class="myinputall" name="assistUnitReferCount"/></td>'+
			'<td ><input class="myinputall" name="assistUnitOutHouseCount"/></td>'+
			//'<td ><input class="myinputall" name="outHouseCount"/></td>'+
			'<td ><input class="myinputall" name="customBOM"/></td>'+
			'<td ><input class="myinputall" name="costObj"/></td>'+
			//'<td ><input class="myinputall" name="addOrDel"/></td>'+
			//'<td ><input class="myinputall" name="lockHouseMark"/></td>'+
			//'<td ><input class="myinputall" name="sourceOrderCode"/></td>'+
			//'<td ><input class="myinputall" name="sourceOrderType"/></td>'+
			//'<td ><input class="myinputall" name="sourceOrderInnerCode"/></td>'+
			//'<td ><input class="myinputall" name="sourceOrderSplit"/></td>'+
			//'<td ><input class="myinputall" name="contactCode"/></td>'+
			//'<td ><input class="myinputall" name="contactInnerCode"/></td>'+
			//'<td ><input class="myinputall" name="contactSplit"/></td>'+
			'<td ><input class="myinputall" name="billCount"/></td>'+
			//'<td ><input class="myinputall" name="customOrderCode"/></td>'+
			'<td ><input class="myinputall" name="assistCompanyBillCount"/></td>'+
			'<td ><input class="myinputall" name="assistCompanyFitCount"/></td>'+
			'<td ><input class="myinputall" name="baseCompanyFitCount"/></td>'+
			'<td ><input class="myinputall" name="fitCount"/></td>'+
			//'<td ><input class="myinputall" name="assistAttributeType"/></td>'+
			//'<td ><input class="myinputall" name="priceTaxTotalRM"/></td>'+
			//'<td ><input class="myinputall" name="markForMRP"/></td>'+
			//'<td ><input class="myinputall" name="markIsForMRP"/></td>'+
			//'<td ><input class="myinputall" name="collectPayReferFee"/></td>'+
			'<td ><input class="myinputall" name="remarks"/></td>'+
		'</tr>';
	number++;
	$('#productDetail').append(html);
}
/**
 * 删除PL弹出层中的产品信息
 * @param number
 * @param type
 */
function delPLProductTr(number,type){
	if(type==1){
		delproducts += number+",";
	}
	$('#plproducttr'+number).remove();
	//同时重新计算合计
	countProductPLTotalFee();
}
/**
 * 删除产品信息
 * @param number
 * @param type
 */
function delProductTr(number,type){
	if(type==1){
		delproducts += number+",";
	}
	$('#producttr'+number).remove();
	//删除某行时,更新下合计
	countProductTotalFee();
	
	
}
/**
 * 添加应收款信息
 */
var collectNumber=0;
function addCollectPayTR(){
	var html='<tr id="collectpaytr'+collectNumber+'">'+
				'<td><img src="'+ctx+'/images/delete_small.gif" style="border: 0;cursor: pointer;padding:0px 10px;" onclick="delCollectPayTr('+collectNumber+',0);"/>'+
				'<input type="hidden" name="collectPayIdHiddenTD" value="null"/></td>'+
				'<td><input class="myinputall" name="planCollectTime" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>'+
				'<td><input class="myinputall" name="shouldCollectTime" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})"/></td>'+
				'<td><input class="myinputall" name="shouldCollectFee" onblur="countTotalFee();"/></td>'+
				//'<td><input class="myinputall" name="shouldCollectFeeRm" onblur="countTotalFeeRM();"/></td>'+
				'<td><input class="myinputall" name="shouldCollectFeeRm" readonly="readonly" /></td>'+
				'<td><input class="myinputall" name="collectPayType"/></td>'+
				'<td><input class="myinputall" name="guaranteeLetterType"/></td>'+
				'<td><input class="myinputall" name="guaranteeLetterStart" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" /></td>'+
				'<td><input class="myinputall" name="guaranteeLetterEnd" onfocus="WdatePicker({dateFmt:\''+'yyyy-MM-dd'+'\'})" /></td>'+
			'</tr>';
	collectNumber++;
	$('#collectPayDetail').append(html);
}
/**
 * 当汇率变化时改变应收款信息
 * @return
 */
function changeSourceDisplay() {
	countTotalFee();
	//同时更新下关联的产品合计
	countProductTotalFee();
}
/**
 * 删除应收款信息
 * @param collectNumber
 * @param type
 */
function delCollectPayTr(collectNumber,type){
	if(type==1){
		delcollectPays += collectNumber+",";
	}
	$('#collectpaytr'+collectNumber).remove();
	countTotalFee();
}
/**
 * 提交订单去审核
 * @param id
 */
function toSubmitSysOrder(sysorderid){
	var flag = window.confirm("确定提交吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/sysOrder/sys-order!examineSysOrderInfo.htm',
			data :{"sysOrderQuery.sysOrderId":sysorderid,"sysOrderQuery.sysOrderStatus":1},
			success : function(data) {
				//
				data = $.parseJSON(data);
				//alert("data:"+data);
				//alert("data.resultInfo[0]:"+data.resultInfo[0]);
				if(data.resultInfo[0]=='0')
				{
					alert(data.resultInfo[1]);
					
				}else{
					alert(data.resultInfo[1]);
				}
				loadOrders();
				
			}
		});
	}
}
/**
 * 转到审核系统订单
 * @param id
 */
function examineSysOrder(id){
	$('#sysOrderIdHidden').val(id);
	$.openDiv('examineDiv');
}
/**
 * 审核系统订单
 */
function examineAgree(exeprocessParam){
	var sysorderid = $('#sysOrderIdHidden').val();
	var sysOrderStatus = $("input[name='examine']:checked").val();
	
	
	//审核内容
	var approveCotent = $('#approveCotent').val();
    if("3"==sysOrderStatus){//驳回提示原因必填
		if(null==approveCotent||""==approveCotent){
			alert("请填写驳回原因!");
			return;
		}
	}
    var param="sysOrderQuery.sysOrderId="+sysorderid+"&sysOrderQuery.sysOrderStatus="+sysOrderStatus
	+"&sysOrderQuery.approveCotent="+approveCotent+"&"+exeprocessParam;
    //alert("param:"+param);
	var flag = window.confirm("确定提交吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/sysOrder/sys-order!examineSysOrderInfo.htm',
			/*data :{"sysOrderQuery.sysOrderId":sysorderid,"sysOrderQuery.sysOrderStatus":sysOrderStatus,
			"sysOrderQuery.approveCotent":approveCotent},*/
			data :param,
			success : function(data) {
				
				data = $.parseJSON(data);
				alert("data:"+data);
				alert("data.resultInfo[0]:"+data.resultInfo[0]);
				if(data.resultInfo[0]=='0')
				{
					alert(data.resultInfo[1]);
					window.location.reload();
				}else{
					alert(data.resultInfo[1]);
				}
				/*//loadOrders();
				//审核按钮移到详情页中了,操作后显示详情页
				//审核或驳回成功
				var ui1 = document.getElementById("examineBtn");
			    ui1.style.visibility="hidden";//设置隐藏
			    
			    //var menuidparamH = $("#menuidparamH").val();
			    
				//toCheckSysOrder(sysorderid,menuidparamH);
			    toCheckSysOrder(sysorderid);
				$('#sysOrderIdHidden').val("");
				$.closeDiv('examineDiv');*/
				
			}
		});
	}
}
/**
 * 弹出核算项目名称列表
 */
function toAddCheckProject(){
	$("#selectCheckProjectDiv").css("display","");
	var name = $("#checkProject").val();
	var data = 'organizationQuery.fname='+name;
	var html='<td><select id="checkProjectSelect" onchange="addCheckProject();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/organization/organization!listToRow.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.organizationList;
			$.each(list,function(i,o){
				html+='<option value="'+o.finnerid+'" >'+o.fname+'</option>';
			});
			html+='</select></td>';
			$('#selectCheckProject').html(html);
		}
	});	
}
/**
 * 添加合算项目
 */
function addCheckProject(){
	var selectValue = $('#checkProjectSelect').val();
	//var selectTxt = $("#checkProjectSelect").eq(0).find('option:[value='+selectValue+']').text();
	var selectTxt = $("#checkProjectSelect").find("option:selected").text().trim();
	$('#checkProject').val(selectTxt);
	$('#checkProjectId').val(selectValue);
	$("#selectCheckProjectDiv").css("display","none");
}
/**
 * 弹出审核人列表
 */
function toAddExamineUser(){
	$("#selectExamineUserDiv").css("display","");
	var name = $("#examineUserName").val();
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
	$('#examineUserName').val(selectTxt);
	$('#examineUserId').val(selectValue);
	$("#selectExamineUserDiv").css("display","none");
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
}
/**
 * 弹出部门列表
 */
function toAddDept(){
	$("#selectDeptDiv").css("display","");
	var name = $("#department").val().trim();
	var data = 'departmentQuery.teamname='+name+'&departmentQuery.isused=0';
	var html='<td><select id="deptSelect" onchange="addDept();" style="width: 180px; height: 120px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/listDept.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
//			data = $.parseJSON(data);
//			var page = data.page;
			$.each(data,function(i,o){
				html+='<option value="'+o.teamid+'" >'+o.teamname+'</option>';
			});
			html+='</select></td>';
			$('#selectDept').html(html);
		}
	});	
}
/**
 * 添加部门
 */
function addDept(){
	var selectValue = $('#deptSelect').val();
	//var selectTxt = $("#deptSelect").find('option:[value='+selectValue+']').text();
	var selectTxt = $("#deptSelect").find("option:selected").text().trim();
	$('#department').val(selectTxt);
	$('#departmentId').val(selectValue);
	$("#selectDeptDiv").css("display","none");
}

/**
 * 弹出主管列表
 */
function toAddManager(){
	$("#selectManagerDiv").css("display","");
	var name = $("#manager").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="managerSelect" onchange="addManager();" style="width: 180px; height: 120px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
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
			$('#selectManager').html(html);
		}
	});	
}
/**
 * 添加主管
 */
function addManager(){
	var selectValue = $('#managerSelect').val();
	//var selectTxt = $("#managerSelect").find('option:[value='+selectValue+']').text();
	var selectTxt = $("#managerSelect").find("option:selected").text().trim();
	$('#manager').val(selectTxt);
	$('#managerId').val(selectValue);
	$("#selectManagerDiv").css("display","none");
}
/**
 * 弹出业务员列表
 */
function toAddBusinessUser(){
	//设置div的位置
	var offsettop=$("#businessUser").offset().top;   
 	var offsetleft=$("#businessUser").offset().left;
	$("#selectBusinessUserDiv").css({position: "absolute",'top':offsettop-125,'left':offsetleft-20}); 
	$("#selectBusinessUserDiv").css("display","");
	var name = $("#businessUser").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="businessUserSelect" onchange="addBusinessUser();" style="width: 150px; height: 120px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
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
			$('#selectBusinessUser').html(html);
		}
	});	
}
/**
 * 添加业务员
 */
function addBusinessUser(){
	var selectValue = $('#businessUserSelect').val();
	//var selectTxt = $("#businessUserSelect").find('option:[value='+selectValue+']').text();
	var selectTxt = $("#businessUserSelect").find("option:selected").text().trim();
	$('#businessUser').val(selectTxt);
	$('#businessUserId').val(selectValue);
	//根据业务员到表t_sales_bratio中查找对应的销售经理和区域经理
	var data = 'salesBratioQuery.saleId='+selectValue;
	var url =ctx+'/salesBratio/sales-bratio!listToQuery.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.salesBratioList;
			var salemanagerId="";
			var salemanagerName="";
			var areamanagerId="";
			var areamanagerName="";
			var businessratio=0;//标准产品业务员比例
			var salemanagerratio=0;//标准产品销售经理比例
			var areamanagerratio=0;//标准产品区域经理比例
			var fbselfratio=0;//非标产品业务员比例
			var fbsmratio=0;//非标产品销售经理比例
			var fbamratio=0;//非标产品区域经理比例
			if(list.length>0){
				$.each(list,function(i,o){
					salemanagerId=(o.salemanagerId==null?"":o.salemanagerId);
					salemanagerName=(o.salemanagerName==null?"":o.salemanagerName);
					areamanagerId=(o.areamanagerId==null?"":o.areamanagerId);
					areamanagerName=(o.areamanagerName==null?"":o.areamanagerName);
					
					businessratio=(o.bzselfratio==null?0:o.bzselfratio);
					salemanagerratio=(o.bzsmratio==null?0:o.bzsmratio);
					areamanagerratio=(o.bzamratio==null?0:o.bzamratio);
					fbselfratio=(o.fbselfratio==null?0:o.fbselfratio);
					fbsmratio=(o.fbsmratio==null?0:o.fbsmratio);
					fbamratio=(o.fbamratio==null?0:o.fbamratio);
					
				});
			}
			$("#salemanagerId").val(salemanagerId);
			$("#salemanagerName").val(salemanagerName);
			$("#areamanagerId").val(areamanagerId);
			$("#areamanagerName").val(areamanagerName);
			$("#businessratio").val(businessratio);
			$("#salemanagerratio").val(salemanagerratio);
			$("#areamanagerratio").val(areamanagerratio);
			$("#fbselfratio").val(fbselfratio);
			$("#fbsmratio").val(fbsmratio);
			$("#fbamratio").val(fbamratio);
			
			
		}
	});	
	$("#selectBusinessUserDiv").css("display","none");
	
}
/**
 * 弹出销售经理列表
 */
function toAddSalemanagerUser(){
	//设置div的位置
	var offsettop=$("#salemanagerName").offset().top;   
 	var offsetleft=$("#salemanagerName").offset().left;
	$("#selectSalemanagerNameDiv").css({position: "absolute",'top':offsettop-125,'left':offsetleft-18}); 
	$("#selectSalemanagerNameDiv").css("display","");
	var name = $("#salemanagerName").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="salemanagerNameSelect" onchange="addSalemanagerName();" style="width: 150px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
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
			$('#selectSalemanagerName').html(html);
		}
	});	
}
/**
 * 添加销售经理
 */
function addSalemanagerName(){
	var selectValue = $('#salemanagerNameSelect').val();
	var selectTxt = $("#salemanagerNameSelect").find("option:selected").text().trim();
	$('#salemanagerName').val(selectTxt);
	$('#salemanagerId').val(selectValue);
	$("#selectSalemanagerNameDiv").css("display","none");
	
}
/**
 * 弹出区域经理列表
 */
function toAddAreamanagerUser(){
	//设置div的位置
	var offsettop=$("#areamanagerName").offset().top;   
 	var offsetleft=$("#areamanagerName").offset().left;
	$("#selectAreamanagerNameDiv").css({position: "absolute",'top':offsettop-125,'left':offsetleft-18}); 
	$("#selectAreamanagerNameDiv").css("display","");
	var name = $("#areamanagerName").val();
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="areamanagerNameSelect" onchange="addAreamanagerName();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/findListByDepart.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectAreamanagerName').html(html);
		}
	});	
}
/**
 * 添加区域经理
 */
function addAreamanagerName(){
	var selectValue = $('#areamanagerNameSelect').val();
	var selectTxt = $("#areamanagerNameSelect").find("option:selected").text().trim();
	$('#areamanagerName').val(selectTxt);
	$('#areamanagerId').val(selectValue);
	$("#selectAreamanagerNameDiv").css("display","none");
	
}
/**
 * 弹出集团客户
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
	//var selectTxt = $("#systemConsumerSelect").find('option:[value='+selectValue+']').text();
	var selectTxt = $("#systemConsumerSelect").find("option:selected").text().trim();
	$('#systemConsumer').val(selectTxt);
	$('#systemConsumerId').val(selectValue);
	$("#selectSystemConsumerDiv").css("display","none");
}
/**
 * 转到最终用户添加组件
 */
function toAddFinalConsumer(){
	$("#selectFinalConsumerDiv").css("display","");
	var name = $("#finalConsumer").val();
	var data = 'organizationQuery.fname='+name;
	var html='<td><select id="finalConsumerSelect" onchange="addFinalConsumer();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/organization/organization!listToRow.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.organizationList;
			$.each(list,function(i,o){
				html+='<option value="'+o.finnerid+'" >'+o.fname+'</option>';
			});
			html+='</select></td>';
			$('#selectFinalConsumer').html(html);
		}
	});	
}
/**
 * 添加最终用户
 */
function addFinalConsumer(){
	var selectValue = $('#finalConsumerSelect').val();
	//var selectTxt = $("#finalConsumerSelect").find('option:[value='+selectValue+']').text();
	var selectTxt = $("#finalConsumerSelect").find("option:selected").text().trim();
	$('#finalConsumer').val(selectTxt);
	$('#finalConsumerId').val(selectValue);
	$("#selectFinalConsumerDiv").css("display","none");
}
/**
 * 弹出省份列表
 */
function toAddProvince(){
	$("#selectProvinceDiv").css("display","");
	var name = $("#province").val();
	var data = 'provinceQuery.provincename='+name;
	var html='<td><select id="provinceSelect" onchange="addProvince();" style="width: 180px; height: 120px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	var url =ctx+'/system/provincelist.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.provinceList;
			$.each(list,function(i,o){
				html+='<option value="'+o.provinceid+'" >'+o.provincename+'</option>';
			});
			html+='</select></td>';
			$('#selectProvince').html(html);
		}
	});	
}
/**
 * 添加省份
 */
function addProvince(){
	var selectValue = $('#provinceSelect').val();
	//var selectTxt = $("#provinceSelect").find('option:[value='+selectValue+']').text();
	var selectTxt = $("#provinceSelect").find("option:selected").text().trim();
	$('#province').val(selectTxt);
	$('#provinceId').val(selectValue);
	$("#selectProvinceDiv").css("display","none");
}
/**
 * 跳转到查看系统订单
 * @param id
 */
/*function toCheckSysOrder(id){
	window.location.href = ctx+"/order/sysorder-check.htm?id="+id+"&type=1";
}*/
function toCheckSysOrder(id){
	//window.location.href = ctx+"/order/sysorder-check.htm?id="+id+"&type=1";
	window.open(ctx+"/order/sysorder-check.htm?id="+id+"&type=1","系统订单查看");
}
function toCheckSysOrderBAK(id,menuidparam){
	window.location.href = ctx+"/order/sysorder-check.htm?id="+id+"&type=1&menuidparam="+menuidparam;
}
function toCheckSysOrderHistory(id){
	window.open(ctx+"/order/sysorder-check.htm?id="+id+"&type=2","系统订单历史查看");
	//window.location.href = ctx+"/order/sysorder-check.htm?id="+id+"&type=2";
}


/**
 * 删除系统订单
 * @param id 删除的系统订单的id
 */
function delsysorders(orderCode){
	var param = {};
	if(null!=orderCode&&orderCode!='') {
		param['checkedCodeList[0]'] = orderCode;
	} else {		
		var delDecvices = $('[name="checkedSysOrder"]:checked');
		var cnt = 0;
		$.each(delDecvices, function(i, o){		
			param['checkedCodeList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedCodeList[0]']) {
		alert('请选择要删除的系统订单！');
		return;
	}
	
	if(!confirm('确定删除？')) {
		return;
	}
	var url = ctx+ '/sysOrder/sys-order!delete.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			
			if(data && data == 'success') {
				loadOrders();
			} else {
				alert('删除订单失败！'+data);
			}
		}
	});
}

function selectAccess(rv){
	//alert("rv:"+rv);
	if(rv==1){
		$('#rebackTR').css("display","none");
	}else if(rv==0){
		var nodeseq = $('#nodeSeq').val();
		//alert("nodeseq:"+nodeseq);
		if(nodeseq==1){
			$('#rebackNode').html("<option value='0'>开始</option>");
			$('#rebackTR').css("display","");
		}else if(nodeseq>1){
			var url = ctx+"/processDetail/process-detail!findByCode.htm";
			$.webAjax({
				type : "post",
				url : url,
				data: 'processDetailQuery.processCode='+$('#taskcode').val(),
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
/**
 * 进行下推，启动下料下推的流程
 * @param type 是下推还是审核 0下推 1审核
 */
function exeprocess(type){
	if(type==0){//是下推
		saveexamine(type);
	}else{//是审核
		$('#fmark').val('');
		$.openDiv("examineAddDiv");
	}
}
function shenheOpt(examParam){
    //alert("6");
	//addCodeAndQty();
	//alert("601");
	//block_viewport();
	//alert("602");
	var tools='${param.tools}';
	var t='';
	if(tools==1){
			t='&tools=1';
			var url = ctx+"/picking/picking!review.htm";
			var formParam = $('#queryForm').serialize();
			//alert(formParam);
			//alert("7");
			$.webAjax( {
				type : "post",
				url : url,
				data:formParam+'&fstatus=1'+t+'&'+examParam,
				success : function(data) {
					data = $.parseJSON(data);
					
					if(data.resultInfo[0]=="0")
					{
						xval.remove();
						alert("审核成功.");
						 
				        window.location.reload();
						//loadbill();
						//window.opener.loadbill();
					}
					else
					{
						xval.remove();
						alert("审核失败:"+data.resultInfo[1]);
						window.location.reload();
					}
					closeDiv('rbdetailDiv');
				}
			});
	 	
	}else if($('#dbno').val()==3||$('#dbno').val()==4)
	{
		var url = "${ctx}/picking/picking!review.htm";
		var formParam = $('#queryForm').serialize();
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam+'&fstatus=1'+t+'&'+examParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=="0")
				{
					xval.remove();
					alert("审核成功.");
					//loadbill();
					//window.opener.loadbill();
					window.location.reload();
				}
				else
				{
					xval.remove();
					alert("审核失败:"+data.resultInfo[1]);
					window.location.reload();
				}
				closeDiv('rbdetailDiv');
			}
		});	
	}
	else
	{
		alert("产品未选标记，请联系管理员");
		xval.remove();
	}
}
function exeprocessStart(type){
	var examineinfo = '';
	/**if(type==0){//如果是下推按钮则不传审核类的信息
	}else if(type==1){//如果是审核操作要将信息传入
		mark = examineMark;
	}else{}*/
	var nodeseq = $('#nodeSeq').val();
	if(nodeseq==undefined || nodeseq==null || nodeseq==''){
		nodeseq = 0;
	}
	var examineAddForm = $('#examineAddForm').serialize();
	var url = ctx+"/picking/picking!exeProcess.htm";
	var param = 'processExetask.sourceId='+$('#sysOrderIdHidden').val()+
				//'&processExetask.sourceCode='+$('#sourceCode').val()+
				'&processExetask.nodeSeq='+nodeseq+
				'&processExetask.id='+$('#exeTaskId').val()+
				'&processExetask.taskCode='+$('#taskcode').val()+
				'&pickingid='+$('#sysOrderIdHidden').val();
	var examParam=examineAddForm+"&"+param;
	//shenheOpt(examParam);
	examineAgree(examParam);
}
function saveexamine(type){
	var examineinfo = '';
	/**if(type==0){//如果是下推按钮则不传审核类的信息
	}else if(type==1){//如果是审核操作要将信息传入
		mark = examineMark;
	}else{}*/
	var nodeseq = $('#nodeSeq').val();
	if(nodeseq==undefined || nodeseq==null || nodeseq==''){
		nodeseq = 0;
	}
	var examineAddForm = $('#examineAddForm').serialize();
	var url = ctx+"/picking/picking!exeProcess.htm";
	var param = 'processExetask.sourceId='+$('#sysOrderIdHidden').val()+
				//'&processExetask.sourceCode='+$('#sourceCode').val()+
				'&processExetask.nodeSeq='+nodeseq+
				'&processExetask.id='+$('#exeTaskId').val()+
				'&processExetask.taskCode='+$('#taskcode').val()+
				'&pickingid='+$('#sysOrderIdHidden').val();
	var examParam=examineAddForm+"&"+param;
	//shenheOpt(examParam);
	//examineAgree(examParam);
	

	var sysorderid = $('#sysOrderIdHidden').val();
	var sysOrderStatus = $("input[name='examine']:checked").val();
	
	
	//审核内容
	var approveCotent = $('#approveCotent').val();
    if("3"==sysOrderStatus){//驳回提示原因必填
		if(null==approveCotent||""==approveCotent){
			alert("请填写驳回原因!");
			return;
		}
	}
    var param="sysOrderQuery.sysOrderId="+sysorderid+"&sysOrderQuery.sysOrderStatus="+sysOrderStatus
		+"&sysOrderQuery.approveCotent="+approveCotent+"&"+examParam;
    //alert("param:"+param);
	var flag = window.confirm("确定提交吗？");
	if(flag==true){
		$.webAjax({
			type : 'post',
			url : ctx+ '/sysOrder/sys-order!examineSysOrderInfo.htm',
			/*data :{"sysOrderQuery.sysOrderId":sysorderid,"sysOrderQuery.sysOrderStatus":sysOrderStatus,
			"sysOrderQuery.approveCotent":approveCotent},*/
			data :param,
			success : function(data) {
				var resultInfo = data.resultInfo;
				//alert("resultInfo[0]:"+resultInfo[0]);
					//var dataResult = $.parseJSON(data);
					//alert("data2:"+dataResult);
					//alert("dataResult.resultInfo[0]:"+dataResult.resultInfo[0]);
				if(resultInfo[0]=='0')
				{
						alert(resultInfo[1]);
						window.location.reload();
				}else{
						alert(resultInfo[1]);
				}
				
				/*//loadOrders();
				//审核按钮移到详情页中了,操作后显示详情页
				//审核或驳回成功
				var ui1 = document.getElementById("examineBtn");
			    ui1.style.visibility="hidden";//设置隐藏
			    
			    //var menuidparamH = $("#menuidparamH").val();
			    
				//toCheckSysOrder(sysorderid,menuidparamH);
			    toCheckSysOrder(sysorderid);
				$('#sysOrderIdHidden').val("");
				$.closeDiv('examineDiv');*/
				
			},
			error: function (result, status) {
                alert(status);
            }
		});
	}

	
	
	/* $.webAjax({
		type : "post",
		url : url,
		data: examineAddForm+"&"+param,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
			
			    //判断是流程结束
			    if(data.resultInfo[2]=='true'){// 流程结束
		            review(); 
				}
				alert("操作成功!");
				window.location.reload();
			}
		}
	}); */
	
}
/**
 * 查看流程
 */
function checkprocesshis(){
	var statusmark = 0;
	if(titleObj.sysOrderStatus!=null){
		statusmark= titleObj.sysOrderStatus;
	}
	var url = ctx+"/processHistask/process-histask!listToQueryAll.htm";
	var param = 'processHistaskQuery.taskCode='+$('#taskcode').val()+
				"&processHistaskQuery.sourceId="+$('#sysOrderIdHidden').val();;
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
				//alert("html:"+html);
				$('#processcontent').html(html);
				$.openDiv('checkProcessDiv');
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
var titleObj;
/**
 * 查看系统订单
 * @param id 查看的系统订单的id
 */
//function checkSysOrder(id,type,menuidparam){
function checkSysOrder(id,type){
	//alert("menuidparam:"+menuidparam);
	//$('#menuidparamH').val(menuidparam);
	//alert("查看系统订单或历史,id:"+id+",type"+type);
	if(null!=id&&undefined!=id&&id!=""){
		
		//alert("0");
		
		//alert("1");
		if($('.productTR').length!=0){
			$('.productTR').remove();
		}
		var urlMark = "";
		if(type==1){
			urlMark = ctx+ '/sysOrder/sys-order!input.htm?id='+id;
			//urlMark = ctx+ '/sysOrder/sys-order!input.htm?id='+id+'&sysOrderQuery.menuidparam='+menuidparam;
		}else{
			urlMark = ctx+ '/sysOrder/sys-order!inputHistory.htm?id='+id;
			//urlMark = ctx+ '/sysOrder/sys-order!inputHistory.htm?id='+id+'&sysOrderQuery.menuidparam='+menuidparam;
		}
		//alert("urlMark:"+urlMark);
		$('#sysOrderIdHidden').val(parseInt(id));
		$.webAjax({
			type : 'post',
			url : urlMark,
			success : function(data) {
				var sysOrder = data.sysOrder;
				titleObj =  data.sysOrder;
				var pushToExam = false;//下推
				
				
				$.each(data.menuOperatelist, function(i, o){
					
					if(o.functionName=='ROLE_SYSORDER_PUSHTOEXAM'){// 
						pushToExam = true;//
					}
			    });
				
				//alert("sysOrder.sysOrderStatus:"+sysOrder.sysOrderStatus);
				if(sysOrder.sysOrderStatus==100)
				{
					loadexestatus(id,0);
					$('#currentprocess').text("流程结束!");
					$('#examinestatusdiv').css("display","");
				}
				else if(sysOrder.sysOrderStatus==0)
				{
					loadexestatus(id,0);
					if(pushToExam){
						//显示下推
						$('#checkbutton').html('<input type="button" onclick="javascript:exeprocess(0);" value="下推" class="btnall" id ="examineBtn"   />');
					}
					
				}
				else if(sysOrder.sysOrderStatus==-1){
					loadexestatus(id,0);
					if(pushToExam){
						$('#checkbutton').html('<input type="button" onclick="javascript:exeprocess(0);" value="下推" class="btnall" id ="examineBtn"  />');
					}
					//$('#rebackinfo_start').text("被驳回!原因:"+sysOrder.fstatusDesc).css("color","red");
					
					//$('#rebackinfo_start').css("display","");
					$('#examinestatusdiv').css("display","none");
				}
				else if(sysOrder.sysOrderStatus==200){
					loadexestatus(id,0);
					if(pushToExam){
						$('#checkbutton').html('<input type="button" onclick="javascript:exeprocess(0);" value="下推" class="btnall" id ="examineBtn"  />');
					}
					//$('#rebackinfo_start').text("被驳回!原因:"+sysOrder.fstatusDesc).css("color","red");
					
					//$('#rebackinfo_start').css("display","");
					$('#examinestatusdiv').css("display","none");
				}
				else//非已经审核状态
				{
					loadexestatus(id,1);
					//$('#checkbutton').html('<input type="button" onclick="javascript:exeprocess(1);" value="审核" class="btnall" id ="examineBtn"   />');
				}
				
				
				var contractTypeShow = "";
				var productList = data.productList;
				var collectPayList = data.collectPayList;
				
				var productplList = data.productplList;//系统订单关联的产品列表的PL产品
				//alert("productplList:"+productplList);
				var product = "";
				var collectPay = "";
				if(sysOrder.contractType=="1"){
					contractTypeShow = "年度合同";
				}else if(sysOrder.contractType=="2"){
					contractTypeShow = "合同正本";
				}else{
					contractTypeShow = "内部订单";
				}
				var examineVal = false;
				var downloadVal = false;
				$.each(data.menuOperatelist, function(i, o){
					if(o.functionName=='ROLE_SYSORDER_EXAM'){// 
						examineVal = true;//审核
					}
					if(o.functionName=='ROLE_SYSORDER_DOWNLOAD'){// 
						downloadVal = true;//审核
					}
			    });
				//alert("001:");
				$('#orderCode').html(sysOrder.orderCode);
				//影藏域中的值
				$('#orderCodeH').val(sysOrder.orderCode);
				$('#contractCode').html(replaceNull(sysOrder.contractCode));
				$('#contractTime').html(replaceNull(formatDate("yyyy-MM-dd",sysOrder.contractTime)));
				$('#contractName').html(replaceNull(sysOrder.contractName));
				$('#checkProject').html(replaceNull(sysOrder.checkProject));
				$('#contractType').html(replaceNull(contractTypeShow));
				$('#model').html(replaceNull(sysOrder.model));
				$('#coinType').html(replaceNull(sysOrder.coinType));
				$('#exchangeRate').html(replaceNull(sysOrder.exchangeRate));
				$('#bussinessType').html(sysOrder.bussinessType==1?"基础业务":"大项目业务");
				$('#systemConsumer').html(replaceNull(sysOrder.systemConsumer));
				$('#finalConsumer').html(replaceNull(sysOrder.finalConsumer));
				$('#contractVersion').html(replaceNull(sysOrder.contractVersion));
				$('#changeTime').html(replaceNull(formatDate("yyyy-MM-dd",sysOrder.changeTime)));
				$('#changeReason').html(replaceNull(sysOrder.changeReason));
				$('#businessUser').html(replaceNull(sysOrder.businessUser));
				$('#manager').html(replaceNull(sysOrder.manager));
				$('#payCondition').html(replaceNull(sysOrder.payCondition));
				$('#department').html(replaceNull(sysOrder.department));
				$('#warrantyTime').html(replaceNull(sysOrder.warrantyTime));
				$('#examineTime').html(replaceNull(formatDate("yyyy-MM-dd",sysOrder.examineTime)));
				$('#examineUserName').html(replaceNull(sysOrder.examineUserName));
				$('#changeUserName').html(replaceNull(sysOrder.changeUserName));
				$('#remarks').html(replaceNull(sysOrder.remarks));
				$('#province').html(replaceNull(sysOrder.province));
				$('#customContractCode').html(replaceNull(sysOrder.customContractCode));
				$('#model').html(replaceNull(sysOrder.model));
				$('#saleType').html(replaceNull(sysOrder.saleType));
				
				$('#fheadSelfS0156').html( sysOrder.bussinessType==31373?"有":"无" );//是否有合同：fheadSelfS0156
				$('#disCoefficient').html(replaceNull(sysOrder.disCoefficient));//经销系数
				
				$('#operatorrate').html(replaceNull(sysOrder.operatorrate));//业务费系数
				
				$('#dealerName').html(replaceNull(sysOrder.dealerName));//经销商
				//alert("01:");
				//显示国产PL产品
				if('0'!=replaceNull(sysOrder.pL3000Count)){
				$('#PL3000Count').html(replaceNull(sysOrder.pL3000Count));//国产PL产品
				}
				//alert("sysOrder.pL3000Count:"+sysOrder.pL3000Count);
				if('0'!=replaceNull(sysOrder.pL3000Unit)){
					$('#PL3000SalePrice').html(replaceNull(sysOrder.pL3000Unit));
				}
				if('0'!=replaceNull(sysOrder.pL3000ListPrice)){
				$('#PL3000ListPrice').html(replaceNull(sysOrder.pL3000ListPrice));
				}
				if('0'!=replaceNull(sysOrder.pL4200Count)){
				$('#PL4200Count').html(replaceNull(sysOrder.pL4200Count));
				}
				if('0'!=replaceNull(sysOrder.pL4200Unit)){
					$('#PL4200SalePrice').html(replaceNull(sysOrder.pL4200Unit));
					}
					if('0'!=replaceNull(sysOrder.pL4200ListPrice)){
					$('#PL4200ListPrice').html(replaceNull(sysOrder.pL4200ListPrice));
					}
				
					if('0'!=replaceNull(sysOrder.sSV3500Count)){	
				$('#SSV3500Count').html(replaceNull(sysOrder.sSV3500Count));
					}
				if('0'!=replaceNull(sysOrder.sSV3500Unit)){
					$('#SSV3500SalePrice').html(replaceNull(sysOrder.sSV3500Unit));
					}
					if('0'!=replaceNull(sysOrder.sSV3500ListPrice)){
					$('#SSV3500ListPrice').html(replaceNull(sysOrder.sSV3500ListPrice));
					}
					if('0'!=replaceNull(sysOrder.sPL2000Count)){	
				$('#SPL2000Count').html(replaceNull(sysOrder.sPL2000Count));
					}
				if('0'!=replaceNull(sysOrder.sPL2000Unit)){
					$('#SPL2000SalePrice').html(replaceNull(sysOrder.sPL2000Unit));
					}
					if('0'!=replaceNull(sysOrder.sPL2000ListPrice)){
					$('#SPL2000ListPrice').html(replaceNull(sysOrder.sPL2000ListPrice));
					}
                //显示系统订单状态
				//alert("sysOrder.sysOrderStatus:"+sysOrder.sysOrderStatus);
				if('0'==(sysOrder.sysOrderStatus+'')){//0待提交 ,1待审核,2已生效,被驳回
					$('#sysOrderStatus').html("待提交");
				}else if(('100'!=(sysOrder.sysOrderStatus+''))&&('3'!=(sysOrder.sysOrderStatus+''))){//0待提交 ,1待审核,2已生效,被驳回
					//alert("sysOrder.sysOrderStatus:"+sysOrder.sysOrderStatus);
					$('#sysOrderStatus').html("待审核");
					//显示审核按钮
					var currentBtn = document.getElementById("examineBtn");
					//alert("currentBtn:"+currentBtn+" "+("null"!=(currentBtn+"")));
					//alert("currentBtn:"+currentBtn+" "+("null"==(currentBtn+"")));
				    /**/if ((type == "1")&&examineVal&&("null"!=(currentBtn+""))) {//非历史详情页
				        //currentBtn.style.display = ""; //style中的visible属性
				        //var ui1 = document.getElementById("contractTxtFile");
				        currentBtn.style.visibility="visible";
				    }
					
				}else if('100'==(sysOrder.sysOrderStatus+'')){//0待提交 ,1待审核,2已生效,被驳回
					$('#sysOrderStatus').html("已生效");
				}else{
					$('#sysOrderStatus').html("被驳回");
				}
				      
				$('#businessratio').html(sysOrder.businessratio==null?"":sysOrder.businessratio);//业务员标准比例  
				$('#salemanagerName').html(sysOrder.salemanagerName==null?"":sysOrder.salemanagerName);//销售经理姓名
				$('#salemanagerratio').html(sysOrder.salemanagerratio==null?"":sysOrder.salemanagerratio);//销售经理标准比例
				$('#areamanagerName').html(sysOrder.areamanagerName==null?"":sysOrder.areamanagerName);//区域经理姓名
				$('#areamanagerratio').html(sysOrder.areamanagerratio==null?"":sysOrder.areamanagerratio);//区域经理标准比例
				$('#fbselfratio').html(sysOrder.fbselfratio==null?"":sysOrder.fbselfratio);//业务员非标比例
				$('#fbsmratio').html(sysOrder.fbsmratio==null?"":sysOrder.fbsmratio);//销售经理非标比例
				$('#fbamratio').html(sysOrder.fbamratio==null?"":sysOrder.fbamratio);//区域经理非标比例
				
				//显示系统订单审核人意见
				$('#examineMsg').html(replaceNull(sysOrder.examineMsg));
				if (downloadVal) {//有下载权限
					$('#biddingNoticeShow').html("<a href='javascript:checkFile(\""
							+sysOrder.biddingNotice+"\");'>查看</a>|<a href='javascript:downloadFile(\""
							+sysOrder.biddingNotice+"\");' >下载</a>");
					/**	
					$('#biddingNoticeShow').html("<a href='javascript:checkFile(\""
							+sysOrder.biddingNotice+"\");'>查看</a>|<a href='http://127.0.0.1:8080/files/pic/2015/167/16/119_1402905136984.pdf' >下载</a>");
					**/
					$('#contractReviewShow').html("<a href='javascript:checkFile(\""+sysOrder.contractReview+"\");'>查看</a>|<a href='javascript:downloadFile(\""+sysOrder.contractReview+"\");'>下载</a>");
					$('#contractTxtShow').html("<a href='javascript:checkFile(\""+sysOrder.contractTxt+"\");'>查看</a>|<a href='javascript:downloadFile(\""+sysOrder.contractTxt+"\");'>下载</a>");
				}else{//无下载权限
					$('#biddingNoticeShow').html("<a href='javascript:checkFile(\""+sysOrder.biddingNotice+"\");'>查看</a>");
					$('#contractReviewShow').html("<a href='javascript:checkFile(\""+sysOrder.contractReview+"\");'>查看</a>");
					$('#contractTxtShow').html("<a href='javascript:checkFile(\""+sysOrder.contractTxt+"\");'>查看</a>");
				}
				//alert("1:");
				/**--------------------显示产品列表开始------------------------------*/
				var productCountShow=0;
				var unitPriceShow=0;
				var priceTaxTotalShow=0;
				//含税单价总计(本位币)
				var ftaxpriceShow=0;
				//价税合计总合计(本位币)
				var priceTaxTotalRMShow=0;
				//alert("productList.length:"+productList.length);
				for(var i=0;i<productList.length;i++){
					product += '<tr id="producttr'+(i+1)+'">';
					product += '<td>'+(i+1)+'</td>';
					product += '<td>'+replaceNull(productList[i].productCode)+'</td>';
					//产品名
					product += '<td>'+replaceNull(productList[i].productName)+'</td>';
					//对外销售名
					product += '<td>'+replaceNull(productList[i].outSaleName)+'</td>';
					//材质
					//product += '<td>'+replaceNull(productList[i].material)+'</td>';
					//材质名
					product += '<td>'+replaceNull(productList[i].materialname)+'</td>';
					//执行标准
					product += '<td>'+replaceNull(productList[i].excuteStandard)+'</td>';
					//规格型号
					product += '<td>'+replaceNull(productList[i].specifications)+'</td>';
					//分类
					product += '<td>'+replaceNull(productList[i].productType )+'</td>';
					
					//PL产品添加按钮
					//遍历PL产品找到对应的父产品
					var orderTrNumber=productList[i].orderTrNumber;
					var pLProductInfo="";
					var arr = new List();
					if(null!=productplList){
						for(var j=0;j<productplList.length;j++){
							if(productplList[j].productId==productList[i].productId){
								var productpl = new Object();//新建对象
								//alert("3:");
								//alert("productLineNum:"+productLineNum);
								productpl.productLineNum=orderTrNumber;
								//alert("3 a:");
								productpl.fmodel=replaceNull(productplList[j].fmodel);//pL4200规格型号
								productpl.fnum=replaceNull(productplList[j].fnum);//pL4200数量
								productpl.fprice=replaceNull(productplList[j].fprice);//pL4200合同价
								productpl.flistprice=replaceNull(productplList[j].flistprice);//pL4200列表价
								//alert("5:");
								productpl.pl3000fmodel=replaceNull(productplList[j].pl3000fmodel);//pl3000规格型号
								productpl.pl3000fnum=replaceNull(productplList[j].pl3000fnum);//pl3000数量
								productpl.pl3000fprice=replaceNull(productplList[j].pl3000fprice);//pl3000合同价
								productpl.pl3000flistprice=replaceNull(productplList[j].pl3000flistprice);//pl3000列表价
								//alert("6:");
								productpl.ssv3500fmodel=replaceNull(productplList[j].ssv3500fmodel);//sSV3500规格型号
								productpl.ssv3500fnum=replaceNull(productplList[j].ssv3500fnum);//sSV3500数量
								productpl.ssv3500fprice=replaceNull(productplList[j].ssv3500fprice);//sSV3500合同价
								productpl.ssv3500flistprice=replaceNull(productplList[j].ssv3500flistprice);//sSV3500列表价
								//alert("7:");
								productpl.pl2000fmodel=replaceNull(productplList[j].pl2000fmodel);//sPL2000规格型号
								productpl.pl2000fnum=replaceNull(productplList[j].pl2000fnum);//sPL2000数量
								productpl.pl2000fprice=replaceNull(productplList[j].pl2000fprice);//sPL2000合同价
								productpl.pl2000flistprice=replaceNull(productplList[j].pl2000flistprice);//sPL2000列表价
								//alert("8:");
								arr.add(productpl);
							}
						}
					}
					var json = JSON.stringify(arr);
					if(0<json.length&&'{"value":[]}'!=json){
						pLProductInfo=json;
					}
					var plProductTipText='';
					var pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts"  />';
					if(null==pLProductInfo||""==pLProductInfo){
						plProductTipText='<span   id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'"  >无</span>';
					}else{
						plProductTipText='<span   id="pLProductTxt'+replaceNull(productList[i].orderTrNumber)+'"  >有</span>';
						pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts" value='+pLProductInfo+' />';
					}
					product += '<td><a href="javascript:openShowPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');">'+plProductTipText+'</a>'+
					
					//product += '<td><a href="javascript:openShowPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');"><img src="'+ctx+'/images/view.png" height="35%" width="35%" border="0" /></a>'+
					//PL弹出层中的值,作为隐藏域,是从数据库查出来的需要处理
					pLProductInputStr+
					'</td>';
					
					
					
					//项目名称
					product += '<td>'+replaceNull(productList[i].proProjectName)+'</td>';
					//辅助属性
					product += '<td>'+replaceNull(productList[i].assistAttribute)+'</td>';
//					//单位
//					product += '<td>'+replaceNull(productList[i].productUnit)+'</td>';
					//单位名
					product += '<td>'+replaceNull(productList[i].measureunitname)+'</td>';
					//数量
					product += '<td>'+replaceNull(productList[i].productCount)+'</td>';
					

					//产品数量合计
					var productCountTemp=Number(productCountShow)+Number(replaceNull(productList[i].productCount));
					//alert("11"+productCountTemp);
					productCountShow= Number( ( productCountTemp ).toFixed(4) );
					
					//辅助单位
					product += '<td>'+replaceNull(productList[i].assistUnit)+'</td>';
					//转换率
					product += '<td>'+replaceNull(productList[i].convertRate)+'</td>';
					//辅助数量
					product += '<td>'+replaceNull(productList[i].productAssistCount)+'</td>';
					//不含税单价
					product += '<td>'+replaceNull(productList[i].unitRemoveTax)+'</td>';
					//含税单价
					product += '<td>'+replaceNull(productList[i].unitPrice)+'</td>';
					//含税单价(本位币)
					product += '<td>'+replaceNull(productList[i].ftaxprice)+'</td>';
					
					//自动计算含税单价合计
					var unitPriceTemp=Number(unitPriceShow)+Number(replaceNull(productList[i].unitPrice));
					unitPriceShow= Number( ( unitPriceTemp ).toFixed(4) );
					
					//自动计算含税单价合计
					var ftaxpriceRMTemp=Number(ftaxpriceShow)+Number(replaceNull(productList[i].ftaxprice));
					ftaxpriceShow= Number( ( ftaxpriceRMTemp ).toFixed(4) );
					
					//begin 新需求增加
					//服务费 servicecharge  
					product += '<td>'+replaceNull(productList[i].servicecharge)+'</td>';
					//列表价 	
					product += '<td>'+replaceNull(productList[i].listprice)+'</td>';
					//结算价 	
					product += '<td>'+replaceNull(productList[i].balanceprice)+'</td>';
					//end 新需求增加
					//金额
					product += '<td>'+replaceNull(productList[i].totalFee)+'</td>';
					//金额(本币)
					product += '<td>'+replaceNull(productList[i].famountfor)+'</td>';
					
					//税率
					product += '<td>'+replaceNull(productList[i].taxRate)+'</td>';
					//折扣率
					product += '<td>'+replaceNull(productList[i].discountRate)+'</td>';
					//折扣
					product += '<td>'+replaceNull(productList[i].discount)+'</td>';
					//折扣(本币)
					product += '<td>'+replaceNull(productList[i].fbusinessdiscount)+'</td>';
					//实际含税单价
					//product += '<td>'+replaceNull(productList[i].factUnitPrice)+'</td>';
					
					//销项税额
					product += '<td>'+replaceNull(productList[i].saleTax)+'</td>';
					//销项税额(本币)
					product += '<td>'+replaceNull(productList[i].ftax)+'</td>';
					//价税合计
					product += '<td>'+replaceNull(productList[i].priceTaxTotal)+'</td>';
					//价税合计(本币)
					product += '<td>'+replaceNull(productList[i].priceTaxTotalRM)+'</td>';
					
					//价税总合计
					var priceTaxTotalTemp=Number(priceTaxTotalShow)+Number(replaceNull(productList[i].priceTaxTotal));
					//alert("11"+priceTaxTotalTemp);
					priceTaxTotalShow= Number( ( priceTaxTotalTemp ).toFixed(2) );
					
					//价税总合计
					var priceTaxTotalRMTemp=Number(priceTaxTotalRMShow)+Number(replaceNull(productList[i].priceTaxTotalRM));
					//alert("11"+priceTaxTotalTemp);
					priceTaxTotalRMShow= Number( ( priceTaxTotalRMTemp ).toFixed(2) );
					
					product += '<td>'+replaceNull(productList[i].deliveryTime)+'</td>';
					product += '<td>'+replaceNull(productList[i].adviceDeliveryTime)+'</td>';
					
					product += '<td>'+replaceNull(productList[i].qualityFeeRate)+'</td>';
					product += '<td>'+replaceNull(productList[i].qualityFee)+'</td>';
					
					
					product += '<td>'+replaceNull(productList[i].makeNumberCode)+'</td>';
					product += '<td>'+replaceNull(productList[i].taskCode)+'</td>';
					product += '<td>'+replaceNull(productList[i].assistUnitOutHouseCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].customBOM)+'</td>';
					product += '<td>'+replaceNull(productList[i].costObj)+'</td>';
					product += '<td>'+replaceNull(productList[i].billCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].assistCompanyBillCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].assistCompanyFitCount)+'</td>';
					//product += '<td>'+replaceNull(productList[i].orderTrNumber)+'</td>';
					
					product += '<td>'+replaceNull(productList[i].baseCompanyFitCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].fitCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].remarks)+'</td>';
					product += '</tr>';
				}
				//显示数量合计
				$('#productCountShow').html(productCountShow+'');
				//显示含税单价合计
				$('#unitPriceShow').html(unitPriceShow+'');
				
				//显示含税单价总合计(本位币)
				$('#ftaxpriceShow').html(ftaxpriceShow+'');
				
				//显示含税单价合计
				$('#priceTaxTotalShow').html(priceTaxTotalShow+'');
				//显示含税单价合计
				$('#priceTaxTotalRMShow').html(priceTaxTotalRMShow+'');
				
				
				$('#productDetail').append(product);
				/**--------------------显示产品列表结束------------------------------*/
				/**--------------------显示应收款管理列表开始-----------------------------*/
				for(var i=0;i<collectPayList.length;i++){
					collectPay += '<tr id="collectpaytr'+(i+1)+'">';
					collectPay += '<td>'+(i+1)+'</td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].planCollectTime)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].shouldCollectTime)+'</span></td>';
					collectPay += '<td><span class="shouldCollectFee">'+replaceNull(collectPayList[i].shouldCollectFee)+'</span></td>';
					collectPay += '<td><span class="shouldCollectFeeRm">'+replaceNull(collectPayList[i].shouldCollectFeeRm)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].collectPayType)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].guaranteeLetterType)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].guaranteeLetterStart)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].guaranteeLetterEnd)+'</span></td>';
					collectPay += '</tr>';
				}
				$('#collectPayDetail').append(collectPay);
				/**--------------------显示应收款管理列表结束-----------------------------*/
				/**--------------------计算应收款原币和应收款本位币的总和开始------------------------------*/
				var totalFee= 0;
				var totalFeeRM= 0;
				var shouldCollectFee = $('.shouldCollectFee');
				var shouldCollectFeeRM = $('.shouldCollectFeeRm');
				for(var i=0;i<shouldCollectFee.length;i++){
					if(shouldCollectFee.eq(i).text()!=''){
						totalFee += parseFloat(shouldCollectFee.eq(i).text());//应收款原币总和
					}
					if(shouldCollectFeeRM.eq(i).text()!=''){
						totalFeeRM += parseFloat(shouldCollectFeeRM.eq(i).text());//应收款本位币总和
					}
				}
				$('#shouldTotal').html(totalFee);
				$('#shouldTotalRM').html(totalFeeRM);
				/**--------------------计算应收款原币和应收款本位币的总和结束------------------------------*/
			}
		});
	}
}
/*function checkSysOrder(id,type){
	
	
	//alert("查看系统订单或历史,id:"+id+",type"+type);
	if(null!=id&&undefined!=id&&id!=""){
		if($('.productTR').length!=0){
			$('.productTR').remove();
		}
		var urlMark = "";
		if(type==1){
			urlMark = ctx+ '/sysOrder/sys-order!input.htm?id='+id;
		}else{
			urlMark = ctx+ '/sysOrder/sys-order!inputHistory.htm?id='+id;
		}
		$('#sysOrderIdHidden').val(parseInt(id));
		$.webAjax({
			type : 'post',
			url : urlMark,
			success : function(data) {
				var sysOrder = data.sysOrder;
				var contractTypeShow = "";
				var productList = data.productList;
				var collectPayList = data.collectPayList;
				
				var productplList = data.productplList;//系统订单关联的产品列表的PL产品
				//alert("productplList:"+productplList);
				var product = "";
				var collectPay = "";
				if(sysOrder.contractType=="1"){
					contractTypeShow = "年度合同";
				}else if(sysOrder.contractType=="2"){
					contractTypeShow = "合同正本";
				}else{
					contractTypeShow = "内部订单";
				}
				var examineVal = false;
				$.each(data.menuOperatelist, function(i, o){
					if(o.functionName=='exam()'){// 
						examineVal = true;//审核
					}
			    });
				
				$('#orderCode').html(sysOrder.orderCode);
				//影藏域中的值
				$('#orderCodeH').val(sysOrder.orderCode);
				$('#contractCode').html(replaceNull(sysOrder.contractCode));
				$('#contractTime').html(replaceNull(formatDate("yyyy-MM-dd",sysOrder.contractTime)));
				$('#contractName').html(replaceNull(sysOrder.contractName));
				$('#checkProject').html(replaceNull(sysOrder.checkProject));
				$('#contractType').html(replaceNull(contractTypeShow));
				$('#model').html(replaceNull(sysOrder.model));
				$('#coinType').html(replaceNull(sysOrder.coinType));
				$('#exchangeRate').html(replaceNull(sysOrder.exchangeRate));
				$('#bussinessType').html(sysOrder.bussinessType==1?"基础业务":"大项目业务");
				$('#systemConsumer').html(replaceNull(sysOrder.systemConsumer));
				$('#finalConsumer').html(replaceNull(sysOrder.finalConsumer));
				$('#contractVersion').html(replaceNull(sysOrder.contractVersion));
				$('#changeTime').html(replaceNull(formatDate("yyyy-MM-dd",sysOrder.changeTime)));
				$('#changeReason').html(replaceNull(sysOrder.changeReason));
				$('#businessUser').html(replaceNull(sysOrder.businessUser));
				$('#manager').html(replaceNull(sysOrder.manager));
				$('#payCondition').html(replaceNull(sysOrder.payCondition));
				$('#department').html(replaceNull(sysOrder.department));
				$('#warrantyTime').html(replaceNull(sysOrder.warrantyTime));
				$('#examineTime').html(replaceNull(formatDate("yyyy-MM-dd",sysOrder.examineTime)));
				$('#examineUserName').html(replaceNull(sysOrder.examineUserName));
				$('#changeUserName').html(replaceNull(sysOrder.changeUserName));
				$('#remarks').html(replaceNull(sysOrder.remarks));
				$('#province').html(replaceNull(sysOrder.province));
				$('#customContractCode').html(replaceNull(sysOrder.customContractCode));
				$('#model').html(replaceNull(sysOrder.model));
				$('#saleType').html(replaceNull(sysOrder.saleType));
				
				$('#fheadSelfS0156').html( sysOrder.bussinessType==31373?"有":"无" );//是否有合同：fheadSelfS0156
				$('#disCoefficient').html(replaceNull(sysOrder.disCoefficient));//经销系数
				
				$('#operatorrate').html(replaceNull(sysOrder.operatorrate));//业务费系数
				
				$('#dealerName').html(replaceNull(sysOrder.dealerName));//经销商
				//显示国产PL产品
				if('0'!=replaceNull(sysOrder.pL3000Count)){
				$('#PL3000Count').html(replaceNull(sysOrder.pL3000Count));//国产PL产品
				}
				//alert("sysOrder.pL3000Count:"+sysOrder.pL3000Count);
				if('0'!=replaceNull(sysOrder.pL3000Unit)){
					$('#PL3000SalePrice').html(replaceNull(sysOrder.pL3000Unit));
				}
				if('0'!=replaceNull(sysOrder.pL3000ListPrice)){
				$('#PL3000ListPrice').html(replaceNull(sysOrder.pL3000ListPrice));
				}
				if('0'!=replaceNull(sysOrder.pL4200Count)){
				$('#PL4200Count').html(replaceNull(sysOrder.pL4200Count));
				}
				if('0'!=replaceNull(sysOrder.pL4200Unit)){
					$('#PL4200SalePrice').html(replaceNull(sysOrder.pL4200Unit));
					}
					if('0'!=replaceNull(sysOrder.pL4200ListPrice)){
					$('#PL4200ListPrice').html(replaceNull(sysOrder.pL4200ListPrice));
					}
				
					if('0'!=replaceNull(sysOrder.sSV3500Count)){	
				$('#SSV3500Count').html(replaceNull(sysOrder.sSV3500Count));
					}
				if('0'!=replaceNull(sysOrder.sSV3500Unit)){
					$('#SSV3500SalePrice').html(replaceNull(sysOrder.sSV3500Unit));
					}
					if('0'!=replaceNull(sysOrder.sSV3500ListPrice)){
					$('#SSV3500ListPrice').html(replaceNull(sysOrder.sSV3500ListPrice));
					}
					if('0'!=replaceNull(sysOrder.sPL2000Count)){	
				$('#SPL2000Count').html(replaceNull(sysOrder.sPL2000Count));
					}
				if('0'!=replaceNull(sysOrder.sPL2000Unit)){
					$('#SPL2000SalePrice').html(replaceNull(sysOrder.sPL2000Unit));
					}
					if('0'!=replaceNull(sysOrder.sPL2000ListPrice)){
					$('#SPL2000ListPrice').html(replaceNull(sysOrder.sPL2000ListPrice));
					}
                //显示系统订单状态
				if('0'==sysOrder.sysOrderStatus+''){//0待提交 ,1待审核,2已生效,被驳回
					$('#sysOrderStatus').html("待提交");
				}else if('1'==sysOrder.sysOrderStatus+''){//0待提交 ,1待审核,2已生效,被驳回
					$('#sysOrderStatus').html("待审核");
					//显示审核按钮
					var currentBtn = document.getElementById("examineBtn");
				    if (type == "1"&&examineVal) {//非历史详情页
				        //currentBtn.style.display = ""; //style中的visible属性
				        //var ui1 = document.getElementById("contractTxtFile");
				        currentBtn.style.visibility="visible";
				    }
					
				}else if('2'==sysOrder.sysOrderStatus+''){//0待提交 ,1待审核,2已生效,被驳回
					$('#sysOrderStatus').html("已生效");
				}else{
					$('#sysOrderStatus').html("被驳回");
				}
				
				//显示系统订单审核人意见
				$('#examineMsg').html(replaceNull(sysOrder.examineMsg));
				
				$('#biddingNoticeShow').html("<a href='javascript:checkFile(\""
						+sysOrder.biddingNotice+"\");'>查看</a>|<a href='javascript:downloadFile(\""
						+sysOrder.biddingNotice+"\");' >下载</a>");
				*//**	
				$('#biddingNoticeShow').html("<a href='javascript:checkFile(\""
						+sysOrder.biddingNotice+"\");'>查看</a>|<a href='http://127.0.0.1:8080/files/pic/2015/167/16/119_1402905136984.pdf' >下载</a>");
				**//*
				$('#contractReviewShow').html("<a href='javascript:checkFile(\""+sysOrder.contractReview+"\");'>查看</a>|<a href='javascript:downloadFile(\""+sysOrder.contractReview+"\");'>下载</a>");
				$('#contractTxtShow').html("<a href='javascript:checkFile(\""+sysOrder.contractTxt+"\");'>查看</a>|<a href='javascript:downloadFile(\""+sysOrder.contractTxt+"\");'>下载</a>");
				*//**--------------------显示产品列表开始------------------------------*//*
				var productCountShow=0;
				var unitPriceShow=0;
				var priceTaxTotalShow=0;
				//含税单价总计(本位币)
				var ftaxpriceShow=0;
				//价税合计总合计(本位币)
				var priceTaxTotalRMShow=0;
				for(var i=0;i<productList.length;i++){
					product += '<tr id="producttr'+(i+1)+'">';
					product += '<td>'+(i+1)+'</td>';
					product += '<td>'+replaceNull(productList[i].productCode)+'</td>';
					//产品名
					product += '<td>'+replaceNull(productList[i].productName)+'</td>';
					//对外销售名
					product += '<td>'+replaceNull(productList[i].outSaleName)+'</td>';
					//材质
					//product += '<td>'+replaceNull(productList[i].material)+'</td>';
					//材质名
					product += '<td>'+replaceNull(productList[i].materialname)+'</td>';
					//执行标准
					product += '<td>'+replaceNull(productList[i].excuteStandard)+'</td>';
					//规格型号
					product += '<td>'+replaceNull(productList[i].specifications)+'</td>';
					//分类
					product += '<td>'+replaceNull(productList[i].productType )+'</td>';
					
					//PL产品添加按钮
					//遍历PL产品找到对应的父产品
					var orderTrNumber=productList[i].orderTrNumber;
					var pLProductInfo="";
					var arr = new List();
					if(null!=productplList){
						for(var j=0;j<productplList.length;j++){
							if(productplList[j].productId==productList[i].productId){
								var productpl = new Object();//新建对象
								//alert("3:");
								//alert("productLineNum:"+productLineNum);
								productpl.productLineNum=orderTrNumber;
								//alert("3 a:");
								productpl.fmodel=replaceNull(productplList[j].fmodel);//pL4200规格型号
								productpl.fnum=replaceNull(productplList[j].fnum);//pL4200数量
								productpl.fprice=replaceNull(productplList[j].fprice);//pL4200合同价
								productpl.flistprice=replaceNull(productplList[j].flistprice);//pL4200列表价
								//alert("5:");
								productpl.pl3000fmodel=replaceNull(productplList[j].pl3000fmodel);//pl3000规格型号
								productpl.pl3000fnum=replaceNull(productplList[j].pl3000fnum);//pl3000数量
								productpl.pl3000fprice=replaceNull(productplList[j].pl3000fprice);//pl3000合同价
								productpl.pl3000flistprice=replaceNull(productplList[j].pl3000flistprice);//pl3000列表价
								//alert("6:");
								productpl.ssv3500fmodel=replaceNull(productplList[j].ssv3500fmodel);//sSV3500规格型号
								productpl.ssv3500fnum=replaceNull(productplList[j].ssv3500fnum);//sSV3500数量
								productpl.ssv3500fprice=replaceNull(productplList[j].ssv3500fprice);//sSV3500合同价
								productpl.ssv3500flistprice=replaceNull(productplList[j].ssv3500flistprice);//sSV3500列表价
								//alert("7:");
								productpl.pl2000fmodel=replaceNull(productplList[j].pl2000fmodel);//sPL2000规格型号
								productpl.pl2000fnum=replaceNull(productplList[j].pl2000fnum);//sPL2000数量
								productpl.pl2000fprice=replaceNull(productplList[j].pl2000fprice);//sPL2000合同价
								productpl.pl2000flistprice=replaceNull(productplList[j].pl2000flistprice);//sPL2000列表价
								//alert("8:");
								arr.add(productpl);
							}
						}
					}
					var json = JSON.stringify(arr);
					if(0<json.length&&'{"value":[]}'!=json){
						pLProductInfo=json;
					}
					
					var pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts"  />';
					if(null==pLProductInfo||""==pLProductInfo){
					}else{
						pLProductInputStr='<input type="hidden" id="pLProduct'+replaceNull(productList[i].orderTrNumber)+'" name="pLProducts" value='+pLProductInfo+' />';
					}
					product += '<td><a href="javascript:openShowPLDiv('+replaceNull(productList[i].orderTrNumber)+','+'2'+');"><img src="'+ctx+'/images/view.png" height="35%" width="35%" border="0" /></a>'+
					//PL弹出层中的值,作为隐藏域,是从数据库查出来的需要处理
					pLProductInputStr+
					'</td>';
					
					
					
					//项目名称
					product += '<td>'+replaceNull(productList[i].proProjectName)+'</td>';
					//辅助属性
					product += '<td>'+replaceNull(productList[i].assistAttribute)+'</td>';
//					//单位
//					product += '<td>'+replaceNull(productList[i].productUnit)+'</td>';
					//单位名
					product += '<td>'+replaceNull(productList[i].measureunitname)+'</td>';
					//数量
					product += '<td>'+replaceNull(productList[i].productCount)+'</td>';
					

					//产品数量合计
					var productCountTemp=Number(productCountShow)+Number(replaceNull(productList[i].productCount));
					//alert("11"+productCountTemp);
					productCountShow= Number( ( productCountTemp ).toFixed(4) );
					
					//辅助单位
					product += '<td>'+replaceNull(productList[i].assistUnit)+'</td>';
					//转换率
					product += '<td>'+replaceNull(productList[i].convertRate)+'</td>';
					//辅助数量
					product += '<td>'+replaceNull(productList[i].productAssistCount)+'</td>';
					//不含税单价
					product += '<td>'+replaceNull(productList[i].unitRemoveTax)+'</td>';
					//含税单价
					product += '<td>'+replaceNull(productList[i].unitPrice)+'</td>';
					//含税单价(本位币)
					product += '<td>'+replaceNull(productList[i].ftaxprice)+'</td>';
					
					//自动计算含税单价合计
					var unitPriceTemp=Number(unitPriceShow)+Number(replaceNull(productList[i].unitPrice));
					unitPriceShow= Number( ( unitPriceTemp ).toFixed(4) );
					
					//自动计算含税单价合计
					var ftaxpriceRMTemp=Number(ftaxpriceShow)+Number(replaceNull(productList[i].ftaxprice));
					ftaxpriceShow= Number( ( ftaxpriceRMTemp ).toFixed(4) );
					
					//begin 新需求增加
					//服务费 servicecharge  
					product += '<td>'+replaceNull(productList[i].servicecharge)+'</td>';
					//列表价 	
					product += '<td>'+replaceNull(productList[i].listprice)+'</td>';
					//结算价 	
					product += '<td>'+replaceNull(productList[i].balanceprice)+'</td>';
					//end 新需求增加
					//金额
					product += '<td>'+replaceNull(productList[i].totalFee)+'</td>';
					//金额(本币)
					product += '<td>'+replaceNull(productList[i].famountfor)+'</td>';
					
					//税率
					product += '<td>'+replaceNull(productList[i].taxRate)+'</td>';
					//折扣率
					product += '<td>'+replaceNull(productList[i].discountRate)+'</td>';
					//折扣
					product += '<td>'+replaceNull(productList[i].discount)+'</td>';
					//折扣(本币)
					product += '<td>'+replaceNull(productList[i].fbusinessdiscount)+'</td>';
					//实际含税单价
					//product += '<td>'+replaceNull(productList[i].factUnitPrice)+'</td>';
					
					//销项税额
					product += '<td>'+replaceNull(productList[i].saleTax)+'</td>';
					//销项税额(本币)
					product += '<td>'+replaceNull(productList[i].ftax)+'</td>';
					//价税合计
					product += '<td>'+replaceNull(productList[i].priceTaxTotal)+'</td>';
					//价税合计(本币)
					product += '<td>'+replaceNull(productList[i].priceTaxTotalRM)+'</td>';
					
					//价税总合计
					var priceTaxTotalTemp=Number(priceTaxTotalShow)+Number(replaceNull(productList[i].priceTaxTotal));
					//alert("11"+priceTaxTotalTemp);
					priceTaxTotalShow= Number( ( priceTaxTotalTemp ).toFixed(2) );
					
					//价税总合计
					var priceTaxTotalRMTemp=Number(priceTaxTotalRMShow)+Number(replaceNull(productList[i].priceTaxTotalRM));
					//alert("11"+priceTaxTotalTemp);
					priceTaxTotalRMShow= Number( ( priceTaxTotalRMTemp ).toFixed(2) );
					
					product += '<td>'+replaceNull(productList[i].deliveryTime)+'</td>';
					product += '<td>'+replaceNull(productList[i].adviceDeliveryTime)+'</td>';
					
					product += '<td>'+replaceNull(productList[i].qualityFeeRate)+'</td>';
					product += '<td>'+replaceNull(productList[i].qualityFee)+'</td>';
					
					
					product += '<td>'+replaceNull(productList[i].makeNumberCode)+'</td>';
					product += '<td>'+replaceNull(productList[i].taskCode)+'</td>';
					product += '<td>'+replaceNull(productList[i].assistUnitOutHouseCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].customBOM)+'</td>';
					product += '<td>'+replaceNull(productList[i].costObj)+'</td>';
					product += '<td>'+replaceNull(productList[i].billCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].assistCompanyBillCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].assistCompanyFitCount)+'</td>';
					//product += '<td>'+replaceNull(productList[i].orderTrNumber)+'</td>';
					
					product += '<td>'+replaceNull(productList[i].baseCompanyFitCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].fitCount)+'</td>';
					product += '<td>'+replaceNull(productList[i].remarks)+'</td>';
					product += '</tr>';
				}
				//显示数量合计
				$('#productCountShow').html(productCountShow+'');
				//显示含税单价合计
				$('#unitPriceShow').html(unitPriceShow+'');
				
				//显示含税单价总合计(本位币)
				$('#ftaxpriceShow').html(ftaxpriceShow+'');
				
				//显示含税单价合计
				$('#priceTaxTotalShow').html(priceTaxTotalShow+'');
				//显示含税单价合计
				$('#priceTaxTotalRMShow').html(priceTaxTotalRMShow+'');
				
				
				$('#productDetail').append(product);
				*//**--------------------显示产品列表结束------------------------------*//*
				*//**--------------------显示应收款管理列表开始-----------------------------*//*
				for(var i=0;i<collectPayList.length;i++){
					collectPay += '<tr id="collectpaytr'+(i+1)+'">';
					collectPay += '<td>'+(i+1)+'</td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].planCollectTime)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].shouldCollectTime)+'</span></td>';
					collectPay += '<td><span class="shouldCollectFee">'+replaceNull(collectPayList[i].shouldCollectFee)+'</span></td>';
					collectPay += '<td><span class="shouldCollectFeeRm">'+replaceNull(collectPayList[i].shouldCollectFeeRm)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].collectPayType)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].guaranteeLetterType)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].guaranteeLetterStart)+'</span></td>';
					collectPay += '<td><span>'+replaceNull(collectPayList[i].guaranteeLetterEnd)+'</span></td>';
					collectPay += '</tr>';
				}
				$('#collectPayDetail').append(collectPay);
				*//**--------------------显示应收款管理列表结束-----------------------------*//*
				*//**--------------------计算应收款原币和应收款本位币的总和开始------------------------------*//*
				var totalFee= 0;
				var totalFeeRM= 0;
				var shouldCollectFee = $('.shouldCollectFee');
				var shouldCollectFeeRM = $('.shouldCollectFeeRm');
				for(var i=0;i<shouldCollectFee.length;i++){
					if(shouldCollectFee.eq(i).text()!=''){
						totalFee += parseFloat(shouldCollectFee.eq(i).text());//应收款原币总和
					}
					if(shouldCollectFeeRM.eq(i).text()!=''){
						totalFeeRM += parseFloat(shouldCollectFeeRM.eq(i).text());//应收款本位币总和
					}
				}
				$('#shouldTotal').html(totalFee);
				$('#shouldTotalRM').html(totalFeeRM);
				*//**--------------------计算应收款原币和应收款本位币的总和结束------------------------------*//*
			}
		});
	}
}*/

/**
 * 计算应收款总额
 */
function countTotalFee(){
	var totalFee= 0;
	var totalFeeRM= 0;
	var shouldCollectFee = $('input[name="shouldCollectFee"]');
	var shouldCollectFeeRM = $('input[name="shouldCollectFeeRm"]');
	var exchangeRate=$('#sysOrderForm select[id="exchangeRate"] option:selected').val();
	//alert("exchangeRate:"+exchangeRate);
	var strs= new Array(); //定义一数组 
	strs=exchangeRate.split("|"); //字符分割
	exchangeRate=parseFloat(strs[0]);
	//alert("exchangeRate:"+exchangeRate);
	for(var i=0;i<shouldCollectFee.length;i++){
		if(shouldCollectFee.eq(i).val()!=''){
			totalFee += parseFloat(shouldCollectFee.eq(i).val());
			//得到汇率
			var tempshouldCollectFee=parseFloat(shouldCollectFee.eq(i).val());
			var totalShouldCollectFeeRM= (Number( (  exchangeRate*tempshouldCollectFee ).toFixed(2) )  );
			shouldCollectFeeRM.eq(i).val(totalShouldCollectFeeRM+'');
			totalFeeRM+= parseFloat(totalShouldCollectFeeRM+'');
		}
	}
	if('0'!=totalFee+''){
		totalFee=Number( (  totalFee ).toFixed(2) );
	}
	if('0'!=totalFeeRM+''){
		totalFeeRM=Number( (  totalFeeRM ).toFixed(2) );
	}
	$('#shouldTotal').html(totalFee);
	$('#shouldTotalRM').html(totalFeeRM);
}
/**
 * 计算应收款总额(本位币)
 */
function countTotalFeeRM(){
	var totalFee= 0;
	var shouldCollectFeeRM = $('input[name="shouldCollectFeeRm"]');
	for(var i=0;i<shouldCollectFeeRM.length;i++){
		if(shouldCollectFeeRM.eq(i).val()!=''){
			totalFee += parseFloat(shouldCollectFeeRM.eq(i).val());
		}
	}
	$('#shouldTotalRM').html(totalFee);
}
/**
 * 返回系统订单列表
 */
function gotoList(id,type){
	window.location.href = ctx+"/order/sysorder-list.htm";
}
/**
 * 在线预览文件
 * @param path
 */
function checkFile(path){
	var usepath = path.substring(0,path.indexOf("."));
	$.openDiv('checkDiv');
	new FlexPaperViewer(	
			 ctx+'/FlexPaperViewer',
			 //'/FlexPaperViewer',
			 'viewerPlaceHolder', 
			 { 
				 config : {
					 SwfFile : escape(usepath+'.swf'),
					 //SwfFile : escape(usepath+'.swf'),
					 Scale : 0.6, 
					 ZoomTransition : 'easeOut',
					 ZoomTime : 0.5,
					 ZoomInterval : 0.2,
					 FitPageOnLoad : true,
					 FitWidthOnLoad : false,
					 FullScreenAsMaxWindow : false,
					 ProgressiveLoading : false,
					 MinZoomSize : 0.2,
					 MaxZoomSize : 5,
					 SearchMatchAll : false,
					 InitViewMode : 'SinglePage',
					 
					 ViewModeToolsVisible : true,
					 ZoomToolsVisible : true,
					 NavToolsVisible : true,
					 CursorToolsVisible : true,
					 SearchToolsVisible : true,
							
					localeChain: 'en_US'
				 }
			});
}
/**
 * 下载文件
 * @param path 下载的文件的路径
 */
function downloadFile(path){
	  var elemIF = document.createElement("iframe");
	  elemIF.src = ctx+path;
	  //alert("elemIF.src:"+elemIF.src);
	  elemIF.style.display = "none";
	  document.body.appendChild(elemIF);
}
function showDiv(t,e,index){
	var str = '';
	if(index==1){
		str='销项税额=(列表总价(含税)-列表总价(不含税))*折扣率';
	}else if(index==2){
		str='价税合计=列表单价*产品数量';
	}else if(index==3){
		str='结算单价=单价(含税)-服务/工程费单价';
	}else if(index==4){
		str='结算总金额=结算单价(含税)*产品数量/(1+税率%)';
	}else{
		
	}
	var toolTip = "<div id='tooltip'  width='100px' height='12px' style='cursor:hand;color:white;background-color:#98bf21;position:absolute;border:solid #aaa 1px;padding:3px;'>"+str+"</div>";
	 $("body").append(toolTip);
	 $("#tooltip").css({"top" :e.pageY + "px","left" :e.pageX + "px"});
}
function divClose()
{
	$("#tooltip").remove();
}