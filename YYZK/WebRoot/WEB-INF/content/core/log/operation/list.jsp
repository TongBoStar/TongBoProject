<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap/css/bootstrap.min.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- date -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>用户管理</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/operationlog/operation-log!pageList.htm',
        title: '用户列表',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#toolbar',
        pagination: true,
        iconCls:'icon-list',
        pageSize: 20,
        rownumbers: true,
        columns: [[
{ field: 'ck', checkbox: true },
{ field: 'id', title: 'ID'},
{ field: 'empUserName', title: '用户'},
{ field: 'moduleName', title: '操作模块'},
{ field: 'ip', title: 'ip地址'},
{ field: 'machineName', title: '机器名'},
{ field: 'operateDate', title: '操作时间'},
{ field: 'empLoginName', title: '登录名'},
{ field: 'operateType', title: '操作类型'},
{ field: 'operateDescription', title: '描述'}
		]]
    });
});

function add(){
	window.location.href="${ctx}/operationlog/addIndex.htm";
}

function edit(){
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		 window.location.href="${ctx}/operationlog/addIndex.htm?operationLog.id="+row.id;
		 
	 }else {
			$.messager.alert('提示','请选择要修改的数据！','warning');
		}
}

function del(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/operationlog/operationlog!delete.htm",
			data:{"operationLog.id":row.id},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				alert(data.msg);
				window.location.href="${ctx}/oa/addressbook/list.htm";
			}
		});
	} else {
		$.messager.alert('提示','请选择要删除的数据！','warning');
	}
}

</script>
</head>
<body  class="easyui-layout">
<!-- 
<div data-options="region:'north',border:false" >
<div class="search_area search_normal" id="search_normal_div" style="display: block;">
	<div class="form-search">
		<div class="input-append">
			<input type="text" id="search_para" class="span4 search-query" placeholder="请输入要查询的流水号或工作名称/文号">
			<button type="button" id="normalSearchBtn" class="btn btn-primary">查询</button>
		</div>
		&nbsp;&nbsp;
		<button type="button" id="toAdvSearch" class="btn">切换至高级查询</button>
	</div>
</div>
</div>
 -->
<div data-options="region:'center',border:false" style="padding:3px;">
<div class="easyui-layout" data-options="fit:true">
	<table id="centergrid"></table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add()">新增</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit()">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true" onclick="del()">删除</a>
	</div>
</div>
</div>
</body>
</html>