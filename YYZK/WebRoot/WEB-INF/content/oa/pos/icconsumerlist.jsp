<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>消费记录列表</title>
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	
	$('#centergrid').datagrid({
    	url:'${ctx}/pos/pos!list.htm',
        title: '消费明细',
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
			{ field: 'userName', title: '用户名'},
			{ field: 'posTime', title: '消费时间'}
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

//同步
function synch(){
	
	//$("#dg").datagrid("loaded");
	$.ajax({
		type: "post",
		url: "${ctx}/pos/pos!synch.htm",
		//data:{"meetingroomInfoQuery.isDel":0},
		dataType: "json",
		async: false,
		beforeSend:function(){
			$("#centergrid").datagrid("loading", "正在同步数据，请耐心等待 ……");
		},
		success: function (data, success) {
			$.messager.confirm('提示', data.msg, function(r){
				$("#centergrid").datagrid("loaded");
			});
		}
	});
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
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="synch()">同步</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>