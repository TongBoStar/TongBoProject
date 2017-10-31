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
<title>压力容器任务列表</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/taskyalirongqi/task-ya-li-rong-qi!pageList.htm?taskYaLiRongQiQuery.taskState=${param.taskState}',
        title: '压力容器任务列表',
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
        frozenColumns:[[
			{ field: 'ck', checkbox: true },
			{ field: 'publisherId', title: '发布人',
				formatter: function (value, rec, index) {
            		if(rec.publisherEmp==undefined){
            			return "";
            		}else{
            			return rec.publisherEmp.userName;
            		}
            	}
			},
			{ field: 'recipientId', title: '设计人',
				formatter: function (value, rec, index) {
            		if(rec.recipientEmp==undefined){
            			return "";
            		}else{
            			return rec.recipientEmp.userName;
            		}
            	}	
			},
			{ field: 'recipientFinishDate', title: '设计完成时间'},
			{ field: 'jiaoYanId', title: '校核人',
				formatter: function (value, rec, index) {
            		if(rec.jiaoYanEmp==undefined){
            			return "";
            		}else{
            			return rec.jiaoYanEmp.userName;
            		}
            	}	
			},
			{ field: 'jiaoYanTime', title: '校核时间'},
			{ field: 'shenHeId', title: '审核人',
				formatter: function (value, rec, index) {
            		if(rec.shenHeEmp==undefined){
            			return "";
            		}else{
            			return rec.shenHeEmp.userName;
            		}
            	}		
			},
			{ field: 'shenHeTime', title: '审核时间'},
			{ field: 'plannedFinishDate', title: '计划完成时间'},
			{ field: 'actualFinishDate', title: '实际完成时间'}
       	]],
        columns: [[
    		{ field: 'systemNumber', title: '制令号'},
			{ field: 'filterNumber', title: '过滤器令号或型号'},
			{ field: 'directiveNumber', title: '主指令号'},
			{ field: 'remark', title: '备注'}
		]],
		onLoadSuccess:function(data){
			 $('#centergrid').datagrid('resize');
		}
    });
});

function add(){
	window.location.href="${ctx}/taskyalirongqi/addIndex.htm";
}

function edit(){
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		 window.location.href="${ctx}/taskyalirongqi/addIndex.htm?TaskYaLiRongQi.id="+row.id;
		 
	 }else {
			$.messager.alert('提示','请选择要修改的数据！','warning');
		}
}

function del(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/taskyalirongqi/taskyalirongqi!delete.htm",
			data:{"TaskYaLiRongQi.id":row.id},
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
		<!-- 
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit()">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true" onclick="del()">删除</a>
		 -->
	</div>
</div>
</div>
</body>
</html>