function addItemcode(){
	showA();
	//弹出物料编码选择框
	window.open('selectitem.htm?type=0', 'newwindow', 'height=650, width=1250, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
}
//每次调用下showA,获取当前页面中物料名称为空的文本框行,弹出框点击保存后,调用showValue时接收 id 来赋值
var id="";
function showA(){
	var list = $('input[name="projectBom.itemcodes"]');
	for(var i = 0;i<list.length;i++){
		if(null==$(list[i]).val().trim() || ""==$(list[i]).val().trim()){
			id = $(list[i]).attr("id") ;
			var idlength=id.length;
			id=id.substring(8, idlength);
			return;
		}
	}
}
function showValue(lst){
	if(lst.length>0){
		
		$("#itemcode"+id).val(lst[0]==null?"":lst[0]);
		$("#itemname"+id).val(lst[1]==null?"":lst[1]);
		$("#fmodel"+id).val(lst[2]==null?"":lst[2]);
		$("#flevel"+id).val(lst[3]==null?"":lst[3]);
		$("#fmaker"+id).val(lst[4]==null?"":lst[4]);
		$("#srcarea"+id).val(lst[5]==null?"":lst[5]);
		$("#listprice"+id).val(lst[6]==null?"":lst[6]);
		$("#costprice"+id).val(lst[7]==null?"":lst[7]);
		$("#fdescript"+id).val(lst[8]==null?"":lst[8]);
		var listprice = lst[6];
		if(listprice!=null||listprice!=""){
			var discountcoeff = $("#discountcoeff").val();
			if(discountcoeff!=null&&discountcoeff!=""){
				var sum = (listprice) * (discountcoeff);
				var t = sum.toFixed(0)
				$('#bidprice'+id).attr("value",t);
			}
			
		}
	}
}

function loadProject(proid){
	//加载结构型式数据（拼写html复选框：调压部分和计量部分）
	var html='<span>调压部分：</span>';
	var html1='<span>计量部分：</span>';
	var url = ctx+"/structure/structure!listPressure.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.strList;
			if(data.resultInfo[0]=='0')
			{
				$.each(page,function(i,o){
					if(o.structuretype!=null&&o.structuretype=="1"){
						if(o.isuse!=null&&o.isuse==1){
							html+='<input type="checkbox" name="pressureStructure" disabled="disabled"  value="'+o.id+'">'+o.structurename+'</input>';
						}else if(o.isuse!=null&&o.isuse==0){
							html+='<input type="checkbox" name="pressureStructure" value="'+o.id+'">'+o.structurename+'</input>';
						}
					}else if(o.structuretype!=null&&o.structuretype=="2"){
						if(o.isuse!=null&&o.isuse==1){
							html1+='<input type="checkbox" name="meterStructure" disabled="disabled"  value="'+o.id+'">'+o.structurename+'</input>';
						}else if(o.isuse!=null&&o.isuse==0){
							html1+='<input type="checkbox" name="meterStructure" value="'+o.id+'">'+o.structurename+'</input>';
						}
						
					}
				});
				$('#pressuretd').html(html);
				$('#metertd').html(html1);
			}
			loaditemwait();
			showProject(proid);
		}
	});
	
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
		if(data.resultInfo[0]=='1'){
			//formatDate("yyyy-MM-dd",o.quoteorderdate)将数据库中的日期转为"yyyy-MM-dd"此格式的字符串型显示
			$('#quoteOrderDate').attr("value",(o.quoteOrderDate==null?"":o.quoteOrderDate));
			$('#version').attr("value",(o.version==null?"":o.version));
		}
		if(data.resultInfo[0]=='0'&&o!=null)
			{	
			/**
			 * 
userName projectName productName deliveryDate(date) productMode productType(复选框)  pressureStructure(复选框) meterStructure（复选框） 
instructNum  designPress 
designPressunit designPressa designPressunita designTemp designTempa maxPress maxPressunit
maxPressa maxPressunita maxTemp maxTempa designFlow designFlowRange inPress inPressunit  inPressrange 
inPressrangeunit outPress outPressunit outPressRange outPressRangeunit spreadPress  spreadPressunit
spreadPressRange spreadPressRangeunit cutPress cutPressunit cutPressRange cutPressRangeunit
workMedia paramFolw paramPrecision coefficient allowance  sealMaterial（复选框） mainMedia1
mainMedia2 testRatio1 testRatio2 testRatio3 testRatio4 testRequire1 testRequire2 testRequire3 testRequire4
testStandard strengthTest strengthTestunit strengthTesta strengthTestaunit airtightTest airtightTestunit
airtightTesta airtightTestaunit strengthMedia airtightMedia 

itemUsername(userName)   quoteOrderDate  version  itemProjectName(projectName) validityDate quoteOrderNo
itemProductMode(productMode)  priceUnit(复选框) discountCoeff
			 */
				//先给复选框赋值
				if(o.productType){
					$('input[name="productType"]').each(function(){
						if($(this).val()==o.productType){
							$(this).attr("checked",'checked');
						}else{
							$(this).removeAttr("checked");
						}
					});
				}
				if(o.pressureStructure){
					$('input[name="pressureStructure"]').each(function(){
						if($(this).val()==o.pressureStructure){
							$(this).attr("checked",'checked');
						}else{
							$(this).removeAttr("checked");
						}
					});
				}
				if(o.meterStructure){
					$('input[name="meterStructure"]').each(function(){
						if($(this).val()==o.meterStructure){
							$(this).attr("checked",'checked');
						}else{
							$(this).removeAttr("checked");
						}
					});
				}
				if(o.sealMaterial){
					$('input[name="sealMaterial"]').each(function(){
						if($(this).val()==o.sealMaterial){
							$(this).attr("checked",'checked');
						}else{
							$(this).removeAttr("checked");
						}
					});
				}
				if(o.priceUnit){
					$('input[name="priceUnit"]').each(function(){
						if($(this).val()==o.priceUnit){
							$(this).attr("checked",'checked');
						}else{
							$(this).removeAttr("checked");
						}
					});
				}
				
				//再给输入框赋值
				$("#id").attr("value",(o.id==null?"":o.id));
				$("#userName").attr("value",(o.userName==null?"":o.userName));
				$("#projectName").attr("value",(o.projectName==null?"":o.projectName));
				$("#productName").attr("value",(o.productName==null?"":o.productName));
				$("#deliveryDate").attr("value",(o.deliveryDate==null?"":replaceNull(formatDate("yyyy-MM-dd",o.deliveryDate))));
				$("#productMode").attr("value",(o.productMode==null?"":o.productMode));
				$("#instructNum").attr("value",(o.instructNum==null?"":o.instructNum));
				$("#designPress").attr("value",(o.designPress==null?"":o.designPress));
				$("#designPressunit").attr("value",(o.designPressunit==null?"":o.designPressunit));
				$("#designPressa").attr("value",(o.designPressa==null?"":o.designPressa));
				$("#designPressunita").attr("value",(o.designPressunita==null?"":o.designPressunita));
				$("#designTemp").attr("value",(o.designTemp==null?"":o.designTemp));
				$("#designTempa").attr("value",(o.designTempa==null?"":o.designTempa));
				$("#maxPress").attr("value",(o.maxPress==null?"":o.maxPress));
				$("#maxPressunit").attr("value",(o.maxPressunit==null?"":o.maxPressunit));
				$("#maxPressa").attr("value",(o.maxPressa==null?"":o.maxPressa));
				$("#maxPressunita").attr("value",(o.maxPressunita==null?"":o.maxPressunita));
				$("#maxTemp").attr("value",(o.maxTemp==null?"":o.maxTemp));
				$("#maxTempa").attr("value",(o.maxTempa==null?"":o.maxTempa));
				$("#designFlow").attr("value",(o.designFlow==null?"":o.designFlow));
				$("#designFlowRange").attr("value",(o.designFlowRange==null?"":o.designFlowRange));
				$("#inPress").attr("value",(o.inPress==null?"":o.inPress));
				$("#inPressunit").attr("value",(o.inPressunit==null?"":o.inPressunit));
				$("#inPressrange").attr("value",(o.inPressrange==null?"":o.inPressrange));
				$("#inPressrangeunit").attr("value",(o.inPressrangeunit==null?"":o.inPressrangeunit));
				$("#outPress").attr("value",(o.outPress==null?"":o.outPress));
				$("#outPressunit").attr("value",(o.outPressunit==null?"":o.outPressunit));
				$("#outPressRange").attr("value",(o.outPressRange==null?"":o.outPressRange));
				$("#outPressRangeunit").attr("value",(o.outPressRangeunit==null?"":o.outPressRangeunit));
				$("#spreadPress").attr("value",(o.spreadPress==null?"":o.spreadPress));
				$("#spreadPressunit").attr("value",(o.spreadPressunit==null?"":o.spreadPressunit));
				$("#spreadPressRange").attr("value",(o.spreadPressRange==null?"":o.spreadPressRange));
				$("#spreadPressRangeunit").attr("value",(o.spreadPressRangeunit==null?"":o.spreadPressRangeunit));
				$("#cutPress").attr("value",(o.cutPress==null?"":o.cutPress));
				$("#cutPressunit").attr("value",(o.cutPressunit==null?"":o.cutPressunit));
				$("#cutPressRange").attr("value",(o.cutPressRange==null?"":o.cutPressRange));
				$("#cutPressRangeunit").attr("value",(o.cutPressRangeunit==null?"":o.cutPressRangeunit));
				$("#workMedia").attr("value",(o.workMedia==null?"":o.workMedia));
				$("#paramFolw").attr("value",(o.paramFolw==null?"":o.paramFolw));
				$("#paramPrecision").attr("value",(o.paramPrecision==null?"":o.paramPrecision));
				$("#coefficient").attr("value",(o.coefficient==null?"":o.coefficient));
				$("#allowance").attr("value",(o.allowance==null?"":o.allowance));
				$("#mainMedia1").attr("value",(o.mainMedia1==null?"":o.mainMedia1));
				$("#mainMedia2").attr("value",(o.mainMedia2==null?"":o.mainMedia2));
				$("#testRatio1").attr("value",(o.testRatio1==null?"":o.testRatio1));
				$("#testRatio2").attr("value",(o.testRatio2==null?"":o.testRatio2));
				$("#testRatio3").attr("value",(o.testRatio3==null?"":o.testRatio3));
				$("#testRatio4").attr("value",(o.testRatio4==null?"":o.testRatio4));
				$("#testRequire1").attr("value",(o.testRequire1==null?"":o.testRequire1));
				$("#testRequire2").attr("value",(o.testRequire2==null?"":o.testRequire2));
				$("#testRequire3").attr("value",(o.testRequire3==null?"":o.testRequire3));
				$("#testRequire4").attr("value",(o.testRequire4==null?"":o.testRequire4));
				$("#testStandard").attr("value",(o.testStandard==null?"":o.testStandard));
				$("#strengthTest").attr("value",(o.strengthTest==null?"":o.strengthTest));
				$("#strengthTestunit").attr("value",(o.strengthTestunit==null?"":o.strengthTestunit));
				$("#strengthTesta").attr("value",(o.strengthTesta==null?"":o.strengthTesta));
				$("#strengthTestaunit").attr("value",(o.strengthTestaunit==null?"":o.strengthTestaunit));
				$("#airtightTest").attr("value",(o.airtightTest==null?"":o.airtightTest));
				$("#airtightTestunit").attr("value",(o.airtightTestunit==null?"":o.airtightTestunit));
				$("#airtightTesta").attr("value",(o.airtightTesta==null?"":o.airtightTesta));
				$("#airtightTestaunit").attr("value",(o.airtightTestaunit==null?"":o.airtightTestaunit));
				$("#strengthMedia").attr("value",(o.strengthMedia==null?"":o.strengthMedia));
				$("#airtightMedia").attr("value",(o.airtightMedia==null?"":o.airtightMedia));
				$("#itemUsername").attr("value",(o.userName==null?"":o.userName));
				$("#quoteOrderDate").attr("value",(o.quoteOrderDate==null?"":replaceNull(formatDate("yyyy-MM-dd",o.quoteOrderDate))));
				$("#version").attr("value",(o.version==null?"":o.version));
				$("#itemProjectName").attr("value",(o.projectName==null?"":o.projectName));
				$("#validityDate").attr("value",(o.validityDate==null?"":o.validityDate));
				$("#quoteOrderNo").attr("value",(o.quoteOrderNo==null?"":o.quoteOrderNo));
				$("#itemProductMode").attr("value",(o.productMode==null?"":o.productMode));
				$("#discountCoeff").attr("value",(o.discountCoeff==null?"":o.discountCoeff));
				if(bomList!=null){
					$.each(bomList,function(i,bom){
						$("#bomid"+(i+1)).val(bom.bomid==null?"":bom.bomid);
						$("#itemcode"+(i+1)).val(bom.itemcode==null?"":bom.itemcode);
						$("#itemname"+(i+1)).val(bom.itemname==null?"":bom.itemname);
						$("#fmodel"+(i+1)).val(bom.fmodel==null?"":bom.fmodel);
						$("#fdescript"+(i+1)).val(bom.fdescript==null?"":bom.fdescript);
						$("#flevel"+(i+1)).val(bom.flevel==null?"":bom.flevel);
						$("#fposition"+(i+1)).val(bom.fposition==null?"":bom.fposition);
						$("#fmaker"+(i+1)).val(bom.fmaker==null?"":bom.fmaker);
						$("#srcarea"+(i+1)).val(bom.srcarea==null?"":bom.srcarea);
						$("#unit"+(i+1)).val(bom.unit==null?"":bom.unit);
						$("#fnum"+(i+1)).val(bom.fnum==null?"":bom.fnum);
						$("#bidprice"+(i+1)).val(bom.bidprice==null?"":bom.bidprice);
						$("#bidtotalprice"+(i+1)).val(bom.bidtotalprice==null?"":bom.bidtotalprice);
						$("#factor"+(i+1)).val(bom.factor==null?"":bom.factor);
						$("#listprice"+(i+1)).val(bom.listprice==null?"":bom.listprice);
						$("#listtotalprice"+(i+1)).val(bom.listtotalprice==null?"":bom.listtotalprice);
						$("#costprice"+(i+1)).val(bom.costprice==null?"":bom.costprice);
						$("#costtotalprice"+(i+1)).val(bom.costtotalprice==null?"":bom.costtotalprice);
					});
				}
				if(o.id!=null&&o.id!="-1"){
					$("#quoteorderno").removeAttr("disabled");
					$("#show2").show();
					$("#show22").show();
					$("#show1").hide();
					$("#show11").hide();
					
				}else{
					$("#quoteorderno").attr("disabled","disabled");
					$("#show1").show();
					$("#show11").show();
					$("#show2").hide();
					$("#show22").hide();
				}
			}
			checkBoxChoose();
		}
	});
}

//控制复选框只能单选
function checkBoxChoose(){
	$(":checkbox").click(function(){
		if($(this).attr("checked")!=undefined)
		{
			$(this).siblings().attr("checked",false);
			$(this).attr("checked",true);
		}
	});
}
//保存 另存项目  另存版本 方法
function save(type)
{
	if($("#id").val()==null||$.trim($("#id").val())==""){
		if(type=="2"||type=="3"){
			alert("请先保存项目！");
			return;
		}
	}
	if($("#projectName").val()==null||$.trim($("#projectName").val())==""){
		alert("项目名称不能为空！");
		$("#projectName").focus();
		return;
	}
	//产品类别与报价单号的生成有关，不能为空
	var productType = $('input[name="productType"]:checked ').val();
	if(productType==null||$.trim(productType)==""){
		alert("请选择产品类别!");
		return;
	}
	
	block_viewport();
	//type:1 保存  2另存版本  3另存项目
	var formParam = $('#inputProForm').serialize();
	if(true){
		var url =ctx+ "/projectInfo/project-info!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam+"&type="+type,
			success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
				if(data.resultInfo[0]=='0')
				{
					if(data.projectInfoId!=null){
						showProject(data.projectInfoId);
					}
					//window.close();
					window.opener.search();
					xval.remove();//移除遮罩层
					alert("保存成功！");
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
		
	}
	
}
var xval, tval, bval, rval, lval;
function block_viewport() {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.1, text:'请稍等...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}
/*//保存之前检验各个输入项
function checkForm(){
	if($.trim($('#proid').val())==""){
		var priceunit = $('input[name="area"]:checked ').val();
		if(priceunit==null||$.trim(priceunit)==""){
			alert("请选择区域!");
			return false;
		}
	}else{
		if($.trim($('#quoteorderno').val())==""){
			alert("报价单号不能为空!");
			$('#quoteorderno').focus();
			return false;
		}
	}
	
	if($.trim($('#username').val())==""){
		alert("用户名称不能为空!");
		$('#username').focus();
		return false;
	}
	if($.trim($('#quoteorderdate').val())==""){
		alert("报价日期不能为空!");
		$('#quoteorderdate').focus();
		return false;
	}
	if($.trim($('#validitydate').val())==""){
		alert("有效期不能为空!");
		$('#validitydate').focus();
		return false;
	}
	if($.trim($('#version').val())==""){
		alert("版本号不能为空!");
		$('#version').focus();
		return false;
	}
	if($.trim($('#projectname').val())==""){
		alert("项目名称不能为空!");
		$('#projectname').focus();
		return false;
	}
	if($.trim($('#discountcoeff').val())==""){
		alert("折扣系数不能为空!");
		$('#discountcoeff').focus();
		return false;
	}else{
		var reg = /^[1-9]d*.d*|0.d*[1-9]d*|0?.0+|0$/;
		if(!reg.test($.trim($('#discountcoeff').val()))){
			alert("折扣系数格式不正确，请输入正确的小数!");
			$('#discountcoeff').focus();
			return false;
		}
	}
	
	if($.trim($('#devicemode').val())==""){
		alert("设备型号不能为空!");
		$('#devicemode').focus();
		return false;
	}
	var deliverycondition = $('input[name="deliverycondition"]:checked ').val();
	if(deliverycondition==null||$.trim(deliverycondition)==""){
		alert("请选择交货条件!");
		return false;
	}
	var devicetype = $('input[name="devicetype"]:checked ').val();
	if(devicetype==null||$.trim(devicetype)==""){
		alert("请选择设备类型!");
		return false;
	}
	var priceunit = $('input[name="priceunit"]:checked ').val();
	if(priceunit==null||$.trim(priceunit)==""){
		alert("请选择价格单位!");
		return false;
	}
	
	if($('#designpress').val()==null||$.trim($('#designpress').val())==""){
		alert("设计压力不能为空!");
		$('#designpress').focus();
		return false;
	}else{
		var re = /^[0-9]+.?[0-9]*$/;
		if(!re.test($.trim($('#designpress').val()))){
			alert("设计压力格式不正确，请输入正确的数字!");
			$('#designpress').focus();
			return false;
		}
	}
	if($('#designflow').val()==null||$.trim($('#designflow').val())==""){
		alert("设计流量不能为空!");
		$('#designflow').focus();
		return false;
	}else{
		var re = /^[0-9]+.?[0-9]*$/;
		if(!re.test($.trim($('#designflow').val()))){
			alert("设计流量格式不正确，请输入正确的数字!");
			$('#designflow').focus();
			return false;
		}
	}
	if($('#inpress').val()==null||$.trim($('#inpress').val())==""){
		alert("进口压力不能为空!");
		$('#inpress').focus();
		return false;
	}else{
		var re = /^[0-9]+.?[0-9]*$/;
		if(!re.test($.trim($('#inpress').val()))){
			alert("进口压力格式不正确，请输入正确的数字!");
			$('#inpress').focus();
			return false;
		}
	}
	if($('#outpress').val()==null||$.trim($('#outpress').val())==""){
		alert("出口压力不能为空!");
		$('#outpress').focus();
		return false;
	}else{
		var re = /^[0-9]+.?[0-9]*$/;
		if(!re.test($.trim($('#outpress').val()))){
			alert("出口压力格式不正确，请输入正确的数字!");
			$('#outpress').focus();
			return false;
		}
	}
	var pressurestructure = $('input[name="pressurestructure"]:checked ').val();
	if(pressurestructure==null||$.trim(pressurestructure)==""){
		alert("请选择调压结构型式!");
		return false;
	}
	var meterstructure = $('input[name="meterstructure"]:checked ').val();
	if(meterstructure==null||$.trim(meterstructure)==""){
		alert("请选择计量结构型式!");
		return false;
	}
	
	//验证项目清单列表中的货物名称不能为空 
	var t=0;
	$('input[name="projectBom.itemnames"]').each(function(){
		if($(this).val()==null||$(this).val()==""){
			t++;
		}
	});
	var tt=0;
	$('input[name="projectBom.itemcodes"]').each(function(){
		if($(this).val()==null||$(this).val()==""){
			tt++;
		}
	});
	if(tt==$('input[name="projectBom.itemcodes"]').length){
		alert("物料代码不能为空！");
		return false;
	}
	
	return true;
}*/

//创建表格
var a = 100;
function loaditemwait()
{
	var html='';
		for(var i = 1 ;i <a ;i++){
			html+='<tr align="center" id="tr'+i+'">';
			html+='<td>'+i+'</td>';
			html+='<td><input type="button" value="选择物料" onclick="selectItem('+i+');" class="btnall" style="margin-top: 0px"/></td>';
			html+='<td ><input name="projectBom.bomids" id="bomid'+i+'" value=""  style="display:none;"/><input name="projectBom.itemcodes" id="itemcode'+i+'" value="" class="inputall" style="width:96%" onclick="enterCheck('+i+');"  onkeyup="searchResult('+i+');"  /><div id="itemcodeDiv'+i+'" ref="codediv" class="itemDiv" style="position:absolute;width: 390px;height: 160px;background: #ccc;display: none; "><table><tbody id="selectsbody'+i+'"></tbody></table></div></td>';
			html+='<td><input name="projectBom.itemnames" id="itemname'+i+'" value="" class="inputall" style="width:96%" onclick="enterCheckName('+i+');"  onkeyup="searchResultName('+i+');"/><div id="itemcodeDivName'+i+'" ref="namediv" class="itemDiv" style="position:absolute;width: 390px;height: 160px;background: #ccc;display: none; "><table><tbody id="selectsbodyName'+i+'"></tbody></table></div></td>';
			html+='<td><input name="projectBom.fmodels" id="fmodel'+i+'" value="" class="inputall" style="width:96%"/></td>';
			//html+='<td><input name="projectBom.fdescripts" id="fdescript'+i+'" value=""  class="inputall" style="width:96%"/></td>';
			html+='<td><textarea name="projectBom.fdescripts" id="fdescript'+i+'" rows="4" cols="45"  class="textareaall"/></td>';
			
			
			html+='<td><input name="projectBom.flevels" id="flevel'+i+'" value=""  class="inputall" style="width:94%"/></td>';
			html+='<td><input name="projectBom.fpositions" id="fposition'+i+'" value="" class="inputall" style="width:93%"/></td>';
			html+='<td><input name="projectBom.fmakers" id="fmaker'+i+'" value="" class="inputall" style="width:96%"/></td>';
			html+='<td><input name="projectBom.srcareas" id="srcarea'+i+'" value="" class="inputall" style="width:96%"/></td>';
			html+='<td><input name="projectBom.units" id="unit'+i+'" value="" class="inputall" style="width:96%"/></td>';
			html+='<td><input name="projectBom.fnums" id="fnum'+i+'" value="" class="inputall" style="width:96%" onblur="fnumTototal('+i+')"/></td>';
			html+='<td><input name="projectBom.bidprices" id="bidprice'+i+'" value="" class="inputall" style="width:96%" onblur="tbToPrice('+i+')"/></td>';
			html+='<td><input name="projectBom.bidtotalprices" id="bidtotalprice'+i+'" value="" class="inputall" style="width:96%" readonly="readonly"/></td>';
			html+='<td><input name="projectBom.factors" id="factor'+i+'" value="" class="inputall" style="width:96%" onblur="tbPerPrice('+i+')"/></td>';
			html+='<td><input name="projectBom.listprices" id="listprice'+i+'" value="" class="inputall" style="width:96%" onblur="lbToPrice('+i+')"/></td>';
			html+='<td><input name="projectBom.listtotalprices" id="listtotalprice'+i+'" value="" class="inputall" style="width:96%" readonly="readonly"/></td>';
			html+='<td><input name="projectBom.costprices" id="costprice'+i+'" value="" class="inputall" style="width:96%" onblur="cbToPrice('+i+')"/></td>';
			html+='<td><input name="projectBom.costtotalprices" id="costtotalprice'+i+'" value="" class="inputall" style="width:96%" readonly="readonly"/></td>';
			html+='<td ><a href="javascript:delABC('+i+')" >删除</a></td>';
			html+='</tr>';
	}
	$('#projectDetail').html(html);
}
//选择物料
function selectItem(i){
	window.open('selectproitem.htm?trid='+i, 'selectproitem', 'height=650, width=1250, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
}
function enterCheck(i){
	searchResult(i);
}

function searchResult(i){
	$(".itemDiv").css("display","none");
	$("#itemcodeDiv"+i).css("display","");
	var code = $("#itemcode"+i).val();
	var html='<td><select id="selectCode'+i+'" onchange="changeCode('+i+');" style="width: 370px; height: 147px;background-color: #ccc;" multiple="true">';
	var data = 'proItemQuery.itemcode='+code; 
	var url =ctx+'/proItem/pro-item!listTop.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.proItemList;
									if(list.length==0){
										alert("无此物料代码请重新输入");
										$("#itemcode"+i).attr("value","");
									}
									$.each(list,function(i,o){
										html+='<option value="'+o.aid+'" >'+o.itemcode+'|'+o.itemname+'|'+o.fmode+'|'+o.fdescript+'|'+o.flevel+'|'+o.fmaker+'|'+o.srcarea+'|'+o.buyamount+'|'+o.listamount+'|'+o.costamount+'</option>';
									});
								
							html+='</select></td>';
							$('#selectsbody'+i).html(html);
					}
		});	
	
}
//选择完物料代码后回显物料信息
function changeCode(i){
	var sel = $("#selectCode"+i).val();
	var txt = $('#selectCode'+i).find('option:[value='+sel+']').text();
	var itemcode="";
	var itemname="";
	var fmodel = "";
	var fdescript = "";
	var flevel = "";
	var fmaker = "";
	var srcarea = "";
	var bidprice = "";
	var listprice = "";
	var costprice = "";
	if(txt.toString().split('|')[0]!=null&&txt.toString().split('|')[0]!="null"){
		itemcode = txt.toString().split('|')[0];
	}
	if(txt.toString().split('|')[1]!=null&&txt.toString().split('|')[1]!="null"){
		itemname = txt.toString().split('|')[1];
	}
	if(txt.toString().split('|')[2]!=null&&txt.toString().split('|')[2]!="null"){
		fmodel = txt.toString().split('|')[2];
	}
	if(txt.toString().split('|')[3]!=null&&txt.toString().split('|')[3]!="null"){
		fdescript = txt.toString().split('|')[3];
	}
	if(txt.toString().split('|')[4]!=null&&txt.toString().split('|')[4]!="null"){
		flevel = txt.toString().split('|')[4];
	}
	if(txt.toString().split('|')[5]!=null&&txt.toString().split('|')[5]!="null"){
		fmaker = txt.toString().split('|')[5];
	}
	if(txt.toString().split('|')[6]!=null&&txt.toString().split('|')[6]!="null"){
		srcarea = txt.toString().split('|')[6];
	}
	if(txt.toString().split('|')[7]!=null&&txt.toString().split('|')[7]!="null"){
		bidprice = txt.toString().split('|')[7];
	}
	if(txt.toString().split('|')[8]!=null&&txt.toString().split('|')[8]!="null"){
		listprice = txt.toString().split('|')[8];
	}
	if(txt.toString().split('|')[9]!=null&&txt.toString().split('|')[9]!="null"){
		costprice = txt.toString().split('|')[9];
	}
	
	$("#itemcode"+i).val(itemcode);
	$("#itemname"+i).val(itemname);
	$("#fmodel"+i).val(fmodel);
	$("#fdescript"+i).val(fdescript);
	$("#flevel"+i).val(flevel);
	$("#fmaker"+i).val(fmaker);
	$("#srcarea"+i).val(srcarea);
	if(listprice!=null||listprice!=""){
		var discountcoeff = $("#discountcoeff").val();
		if(discountcoeff!=null&&discountcoeff!=""){
			var sum = (listprice) * (discountcoeff);
			var t = sum.toFixed(0)
			$('#bidprice'+i).attr("value",t);
		}
		
	}
	
	//$("#bidprice"+i).val(bidprice);
	$("#listprice"+i).val(listprice);
	$("#costprice"+i).val(costprice);
	$("#itemcodeDiv"+i).css("display","none");
}


function enterCheckName(i){
	searchResultName(i);
}

function searchResultName(i){
	$(".itemDiv").css("display","none");
	$("#itemcodeDivName"+i).css("display","");
	var name = $("#itemname"+i).val();
	var html='<td><select id="selectCodeName'+i+'" onchange="changeCodeName('+i+');" style="width: 370px; height: 147px;background-color: #ccc;" multiple="true">';
	var data = 'proItemQuery.itemname='+name; 
	var url =ctx+'/proItem/pro-item!listTop.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.proItemList;
									if(list.length==0){
										alert("无此物料代码请重新输入");
										$("#itemname"+i).attr("value","");
									}
									$.each(list,function(i,o){
										html+='<option value="'+o.aid+'" >'+o.itemname+'|'+o.itemcode+'|'+o.fmode+'|'+o.fdescript+'|'+o.flevel+'|'+o.fmaker+'|'+o.srcarea+'|'+o.buyamount+'|'+o.listamount+'|'+o.costamount+'</option>';
									});
								
							html+='</select></td>';
							$('#selectsbodyName'+i).html(html);
					}
		});	
	
}
//选择完物料名称后回显物料信息
function changeCodeName(i){
	var sel = $("#selectCodeName"+i).val();
	var txt = $('#selectCodeName'+i).find('option:[value='+sel+']').text();
	var itemcode="";
	var itemname="";
	var fmodel = "";
	var fdescript = "";
	var flevel = "";
	var fmaker = "";
	var srcarea = "";
	var bidprice = "";
	var listprice = "";
	var costprice = "";
	if(txt.toString().split('|')[1]!=null&&txt.toString().split('|')[1]!="null"){
		itemcode = txt.toString().split('|')[1];
	}
	if(txt.toString().split('|')[0]!=null&&txt.toString().split('|')[0]!="null"){
		itemname = txt.toString().split('|')[0];
	}
	if(txt.toString().split('|')[2]!=null&&txt.toString().split('|')[2]!="null"){
		fmodel = txt.toString().split('|')[2];
	}
	if(txt.toString().split('|')[3]!=null&&txt.toString().split('|')[3]!="null"){
		fdescript = txt.toString().split('|')[3];
	}
	if(txt.toString().split('|')[4]!=null&&txt.toString().split('|')[4]!="null"){
		flevel = txt.toString().split('|')[4];
	}
	if(txt.toString().split('|')[5]!=null&&txt.toString().split('|')[5]!="null"){
		fmaker = txt.toString().split('|')[5];
	}
	if(txt.toString().split('|')[6]!=null&&txt.toString().split('|')[6]!="null"){
		srcarea = txt.toString().split('|')[6];
	}
	if(txt.toString().split('|')[7]!=null&&txt.toString().split('|')[7]!="null"){
		bidprice = txt.toString().split('|')[7];
	}
	if(txt.toString().split('|')[8]!=null&&txt.toString().split('|')[8]!="null"){
		listprice = txt.toString().split('|')[8];
	}
	if(txt.toString().split('|')[9]!=null&&txt.toString().split('|')[9]!="null"){
		costprice = txt.toString().split('|')[9];
	}
	
	$("#itemcode"+i).val(itemcode);
	$("#itemname"+i).val(itemname);
	$("#fmodel"+i).val(fmodel);
	$("#fdescript"+i).val(fdescript);
	$("#flevel"+i).val(flevel);
	$("#fmaker"+i).val(fmaker);
	$("#srcarea"+i).val(srcarea);
	if(listprice!=null||listprice!=""){
		var discountcoeff = $("#discountcoeff").val();
		if(discountcoeff!=null&&discountcoeff!=""){
			var sum = (listprice) * (discountcoeff);
			var t = sum.toFixed(0)
			$('#bidprice'+i).attr("value",t);
		}
		
	}
	$("#listprice"+i).val(listprice);
	$("#costprice"+i).val(costprice);
	$("#itemcodeDivName"+i).css("display","none");
}

//fnum   bidprice bidtotalprice
//根据数量和投标单价计算投标总价
function tbToPrice(i){
	var fnum = $("#fnum"+i).val();
	var price = $('#bidprice'+i).val();

	if(price != null || price != ""){
		var sum = (price) * (fnum);
    		var t = sum.toFixed(2)
    		$('#bidtotalprice'+i).attr("value",t);
	}
}
//fnum listprice listtotalprice
//根据数量和列表单价计算列表总价
function lbToPrice(i){
	var price = $('#listprice'+i).val();
	/*var re = /^[0-9]+.?[0-9]*$/;
	if(!re.test($.trim(price))){
		alert("列表单价格式不正确，请输入正确的数字!");
		//$('#listprice'+i).focus();
	}*/
	var fnum = $("#fnum"+i).val();
	if(price != null || price != ""){
		var sum = (price) * (fnum);
    		var t = sum.toFixed(2)
    		$('#listtotalprice'+i).attr("value",t);
	}
	var factor = $("#factor"+i).val();
	if(price != null || price != ""){
		var sum = (price) * (factor);
    		var t = sum.toFixed(0)
    		$('#bidprice'+i).attr("value",t);
    		var sum1 = (t) * (fnum);
    		var t1 = sum1.toFixed(0)
    		$('#bidtotalprice'+i).attr("value",t1);
	}
	
	
}
//fnum costprice costtotalprice
//根据数量和成本价计算成本总价
function cbToPrice(i){
	var price = $('#costprice'+i).val();
	/*var re = /^[0-9]+.?[0-9]*$/;
	if(!re.test($.trim(price))){
		alert("成本单价格式不正确，请输入正确的数字!");
		//$('#costprice'+i).focus();
	}*/
	var fnum = $("#fnum"+i).val();
	if(price != null || price != ""){
		var sum = (price) * (fnum);
    		var t = sum.toFixed(2)
    		$('#costtotalprice'+i).attr("value",t);
	}
}
//factor listprice bidprice
//根据折扣系数和列表单价计算投标单价
function tbPerPrice(i){
	var factor = $("#factor"+i).val();
	/*var reg = /^[1-9]d*.d*|0.d*[1-9]d*|0?.0+|0$/;
	if(!reg.test($.trim(factor))){
		alert("系数格式不正确，请输入正确的小数!");
		//$("#factor"+i).focus();
	}*/
	var price = $('#listprice'+i).val();
	if(price != null || price != ""){
		var sum = (price) * (factor);
    		var t = sum.toFixed(0)
    		$('#bidprice'+i).attr("value",t);
	}
	
	var fnum = $("#fnum"+i).val();
	var bidprice = $('#bidprice'+i).val();

	if(bidprice != null || bidprice != ""){
		var sum = (bidprice) * (fnum);
    		var t = sum.toFixed(0)
    		$('#bidtotalprice'+i).attr("value",t);
	}
	
}
//更改数量时计算投标总价、成本总价、列表总价
function fnumTototal(i){
	var fnum = $("#fnum"+i).val();
	/*var reg="/^d+(.d+)?$/";//正整数
	if(reg.test($.trim(fnum))){
		alert("数量格式不正确，请输入整数！");
		//$("#fnum"+i).focus();
	}*/
	var bidprice = $('#bidprice'+i).val();
	if(bidprice != null || bidprice != ""){
		var sum = (bidprice) * (fnum);
    		var t = sum.toFixed(0)
    		$('#bidtotalprice'+i).attr("value",t);
	}
	var listprice = $('#listprice'+i).val();

	if(listprice != null || listprice != ""){
		var sum = (listprice) * (fnum);
    		var t = sum.toFixed(2)
    		$('#listtotalprice'+i).attr("value",t);
	}
	
	var costprice = $('#costprice'+i).val();

	if(costprice != null || costprice != ""){
		var sum = (costprice) * (fnum);
    		var t = sum.toFixed(2)
    		$('#costtotalprice'+i).attr("value",t);
	}
	    
	
}

//根据表头的折扣系数更改列表中的折扣系数
function changelistfactor(){
	var discountcoeff = $("#discountCoeff").val();
	if(discountcoeff!=null&&discountcoeff!=""){
		$('input[name="projectBom.factors"]').each(function(){
			$(this).attr("value",discountcoeff);
		});
	}
}

//添加行事件
function tianjia(){
	var html='';
	html+='<tr align="center" id="tr'+a+'">';
	html+='<td>'+a+'</td>';
	html+='<td ><input name="projectBom.bomids" id="bomid'+a+'" value=""  style="display:none;"/><input name="projectBom.itemcodes" id="itemcode'+a+'" value="" class="inputall" style="width:96%" onclick="enterCheck('+a+');"  onkeyup="searchResult('+a+');"  /><div id="itemcodeDiv'+a+'" class="itemDiv" style="position:absolute;width: 390px;height: 160px;background: #ccc;display: none; "><table><tbody id="selectsbody'+a+'"></tbody></table></div></td>';
	html+='<td><input name="projectBom.itemnames" id="itemname'+a+'" value="" class="inputall" style="width:96%"/></td>';
	html+='<td><input name="projectBom.fmodels" id="fmodel'+a+'" value="" class="inputall" style="width:96%"/></td>';
	//html+='<td><input name="projectBom.fdescripts" id="fdescript'+a+'" value=""  class="inputall" style="width:96%"/></td>';
	html+='<td><textarea name="projectBom.fdescripts" id="fdescript'+a+'" rows="4" cols="45"  class="textareaall"/></td>';
	html+='<td><input name="projectBom.flevels" id="flevel'+a+'" value=""  class="inputall" style="width:96%"/></td>';
	html+='<td><input name="projectBom.fpositions" id="fposition'+a+'" value="" class="inputall" style="width:96%"/></td>';
	html+='<td><input name="projectBom.fmakers" id="fmaker'+a+'" value="" class="inputall" style="width:96%"/></td>';
	html+='<td><input name="projectBom.srcareas" id="srcarea'+a+'" value="" class="inputall" style="width:96%"/></td>';
	html+='<td><input name="projectBom.units" id="unit'+a+'" value="" class="inputall" style="width:96%"/></td>';
	html+='<td><input name="projectBom.fnums" id="fnum'+a+'" value="" class="inputall" style="width:96%" onblur="fnumTototal('+a+')"/></td>';
	html+='<td><input name="projectBom.bidprices" id="bidprice'+a+'" value="" class="inputall" style="width:96%" onblur="tbToPrice('+a+')"/></td>';
	html+='<td><input name="projectBom.bidtotalprices" id="bidtotalprice'+a+'" value="" class="inputall" style="width:96%" readonly="readonly"/></td>';
	html+='<td><input name="projectBom.factors" id="factor'+a+'" value="" class="inputall" style="width:96%" onblur="tbPerPrice('+a+')"/></td>';
	html+='<td><input name="projectBom.listprices" id="listprice'+a+'" value="" class="inputall" style="width:96%" onblur="lbToPrice('+a+')"/></td>';
	html+='<td><input name="projectBom.listtotalprices" id="listtotalprice'+a+'" value="" class="inputall" style="width:96%" readonly="readonly"/></td>';
	html+='<td><input name="projectBom.costprices" id="costprice'+a+'" value="" class="inputall" style="width:96%" onblur="cbToPrice('+a+')"/></td>';
	html+='<td><input name="projectBom.costtotalprices" id="costtotalprice'+a+'" value="" class="inputall" style="width:96%" readonly="readonly"/></td>';
	html+='<td ><a href="javascript:delABC('+a+')" >删除</a></td>';
	html+='</tr>';
	a++;
	$('#projectDetail').append(html);
}

function delABC(i){
	var bomid = $("#bomid"+i).val();
	if(bomid!=null&&bomid!=""){
		if(!confirm('确定删除已存在的此条物料信息吗？')) {
			return;
		}
		var param = {};
		if(bomid) {
			param['checkedIdList[0]'] = bomid;
		}
		var url = ctx + '/projectBom/project-bom!deleteToJson.htm';
		$.webAjax( {
			type : 'post',
			url : url,
			data : param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					$("#tr"+i).remove();
					alert("删除成功！");
				} else {
					alert('删除项目失败！');
				}
			}
		});
	}else{
		$("#tr"+i).remove();
	}
	
}



function showItemValue(lst){
	if(lst.length>0){
		var trid = lst[9];
		$("#itemcode"+trid).val(lst[0]==null?"":lst[0]);
		$("#itemname"+trid).val(lst[1]==null?"":lst[1]);
		$("#fmodel"+trid).val(lst[2]==null?"":lst[2]);
		$("#flevel"+trid).val(lst[3]==null?"":lst[3]);
		$("#fmaker"+trid).val(lst[4]==null?"":lst[4]);
		$("#srcarea"+trid).val(lst[5]==null?"":lst[5]);
		$("#listprice"+trid).val(lst[6]==null?"":lst[6]);
		$("#costprice"+trid).val(lst[7]==null?"":lst[7]);
		$("#fdescript"+trid).val(lst[8]==null?"":lst[8]);
		var listprice = lst[6];
		if(listprice!=null||listprice!=""){
			var discountcoeff = $("#discountcoeff").val();
			if(discountcoeff!=null&&discountcoeff!=""){
				var sum = (listprice) * (discountcoeff);
				var t = sum.toFixed(0)
				$('#bidprice'+trid).attr("value",t);
			}
			
		}
	}
}