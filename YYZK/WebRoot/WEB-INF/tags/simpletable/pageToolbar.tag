<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" required="true" type="com.terrence.crm.dol.base.core.Page" description="Page.java" %>
<%@ attribute name="id" type="String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// set default values
	
	if(jspContext.getAttribute("id") == null) {
		jspContext.setAttribute("id","default_toolbar"); 
	} 
	
	
%>
<script>

$(document).ready(function() {
	
	
});
jQuery.extend({

	refreshPageToolbar: function(page, toolbarId, simpleTableObj) {
		var id = 'default_toolbar';
		if(toolbarId) {
			id = toolbarId;
		}
		var simpleTableId = simpleTableObj;
		if(!simpleTableId) {
			simpleTableId = simpleTable;
		}
		simpleTableId.bindStyle();
		var html = '';
			if(page.totalCount > 0) {
				
				//html += '<span class="buttonLabel">' + page.currentFirst + '&nbsp;-&nbsp;' + page.currentLast + '&nbsp;of&nbsp;' + page.totalCount + '&nbsp;</span>';
			if(page.firstPage) {
				html += '<a role="button" class="btn btn-info btn-outlined">首页</a>&nbsp';
			} else {
				html += '<a role="button" class="btn btn-info btn-outlined" name="toolbar_first">首页</a>&nbsp';
			}
			
			

			if(page.hasPre) {
				html += '<a role="button" class="btn btn-info btn-outlined" name="toolbar_pre">上一页</a>&nbsp;';
			} else {
				html += '<a role="button" class="btn btn-info btn-outlined">上一页</a>&nbsp;';
			}
			
			$.each(page.linkPageNumbers, function(i, o){
				if(page.pageNo == o) {
					html += '<span class="badge badge-yellow">'+o+'</span>&nbsp;';
				} else {
					html += '<a name="toolbar_'+o+'" style="cursor:pointer;">'+ o +'</a>&nbsp;';
				}
			
			});
			
			if(page.hasNext) {
				html += '<a role="button" class="btn btn-info btn-outlined" name="toolbar_next" >下一页</a>&nbsp;';
			} else {
				html += '<a role="button" class="btn btn-info btn-outlined">下一页</a>&nbsp;';
			}
			
			if(page.lastPage) {
				html += '<a role="button" class="btn btn-info btn-outlined">末页</a>&nbsp;';
			} else {
				html += '<a role="button" class="btn btn-info btn-outlined" name="toolbar_last" >末页</a>&nbsp;';
			}
			
			html +=  '&nbsp;共'+page.totalCount + '条/' + page.totalPages + '页&nbsp;';
			
			html += '&nbsp;跳转到第：';
			html += '<input name="go2PageNumber" type="text" class="input80" value="'+page.pageNo+'" style="width:40px"/>&nbsp;页&nbsp;';
			html += '每页显示：<input name="makePageSize" id="makePageSize" value="'+page.pageSize+'" class="input80" style="width:40px">条&nbsp;';
			html += '<input name="go2PageBnt" type="button" value="确定" class="btn btn-info btn-outlined" />';
			
			$('#'+id+'_controlButn').show();
			} else {
				$('#'+id+'_controlButn').hide();
			}
			
	
		
		$('#'+id+'_toolbar').html(html);
		
		
		$('#'+id+'_toolbar [name="toolbar_first"]').bind('click', function() {
			  simpleTableId.togglePage(1);
		});
		$('#'+id+'_toolbar [name="toolbar_pre"]').bind('click', function() {
			   simpleTableId.togglePage(page.prePage);
		});
		$.each(page.linkPageNumbers, function(i, o){				
			$('#'+id+'_toolbar [name="toolbar_'+o+'"]').bind('click', function() {
			  simpleTableId.togglePage(o);
			});
		});
		
		$('#'+id+'_toolbar [name="toolbar_next"]').bind('click', function() {
			  simpleTableId.togglePage(page.nextPage);
		});
		$('#'+id+'_toolbar [name="toolbar_last"]').bind('click', function() {
			  simpleTableId.togglePage(page.totalPages);
		});
		
		$('#'+id+'_toolbar [name="go2PageBnt"]').bind('click',{maxValue:page.totalPages},function(event){
			var pageNumberInput = $('#'+id+'_toolbar [name="go2PageNumber"]');
			var offset = pageNumberInput.offset();
			//alert( "left: " + offset.left + ", top: " + offset.top );
			if($.trim(pageNumberInput.val())==''){
				$.showMessage('页数不能为空', offset.top+20, offset.left);
				pageNumberInput.focus();
				return;
			}
			if(!$.checkDigits(pageNumberInput.val())){
				$.showMessage('页数不是数字', offset.top+20, offset.left);
				pageNumberInput.focus();
				return;
			}
			if(pageNumberInput.val()<=0 ||pageNumberInput.val()>event.data.maxValue){
				$.showMessage('页数范围不正确，最小为1，最大为'+event.data.maxValue, offset.top+20, offset.left);
				pageNumberInput.focus();
				return;
			}
			//----------------
			var pageNumberInput2 = $('#'+id+'_toolbar [id="makePageSize"]');
			var offset = pageNumberInput2.offset();
			//alert( "left: " + offset.left + ", top: " + offset.top );
			if($.trim(pageNumberInput2.val())==''){
				//alert("显示条数不能为空");
				//$.showMessage('显示条数不能为空', offset.top-42, offset.left);
				$('#makePageSize').val(10);
			}
			if(!$.checkDigits(pageNumberInput2.val())){
				alert("显示条数不是数字");
				//$.showMessage('显示条数不是数字', offset.top-42, offset.left);
				pageNumberInput2.focus();
				return;
			}
			if(pageNumberInput2.val()<=0 ||pageNumberInput2.val()>1000){
				alert("数量范围不正确，最小为1，最大为1000");
				//$.showMessage('数量范围不正确，最小为1，最大为1000',offset.top-42, offset.left);
				pageNumberInput2.focus();
				return;
			}
			simpleTableId.togglePageNew(pageNumberInput2.val(),pageNumberInput.val());
			//simpleTableId.togglePage(pageNumberInput.val());
		});
	}
});
	


</script>
	<div id="${id}_controlButn" class="controlButn">
		<jsp:doBody />
	</div>
	<div class="pageList" id="${id}_toolbar">
		

	</div>
