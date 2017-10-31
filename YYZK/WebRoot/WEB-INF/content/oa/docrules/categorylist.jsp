<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>分类管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').treegrid({
    	url: '${ctx}/docrules/doc-rules!treeGridCategory.htm',
        title: '分类管理',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        idField:'id',
        treeField:'name',
        columns: [[
			{ field: 'id', title: 'ID' , align: 'center'},
            { field: 'name', title: '名称' },
            { field: 'code', title: '编码'},
            { field: 'parentCode', title: '父编码'},
            { field: 'parentId', title: '父ID'}
        ]],
        onBeforeLoad:function(){
        	//加载按钮权限
			$.ajax({
				type: "post",
				url: "${ctx}/menuoperate/menu-operate!showList.htm",
				data:{"menuOperateQuery.menuId":GetQueryString("menuId")},
				dataType: "json",
				async: false,
				success: function (data, status) {
					var html='';
					$.each(data.rows,function(index,obj){
						html=html+'<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="'+obj.iconCls+'" plain="true" onclick="'+obj.functionName+'">'+obj.name+'</a>';
					});
					$("#toolbar").html(html);
		        	$.parser.parse('#toolbar');
				}
			});
        }
    });
});

function add(){
	var adddig = $.dialog({
		content: 'url:${ctx}/docrules/indexCategory.htm',
		lock : true,
		width:'658px',
		height:'138px',
		title:'分类管理',
		opacity : 0.3,
		cache:false,
	    ok: function(){
	    	iframe = this.iframe.contentWindow;
	    	$('#btn_sub', iframe.document).click();
	    	return false;
	    },
	    cancelVal: '关闭',
	    cancel: true
	}).zindex();
}

function edit(){
	var row = $('#centergrid').treegrid('getSelected');
	if(row){
		var editdig = $.dialog({
			content: 'url:${ctx}/docrules/indexCategory.htm?docRulesCategory.id='+row.id,
			lock : true,
			width:'658px',
			height:'138px',
			title:'分类管理',
			opacity : 0.3,
			cache:false,
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
		    	$('#btn_sub', iframe.document).click();
		    	return false;
		    },
		    cancelVal: '关闭',
		    cancel: true
		}).zindex();
	}
}

function del(){
	var row = $('#centergrid').treegrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: '${ctx}/docrules/doc-rules!deleteCategory.htm',
			data:{"docRulesCategory.id":row.id},
			dataType: "json",
			async: false,
			success:function(data,listTextStatus){
				if(data.success=="false"){
					$.dialog.alert(data.msg);
				}else{
					reloadGridTree();
				}
			}
		});
	}
}

function reloadGridTree(){
	$('#centergrid').treegrid('reload');	
}
</script>
</head>
<body  class="easyui-layout">
<div data-options="region:'center',border:false" style="padding:3px;">
<div class="easyui-layout" data-options="fit:true">
	<table id="centergrid"></table>
	<div id="toolbar"></div>
</div>
</div>
</body>
</html>