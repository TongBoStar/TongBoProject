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

<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<script type="text/javascript">
$(function () {
	$('#centergrid').datagrid({
        title: '加班明细',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        singleSelect: true,
        striped : true,
        fitColumns: false,
        columns: [[
			{ field: 'ck', checkbox: true },
			{ field: 'userName', title: '用户名'},
			{ field: 'overtimeDate', title: '加班日期'},
			{ field: 'mealType', title: '餐别'},
			{ field: 'remark', title: '备注'}
        ]],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){}
    });
	
	$("#normalSearchBtn").click(function(){
		$('#centergrid').datagrid('load','${ctx}/pos/pos!reportForm.htm?posWorkOverTimeListQuery.notRemark=正常用餐&posWorkOverTimeListQuery.startDate='+$("#startDate").val()+"&posWorkOverTimeListQuery.endDate="+$("#endDate").val());
	});
});



function reloadDatagrid(selId){
	var node = $('#westtree').tree('find', selId);
	$('#westtree').tree('select', node.target);
	$("#centergrid").datagrid("reload",{"addressBookItemQuery.treeId":node.id});
}

//导出
function report(){
	window.location.href='${ctx}/pos/pos!export.htm?posWorkOverTimeListQuery.notRemark=正常用餐&posWorkOverTimeListQuery.startDate='+$("#startDate").val()+"&posWorkOverTimeListQuery.endDate="+$("#endDate").val();
}

</script>
</head>
<body class="easyui-layout">
	<form id="form1">
		<div data-options="region:'north',border:false" >
			<div class="search_area search_normal" id="search_normal_div" style="display: block;">
				<div class="form-search">
					<div class="input-append form-inline">
						<input type="text" class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="startDate" placeholder="请选择起始时间">
						<input type="text" class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}'})" id="endDate" placeholder="请选择截至时间">
						<button type="button" id="normalSearchBtn" class="btn btn-primary">统计</button>
					</div>
				</div>
			</div>
		</div>
		<div data-options="region:'center',border:false" style="padding: 3px;">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'center'">
					<table id="centergrid"></table>
					<div id="toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="report()">导出</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>