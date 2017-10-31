<%@ page language="java" pageEncoding="UTF-8" %>
<style>
<!--
.sort {
	
}
.th.sort.desc {
	background:#c5c5c5 url(${ctx}/images/sort_desc.gif) center right no-repeat
}
.th.sort.asc {
	background:#c5c5c5 url(${ctx}/images/sort_asc.gif) center right no-repeat
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
$().ready(function() {
	
	$('#${param.form}_paging .c2-left .pages-cur').html('总计 ' + ${param.totalCount} + ' 条记录');
	if(${param.totalPages} > 5) {
		var pre = $('<span class="pre" style="cursor: pointer;"> < </span>');
		pre.click(function() {//上一页
			if(${param.pageNo} == 1) {
				alert('已经第一页');
				return;
			}
			var gotoNo = ${param.pageNo} - 1 > 1?${param.pageNo}-1:1;
			//alert(gotoNo);
			/** -------------回调---------------  */
			var pagingParam = {};
			pagingParam["page.pageNo"] = gotoNo;//当前页
			pagingParam["page.pageSize"] = '${param.pageSize}';//每页显示条数
			pagingParam["page.orderBy"] = '${param.orderBy}';//排序字段
			pagingParam["page.order"] = '${param.order}';//排序
			
			var fields = $('#${param.form}').serializeArray();
			$.each( fields, function(i, field){//加载form表单查询项
			  pagingParam[field.name ] = field.value;
			});

			eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
			/** -------------回调---------------  */
		});
		$('#${param.form}_paging .c2-right .pages').prepend(pre);
	}
	
	
	
	$.each(${param.linkPageNumbers}, function(i, o){//循环页数
		if(i == 0) {
			if(o > 2) {
				var ss = $('<span class="first" style="cursor: pointer;">1</span>');
				ss.click(function() {
					/** -------------回调---------------  */
					var pagingParam = {};
					pagingParam["page.pageNo"] = 1;
					pagingParam["page.pageSize"] = '${param.pageSize}';
					pagingParam["page.orderBy"] = '${param.orderBy}';
					pagingParam["page.order"] = '${param.order}';
					var fields = $('#${param.form}').serializeArray();
					$.each( fields, function(i, field){
					  pagingParam[field.name ] = field.value;
					});

					eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
					/** -------------回调---------------  */
				});
				$('#${param.form}_paging .c2-right .no').append(ss);
				ss = $('<span>&nbsp;&nbsp;...&nbsp;&nbsp;</span>');
				$('#${param.form}_paging .c2-right .no').append(ss);
			} else if(o > 1) {
				var ss = $('<span class="first" style="cursor: pointer;">1</span>');
				ss.click(function() {
					/** -------------回调---------------  */
					var pagingParam = {};
					pagingParam["page.pageNo"] = 1;
					pagingParam["page.pageSize"] = '${param.pageSize}';
					pagingParam["page.orderBy"] = '${param.orderBy}';
					pagingParam["page.order"] = '${param.order}';
					var fields = $('#${param.form}').serializeArray();
					$.each( fields, function(i, field){
					  pagingParam[field.name ] = field.value;
					});

					eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
					/** -------------回调---------------  */
				});
				
				$('#${param.form}_paging .c2-right .no').append(ss);
			}
		}
		if(${param.pageNo} == o) {
			var ss = $('<span class="pages-cur">'+ o +'</span>');
			$('#${param.form}_paging .c2-right .no').append(ss);
		} else {
			var ss = $('<a class="goto_'+o+'" >'+ o +'</a>');
			ss.click(function() {
				/** -------------回调---------------  */
				var pagingParam = {};
				pagingParam["page.pageNo"] = o;
				pagingParam["page.pageSize"] = '${param.pageSize}';
				pagingParam["page.orderBy"] = '${param.orderBy}';
				pagingParam["page.order"] = '${param.order}';
				var fields = $('#${param.form}').serializeArray();
				$.each( fields, function(i, field){
				  pagingParam[field.name ] = field.value;
				});

				eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
				/** -------------回调---------------  */
			});
			$('#${param.form}_paging .c2-right .no').append(ss);
		}
		
		if(i == ${param.linkPageNumbers}.length - 1) {
			if((o + 1) < ${param.totalPages}) {
				var ss = $('<span>&nbsp;&nbsp;...&nbsp;&nbsp;</span>');
				$('#${param.form}_paging .c2-right .no').append(ss);
				ss = $('<span class="last" style="cursor: pointer;">${param.totalPages}</span>');
				ss.click(function() {
					/** -------------回调---------------  */
					var pagingParam = {};
					pagingParam["page.pageNo"] = ${param.totalPages};
					pagingParam["page.pageSize"] = '${param.pageSize}';
					pagingParam["page.orderBy"] = '${param.orderBy}';
					pagingParam["page.order"] = '${param.order}';
					var fields = $('#${param.form}').serializeArray();
					$.each( fields, function(i, field){
					  pagingParam[field.name ] = field.value;
					});

					eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
					/** -------------回调---------------  */
				});
				$('#${param.form}_paging .c2-right .no').append(ss);
			}else if((o) < ${param.totalPages}){
				var ss = $('<span class="last" style="cursor: pointer;">${param.totalPages}</span>');	
				ss.click(function() {
					/** -------------回调---------------  */
					var pagingParam = {};
					pagingParam["page.pageNo"] = ${param.totalPages};
					pagingParam["page.pageSize"] = '${param.pageSize}';
					pagingParam["page.orderBy"] = '${param.orderBy}';
					pagingParam["page.order"] = '${param.order}';
					var fields = $('#${param.form}').serializeArray();
					$.each( fields, function(i, field){
					  pagingParam[field.name ] = field.value;
					});

					eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
					/** -------------回调---------------  */
				});
				$('#${param.form}_paging .c2-right .no').append(ss);
			}
		}
	});
	
	if(${param.totalPages} > 5) {
		var next = $('<span class="next" style="cursor: pointer;"> > </span>');
		next.click(function() {//下一页

			if(${param.pageNo} == ${param.totalPages}) {
				alert('已经最后一页');
				return;
			}
			var gotoNo = ${param.pageNo} + 1 > ${param.totalPages}?${param.totalPages}:${param.pageNo} + 1;
			//alert(gotoNo);
			/** -------------回调---------------  */
			var pagingParam = {};
			pagingParam["page.pageNo"] = gotoNo;
			pagingParam["page.pageSize"] = '${param.pageSize}';
			pagingParam["page.orderBy"] = '${param.orderBy}';
			pagingParam["page.order"] = '${param.order}';
			var fields = $('#${param.form}').serializeArray();
			$.each( fields, function(i, field){
			  pagingParam[field.name ] = field.value;
			});

			eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
			/** -------------回调---------------  */
			
		});
		$('#${param.form}_paging .c2-right .pages').append(next);
	}
	
	
	/**-------------排序字段------------------*/
	
	
	//$('#${param.form} .data-head th').css('background','');
	//$('#${param.form} .data-head th').removeClass('sort desc');
	$('#${param.form} .data-head th[sort]').unbind('click');
	if(${param.totalPages} > 0) {
		$('#${param.form} .data-head th[sort]').css('cursor','pointer');
		$('#${param.form} .data-head th[sort]').bind('click', function() {
			$('#${param.form} .data-head th').css('background','');
			var sort = $(this).attr('sort');
			var pagingParam = {};
			pagingParam["page.pageNo"] = ${param.pageNo};
			pagingParam["page.pageSize"] = ${param.pageSize};
			pagingParam["page.orderBy"] = sort;
			var order = 'desc';
			if(sort == '${param.orderBy}') {
				if('${param.order}' == 'desc') {
					order = 'asc';
					$(this).css({'background':'#c5c5c5 url(' + ctx + '/images/sort_asc.gif) center right no-repeat'});
				} else {
					order = 'desc';
					$(this).css({'background':'#c5c5c5 url(' + ctx + '/images/sort_desc.gif) center right no-repeat'});
				}
			} else {
				$(this).css({'background':'#c5c5c5 url(' + ctx + '/images/sort_desc.gif) center right no-repeat'});
			}
		
			pagingParam["page.order"] = order;
			var fields = $('#${param.form}').serializeArray();
			$.each( fields, function(i, field){
			  pagingParam[field.name ] = field.value;
			});
			eval('${param.callback}(' + $.toJSON(pagingParam) + ')');
		});
	}
	
	/**-------------排序字段------------------*/
});
</script>
<div id="${param.form}_paging">
<div class="c2-left">
	<div class="pages"><span class="pages-cur"></span></div>
</div>
<div class="c2-right">
	<div class="pages">
	
	<span class="no"></span>	
	
	
	</div>
</div>
</div>