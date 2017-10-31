$(document).ready(function() {
			window.simpleTable =$(document).SimpleTable({
				id:'propage',
				formId: 'queryForm',
				pageNo: '1',
				pageSize : '10',
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
					html+='<td><input type="hidden" id="aid'+(i)+'" value="'+(o.aid==null?"":o.aid)+'"/><input class="inputall" name="itemname" id="itemname'+(i)+'" value="'+(o.itemname==null?"":o.itemname)+'"/></td>';
					html+='<td><input class="inputall" name="fmode" id="fmode'+(i)+'" value="'+(o.fmode==null?"":o.fmode)+'"/></td>';
					html+='<td><input class="inputall" name="fdescript" id="fdescript'+(i)+'" value="'+(o.fdescript==null?"":o.fdescript)+'"/></td>';
					html+='<td><input class="inputall" name="flevel" id="flevel'+(i)+'" value="'+(o.flevel==null?"":o.flevel)+'"/></td>';
					html+='<td>'+(o.fmaker==null?"":o.fmaker)+'</td>';
					html+='<td>'+(o.fshortname==null?"":o.fshortname)+'</td>';
					html+='<td><input class="inputall" name="srcarea" id="srcarea'+(i)+'" value="'+(o.srcarea==null?"":o.srcarea)+'"/></td>';
					html+='<td>'+(o.buyamount==null?"":o.buyamount)+'</td>';
					html+='<td>'+(o.avgamount==null?"":o.avgamount)+'</td>';
					html+='<td><input class="inputall" name="rpamount" id="rpamount'+(i)+'" value="'+(o.rpamount==null?"":o.rpamount)+'"/></td>';
					html+='<td><input class="inputall" name="costamount" id="costamount'+(i)+'" value="'+(o.costamount==null?"":o.costamount)+'"/></td>';
					html+='<td>'+(o.listamount==null?"":o.listamount)+'</td>';
					html+='</tr>';
				});
				$('#plantable').html(html);
			}
		}
	});
}

function save()
{
	
	var param = {};
	//验证各个输入项
	for(var i=0;i<$("#plantable").find("tr").length;i++){
		/*alert($("#aid"+i).val());
		alert($("#itemname"+i).val());
		alert($("#fmode"+i).val());
		alert($("#fdescript"+i).val());
		alert($("#flevel"+i).val());
		alert($("#srcarea"+i).val());
		alert($("#rpamount"+i).val());
		alert($("#costamount"+i).val());*/
		param['proItems['+i+'].aid'] = $("#aid"+i).val();
		param['proItems['+i+'].itemname'] = $("#itemname"+i).val();
		param['proItems['+i+'].fmode'] = $("#fmode"+i).val();
		param['proItems['+i+'].fdescript'] = $("#fdescript"+i).val();
		param['proItems['+i+'].flevel'] = $("#flevel"+i).val();
		param['proItems['+i+'].srcarea'] = $("#srcarea"+i).val();
		param['proItems['+i+'].rpamount'] = $("#rpamount"+i).val();
		param['proItems['+i+'].costamount'] = $("#costamount"+i).val();
		
	}
	var url =ctx+ "/proItem/pro-item!saveToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:param,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
			if(data.resultInfo[0]=='0')
			{
				alert("保存成功！");
				search();
				//closeAddDiv();
			}
		}
	});
}