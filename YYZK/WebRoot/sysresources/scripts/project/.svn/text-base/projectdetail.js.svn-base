
function loadProject(proid){
	showProject(proid);
	
}
//修改项显示
function showProject(proid){
	//修改时将信息显示在页面上
	var urlshow = ctx+"/projectInfo/project-info!showToJson.htm?projectInfoId="+proid;
	$.webAjax( {
		type : "post",
		url : urlshow,
		success : function(data) {
			data = $.parseJSON(data);
			var o = data.model;
			var bomList = data.bomList;
			if(data.resultInfo[0]=='0'){
				//先给复选框赋值
				$("#productType").html(o.productType==null?"":o.productType);
				$("#pressurestructurename").html(o.pressurestructurename==null?"":o.pressurestructurename);
				$("#meterstructurename").html(o.meterstructurename==null?"":o.meterstructurename);
				var sealMaterial="";
				if(o.sealMaterial=="1"){
					sealMaterial = "聚四氟乙烯";
				}
				if(o.sealMaterial=="2"){
					sealMaterial = "金属缠绕垫";
				}
				$("#sealMaterial").html(sealMaterial);
				var priceUnit="";
				if(o.priceUnit=="1"){
					priceUnit = "RMB";
				}
				if(o.priceUnit=="2"){
					priceUnit = "USD$";
				}
				$("#priceUnit").html(o.priceUnit==null?"":o.priceUnit);
				//再给输入框赋值
				$("#projectInfoId").attr("value",(o.id==null?"":o.id));
				$("#userName").html(o.userName==null?"":o.userName);
				$("#projectName").html(o.projectName==null?"":o.projectName);
				$("#productName").html(o.productName==null?"":o.productName);
				$("#deliveryDate").html(o.deliveryDate==null?"":replaceNull(formatDate("yyyy-MM-dd",o.deliveryDate)));
				$("#productMode").html(o.productMode==null?"":o.productMode);
				$("#instructNum").html(o.instructNum==null?"":o.instructNum);
				$("#designPress").html(o.designPress==null?"":o.designPress);
				$("#designPressunit").html(o.designPressunit==null?"":o.designPressunit);
				$("#designPressa").html(o.designPressa==null?"":o.designPressa);
				$("#designPressunita").html(o.designPressunita==null?"":o.designPressunita);
				$("#designTemp").html(o.designTemp==null?"":o.designTemp);
				$("#designTempa").html(o.designTempa==null?"":o.designTempa);
				$("#maxPress").html(o.maxPress==null?"":o.maxPress);
				$("#maxPressunit").html(o.maxPressunit==null?"":o.maxPressunit);
				$("#maxPressa").html(o.maxPressa==null?"":o.maxPressa);
				$("#maxPressunita").html(o.maxPressunita==null?"":o.maxPressunita);
				$("#maxTemp").html(o.maxTemp==null?"":o.maxTemp);
				$("#maxTempa").html(o.maxTempa==null?"":o.maxTempa);
				$("#designFlow").html(o.designFlow==null?"":o.designFlow);
				$("#designFlowRange").html(o.designFlowRange==null?"":o.designFlowRange);
				$("#inPress").html(o.inPress==null?"":o.inPress);
				$("#inPressunit").html(o.inPressunit==null?"":o.inPressunit);
				$("#inPressrange").html(o.inPressrange==null?"":o.inPressrange);
				$("#inPressrangeunit").html(o.inPressrangeunit==null?"":o.inPressrangeunit);
				$("#outPress").html(o.outPress==null?"":o.outPress);
				$("#outPressunit").html(o.outPressunit==null?"":o.outPressunit);
				$("#outPressRange").html(o.outPressRange==null?"":o.outPressRange);
				$("#outPressRangeunit").html(o.outPressRangeunit==null?"":o.outPressRangeunit);
				$("#spreadPress").html(o.spreadPress==null?"":o.spreadPress);
				$("#spreadPressunit").html(o.spreadPressunit==null?"":o.spreadPressunit);
				$("#spreadPressRange").html(o.spreadPressRange==null?"":o.spreadPressRange);
				$("#spreadPressRangeunit").html(o.spreadPressRangeunit==null?"":o.spreadPressRangeunit);
				$("#cutPress").html(o.cutPress==null?"":o.cutPress);
				$("#cutPressunit").html(o.cutPressunit==null?"":o.cutPressunit);
				$("#cutPressRange").html(o.cutPressRange==null?"":o.cutPressRange);
				$("#cutPressRangeunit").html(o.cutPressRangeunit==null?"":o.cutPressRangeunit);
				$("#workMedia").html(o.workMedia==null?"":o.workMedia);
				$("#paramFolw").html(o.paramFolw==null?"":o.paramFolw);
				$("#paramPrecision").html(o.paramPrecision==null?"":o.paramPrecision);
				$("#coefficient").html(o.coefficient==null?"":o.coefficient);
				$("#allowance").html(o.allowance==null?"":o.allowance);
				$("#mainMedia1").html(o.mainMedia1==null?"":o.mainMedia1);
				$("#mainMedia2").html(o.mainMedia2==null?"":o.mainMedia2);
				$("#testRatio1").html(o.testRatio1==null?"":o.testRatio1);
				$("#testRatio2").html(o.testRatio2==null?"":o.testRatio2);
				$("#testRatio3").html(o.testRatio3==null?"":o.testRatio3);
				$("#testRatio4").html(o.testRatio4==null?"":o.testRatio4);
				$("#testRequire1").html(o.testRequire1==null?"":o.testRequire1);
				$("#testRequire2").html(o.testRequire2==null?"":o.testRequire2);
				$("#testRequire3").html(o.testRequire3==null?"":o.testRequire3);
				$("#testRequire4").html(o.testRequire4==null?"":o.testRequire4);
				$("#testStandard").html(o.testStandard==null?"":o.testStandard);
				$("#strengthTest").html(o.strengthTest==null?"":o.strengthTest);
				$("#strengthTestunit").html(o.strengthTestunit==null?"":o.strengthTestunit);
				$("#strengthTesta").html(o.strengthTesta==null?"":o.strengthTesta);
				$("#strengthTestaunit").html(o.strengthTestaunit==null?"":o.strengthTestaunit);
				$("#airtightTest").html(o.airtightTest==null?"":o.airtightTest);
				$("#airtightTestunit").html(o.airtightTestunit==null?"":o.airtightTestunit);
				$("#airtightTesta").html(o.airtightTesta==null?"":o.airtightTesta);
				$("#airtightTestaunit").html(o.airtightTestaunit==null?"":o.airtightTestaunit);
				$("#strengthMedia").html(o.strengthMedia==null?"":o.strengthMedia);
				$("#airtightMedia").html(o.airtightMedia==null?"":o.airtightMedia);
				$("#itemUsername").html(o.userName==null?"":o.userName);
				$("#quoteOrderDate").html(o.quoteOrderDate==null?"":replaceNull(formatDate("yyyy-MM-dd",o.quoteOrderDate)));
				$("#version").html(o.version==null?"":o.version);
				$("#itemProjectName").html(o.projectName==null?"":o.projectName);
				$("#validityDate").html(o.validityDate==null?"":o.validityDate+"天");
				$("#quoteOrderNo").html(o.quoteOrderNo==null?"":o.quoteOrderNo);
				$("#itemProductMode").html(o.productMode==null?"":o.productMode);
				$("#discountCoeff").html(o.discountCoeff==null?"":o.discountCoeff);
				var html='';
				var bidtotalprice=0;
				var listtotalprice=0;
				var costtotalprice=0;
				if(bomList!=null){
					$.each(bomList,function(i,bom){
						bidtotalprice = bidtotalprice+bom.bidtotalprice;
						listtotalprice = listtotalprice +bom.listtotalprice;
						costtotalprice = costtotalprice + bom.costtotalprice;
						
						html+='<tr align="center" id="tr'+(i+1)+'">';
						html+='<td>'+(i+1)+'</td>';
						html+='<td >'+(bom.itemcode==null?"":bom.itemcode)+'</td>';
						html+='<td>'+(bom.itemname==null?"":bom.itemname)+'</td>';
						html+='<td>'+(bom.fmodel==null?"":bom.fmodel)+'</td>';
						html+='<td>'+(bom.fdescript==null?"":bom.fdescript)+'</td>';
						var str1=(bom.itemname==null?"":bom.itemname)+(bom.fmodel==null?"":bom.fmodel)+(bom.fdescript==null?"":bom.fdescript);
						var str2 = (bom.fmodel==null?"":bom.fmodel)+(bom.fdescript==null?"":bom.fdescript);
						html+='<td>'+str1+'</td>';
						html+='<td>'+str2+'</td>';
						html+='<td>'+(bom.flevel==null?"":bom.flevel)+'</td>';
						html+='<td>'+(bom.fposition==null?"":bom.fposition)+'</td>';
						html+='<td>'+(bom.fmaker==null?"":bom.fmaker)+'</td>';
						html+='<td>'+(bom.srcarea==null?"":bom.srcarea)+'</td>';
						html+='<td>'+(bom.unit==null?"":bom.unit)+'</td>';
						html+='<td>'+(bom.fnum==null?"":bom.fnum)+'</td>';
						html+='<td>'+(bom.bidprice==null?"":bom.bidprice)+'</td>';
						html+='<td>'+(bom.bidtotalprice==null?"":bom.bidtotalprice)+'</td>';
						html+='<td>'+(bom.factor==null?"":bom.factor)+'</td>';
						html+='<td>'+(bom.listprice==null?"":bom.listprice)+'</td>';
						html+='<td>'+(bom.listtotalprice==null?"":bom.listtotalprice)+'</td>';
						html+='<td>'+(bom.costprice==null?"":bom.costprice)+'</td>';
						html+='<td>'+(bom.costtotalprice==null?"":bom.costtotalprice)+'</td>';
						html+='</tr>';
					});
					
					html+='<tr align="center"><td>合计</td><td colspan="12"></td><td>合计</td><td>'+bidtotalprice+'</td><td></td><td>合计</td><td>'+listtotalprice+'</td><td>合计</td><td>'+costtotalprice+'</td>'
					$('#projectDetail').html(html);
				}
			}
		}
	});
}


var xval;
function block_viewport() {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.1, text:'请稍等...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}
//导出项目信息和设备清单
function exportAll(){
	var checkCols = $("input[name='exportcols']:checked");
	if(checkCols==null||checkCols.length<=0){
		alert("请选择要导出的列");
		return;
	}else{
		block_viewport();
		var exportCols="";
		$.each(checkCols, function(i, o){	
			if(i==(checkCols.length-1)){
				exportCols+=$(o).val();
			}else{
				exportCols+=$(o).val()+",";
			}
		});
		var proid =  $("#projectInfoId").val();	 	
	 	var elemIF = document.createElement("iframe");
	 	elemIF.src = ctx+"/exportProject/exportAll.htm?projectInfoId="+proid+"&exportCols="+exportCols;
	 	elemIF.style.display = "none";
	 	document.body.appendChild(elemIF);
	 	xval.remove();
	}
}
//导出项目信息及参数
function exportProInfo(){
	block_viewport();
	var proid =  $("#projectInfoId").val();	 	
 	var elemIF = document.createElement("iframe");
 	elemIF.src = ctx+"/exportProject/export1.htm?projectInfoId="+proid;
 	elemIF.style.display = "none";
 	document.body.appendChild(elemIF);
 	xval.remove();
}
//导出设备清单
function exportProDetail(){
	var checkCols = $("input[name='exportcols']:checked");
	if(checkCols==null||checkCols.length<=0){
		alert("请选择要导出的列");
		return;
	}else{
		block_viewport();
		var exportCols="";
		$.each(checkCols, function(i, o){	
			if(i==(checkCols.length-1)){
				exportCols+=$(o).val();
			}else{
				exportCols+=$(o).val()+",";
			}
		});
		var proid =  $("#projectInfoId").val();	 	
	 	var elemIF = document.createElement("iframe");
	 	elemIF.src = ctx+"/exportProject/export2.htm?projectInfoId="+proid+"&exportCols="+exportCols;
	 	elemIF.style.display = "none";
	 	document.body.appendChild(elemIF);
	 	xval.remove();
	}
}