$(document).ready(function() {
	if($("#fbillno").val()!=null&&$.trim($("#fbillno").val())!=""){
		$("#fbillno1").val($("#fbillno").val());
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
		orderBy: 'finterid',
		submitForm : submitQueryForm//分页回调函数
		});
	loadPorequests();
});
function submitQueryForm(simpleTable, param){
	loadPorequests();
}
/**
 * 查询采购申请单信息
 */
function loadPorequests() {
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+ '/porequest/porequest!listToJsonNew.htm';
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
				var products  = o.listporequestentry;
				if(products!=null&&products.length>0){
					var length = products.length;
					$.each(products, function(j, p){
						if(length==1){
							html += '<tr id="tr'+i+''+j+'" ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td>'+(o.createdate==null?"":o.createdateString.substring(0,10)) +'</td>';
							html += '<td>'+(o.fbillno==null?"":o.fbillno)+'</td>';
							var fbiztype = "";
							if(o.fbiztype==12510){
								fbiztype="外购入库";
							}else if(o.fbiztype==12511){
								fbiztype="订单委外";
							}else{
								fbiztype = "";
							}
							html += '<td>'+fbiztype+'</td>';
							html += '<td>Y</td>';
							var fclosed = "";
							if(o.fclosed==0){
								fclosed="未关闭";
							}else if(o.fclosed==1){
								fclosed="已关闭";
							}else{
								fclosed = "";
							}
							html += '<td>'+fclosed+'</td>';
							html += '<td>'+(o.depart==null?"":o.depart.teamname)+'</td>';
							html += '<td>'+(o.admin==null?"":o.admin.adminName)+'</td>';
							
							html += '<td>'+(p.itemname==null?"":p.itemname)+'</td>';
							html += '<td>'+(p.itemmode==null?"":p.itemmode)+'</td>';
							html += '<td>'+(p.unitname==null?"":p.unitname)+'</td>';
							html += '<td>'+(p.amount==null?"":p.amount)+'</td>';
							html += '<td>'+(p.ata==null?"":p.ataString.substring(0,10))+'</td>';
							html += '<td>'+(p.fsupplier==null?"":p.fsupplier.fname)+'</td>';
							html += '<td>'+(p.itemcode==null?"":p.itemcode)+'</td>';
							html += '<td>'+(p.rta==null?"":p.rtaString.substring(0,10))+
							'<input id="poid'+i+''+j+'" value="'+(p.poid==null?"":p.poid)+'"  type="hidden"/>'+
							'<input id="detpid'+i+''+j+'" value="'+(o.fdeptid==null?"":o.fdeptid)+'"  type="hidden"/>'+
							'<input id="detpname'+i+''+j+'" value="'+(o.depart==null?"":o.depart.teamname)+'"  type="hidden"/>'
							+'</td>';
							html += '</tr>';
						}else if(length>1&&j==0){
							html += '<tr id="tr'+i+''+j+'" ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td style="border-bottom:0px;">'+(o.createdate==null?"":o.createdateString.substring(0,10)) +'</td>';
							html += '<td style="border-bottom:0px;">'+(o.fbillno==null?"":o.fbillno)+'</td>';
							var fbiztype = "";
							if(o.fbiztype==12510){
								fbiztype="外购入库";
							}else if(o.fbiztype==12511){
								fbiztype="订单委外";
							}else{
								fbiztype = "";
							}
							html += '<td style="border-bottom:0px;">'+fbiztype+'</td>';
							html += '<td style="border-bottom:0px;">Y</td>';
							var fclosed = "";
							if(o.fclosed==0){
								fclosed="未关闭";
							}else if(o.fclosed==1){
								fclosed="已关闭";
							}else{
								fclosed = "";
							}
							html += '<td style="border-bottom:0px;">'+fclosed+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.depart==null?"":o.depart.teamname)+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.admin==null?"":o.admin.adminName)+'</td>';
							
							html += '<td>'+(p.itemname==null?"":p.itemname)+'</td>';
							html += '<td>'+(p.itemmode==null?"":p.itemmode)+'</td>';
							html += '<td>'+(p.unitname==null?"":p.unitname)+'</td>';
							html += '<td>'+(p.amount==null?"":p.amount)+'</td>';
							html += '<td>'+(p.ata==null?"":p.ataString.substring(0,10))+'</td>';
							html += '<td>'+(p.fsupplier==null?"":p.fsupplier.fname)+'</td>';
							html += '<td>'+(p.itemcode==null?"":p.itemcode)+'</td>';
							html += '<td>'+(p.rta==null?"":p.rtaString.substring(0,10))+
							'<input id="poid'+i+''+j+'" value="'+(p.poid==null?"":p.poid)+'"  type="hidden"/>'+
							'<input id="detpid'+i+''+j+'" value="'+(o.fdeptid==null?"":o.fdeptid)+'"  type="hidden"/>'+
							'<input id="detpname'+i+''+j+'" value="'+(o.depart==null?"":o.depart.teamname)+'"  type="hidden"/>'
							
							+'</td>';
							html += '</tr>';
							
						}else if(length>1&&j<length-1&&j>0){
							
							html += '<tr id="tr'+i+''+j+'" ondblclick="selectPro(\''+i+''+j+'\')">';
							html += '<td style="border-bottom:0px;">'+(o.createdate==null?"":o.createdateString.substring(0,10)) +'</td>';
							html += '<td style="border-bottom:0px;">'+(o.fbillno==null?"":o.fbillno)+'</td>';
							var fbiztype = "";
							if(o.fbiztype==12510){
								fbiztype="外购入库";
							}else if(o.fbiztype==12511){
								fbiztype="订单委外";
							}else{
								fbiztype = "";
							}
							html += '<td style="border-bottom:0px;">'+fbiztype+'</td>';
							html += '<td style="border-bottom:0px;">Y</td>';
							var fclosed = "";
							if(o.fclosed==0){
								fclosed="未关闭";
							}else if(o.fclosed==1){
								fclosed="已关闭";
							}else{
								fclosed = "";
							}
							html += '<td style="border-bottom:0px;">'+fclosed+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.depart==null?"":o.depart.teamname)+'</td>';
							html += '<td style="border-bottom:0px;">'+(o.admin==null?"":o.admin.adminName)+'</td>';
							
							html += '<td>'+(p.itemname==null?"":p.itemname)+'</td>';
							html += '<td>'+(p.itemmode==null?"":p.itemmode)+'</td>';
							html += '<td>'+(p.unitname==null?"":p.unitname)+'</td>';
							html += '<td>'+(p.amount==null?"":p.amount)+'</td>';
							html += '<td>'+(p.ata==null?"":p.ataString.substring(0,10))+'</td>';
							html += '<td>'+(p.fsupplier==null?"":p.fsupplier.fname)+'</td>';
							html += '<td>'+(p.itemcode==null?"":p.itemcode)+'</td>';
							html += '<td>'+(p.rta==null?"":p.rtaString.substring(0,10))+
							'<input id="poid'+i+''+j+'" value="'+(p.poid==null?"":p.poid)+'"  type="hidden"/>'+
							'<input id="detpid'+i+''+j+'" value="'+(o.fdeptid==null?"":o.fdeptid)+'"  type="hidden"/>'+
							'<input id="detpname'+i+''+j+'" value="'+(o.depart==null?"":o.depart.teamname)+'"  type="hidden"/>'
							
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
							html += '<td>'+(p.itemname==null?"":p.itemname)+'</td>';
							html += '<td>'+(p.itemmode==null?"":p.itemmode)+'</td>';
							html += '<td>'+(p.unitname==null?"":p.unitname)+'</td>';
							html += '<td>'+(p.amount==null?"":p.amount)+'</td>';
							html += '<td>'+(p.ata==null?"":p.ataString.substring(0,10))+'</td>';
							html += '<td>'+(p.fsupplier==null?"":p.fsupplier.fname)+'</td>';
							html += '<td>'+(p.itemcode==null?"":p.itemcode)+'</td>';
							html += '<td>'+(p.rta==null?"":p.rtaString.substring(0,10))+
							'<input id="poid'+i+''+j+'" value="'+(p.poid==null?"":p.poid)+'"  type="hidden"/>'+
							'<input id="detpid'+i+''+j+'" value="'+(o.fdeptid==null?"":o.fdeptid)+'"  type="hidden"/>'+
							'<input id="detpname'+i+''+j+'" value="'+(o.depart==null?"":o.depart.teamname)+'"  type="hidden"/>'
							
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
function search3(){
	var offsettop=$("#deptid2di").offset().top;   
 	var offsetleft=$("#deptid2di").offset().left;
	$("#itemcodeDivdp").css({position: "absolute",'top':offsettop+25,'left':offsetleft-10}); 
	$("#itemcodeDivdp").css("display","");
	var name = $("#deptid2di").val();
	var html='<td><select id="selectCode3" onchange="changeCode3();" style="width: 150px; height: 150px;background-color: #ccc;" multiple="true">';
	var data = 'departmentQuery.teamname='+name;
	var url =ctx+'/system/findListTeam.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.departmentList;
									$.each(list,function(i,o){
										html+='<option value="'+o.teamid+'" >'+o.teamname+'</option>';
									});
								
							html+='</select></td>';
							$('#selectsbodydp').html(html);
					}
		});	
	
}

function changeCode3(){
	var sel = $("#selectCode3").val();
	var txt = $('#selectCode3').find("option:selected").text();
	$('#deptid').attr("value",sel);
	$('#deptid2di').attr("value",txt);
	$("#itemcodeDivdp").css("display","none");
}

function selectPro(i){
	var tds = $("#tr"+i).children('td');
	var itemcode="";
	var unitname="";
	var count = "";
	var ordercode="";
	$.each(tds,function(i,o){
		if($(this).html()!=null&&$(this).html()!=""){
			if(i==1){
				ordercode =$(this).html(); 
			}else if(i==9){
				unitname = $(this).html();
			}else if(i==10){
				count = $(this).html();
			}else if(i==13){
				itemcode = $(this).html();
			}else{
				
			}
		}
	});
	var poid=$("#poid"+i).val();
	var deptid=$("#detpid"+i).val()==null?"":$("#detpid"+i).val();
	var deptname=$("#detpname"+i).val()==null?"":$("#detpname"+i).val();
	var lst = new Array();
	lst.push(ordercode);
	lst.push(itemcode);
	lst.push(unitname);
	lst.push(count);
	lst.push(poid);
	lst.push(deptid);
	lst.push(deptname);
	opener.showPorequstValue(lst);
	/**
	 * 日期createdate 单据编号fbillno 业务类型fbiztype 审核标志fstatus 关闭标志fclosed 使用部门fdeptid 申请人frequesterid   
物料名称itemname 规格型号itemmode 单位unitname 数量amount 到货日期ata 供应商名称FSupplyID 物料长代码itemcode 建议采购日期rta
	 */
	window.close();
}