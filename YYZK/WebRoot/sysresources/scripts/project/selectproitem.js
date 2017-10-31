var trid="";
function loadProItem(id){
	trid = id;
	window.simpleTable =$(document).SimpleTable({
		id:'propage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '10',
		order: 'desc',
		orderBy: 't_pro_item.aid',
		submitForm : submitForm//分页回调函数
		});	
	document.onkeydown = function(e){
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	search();	
	     }
	}
	
	search();
}

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
					html+='<tr id="tr'+i+'" align="center" ondblclick="selectItem('+i+')">';
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
					html+='</tr>';
				});
				$('#plantable').html(html);
			}
		}
	});
}
function selectItem(i){
	var tds = $("#tr"+i).children('td');
	var itemcode="";
	var itemname="";
	var itemmode="";
	var flevel="";
	var fmaker="";
	var srcarea="";
	var listamount="";
	var costamount="";
	var fdescript="";
	$.each(tds,function(i,o){
		if($(this).html()!=null&&$(this).html()!=""){
			if(i==0){
				itemcode =$(this).html(); 
			}else if(i==1){
				itemname = $(this).html();
			}else if(i==2){
				itemmode = $(this).html();
			}else if(i==4){
				flevel = $(this).html();
			}else if(i==7){
				fmaker = $(this).html();
			}else if(i==12){
				listamount = $(this).html();
			}else if(i==11){
				costamount = $(this).html();
			}else if(i==3){
				fdescript = $(this).html();
			}
		}
	});
	var lst = new Array();
	lst.push(itemcode);
	lst.push(itemname);
	lst.push(itemmode);
	lst.push(flevel);
	lst.push(fmaker);
	lst.push(srcarea);
	lst.push(listamount);
	lst.push(costamount);
	lst.push(fdescript);	
	lst.push(trid);
	opener.showItemValue(lst);
	window.close();
}



