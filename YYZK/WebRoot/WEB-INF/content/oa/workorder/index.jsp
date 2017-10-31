<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/defaultform.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- otherjs -->
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<title>工单信息列表</title>
<script type="text/javascript">
var listTable;
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/admin/oa/workorder/oa-work-order!pageList.htm?oaWorkOrderQuery.releasePerson=-1&oaWorkOrderQuery.workOrderType='+GetQueryString("workOrderType"),
        title: '工单列表',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: true,
        iconCls:'myicon-list',
        pageSize: 20,
        rownumbers: true,
        columns: [[
            { field: 'ck', checkbox: true },
			{ field: 'id', title: 'ID'},
			{ field: 'title', title: '标题'},
			{ field: 'remarks', title: '描述'},
			{ field: 'releasePersonName', title: '上报人'},
			{ field: 'releaseTime', title: '上报时间'},
			{ field: 'workOrderStatus', title: '工单状态',
				formatter: function(value, row, index){
				    if (value == 0) {
				        return '<font color="red">已提交</font>';
				    }
				    else if(value == 1)
				    {
				    	return '<font color="blue">确认完成</font>';
				    }
				    else if(value == -1)
				    {
				    	return '<font color="blue">关闭</font>';
				    }
				}
			},
			{ field: 'treatmentStatus', title: '处理状态',
				formatter: function(value, row, index){
				    if (value == 0) {
				        return '<font color="red">待处理</font>';
				    }
				    else if(value == 1)
				    {
				    	return '<font color="blue">已完成</font>';
				    }
				}
			},
			{ field: 'treatmentTime', title: '处理时间'}
		]]
    });
});

function del(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/admin/oa/workorder/oa-work-order!del.htm",
			data:{"oaWorkOrder.id":row.id},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				$.messager.confirm('提示', data.msg, function(r){
					reload();
				});
			}
		});
	} else {
		$.messager.alert('提示','请选择要删除的数据！','warning');
	}
}

function edit(){
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		var iframeId = window.frameElement && window.frameElement.id || '';
		openWin('编辑工单','myicon-edit',600,400,'${ctx}/admin/oa/workorder/editIndex.htm?oaWorkOrder.id='+row.id+'&workOrderType='+GetQueryString("workOrderType"),iframeId);
	} else {
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}
}

function reload(){
	$('#centergrid').datagrid("reload");
}

function add(){
	var iframeId = window.frameElement && window.frameElement.id || '';
	openWin('新增工单','myicon-add',600,400,'${ctx}/oa/workorder/add.htm?workOrderType='+GetQueryString("workOrderType"),iframeId);
}

function show(){
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		var iframeId = window.frameElement && window.frameElement.id || '';
		openWin('查看工单','myicon-view',600,400,'${ctx}/admin/oa/workorder/show.htm?oaWorkOrder.id='+row.id,iframeId);
	} else {
		$.messager.alert('提示','请选择要查看的数据！','warning');
	}
}

function repair(){
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		 var iframeId = window.frameElement && window.frameElement.id || '';
		openWin('处理工单','myicon-repair',600,500,'${ctx}/admin/oa/workorder/auditIndex.htm?oaWorkOrder.id='+row.id,iframeId);
	} else {
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}
}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" >
			<div class="search_area search_normal" id="search_normal_div" style="display: block;">
				<div class="form-search">
					<div class="input-append form-inline">
						<input type="text" class="form-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="startDate" placeholder="请填写标题">
						<button type="button" id="normalSearchBtn" class="btn btn-primary">查询</button>
					</div>
				</div>
			</div>
	</div>
	<div data-options="region:'center',border:false" style="padding:3px;">
		<div class="easyui-layout" data-options="fit:true">
			<table id="centergrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-add',plain:true" onclick="add()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-edit',plain:true" onclick="edit()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-view',plain:true" onclick="show()">查看</a>
				<!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-delete',plain:true" onclick="del()">删除</a> -->
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-repair',plain:true" onclick="repair()">处理</a>
			</div>
		</div>
	</div>
</body>
</html>