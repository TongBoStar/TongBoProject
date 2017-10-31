$(document).ready(function() { 
			window.simpleTable =$(document).SimpleTable({
				id:'propage',
				formId: 'queryForm',
				pageNo: '1',
				pageSize : '20',
				order: 'desc',
				orderBy: 't_project_info.id',
				submitForm : submitForm//分页回调函数
				});
			
			//报价单号quoteorderno 报价日期 quoteorderdate 有效期validitydate  折扣系数discountcoeff 交货期 deliverydate 设备型号devicemode 交货条件deliverycondition 
			//设备类型devicetype  价格单位priceunit 设计压力designpress 设计流量 designflow 进口压力inpress 出口压力outpress  调压部分 pressurestructure 计量部分meterstructure
			var html1='<option value="">--</option>';
			var html2='<option value="">--</option>';
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
								html1+='<option value="'+o.id+'">'+o.structurename+'</option>';
								
							}else if(o.structuretype!=null&&o.structuretype=="2"){
								html2+='<option value="'+o.id+'">'+o.structurename+'</option>';
								
							}
						});
						$('#pressurestructure').html(html1);
						$('#meterstructure').html(html2);
					}
					
					search();
				}
			});
});
function addproject(){
	window.open ('project-add.htm?projectInfoId=-1','addwindow','height=700,width=1500,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no') 
}

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
	var url = ctx+"/projectInfo/project-info!listToJson.htm";
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
					
					/**
					 * 用户名称(userName)    项目名称(projectName)    产品型号(productMode)  产品类别(productType)
					 *   结构形式调压部分(pressurestructurename)  结构形式计量部分(meterstructurename) 
						   设计压力（调压器前）(designPress)      设计流量（额定值）(designFlow)  报价日期(quoteOrderDate) 报价单号(quoteOrderNo)
						版本号(version)  价格单位(priceUnit) 折扣系数 (discountCoeff) 
					 */
					html+='<tr align="center">';
					html += '<td><input type="checkbox" id="checkedpro" name="checkedpro" value="' + o.id + '"/></td>';
					html+='<td ><a href="javascript:projectdetail('+o.id+');void(0);" style="color:blue;">'+(o.projectName==null?"":o.projectName)+'</a></td>';
					html+='<td>'+(o.userName==null?"":o.userName)+'</td>';
					html+='<td>'+(o.productMode==null?"":o.productMode)+'</td>';
					html+='<td>'+(o.productType==null?"":o.productType)+'</td>';
					html+='<td>'+(o.pressurestructurename==null?"":o.pressurestructurename)+'</td>';
					html+='<td>'+(o.meterstructurename==null?"":o.meterstructurename)+'</td>';
					html+='<td>'+(o.designPress==null?"":o.designPress)+'</td>';
					html+='<td>'+(o.designFlow==null?"":o.designFlow)+'</td>';
					html+='<td>'+(o.quoteOrderDate==null?"":replaceNull(formatDate("yyyy-MM-dd",o.quoteOrderDate)) )+'</td>';
					html+='<td>'+(o.quoteOrderNo==null?"":o.quoteOrderNo)+'</td>';
					html+='<td>'+(o.version==null?"":o.version)+'</td>';
					if(o.priceUnit!=null&&o.priceUnit=="1"){
						html+='<td>RMB</td>';
					}else if(o.priceUnit!=null&&o.priceUnit=="2"){
						html+='<td>USD$</td>';
					}else{
						html+='<td></td>';
					}
					html+='<td>'+(o.discountCoeff==null?"":o.discountCoeff)+'</td>';
					html+='<td><a href="javascript:editproject('+o.id+');void(0);"><img src="'+ctx+'/images/icon01.gif"/></a>|<a href="javascript:del('+o.id+');"><img src="'+ctx+'/images/delete_small.gif"/></a></td>';
					html+='</tr>';
				});
				$('#plantable').html(html);
				closeblockdiv();
			}
		}
	});
}
function editproject(proid){
	window.open ("project-add.htm?projectInfoId="+proid,'projectedit','height=700,width=1500,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
}
//删除
function del(blocid)
{
	var param = {};
	if(blocid) {
		param['checkedIdList[0]'] = blocid;
	} else {		
		var delBlocs = $('[name="checkedpro"]:checked');
		//console.log('del admin length: ' + delAdmins.length);
		var cnt = 0;
		$.each(delBlocs, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	//console.log('param : ' + param['checkedIdList[0]']);
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的项目！');
		return;
	}
	
	if(!confirm('确定删除项目吗？')) {
		return;
	}
	var url = ctx + '/projectInfo/project-info!deleteToJson.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("删除成功");
				search();
			} else {
				alert('删除项目失败！');
			}
		}
	});
}
function projectdetail(proid){
	window.open ("projectdetail.htm?proId="+proid,'projectdetail1','height=700,width=1500,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
}