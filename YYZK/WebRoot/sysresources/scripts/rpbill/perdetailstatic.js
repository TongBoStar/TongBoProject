$(document).ready(function() {
	countRewardsByQuarter();
});
/**
 * 统计
 */
function countRewardsByQuarter(){
	/*if($('#fdate').val().trim()==''){
		alert("请输入结算的季度!");
		return;
	}*/
	openblockdiv();
	var formparam = $('#queryForm').serialize();
	$.webAjax({
		type : 'post',
		url : ctx+"/performanceDetail/performance-detail!countRewardsByQuarter.htm",
		data :formparam,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.performanceDetailList,function(i,o){
					var servicefeeall=0;
					var achrewardall=0;
					servicefeeall = (null==o.servicefeeamounta?0:o.servicefeeamounta)+(null==o.servicefeeamountbcde?0:o.servicefeeamountbcde);
					achrewardall = (null==o.achrewardamounta?0:o.achrewardamounta)+(null==o.achrewardamountbcde?0:o.achrewardamountbcde)+
									(null==o.excrewardamount?0:o.excrewardamount)
					html+='<tr align="center">';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+o.fyear+"年第"+o.fquarter+'季度</td>';
					html+='<td>'+replaceNull(o.salerName)+'</a></td>';
					html+='<td>'+replaceNull(o.achrewardamounta)+'</td>';
					html+='<td>'+replaceNull(o.achrewardamountbcde)+'</td>';
					html+='<td>'+replaceNull(o.excrewardamount)+'</td>';
					html+='<td>'+replaceNull(o.servicefeeamounta)+'</td>';
					html+='<td>'+replaceNull(o.servicefeeamountbcde)+'</td>';
					html+='<td>'+achrewardall.toFixed(2)+'</td>';
					html+='<td>'+servicefeeall.toFixed(2)+'</td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 导出为2007表格
 */
function exportExcelStatic2007(){
	openblockdiv();
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx+"/performanceDetail/performance-detail!exportExcelStatic2007.htm";
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
	closeblockdiv();
}
function backtopdetail(){
	window.location.href=ctx+"/receivable/performancedetail.htm";
}