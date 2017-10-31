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