$(function(){
	openblockdiv();
	window.simpleTable =$(document).SimpleTable({
		id:'seoutstockpage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '10',
		order: 'desc',
		orderBy: 't_seoutstockentry.finterid',
		submitForm : submitForm//分页回调函数
		});	
	
	loadseoutstock();
	
});
function submitForm(simpleTable, param)
{
	loadseoutstock();
}

function loadseoutstock()
{
	var idd = null;
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/seoutstockentry/seoutstockentry!listtable.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data : pageParam +'&'+formParam ,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			$.refreshPageToolbar(page,"seoutstockpage",simpleTable);
			$.each(page.result,function(i,o){
				if(o.seoutstock.finterid == idd){
						//填写主表相同分录表不同的行
						var style="";
						html+='<tr>';
						html+='<td '+style+'></td>';
						html+='<td '+style+'></td>'; 
						html+='<td '+style+'></td>'; 
						html+='<td '+style+'></td>';
						html+='<td '+style+'></td>';
						html+='<td '+style+'></td>';
						html+='<td '+style+'></td>';
						html+='<td '+style+'></td>';
						html+='<td '+style+'>'+replaceNull(o.itemname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.formatno)+'</td>';	
						html+='<td '+style+'>'+replaceNull(o.unitname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.fqty)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.fprice)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.famount)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.itemcode)+'</td>';
						html+='<td '+style+'>'+(o.ffetchdate==null?"":o.ffetchdate.substring(0,10))+'</td>';
						html+='<td '+style+'></td>';
					  	html+='</tr>';
					  	idd = o.seoutstock.finterid;
				}else{
						//填写主表不同的行
						var style="";
						html+='<tr>';
						var status="";
						if(o.seoutstock.fstatus==0){status="未审"}
						if(o.seoutstock.fstatus==1){status="已审"}
						html+='<td '+style+'>'+status+'</td>';
						var fclosed="";
						if(o.seoutstock.fclosed==0){status="未关闭"}
						if(o.seoutstock.fclosed==1){status="已关闭"}
						html+='<td '+style+'>'+fclosed+'</td>'; 
						html+='<td '+style+'>'+(o.seoutstock.fdate==null?"":o.seoutstock.fdate.substring(0,10))+'</td>'; 
						html+='<td '+style+'>'+replaceNull(o.seoutstock.fname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.seoutstock.fbillno)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.seoutstock.teamname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.seoutstock.adminname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.seoutstock.fcurrencyname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.itemname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.formatno)+'</td>';	
						html+='<td '+style+'>'+replaceNull(o.unitname)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.fqty)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.fprice)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.famount)+'</td>';
						html+='<td '+style+'>'+replaceNull(o.itemcode)+'</td>';
						html+='<td '+style+'>'+(o.ffetchdate==null?"":o.ffetchdate.substring(0,10))+'</td>';
						html+='<td '+style+'></td>';
					  	html+='</tr>';
					  	idd = o.seoutstock.finterid;
			  	}
			  	
			});
			$('#pageContent').html(html);
			closeblockdiv();
		}
	});
}
//--------购货单位---------
function fcustNameClick(){
	var offsettop=$("#fcustName").offset().top;   
 	var offsetleft=$("#fcustName").offset().left;
	$("#fcustNameDiv").css({position: "absolute",'top':offsettop-15,'left':offsetleft-200}); 
	$("#fcustNameDiv").css("display","");
	var name = $("#fcustName").val();
	var html='<td><select id="selectCodefcustName" onchange="changeCodefcustName();" style="width: 150px; height: 190px;background-color: #ccc;" multiple="true">';
	var data = 'organizationQuery.fname='+name;
	var url =ctx+'/organization/organization!listdate.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.organizationList;
									$.each(list,function(i,o){
										html+='<option value="'+o.fitemid+'" >'+o.fname+'</option>';
									});
								
							html+='</select></td>';
							$('#selectfcustName').html(html);
					}
		});	
}

function changeCodefcustName(){
	var sel = $("#selectCodefcustName").val();
	var txt = $('#selectCodefcustName').find('option:selected').text(); 
	$('#fcustid').val(sel);
	$('#fcustName').val(txt);
	$("#fcustNameDiv").css("display","none");
}