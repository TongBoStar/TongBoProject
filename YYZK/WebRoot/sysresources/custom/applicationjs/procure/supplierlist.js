$(document).ready(function() {
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'supplierlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_supplier.supplierId',
		submitForm : submitForm//分页回调函数
		});	
	search();
});
function submitForm(){
	search();
}
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/supplier/supplier!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"supplierlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//供应商名称	fname
					html+='<td>'+replaceNull(o.fname)+'</td>';
					//地址	faddress
					html+='<td>'+replaceNull(o.faddress)+'</td>';
					/*//邮编	fpostalcode
					html+='<td>'+replaceNull(o.fpostalcode)+'</td>';
					//城市	fcity
					html+='<td>'+replaceNull(o.fcity)+'</td>';
					//省份	fprovince
					html+='<td>'+replaceNull(o.fprovince)+'</td>';
					//国家	fcountry
					html+='<td>'+replaceNull(o.fcountry)+'</td>';*/
					//电话	fphone
					html+='<td>'+replaceNull(o.fphone)+'</td>';
					//传真	ffax
					html+='<td>'+replaceNull(o.ffax)+'</td>';
					//邮箱	femail
					html+='<td>'+replaceNull(o.femail)+'</td>';
					//主页	fhomepage
					html+='<td>'+replaceNull(o.fhomepage)+'</td>';
					//开户行	fbank
					html+='<td>'+replaceNull(o.fbank)+'</td>';
					//开户帐号	faccount
					html+='<td>'+replaceNull(o.faccount)+'</td>';
					//联系人	fcontact
					html+='<td>'+replaceNull(o.fcontact)+'</td>';
					//法人代表	fcorperate
					html+='<td>'+replaceNull(o.fcorperate)+'</td>';
					/*//创建日期	fcreatedate
					html+='<td>'+replaceNull(o.fcreatedate)+'</td>';
					//失效日期	fabatedate
					html+='<td>'+replaceNull(o.fabatedate)+'</td>';*/
					//供应商等级	levels
					html+='<td>'+replaceNull(o.levels)+'</td>';
					//供应商归属分支机构	seccode
					html+='<td>'+replaceNull(o.seccode)+'</td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
//同步数据
function update(){
	var url = ctx+"/sortcodesec/syncSupplier.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("同步数据成功！");
				search();
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}

