$(document).ready(function() {
	if($("#ordercodeparam").val()!=null&&$.trim($("#ordercodeparam").val())!=""){
		$("#sysordercode").val($("#ordercodeparam").val());
	}
	$('.spinner.demo').show();
	$('.spinner.demo').css("opacity","0.6").css("zIndex","9999");
	//alert($(".mr-control").css("width"));
	window.simpleTable =$(document).SimpleTable({
		id:'sysorderpage',
		formId: 'queryform',
		pageNo: '1',
		pageSize : '15',
		order: 'desc',
		orderBy: 'contractTime',
		submitForm : submitQueryForm//分页回调函数
		});
	loadOrders();  
});
function submitQueryForm(simpleTable, param){
	loadOrders();
}
/**
 * 查询系统订单信息
 */
function loadOrders() {
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+ '/sysOrder/sys-order!listToJsonNew.htm';
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
			//组装table
			$.each(page.result, function(i, o){
				/**
				 * 
--审核标识 日期 购货单位 单据编号 币别 部门 业务员
select t_sysorder.sysOrderStatus,t_sysorder.contracttime,t_sysorder.checkproject,t_sysorder.orderCode,t_sysorder.cointype,t_sysorder.department,t_sysorder.businessuser from t_sysorder where sysOrderStatus=2 
--产品名称 规格型号 单位 数量 交货日期 产品长代码 实际含税单价 价税合计
select t_product.productName,t_product.specifications,t_product.productunit,t_product.productcount,t_product.advicedeliverytime,
t_product.productCode,t_product.factunitprice,t_product.pricetaxtotal,* from t_product where orderCode='XSHT000591'
				 */
				var products  = o.products;
				if(products!=null&&products.length>0){
					var length = products.length;
					$.each(products, function(j, p){
						if(length==1){
							html += '<tr id="tr'+i+''+j+'" ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td>Y</td>';
							html += '<td>'+(o.contractTime==null?"":formatDate("yyyy-MM-dd",o.contractTime)) +'</td>';
							html += '<td>'+(o.checkProject==null?"":o.checkProject)+'</td>';
							html += '<td>'+o.orderCode+'</td>';
							html += '<td>'+(o.coinType==null?"":o.coinType)+'</td>';
							html += '<td>'+(o.department==null?"":o.department)+'</td>';
							html += '<td>'+(o.businessuser==null?"":o.businessuser)+'</td>';
							html += '<td>'+(p.productName==null?"":p.productName)+'</td>';
							html += '<td>'+(p.specifications==null?"":p.specifications)+'</td>';
							html += '<td>'+(p.productUnit==null?"":p.productUnit)+'</td>';
							html += '<td>'+(p.productCount==null?"":p.productCount)+'</td>';
							html += '<td>'+(p.adviceDeliveryTime==null?"":p.adviceDeliveryTime.substring(0,10))+'</td>';
							html += '<td>'+(p.productCode==null?"":p.productCode)+'</td>';
							html += '<td>'+(p.factUnitPrice==null?"":p.factUnitPrice)+'</td>';
							html += '<td>'+(p.priceTaxTotal==null?"":p.priceTaxTotal)+
							'<input id="orderCode'+i+''+j+'" value="'+(o.orderCode==null?"":o.orderCode)+'" type="hidden"/>'+
							'<input id="assistAttribute'+i+''+j+'" value="'+(p.assistAttribute==null?"":p.assistAttribute)+'"  type="hidden"/>'+
							'<input id="assistUnit'+i+''+j+'" value="'+(p.assistUnit==null?"":p.assistUnit)+'" type="hidden"/>'+
							'<input id="convertRate'+i+''+j+'" value="'+(p.convertRate==null?"":p.convertRate)+'" type="hidden"/>'+
							'<input id="productAssistCount'+i+''+j+'" value="'+(p.productAssistCount==null?"":p.productAssistCount)+'" type="hidden"/>'+
							'<input id="makeNumberCode'+i+''+j+'" value="'+(p.makeNumberCode==null?"":p.makeNumberCode)+'" type="hidden"/>'+
							'<input id="customBOM'+i+''+j+'" value="'+(p.customBOM==null?"":p.customBOM)+'" type="hidden"/>'+
							'<input id="orderdetailId'+i+''+j+'" value="'+(p.productId==null?"":p.productId)+'" type="hidden"/>'
							+'</td>';
							html += '</tr>';
						}else if(length>1&&j==0){
							html += '<tr id="tr'+i+''+j+'"  ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td style="border-bottom:0px;">Y</td>';
							html += '<td style="border-bottom:0px;">'+(o.contractTime==null?"":formatDate("yyyy-MM-dd",o.contractTime)) +'</td>';
							html += '<td style="border-bottom:0px;">'+(o.checkProject==null?"":o.checkProject)+'</td>';
							html += '<td style="border-bottom:0px;">'+o.orderCode+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.coinType==null?"":o.coinType)+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.department==null?"":o.department)+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.businessuser==null?"":o.businessuser)+'</td>';
							html += '<td>'+(p.productName==null?"":p.productName)+'</td>';
							html += '<td>'+(p.specifications==null?"":p.specifications)+'</td>';
							html += '<td>'+(p.productUnit==null?"":p.productUnit)+'</td>';
							html += '<td>'+(p.productCount==null?"":p.productCount)+'</td>';
							html += '<td>'+(p.adviceDeliveryTime==null?"":p.adviceDeliveryTime.substring(0,10))+'</td>';
							html += '<td>'+(p.productCode==null?"":p.productCode)+'</td>';
							html += '<td>'+(p.factUnitPrice==null?"":p.factUnitPrice)+'</td>';
							html += '<td>'+(p.priceTaxTotal==null?"":p.priceTaxTotal)+
							'<input id="orderCode'+i+''+j+'" value="'+(o.orderCode==null?"":o.orderCode)+'" type="hidden"/>'+
							'<input id="assistAttribute'+i+''+j+'" value="'+(p.assistAttribute==null?"":p.assistAttribute)+'"  type="hidden"/>'+
							'<input id="assistUnit'+i+''+j+'" value="'+(p.assistUnit==null?"":p.assistUnit)+'" type="hidden"/>'+
							'<input id="convertRate'+i+''+j+'" value="'+(p.convertRate==null?"":p.convertRate)+'" type="hidden"/>'+
							'<input id="productAssistCount'+i+''+j+'" value="'+(p.productAssistCount==null?"":p.productAssistCount)+'" type="hidden"/>'+
							'<input id="makeNumberCode'+i+''+j+'" value="'+(p.makeNumberCode==null?"":p.makeNumberCode)+'" type="hidden"/>'+
							'<input id="customBOM'+i+''+j+'" value="'+(p.customBOM==null?"":p.customBOM)+'" type="hidden"/>'+
							'<input id="orderdetailId'+i+''+j+'" value="'+(p.productId==null?"":p.productId)+'" type="hidden"/>'
							+'</td>';
							html += '</tr>';
						}else if(length>1&&j<length-1&&j>0){
							html += '<tr id="tr'+i+''+j+'" ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td  style="border-bottom:0px;"></td>';
							html += '<td style="border-bottom:0px;"></td>';
							html += '<td style="border-bottom:0px;"></td>';
							html += '<td style="border-bottom:0px;"></td>';
							html += '<td style="border-bottom:0px;"></td>';
							html += '<td style="border-bottom:0px;"></td>';
							html += '<td style="border-bottom:0px;"></td>';
							html += '<td>'+(p.productName==null?"":p.productName)+'</td>';
							html += '<td>'+(p.specifications==null?"":p.specifications)+'</td>';
							html += '<td>'+(p.productUnit==null?"":p.productUnit)+'</td>';
							html += '<td>'+(p.productCount==null?"":p.productCount)+'</td>';
							html += '<td>'+(p.adviceDeliveryTime==null?"":p.adviceDeliveryTime.substring(0,10))+'</td>';
							html += '<td>'+(p.productCode==null?"":p.productCode)+'</td>';
							html += '<td>'+(p.factUnitPrice==null?"":p.factUnitPrice)+'</td>';
							html += '<td>'+(p.priceTaxTotal==null?"":p.priceTaxTotal)+
							'<input id="orderCode'+i+''+j+'" value="'+(o.orderCode==null?"":o.orderCode)+'" type="hidden"/>'+
							'<input id="assistAttribute'+i+''+j+'" value="'+(p.assistAttribute==null?"":p.assistAttribute)+'"  type="hidden"/>'+
							'<input id="assistUnit'+i+''+j+'" value="'+(p.assistUnit==null?"":p.assistUnit)+'" type="hidden"/>'+
							'<input id="convertRate'+i+''+j+'" value="'+(p.convertRate==null?"":p.convertRate)+'" type="hidden"/>'+
							'<input id="productAssistCount'+i+''+j+'" value="'+(p.productAssistCount==null?"":p.productAssistCount)+'" type="hidden"/>'+
							'<input id="makeNumberCode'+i+''+j+'" value="'+(p.makeNumberCode==null?"":p.makeNumberCode)+'" type="hidden"/>'+
							'<input id="customBOM'+i+''+j+'" value="'+(p.customBOM==null?"":p.customBOM)+'" type="hidden"/>'+
							'<input id="orderdetailId'+i+''+j+'" value="'+(p.productId==null?"":p.productId)+'" type="hidden"/>'
							+'</td>';
							html += '</tr>';
						}else{
							html += '<tr id="tr'+i+''+j+'" ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td></td>';
							html += '<td></td>';
							html += '<td></td>';
							html += '<td></td>';
							html += '<td></td>';
							html += '<td></td>';
							html += '<td></td>';
							html += '<td>'+(p.productName==null?"":p.productName)+'</td>';
							html += '<td>'+(p.specifications==null?"":p.specifications)+'</td>';
							html += '<td>'+(p.productUnit==null?"":p.productUnit)+'</td>';
							html += '<td>'+(p.productCount==null?"":p.productCount)+'</td>';
							html += '<td>'+(p.adviceDeliveryTime==null?"":p.adviceDeliveryTime.substring(0,10))+'</td>';
							html += '<td>'+(p.productCode==null?"":p.productCode)+'</td>';
							html += '<td>'+(p.factUnitPrice==null?"":p.factUnitPrice)+'</td>';
							html += '<td>'+(p.priceTaxTotal==null?"":p.priceTaxTotal)+
							'<input id="orderCode'+i+''+j+'" value="'+(o.orderCode==null?"":o.orderCode)+'" type="hidden"/>'+
							'<input id="assistAttribute'+i+''+j+'" value="'+(p.assistAttribute==null?"":p.assistAttribute)+'"  type="hidden"/>'+
							'<input id="assistUnit'+i+''+j+'" value="'+(p.assistUnit==null?"":p.assistUnit)+'" type="hidden"/>'+
							'<input id="convertRate'+i+''+j+'" value="'+(p.convertRate==null?"":p.convertRate)+'" type="hidden"/>'+
							'<input id="productAssistCount'+i+''+j+'" value="'+(p.productAssistCount==null?"":p.productAssistCount)+'" type="hidden"/>'+
							'<input id="makeNumberCode'+i+''+j+'" value="'+(p.makeNumberCode==null?"":p.makeNumberCode)+'" type="hidden"/>'+
							'<input id="customBOM'+i+''+j+'" value="'+(p.customBOM==null?"":p.customBOM)+'" type="hidden"/>'+
							'<input id="orderdetailId'+i+''+j+'" value="'+(p.productId==null?"":p.productId)+'" type="hidden"/>'
							+'</td>';
							html += '</tr>';
						}
					});
				}
				
			});
			$('#data-body').html(html);
			$('.spinner.demo').fadeOut('slow');
		}
	});
}


function toAddCheckProject(){
	var offsettop=$("#checkProjectName").offset().top;   
 	var offsetleft=$("#checkProjectName").offset().left;
	$("#selectCheckProjectDiv").css({position: "absolute",'top':offsettop+25,'left':offsetleft-40}); 
	$("#selectCheckProjectDiv").css("display","");
	var name = $("#checkProjectName").val();
	var data = 'organizationQuery.fname='+name;
	var html='<td><select id="checkProjectSelect" onchange="addCheckProject();" style="width: 230px; height: 120px;background-color: #ccc"; multiple="true">';
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

function addCheckProject(){
	var selectValue = $('#checkProjectSelect').val();
	var selectTxt = $("#checkProjectSelect").find('option:selected').text();
	$('#checkProjectName').val(selectTxt);
	$('#checkProjectId').val(selectValue);
	$("#selectCheckProjectDiv").css("display","none");
}


function selectPro(i){
	var tds = $("#tr"+i).children('td');
	var itemcode="";
	var count = "";
	var ordercode="";
	$.each(tds,function(i,o){
		if($(this).html()!=null&&$(this).html()!=""){
			if(i==3){
				//ordercode =$(this).html(); 
			}else if(i==10){
				count = $(this).html();
			}else if(i==12){
				itemcode = $(this).html();
			}else{
				
			}
		}
	});
	var lst = new Array();
	if($("#type").val()==1){
		//物料编码   数量   源单单号   辅助属性 assistAttribute 辅助单位 assistUnit 换算率 convertRate 辅助数量 productAssistCount 制令号 makeNumberCode 客户BOM customBOM
		var assistAttribute = $("#assistAttribute"+i).val()==null?"":$("#assistAttribute"+i).val();
		var assistUnit = $("#assistUnit"+i).val()==null?"":$("#assistUnit"+i).val();
		var convertRate = $("#convertRate"+i).val()==null?"":$("#convertRate"+i).val();
		var productAssistCount = $("#productAssistCount"+i).val()==null?"":$("#productAssistCount"+i).val();
		var makeNumberCode = $("#makeNumberCode"+i).val()==null?"":$("#makeNumberCode"+i).val();
		var customBOM = $("#customBOM"+i).val()==null?"":$("#customBOM"+i).val();
		ordercode = $("#orderCode"+i).val()==null?"":$("#orderCode"+i).val();
		var orderdetailId = $("#orderdetailId"+i).val()==null?"":$("#orderdetailId"+i).val();
		lst.push(itemcode);
		lst.push(count);
		lst.push(ordercode);
		lst.push(assistAttribute);
		lst.push(assistUnit);
		lst.push(convertRate);
		lst.push(productAssistCount);
		lst.push(makeNumberCode);
		lst.push(customBOM);
		lst.push(orderdetailId);
	}else if($("#type").val()==2){
		ordercode = $("#orderCode"+i).val()==null?"":$("#orderCode"+i).val();
		var orderdetailId = $("#orderdetailId"+i).val()==null?"":$("#orderdetailId"+i).val();
		lst.push(ordercode);
		lst.push(itemcode);
		lst.push(count);
		lst.push(orderdetailId);
	}
	opener.showProValue(lst);
	window.close();
}