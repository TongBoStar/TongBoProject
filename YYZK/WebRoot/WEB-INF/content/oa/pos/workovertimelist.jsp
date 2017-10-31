<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>加班列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script type="text/javascript" src="${ctx}/resources/js/curdtools.js"></script>
<script type="text/javascript">
$(function () {
	
	$('#centergrid').datagrid({
    	url:'${ctx}/pos/pos!overtimeist.htm',
        title: '加班明细',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [[
			{ field: 'ck', checkbox: true },
			{ field: 'id', title: 'ID'},
			{ field: 'deptName', title: '部门'},
			{ field: 'userName', title: '用户名'},
			{ field: 'overtimeDate', title: '加班日期'},
			{ field: 'mealType', title: '餐别'}
        ]],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){}
    });
	
	$("#normalSearchBtn").click(function(){
        $("#centergrid").datagrid("reload",{"addressBookItemQuery.name":$("#search_para").val()});
	});
});



function reloadDatagrid(selId){
	var node = $('#westtree').tree('find', selId);
	$('#westtree').tree('select', node.target);
	$("#centergrid").datagrid("reload",{"addressBookItemQuery.treeId":node.id});
}

//导入
function importlist(){
	var uploaddg = $.dialog({
		content: 'url:${ctx}/oa/pos/workovertimeimport.htm',
		lock : true,
		width:'658px',
		height:'418px',
		title:'加班明细上传',
		opacity : 0.3,
		cache:false,
	    ok: function(){
	    	iframe = this.iframe.contentWindow;
	    	$('#btn_sub', iframe.document).click();
			//uploaddg.content.startUpload();
	    	return false;
	    },
	    cancelVal: '关闭',
	    cancel: true
	}).zindex();
}

function downxls(){
	window.location.href='${ctx}/resources/tpl/加班模板.xls';
}

</script>
</head>
<body class="easyui-layout">
	<form id="form1">
	<!-- 
		<div data-options="region:'north',border:false" >
			<div class="search_area search_normal" id="search_normal_div" style="display: block;">
				<div class="form-search">
					<div class="input-append">
						<input type="text" id="search_para" class="span4 search-query" placeholder="请输入要查询的姓名">
						<button type="button" id="normalSearchBtn" class="btn btn-primary">查询</button>
					</div>
				</div>
			</div>
		</div>
	-->
		<div data-options="region:'center',border:false" style="padding: 3px;">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'center'">
					<table id="centergrid"></table>
					<div id="toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="importlist()">导入</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="downxls()">模板下载</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>