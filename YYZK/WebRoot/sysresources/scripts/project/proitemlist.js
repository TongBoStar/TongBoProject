$(document).ready(function() {
	$('#fileInput1').uploadify({
        'swf': ctx+'/uploadify/uploadify.swf',
        'uploader':ctx+'/common/file-upload.htm',//处理Action
        'folder': '/uploads',//服务端默认保存路径
        //'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
        'buttonText':'上传文件',//按钮显示文字,不支持中文,解决方案见下
        'height':25,
        'width':60,
        //'buttonImage':'${ctx}/image/addimg.jpg',//通过设置背景图片解决中文问题,把背景图做成按钮的样子
        'multi':false,//多文件上传开关
         'fileTypeExts':'*.xls;*.xlsx',//文件过滤器
        'fileTypeDesc':'Excel文件',//文件过滤器 详解见文档
        'hideButton' : true,
        'fileObjName':'uploadFile',
        //'uploadLimit':10,
       'onUploadComplete' : function(file){ 
       		//response为服务器端返回的字符串值
         },
    	 'onUploadError':function(file, errorCode, errorMsg)
    	 {
    		 alert(errorMsg);
    	 },
    	 'onUploadSuccess' : function(file, data, response) {
    		data = $.parseJSON(data);
    		$("#filename").val(data.srcfilename);
    		$("#filepath").val(data.filename); 
		}
    });
			window.simpleTable =$(document).SimpleTable({
				id:'propage',
				formId: 'queryForm',
				pageNo: '1',
				pageSize : '20',
				order: 'desc',
				orderBy: 't_pro_item.aid',
				submitForm : submitForm//分页回调函数
				});	
			search();
});


function submitForm()
{
	search();
}

function search()
{
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/proItem/pro-item!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"propage",simpleTable);
			if(data.resultInfo[0]=='0')
			{
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					html+='<td>'+(o.itemcode==null?"":o.itemcode)+'</td>';
					html+='<td>'+(o.itemname==null?"":o.itemname)+'</td>';
					html+='<td>'+(o.fmode==null?"":o.fmode)+'</td>';
					html+='<td>'+(o.fdescript==null?"":o.fdescript)+'</td>';
					html+='<td>'+(o.flevel==null?"":o.flevel)+'</td>';
					html+='<td>'+(o.fmaker==null?"":o.fmaker)+'</td>';
					html+='<td>'+(o.fshortname==null?"":o.fshortname)+'</td>';
					html+='<td>'+(o.srcarea==null?"":o.srcarea)+'</td>';
					html+='<td>'+(o.buyamount==null?"":o.buyamount)+'</td>';
					html+='<td>'+(o.avgamount==null?"":o.avgamount)+'</td>';
					html+='<td>'+(o.rpamount==null?"":o.rpamount)+'</td>';
					html+='<td>'+(o.costamount==null?"":o.costamount)+'</td>';
					html+='<td>'+(o.listamount==null?"":o.listamount)+'</td>';
					html+='<td><a href="javascript:editstr('+o.aid+');"><img src="'+ctx+'/images/icon01.gif"/></a></td>';
					html+='</tr>';
				});
				$('#plantable').html(html);
				closeblockdiv();
			}
		}
	});
}
function editstr(proid)
{
	var url = ctx+"/proItem/pro-item!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'proItemId='+proid,
		success : function(data) {
			data = $.parseJSON(data);
			var model=data.model;
			//aid  itemcode itemname fmode flevel fdescript fmaker fshortname srcarea buyamount  avgamount rpamount costamount listamount
			$('#aid').attr("value",proid);
			$('#itemcode').attr("value",(model.itemcode==null?"":model.itemcode));
			$('#itemname').attr("value",(model.itemname==null?"":model.itemname));
			$('#fmode').attr("value",(model.fmode==null?"":model.fmode));
			$('#flevel').attr("value",(model.flevel==null?"":model.flevel));
			$('#fdescript').attr("value",(model.fdescript==null?"":model.fdescript));
			$('#fmaker').attr("value",(model.fmaker==null?"":model.fmaker));
			$('#fshortname').attr("value",(model.fshortname==null?"":model.fshortname));
			$('#srcarea').attr("value",(model.srcarea==null?"":model.srcarea));
			$('#buyamount').attr("value",(model.buyamount==null?"":model.buyamount));
			$('#avgamount').attr("value",(model.avgamount==null?"":model.avgamount));
			$('#rpamount').attr("value",(model.rpamount==null?"":model.rpamount));
			$('#costamount').attr("value",(model.costamount==null?"":model.costamount));
			$('#listamount').attr("value",(model.listamount==null?"":model.listamount));
		}
	});

	$("#buyamount").attr("readonly","readonly");
	$("#buyamount").attr("class","inputall1");
	$("#avgamount").attr("readonly","readonly");
	$("#avgamount").attr("class","inputall1");
	$("#listamount").attr("readonly","readonly");
	$("#listamount").attr("class","inputall1");
	
	$("#itemcode").removeAttr("disabled");
	$("#itemcode").attr("style","display:'';");
	$("#itemcode1").attr("disabled","disabled");
	$("#itemcode1").attr("style","display:none;");
	$.openDiv('inputDiv');	
}
function addproitem(){
	$('#aid').attr("value","");
	$('#itemcode').attr("value","");
	$('#itemcode1').attr("value","");
	$('#itemname').attr("value","");
	$('#fmode').attr("value","");
	$('#flevel').attr("value","");
	$('#fdescript').attr("value","");
	$('#fmaker').attr("value","");
	$('#fshortname').attr("value","");
	$('#srcarea').attr("value","");
	$('#buyamount').attr("value","");
	$('#avgamount').attr("value","");
	$('#rpamount').attr("value","");
	$('#costamount').attr("value","");
	$('#listamount').attr("value","");
	$("#buyamount").removeAttr("readonly");
	$("#buyamount").attr("class","inputall");
	$("#avgamount").removeAttr("readonly");
	$("#avgamount").attr("class","inputall");
	$("#listamount").removeAttr("readonly");
	$("#listamount").attr("class","inputall");
	
	$("#itemcode").attr("disabled","disabled");
	$("#itemcode").attr("style","display:none;");
	$("#itemcode1").removeAttr("disabled");
	$("#itemcode1").attr("style","display:'';");
	openDiv('inputDiv');
}
function save()
{
	
	var formParam = $('#inputForm').serialize();
	//验证各个输入项
	if($("#itemcode").attr("disabled")==false){
		if($.trim($('#itemcode').val())==""){
			alert("物料代码不能为空!");
			$('#itemcode').focus();
			return false;
		}
	}else{
		if($.trim($('#itemcode1').val())==""){
			alert("物料代码不能为空!");
			$('#itemcode1').focus();
			return false;
		}
	} 
	
	
	if($.trim($('#itemname').val())==""){
		alert("物料名称不能为空!");
		$('#itemname').focus();
		return false;
	}
	
	var url =ctx+ "/proItem/pro-item!saveToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
			if(data.resultInfo[0]=='0')
			{
				alert("操作成功！");
				search();
				closeAddDiv();
			}
		}
	});
}

function updateValue(){
	var costamount = $("#costamount").val();
	var re = /^[0-9]+.?[0-9]*$/;
	if(!re.test($.trim(costamount))){
		alert("指定成本价格式不正确，请输入正确的数字!");
		$('#costamount').focus();
		return false;
	}else{
		var listamount = parseFloat(costamount)*2.5;
		$("#listamount").attr("value",listamount);
	}
	
}
function updateListValue(){
	var rpamount = $("#rpamount").val();
	var re = /^[0-9]+.?[0-9]*$/;
	if(!re.test($.trim(rpamount))){
		alert("参考价格式不正确，请输入正确的数字!");
		$('#rpamount').focus();
		return false;
	}else{
		var costamount = $("#costamount").val();
		if(costamount==0){
			var listamount = parseFloat(rpamount)*2.5;
			$("#listamount").attr("value",listamount);
		}else{
			var sum = parseFloat(costamount)*2.5;
			$("#listamount").attr("value",sum);
		}
		
	}
	
}
function insertproitem(){
	block_viewport();
	var url =ctx+ "/proItem/pro-item!insertProItem.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		xval.remove();
			if(data.resultInfo[0]=='0')
			{
				alert("操作成功！");
				search();
			}
			if(data.resultInfo[0]=='-1')
			{
				alert("操作失败！");
				search();
			}
		}
	});
}


function exportXls(){
	var formParam = $('#queryForm').serialize();
 	var url = ctx+"/excel/exportProItem.htm";
 	block_viewport();
 	$.webAjax( {
	type : "post",
	url : url,
	data:formParam,
	success : function(data) {
		data = $.parseJSON(data);
		xval.remove();
		if(data.resultInfo[0]==0){
		location.href=ctx+"/excel/saveExportProItem.htm?filename="+data.resultInfo[1];//data.resultInfo[1]为保存在服务器的文件名,yyyyMMddHHmmss+"work.xls"
		}else{
		alert(data.resultInfo[1]);
		}
	}
});
}
function importxls()
{
	 var filepath = $("#filepath").val();
	 if(null==filepath||''==filepath){
	 alert("请先上传文件!");
	 return;
	 }
	 block_viewport();
	 var url = ctx+"/proItem/pro-item!importItemxls.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:'xlsfile='+filepath,
			success : function(data) {
			data = $.parseJSON(data);
			xval.remove();
				if(data.resultInfo[0]=='0')
				{
					alert(data.resultInfo[1]);
					$("#filepath").val('');
					search();
				}else{
					alert(data.resultInfo[1]);
					$("#filepath").val('');
				}
			}
		});
}
//物料显示
function showValue(lst){
	if(lst.length>0){
		//将弹出的物料代码选择页面的值回显到添加页
		$("#itemcode1").val(lst[0]==null?"":lst[0]);
		$("#itemname").val(lst[1]==null?"":lst[1]);
		$("#fmode").val(lst[2]==null?"":lst[2]);
		$("#flevel").val(lst[3]==null?"":lst[3]);
		$("#fmaker").val(lst[4]==null?"":lst[4]);
		$("#fshortname").val(lst[4]==null?"":lst[4]);
		$("#srcarea").val(lst[5]==null?"":lst[5]);
		$("#fdescript").val(lst[6]==null?"":lst[6]);
	}
	   
}
//添加物料代码
function addItemcode(){
	window.open(ctx +'/projectinfo/showitemcode.htm', 'newwindow', 'height=650, width=1300, top=250, left=490, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
}


