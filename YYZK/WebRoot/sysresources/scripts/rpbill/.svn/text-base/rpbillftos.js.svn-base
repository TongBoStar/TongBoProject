$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'rpftospage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_receivable.receivableid',
		submitForm : search//分页回调函数
		});
	$('#contractFile').uploadify({
		'swf' : ctx+'/uploadify/uploadify.swf',
		'uploader' : ctx+'/common/file-upload.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.xlsx;*.xls',// 文件过滤器
		'fileTypeDesc' : 'xlsx,xls文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'uploadFile',
		'uploadLimit' : 5,
		'height':25,
        'width':40,
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			$('#fileshow').val(data.srcfilename);
			$('#filepath').val(data.filename);
		}
	});
	search();
	if($('#operType').val()==1){//修改操作
		loadProductInfo();
	}
	$('#uploadDiv').css("display","");
});
function search(){
	openblockdiv();
	var queryForm = $("#queryForm").serialize();
	var pageForm = simpleTable.bindPageParam();
	$.webAjax({
		type : 'post',
		url : ctx+"/receivable/receivable!listToJson.htm",
		data :queryForm+"&"+pageForm,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.refreshPageToolbar(page,"rpftospage",simpleTable);
			var html = '';
			$.each(page.result,function(i,o){
				html += '<tr id="TR'+i+'">';
				html += '<td id="TD'+i+'35"><a href="javascript:void(0);"onclick="editInfo_edit('+o.receivableid+');"><img src="'+ctx+'/images/edit.gif"/></a></td>';
				if('D' == o.fclass){
					html += '<input type="hidden" name="receivableList['+i+'].receivableid" value="'+replaceNull(o.receivableid)+'"/>';
				}
				html += '<td id="TD'+i+'0">'+formatDate("yyyy-MM-dd",replaceNull(o.contractDate))+'</td>';
				html += '<td id="TD'+i+'0">'+replaceNull(o.fcontractno)+'</td>';
				html += '<td id="TD'+i+'0">'+replaceNull(o.checkProject)+'</td>';
				html += '<td id="TD'+i+'0">'+replaceNull(o.area)+'</td>';
				var lname1=(o.saler==null?"":o.saler);
				var sname1 = '';
				if(lname1.length>4){
					sname1=lname1.substring(0,4);
				}else{
					sname1=lname1;
				}
				html+='<td><a data-rel="tooltip" href="javascript:void(0);" data-original-title="'+lname1+'">'+sname1+'</a></td>';
				//html += '<td id="TD'+i+'0">'+replaceNull(o.saler)+'</td>';
				html += '<td id="TD'+i+'1">'+replaceNull(o.fnum)+'</td>';
				html += '<td id="TD'+i+'2">'+replaceNull(o.famount)+'</td>';
				var lname=(o.fitemname==null?"":o.fitemname);
				var sname = '';
				if(lname.length>8){
					sname=lname.substring(0,8);
				}else{
					sname=lname;
				}
				html+='<td><a data-rel="tooltip" href="javascript:void(0);" data-original-title="'+lname+'">'+sname+'</a></td>';
				//html += '<td id="TD'+i+'3">'+replaceNull(o.fitemname)+'</td>';
				html += '<td id="TD'+i+'4">'+replaceNull(o.fclass)+'</td>';
				html += '<td id="TD'+i+'6" colspan="2" style="padding:0px;border-right:none;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl4200fmodel)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl4200fnum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'7" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl4200listprice)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl4200finalprice)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'8" colspan="2" style="padding:0px;border-right:none;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl3000fmodel)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl3000fnum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'9" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl3000listprice)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl3000finalprice)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'10" colspan="2" style="padding:0px;border-right:none;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.ssv3500fmodel)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.ssv3500fnum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'11" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.ssv3500listprice)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.ssv3500finalprice)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'12" colspan="2" style="padding:0px;border-right:none;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl2000fmodel)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl2000fnum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'13" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl2000listprice)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl2000finalprice)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'15">'+replaceNull(o.serviceprice)+'</td>';
				html += '<td id="TD'+i+'16">'+replaceNull(o.servicelistprice)+'</td>';
				html += '<td id="TD'+i+'17">'+replaceNull(o.servicefinalprice)+'</td>';
				html += '<td id="TD'+i+'14" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl4200listpricesum)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl4200finalpricesum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'19" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl3000listpricesum)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl3000finalpricesum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'20" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.ssv3500listpricesum)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.ssv3500finalpricesum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'21" colspan="2" style="padding:0px;">';
				$.each(o.recePls,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.pl2000listpricesum)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.pl2000finalpricesum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'22">'+replaceNull(o.servicepricesum)+'</td>';
				html += '<td id="TD'+i+'23">'+replaceNull(o.servicelistpricesum)+'</td>';
				html += '<td id="TD'+i+'24">'+replaceNull(o.servicefinalpricesum)+'</td>';
				html += '<td id="TD'+i+'24">'+replaceNull(o.discountRate)+'</td>';
				html += '<td id="TD'+i+'25" colspan="2" style="padding:0px;text-align:center;">';
				$.each(o.forderinstocks,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.fdate)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.fnum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'26" colspan="2" style="padding:0px;text-align:center;">';
				$.each(o.fordersends,function(n,m){
					html += '<div style="width:100%;"><div style="width:50%;float:left;text-align:center;">'+replaceNull(m.fdate)+'</div>';
					html += '<div style="width:50%;margin-left:57px;text-align:center;">'+replaceNull(m.fnum)+'</div></div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'27" style="padding:0px;text-align:center;">';
				$.each(o.fordersends,function(n,m){
					html += '<div style="width:100%;text-align:center;">'+replaceNull(m.famount)+'</div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'28" colspan="2" style="padding:0px;text-align:center;">';
				$.each(o.forderinvoices,function(n,m){
					html += '<div style="width:100%;text-align:center;">'+replaceNull(m.fdate)+'</div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'29" style="padding:0px;text-align:center;">';
				$.each(o.forderinvoices,function(n,m){
					html += '<div style="width:100%;text-align:center;">'+replaceNull(m.famount)+'</div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'30" style="padding:0px;text-align:center;">';
				$.each(o.forderinvoices,function(n,m){
					html += '<div style="width:100%;text-align:center;">'+replaceNull(m.finvoiceno)+'</div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'31" colspan="2" style="padding:0px;text-align:center;">';
				$.each(o.forderrefunds,function(n,m){
					html += '<div style="width:100%;text-align:center;">'+replaceNull(m.fdate)+'</div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'32" style="padding:0px;text-align:center;">';
				$.each(o.forderrefunds,function(n,m){
					html += '<div style="width:100%;text-align:center;">'+replaceNull(m.famount)+'</div>';
				});
				html += '</td>';
				html += '<td id="TD'+i+'33">'+replaceNull(o.margin)+'</td>';
				html += '<td id="TD'+i+'34">'+replaceNull(o.loaninterest)+'</td>';
				if('D' == o.fclass){
					html += '<td id="TD'+i+'34"><input class="input60" name="receivableList['+i+'].lngmoneypre" value="'+replaceNull(o.lngmoneypre)+'" style="width:100%;"/></td>';
				}else{
					html += '<td id="TD'+i+'34"></td>';
				}
				html += '</tr>';
			});
			$('#plantable').html(html);
			$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
			closeblockdiv();
		}
	});
}
function editInfo(receivableid){
	window.open(ctx+"/receivable/rpbillftosAdd.htm?operType=1&receivableId="+receivableid);
}
var countmark = 50;
function addTR(mark){
	var html = '';
	if(mark==1){
		html += '<tr id="rktr'+countmark+'">';
		html += '<td width="16%"><a href="javascript:delTR(\'rktr\','+countmark+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>入库时间</td>';
		html += '<td width="16%"><input name="forderinstockList['+countmark+'].fdate" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
		html += '<td width="16%">入库数量</td><td width="16%"><input name="forderinstockList['+countmark+'].fnum" id="fnum" class="inputall2"/></td>';
		html += '<td width="16%"></td><td width="16%"></td>';
		html += '</tr>';
		$('#TBODYRK').append(html);
	}else if(mark==2){
		html += '<tr id="fhtr'+countmark+'">';
		html += '<td width="16%"><a href="javascript:delTR(\'fhtr\','+countmark+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>发货时间</td>';
		html += '<td width="16%"><input name="fordersendList['+countmark+'].fdate" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
		html += '<td width="16%">发货数量</td><td width="16%"><input name="fordersendList['+countmark+'].fnum" class="inputall2" /></td>';
		html += '<td width="16%">发货金额</td>';
		html += '<td width="16%"><input name="fordersendList['+countmark+'].famount" class="inputall2" /></td>';
		html += '</tr>';
		$('#TBODYFH').append(html);
	}else if(mark==3){
		html += '<tr id="hktr'+countmark+'">';
		html += '<td width="16%"><a href="javascript:delTR(\'hktr\','+countmark+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>回款时间</td>';
		html += '<td width="16%"><input name="forderrefundList['+countmark+'].fdate" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
		html += '<td width="16%">回款金额</td>';
		html += '<td width="16%"><input name="forderrefundList['+countmark+'].famount" class="inputall2" /></td>';
		html += '<td width="16%"></td><td width="16%"></td>';
		html += '</tr>';
		$('#TBODYHK').append(html);
	}else{
		html += '<tr id="kptr'+countmark+'">';
		html += '<td width="16%"><a href="javascript:delTR(\'kptr\','+countmark+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>开票时间</td>';
		html += '<td width="16%"><input name="forderinvoiceList['+countmark+'].fdate" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
		html += '<td width="16%">开票金额</td>';
		html += '<td width="16%"><input name="forderinvoiceList['+countmark+'].famount" class="inputall2" /></td>';
		html += '<td width="16%">开票号</td>';
		html += '<td width="16%"><input name="forderinvoiceList['+countmark+'].finvoiceno" class="inputall2" /></td>';
		html += '</tr>';
		$('#TBODYKP').append(html);
	}
	countmark++;
}
function delTR(id,num){
	$('#'+id+num).remove();
}
function addContractInfo(){
	window.open(ctx+"/receivable/rpbillftosAdd.htm");
}
var globalList = null;
var queryList = null;
var sysorder = null;
var allmap = null;
function initProductInfo(){
	if($.trim($('#contractno').val())==""){
		alert("请输入要查询的合同编号!");
		return;
	}
	$('#fcontractno').val($('#contractno').val());
	$.webAjax({
		type : 'post',
		url : ctx+"/receivable/receivable!listToQuery.htm",
		data :'receivableQuery.fcontractno='+$('#fcontractno').val(),
		success : function(data) {
			data = $.parseJSON(data);
			var receivableList = data.receivableList;
			queryList = receivableList;
		}
	});
	$.webAjax({
		type : 'post',
		url : ctx+"/sysOrder/sys-order!findList.htm",
		data :'sysOrderQuery.contractCode='+$('#fcontractno').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(null==data.map.sysOrder){
				alert("没有该合同编号!");
				return;
			}
			var productList = data.map.productList;
			globalList = productList;
			sysorder = data.map.sysOrder;
			allmap = data.map;
			$('#forderno').val(sysorder.orderCode);
			var html = '';
			$.each(productList,function(i,o){
				html += '<tr>';
				html += '<td>'+o.productName+'</td>';
				html += '<td>'+o.productCode+'</td>';
				html += '<td>'+o.productType+'</td>';
				html += '<td>'+o.productCount+'</td>';
				html += '<td><a href="javascript:void(0);" onclick="editAllInfo('+i+');">编辑</a></td>';
				html += '</tr>';
			});
			$('#PROLIST').html(html);
		}
	});
}
function editAllInfo(number){
	var obj = globalList[number];
	var flag = false;
	$.each(queryList,function(i,o){
		if(o.fnumber == obj.productCode){//编辑过
			flag = true;
			obj = o;
		}
	});
	if(!flag){//未编辑过
		$('#receivableId').val();
		$('#productid').val(obj.productId);
		$('#fnum').val(obj.productCount);
		$('#famount').val(obj.priceTaxTotalRM);
		$('#fitemname').val(obj.productName);
		$('#fclass').val(obj.productType);
		$('#fmocode').val(obj.makeNumberCode);
		$('#fnumber').val(obj.productCode);
		initPL(obj);
		$('#servicepricesum').val("");
		$('#servicelistpricesum').val("");
		$('#servicefinalpricesum').val("");
		$('#serviceprice').val("");
		$('#servicelistprice').val("");
		$('#servicefinalprice').val("");
		$('#margin').val("");
		$('#loaninterest').val("");
		$('#TBODYRK').html("");
		$('#TBODYFH').html("");
		$('#TBODYKP').html("");
		$('#TBODYHK').html("");
		findDataFromK3(obj.makeNumberCode);
	}else{//编辑过
		$('#fnum').val(obj.fnum);
		$('#productid').val(obj.productid);
		$('#famount').val(obj.famount);
		$('#fitemname').val(obj.fitemname);
		$('#fclass').val(obj.fclass);
		$('#fmocode').val(obj.fmocode);
		$('#fnumber').val(obj.fnumber);
		$('#receivableId').val(obj.receivableid);
		$('#fcontractno').val(obj.fcontractno);
		$('#servicepricesum').val(obj.servicepricesum);
		$('#servicelistpricesum').val(obj.servicelistpricesum);
		$('#servicefinalpricesum').val(obj.servicefinalpricesum);
		$('#serviceprice').val(obj.serviceprice);
		$('#servicelistprice').val(obj.servicelistprice);
		$('#servicefinalprice').val(obj.servicefinalprice);
		$('#margin').val(obj.margin);
		$('#loaninterest').val(obj.loaninterest);
		loadPL(obj.recePls);
		loadTR(1,obj.forderinstocks);
		loadTR(2,obj.fordersends);
		loadTR(3,obj.forderrefunds);
		loadTR(4,obj.forderinvoices);
	}
}
function findDataFromK3(pfmocode){
	$.webAjax({
		type : 'post',
		url : ctx+"/receivable/receivable!findrkhfkp.htm",
		data :'receivableQuery.fmocode='+pfmocode,
		success : function(data) {
			data = $.parseJSON(data);
			loadTR(1,data.entity.forderinstocks);
			loadTR(2,data.entity.fordersends);
			loadTR(4,data.entity.forderinvoices);
		}
	});
}
function initPL(product){
	var objAll = allmap['pls'+product.productId];
	var obj;
	var len = 0;
	if(objAll.length>0){
		len = objAll.length;
	}
	var html = '';
	for(var i=0;i<len;i++){
		obj = objAll[i];
		var pl4200listpricesum = (obj.fnum*obj.flistprice).toFixed(2);
		var pl3000listpricesum = (obj.pl3000fnum*obj.pl3000flistprice).toFixed(2);
		var sSV3500listpricesum = (obj.ssv3500fnum*obj.ssv3500flistprice).toFixed(2);
		var sPl2000listpricesum = (obj.pl2000fnum*obj.pl2000flistprice).toFixed(2);
		html += '<tr>';
		html += '<td>PL4200</td>';
		html += '<td><input name="receplList['+i+'].pl4200fmodel" id="PL4200fmodel'+i+'" class="inputall1" value="'+obj.fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200fnum" id="PL4200fnum'+i+'" class="inputall1" value="'+obj.fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200listprice" id="PL4200listprice'+i+'" class="inputall1" value="'+obj.fprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200finalprice" id="PL4200finalprice'+i+'" class="inputall2" onblur="countfinalallprice('+i+',\'PL4200fnum\',\'PL4200finalprice\',\'PL4200finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].pl4200listpricesum" id="PL4200listpricesum'+i+'" class="inputall1" value="'+pl4200listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200finalpricesum" id="PL4200finalpricesum'+i+'" class="inputall1" readonly/></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td>PL3000</td>';
		html += '<td><input name="receplList['+i+'].pl3000fmodel" id="PL3000fmodel'+i+'" class="inputall1" value="'+obj.pl3000fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000fnum" id="PL3000fnum'+i+'" class="inputall1" value="'+obj.pl3000fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000listprice" id="PL3000listprice'+i+'" class="inputall1" value="'+obj.pl3000fprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000finalprice" id="PL3000finalprice'+i+'" class="inputall2" onblur="countfinalallprice('+i+',\'PL3000fnum\',\'PL3000finalprice\',\'PL3000finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].pl3000listpricesum" id="PL3000listpricesum'+i+'" class="inputall1" value="'+pl3000listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000finalpricesum" id="PL3000finalpricesum'+i+'" class="inputall1" readonly/></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td>SSV3500</td>';
		html += '<td><input name="receplList['+i+'].ssv3500fmodel" id="SSV3500fmodel'+i+'" class="inputall1" value="'+obj.ssv3500fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500fnum" id="SSV3500fnum'+i+'" class="inputall1" value="'+obj.ssv3500fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500listprice" id="SSV3500listprice'+i+'" class="inputall1" value="'+obj.ssv3500flistprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500finalprice" id="SSV3500finalprice'+i+'" class="inputall2" onblur="countfinalallprice('+i+',\'SSV3500fnum\',\'SSV3500finalprice\',\'SSV3500finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500listpricesum" id="SSV3500listpricesum'+i+'" class="inputall1" value="'+sSV3500listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500finalpricesum" id="SSV3500finalpricesum'+i+'" class="inputall1" readonly/></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td>PL2000</td>';
		html += '<td><input name="receplList['+i+'].pl2000fmodel" id="PL2000fmodel'+i+'" class="inputall1" value="'+obj.pl2000fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000fnum" id="PL2000fnum'+i+'" class="inputall1" value="'+obj.pl2000fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000listprice" id="PL2000listprice'+i+'" class="inputall1" value="'+obj.pl2000flistprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000finalprice" id="PL2000finalprice'+i+'" class="inputall2" onblur="countfinalallprice('+i+',\'PL2000fnum\',\'PL2000finalprice\',\'PL2000finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].pl2000listpricesum" id="PL2000listpricesum'+i+'" class="inputall1" value="'+sPl2000listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000finalpricesum" id="PL2000finalpricesum'+i+'" class="inputall1" readonly/></td>';
		html += '</tr>';
	}
	$('#TBODYPL').html(html);
}
function countfinalallprice(number,countid,baseid,toid){
	var base = $('#'+baseid+number).val();
	var count = $('#'+countid+number).val();
	if(base&&count){
		$('#'+toid+number).val((parseFloat(base)*parseFloat(count)).toFixed(2));
	}
}
function loadProductInfo(){
	$('#contractno').attr("readonly","readonly");
	$.webAjax({
		type : 'post',
		url : ctx+"/receivable/receivable!showToJson.htm",
		data :'receivableId='+$('#receivableId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			sysorder = data.model;
			var receplList = data.receplList;
			var fordersendList = data.fordersendList;
			var forderinstockList = data.forderinstockList;
			var forderinvoiceList = data.forderinvoiceList;
			var forderrefundList = data.forderrefundList;
			$('#contractno').val(sysorder.fcontractno);
			$('#productid').val(sysorder.productid);
			$('#fcontractno').val(sysorder.fcontractno);
			$('#forderno').val(sysorder.forderno);
			$('#fmocode').val(sysorder.fmocode);
			$('#fnumber').val(sysorder.fnumber);
			$('#fnum').val(sysorder.fnum);
			$('#famount').val(sysorder.famount);
			$('#fitemname').val(sysorder.fitemname);
			$('#fclass').val(sysorder.fclass);
			var html = '<tr>';
			html += '<td>'+sysorder.fitemname+'</td>';
			html += '<td>'+sysorder.fnumber+'</td>';
			html += '<td>'+sysorder.fclass+'</td>';
			html += '<td>'+sysorder.fnum+'</td>';
			html += '<td>已编辑</td>';
			html += '</tr>';
			$('#PROLIST').html(html);
			$('#servicepricesum').val(sysorder.servicepricesum);
			$('#servicelistpricesum').val(sysorder.servicelistpricesum);
			$('#servicefinalpricesum').val(sysorder.servicefinalpricesum);
			$('#serviceprice').val(sysorder.serviceprice);
			$('#servicelistprice').val(sysorder.servicelistprice);
			$('#servicefinalprice').val(sysorder.servicefinalprice);
			$('#margin').val(sysorder.margin);
			$('#loaninterest').val(sysorder.loaninterest);
			loadPL(receplList);
			loadTR(1,forderinstockList);
			loadTR(2,fordersendList);
			loadTR(3,forderrefundList);
			loadTR(4,forderinvoiceList);
		}
	});
}
function loadTR(mark,list){
	var html;
	if(mark==1){
		html = '';
		$.each(list,function(i,o){
			html += '<tr id="rktr'+i+'"><input type="hidden" name="forderinstockList['+i+'].fentryid" value="'+(null==o.fentryid?'':o.fentryid)+'"/>';
			html += '<td width="16%"><a href="javascript:delTRAjax(\'rktr\','+i+','+o.fentryid+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="删除"/></a>入库时间</td>';
			html += '<td width="16%"><input name="forderinstockList['+i+'].fdate" value="'+o.fdate+'" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
			html += '<td width="16%">入库数量</td><td width="16%"><input value="'+o.fnum+'" name="forderinstockList['+i+'].fnum" id="fnum" class="inputall2"/></td>';
			html += '<td width="16%"></td><td width="16%"></td>';
			html += '</tr>';
		});
		$('#TBODYRK').html(html);
	}else if(mark==2){
		html = '';
		$.each(list,function(i,o){
			html += '<tr id="fhtr'+i+'"><input type="hidden" name="fordersendList['+i+'].sendid" value="'+(null==o.sendid?'':o.sendid)+'"/>';
			html += '<td width="16%"><a href="javascript:delTRAjax(\'fhtr\','+i+','+o.sendid+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>发货时间</td>';
			html += '<td width="16%"><input name="fordersendList['+i+'].fdate" value="'+o.fdate+'" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
			html += '<td width="16%">发货数量</td><td width="16%"><input name="fordersendList['+i+'].fnum" value="'+o.fnum+'" class="inputall2" /></td>';
			html += '<td width="16%">发货金额</td>';
			html += '<td width="16%"><input name="fordersendList['+i+'].famount" value="'+o.famount+'" class="inputall2" /></td>';
			html += '</tr>';
		});
		$('#TBODYFH').html(html);
	}else if(mark==3){
		html = '';
		$.each(list,function(i,o){
			html += '<tr id="hktr'+i+'"><input type="hidden" name="forderrefundList['+i+'].refundid" value="'+(null==o.refundid?'':o.refundid)+'"/>';
			html += '<td width="16%"><a href="javascript:delTRAjax(\'hktr\','+i+','+o.refundid+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>回款时间</td>';
			html += '<td width="16%"><input name="forderrefundList['+i+'].fdate" value="'+o.fdate+'" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
			html += '<td width="16%">回款金额</td>';
			html += '<td width="16%"><input name="forderrefundList['+i+'].famount" value="'+o.famount+'" class="inputall2" /></td>';
			html += '<td width="16%"></td><td width="16%"></td>';
			html += '</tr>';
		});
		$('#TBODYHK').html(html);
	}else{
		html = '';
		$.each(list,function(i,o){
			html += '<tr id="kptr'+i+'"><input type="hidden" name="forderinvoiceList['+i+'].invoiceid" value="'+(null==o.invoiceid?'':o.invoiceid)+'"/>';
			html += '<td width="16%"><a href="javascript:delTRAjax(\'kptr\','+i+','+o.invoiceid+');"><img src="'+ctx+'/images/delete_small.gif" border="0" title="添加"/></a>开票时间</td>';
			html += '<td width="16%"><input name="forderinvoiceList['+i+'].fdate" value="'+o.fdate+'" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\'})" class="inputall2" /></td>';
			html += '<td width="16%">开票金额</td>';
			html += '<td width="16%"><input name="forderinvoiceList['+i+'].famount" value="'+o.famount+'" class="inputall2" /></td>';
			html += '<td width="16%">开票号</td>';
			html += '<td width="16%"><input name="forderinvoiceList['+i+'].finvoiceno" value="'+o.finvoiceno+'" class="inputall2" /></td>';
			html += '</tr>';
		});
		$('#TBODYKP').html(html);
	}
}
function delTRAjax(id,num,rid){
	var flag = window.confirm("确定删除吗？");
	if (flag == true) {
		block_viewport();
		var url = '';
		var data = '';
		if(id=="rktr"){
			url = ctx+"/forderinstock/forderinstock!deleteToJson.htm";
		}else if(id=="kptr"){
			url = ctx+"/forderinvoice/forderinvoice!deleteToJson.htm";
		}else if(id=="hktr"){
			url = ctx+"/forderrefund/forderrefund!deleteToJson.htm";
		}else if(id=="fhtr"){
			url = ctx+"/fordersend/fordersend!deleteToJson.htm";
		}else{}
		data = 'checkedIdList[0]='+rid;
		$.webAjax({
			type : 'post',
			url : url,
			data :data,
			success : function(data) {
				data = $.parseJSON(data);
				alert(data.resultInfo[1]);
				$('#'+id+num).remove();
				xval.remove();//移除遮罩层
			}
		});
	}
}
function loadPL(receplList){
	var html;
	$.each(receplList,function(i,o){
		var obj = o;
		var pl4200listpricesum = (obj.pl4200fnum*obj.pl4200listprice).toFixed(2);
		var pl3000listpricesum = (obj.pl3000fnum*obj.pl3000listprice).toFixed(2);
		var ssv3500listpricesum = (obj.ssv3500fnum*obj.ssv3500listprice).toFixed(2);
		var pl2000listpricesum = (obj.pl2000fnum*obj.pl2000listpricesum).toFixed(2);
		html += '<tr><input type="hidden" name="receplList['+i+'].fentryid" value="'+obj.fentryid+'"/>';
		html += '<td>PL4200</td>';
		html += '<td><input name="receplList['+i+'].pl4200fmodel" id="PL4200fmodel" class="inputall1" value="'+obj.pl4200fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200fnum" id="PL4200fnum" class="inputall1" value="'+obj.pl4200fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200listprice" id="PL4200listprice" class="inputall1" value="'+obj.pl4200listprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200finalprice" id="PL4200finalprice" class="inputall2" value="'+obj.pl4200finalprice+'" onblur="countfinalallprice(\'PL4200fnum\',\'PL4200finalprice\',\'PL4200finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].pl4200listpricesum" id="PL4200listpricesum" class="inputall1" value="'+pl4200listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl4200finalpricesum" id="PL4200finalpricesum" class="inputall1" value="'+obj.pl4200finalpricesum+'" readonly/></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td>PL3000</td>';
		html += '<td><input name="receplList['+i+'].pl3000fmodel" id="PL3000fmodel" class="inputall1" value="'+obj.pl3000fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000fnum" id="PL3000fnum" class="inputall1" value="'+obj.pl3000fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000listprice" id="PL3000listprice" class="inputall1" value="'+obj.pl3000listprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000finalprice" id="PL3000finalprice" class="inputall2" value="'+obj.pl3000finalprice+'" onblur="countfinalallprice(\'PL3000fnum\',\'PL3000finalprice\',\'PL3000finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].pl3000listpricesum" id="PL3000listpricesum" class="inputall1" value="'+pl3000listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl3000finalpricesum" id="PL3000finalpricesum" class="inputall1" value="'+obj.pl3000finalpricesum+'" readonly/></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td>SSV3500</td>';
		html += '<td><input name="receplList['+i+'].ssv3500fmodel" id="SSV3500fmodel" class="inputall1" value="'+obj.ssv3500fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500fnum" id="SSV3500fnum" class="inputall1" value="'+obj.ssv3500fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500listprice" id="SSV3500listprice" class="inputall1" value="'+obj.ssv3500listprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500finalprice" id="SSV3500finalprice" class="inputall2" value="'+obj.ssv3500finalprice+'" onblur="countfinalallprice(\'SSV3500fnum\',\'SSV3500finalprice\',\'SSV3500finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500listpricesum" id="SSV3500listpricesum" class="inputall1" value="'+ssv3500listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].ssv3500finalpricesum" id="SSV3500finalpricesum" class="inputall1" value="'+obj.ssv3500finalpricesum+'" readonly/></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td>PL2000</td>';
		html += '<td><input name="receplList['+i+'].pl2000fmodel" id="PL2000fmodel" class="inputall1" value="'+obj.pl2000fmodel+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000fnum" id="PL2000fnum" class="inputall1" value="'+obj.pl2000fnum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000listprice" id="PL2000listprice" class="inputall1" value="'+obj.pl2000listprice+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000finalprice" id="PL2000finalprice" class="inputall2" value="'+obj.pl2000finalprice+'" onblur="countfinalallprice(\'PL2000fnum\',\'PL2000finalprice\',\'PL2000finalpricesum\');"/></td>';
		html += '<td><input name="receplList['+i+'].pl2000listpricesum" id="PL2000listpricesum" class="inputall1" value="'+pl2000listpricesum+'" readonly/></td>';
		html += '<td><input name="receplList['+i+'].pl2000finalpricesum" id="PL2000finalpricesum" class="inputall1" value="'+obj.pl2000finalpricesum+'" readonly/></td>';
		html += '</tr>';
	});
	$('#TBODYPL').html(html);
}
function saverpbillInfo(){
	var flag = window.confirm("确定保存吗？");
	if (flag == true) {
		block_viewport();
		var params = $('#inputForm').serialize();
		$.webAjax({
			type : 'post',
			url : ctx+"/receivable/receivable!saveToJson.htm",
			data :params,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("编辑成功!");
				}else{
					alert(data.result[1]);
				}
				xval.remove();//移除遮罩层
			}
		});
	}
}
function hideDiv(i,total){
	if($('#hide'+i).attr("class")=="expandarrow"){
		$("#hide"+i).removeClass().addClass("hidearrow");
		$("#product"+i).css("display","none");
		$('#prolistDiv').height("32px");
		$('#contractDiv').css("top","60px");
	}else{
		$("#hide"+i).removeClass().addClass("expandarrow");
		$("#product"+i).css("display","");
		$('#prolistDiv').height("170px");
		$('#contractDiv').css("top","200px");
	}
	for(var a=1;a<=total;a++){
		if(i!=a){
			$("#hide"+a).removeClass().addClass("hidearrow");
			$("#product"+a).css("display","none");
		}
	}
}
/**添加遮罩层*/
var xval, tval, bval, rval, lval;
function block_viewport() {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.6, text:'请稍等...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}
/**
 * 解析上传的表格
 */
function parseXlsx(){
	block_viewport();
	$.webAjax({
		type : 'post',
		url : ctx+"/receivable/receivable!parseXlsx.htm",
		data :'filepath='+$('#filepath').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("上传成功!");
				search();
			}else{
				alert(data.resultInfo[1]);
			}
			xval.remove();//移除遮罩层
		}
	});
}
/**
 * 
 */
function exportExcel2007(){
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx+"/receivable/receivable!exportExcel2007.htm";
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}
function savelngpre(){
	var flag = window.confirm("确定保存预付款值吗？");
	if (flag == true) {
		openblockdiv();
		var formParam = $('#queryForm').serialize();
		$.webAjax({
			type : 'post',
			url : ctx+"/receivable/receivable!savelngpre.htm",
			data :formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("保存成功!");
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
function editInfo_edit(id){
	openblockdiv();
	$.webAjax({
		type : 'post',
		url : ctx+"/receivable/receivable!showToJson.htm",
		data :'receivableId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.receivableid);
				$('#forderno').val(data.model.forderno);
				$('#contractDate').val(formatDate('yyyy-MM-dd',data.model.contractDate));
				$('#saler').val(data.model.saler);
				$('#checkProject').val(data.model.checkProject);
				$('#famount').val(data.model.famount);
				$('#fclass').val(data.model.fclass);
				$('#fitemname').val(data.model.fitemname);
				$('#fnum').val(data.model.fnum);
				$('#servicelistprice').val(data.model.servicelistprice);
				$('#servicefinalprice').val(data.model.servicefinalprice);
				$('#servicefinalpricesum').val(data.model.servicefinalpricesum);
				$('#servicelistpricesum').val(data.model.servicelistpricesum);
				$('#serviceprice').val(data.model.serviceprice);
				$('#servicepricesum').val(data.model.servicepricesum);
				$('#discountRate').val(data.model.discountRate);
				$('#makeNumberCode').val(data.model.makeNumberCode);
				var fdStart = data.model.balancedate.indexOf("1900-01-01");
				if(fdStart == 0){
					$('#balancedate').val('');
				}else if(fdStart == -1){
					$('#balancedate').val(data.model.balancedate);
				}
				$('#serviceinmount').val(data.model.serviceinmount);
				$('#servicehead').val(data.model.servicehead);
				openDiv('inputDiv');
			}else{
				alert(data.resultInfo[1]);
			}
			closeblockdiv();
		}
	});
}
/**
 * 编辑后保存
 */
function saveReceivable(){
	countservice();
	var flag = window.confirm("确定保存吗？");
	if (flag == true) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		$.webAjax({
			type : 'post',
			url : ctx+"/receivable/receivable!saveToJson.htm",
			data :formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("保存成功!");
					search();
					closeDiv('inputDiv');
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 计算工程服务费总价
 */
function countservice(){
	var jshj = $('#famount').val();
	var danjia = $('#serviceprice').val();
	var fnum = $('#fnum').val();
	if(danjia.trim()!=''&&isNaN(danjia.trim())){
		alert("工程服务费单价必须为数字!");
		$('#serviceprice').val('');
		$('#servicefinalpricesum').val(jshj);
		return;
	}
	if(fnum.trim()!=''&&isNaN(fnum.trim())){
		alert("数量不正确!");
		$('#fnum').val('');
		return;
	}
	if(fnum.trim()==''||danjia.trim()==''){
		$('#servicepricesum').val('');
		$('#servicefinalpricesum').val(jshj);
		return;
	}
	var danjiadouble = parseFloat(danjia);
	var fnumdouble = parseFloat(fnum);
	var jshjdouble = parseFloat(jshj);
	$('#servicepricesum').val(danjiadouble*fnumdouble);
	if(jshjdouble-danjiadouble*fnumdouble<0){
		$('#servicefinalpricesum').val(0);
	}else{
		$('#servicefinalpricesum').val(jshjdouble-danjiadouble*fnumdouble);
	}
	if($('#servicelistpricesum').val().trim()==''||$('#servicelistpricesum').val()=='0'){
		$('#discountRate').val(0);
	}else{
		$('#discountRate').val($('#servicefinalpricesum').val()/$('#servicelistpricesum').val());
	}
}
/**
 * 计算列表总价
 */
function countlistservice(){
	var danjia = $('#servicelistprice').val();
	var fnum = $('#fnum').val();
	if(danjia.trim()!=''&&isNaN(danjia.trim())){
		alert("列表单价必须为数字!");
		$('#servicelistprice').val('');
		return;
	}
	if(fnum.trim()!=''&&isNaN(fnum.trim())){
		alert("数量不正确!");
		$('#fnum').val('');
		return;
	}
	if(fnum.trim()==''||danjia.trim()==''){
		$('#servicelistpricesum').val('');
		$('#discountRate').val(0);
		return;
	}
	var danjiadouble = parseFloat(danjia);
	var fnumdouble = parseFloat(fnum);
	$('#servicelistpricesum').val(danjiadouble*fnumdouble);
	alert($('#servicelistpricesum').val().trim());
	if($('#servicelistpricesum').val().trim()==''||$('#servicelistpricesum').val()=='0'){
		$('#discountRate').val(0);
	}else{
		$('#discountRate').val(($('#servicefinalpricesum').val()/$('#servicelistpricesum').val()).toFixed(2));
	}
}
/**
 * 计算结算总价
 */
function countfinalservice(){
	var finalservice = $('#servicefinalprice').val();
	if(isNaN(finalservice.trim())){
		alert("结算单价必须为数字!");
		return;
	}
}