<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>表字段信息列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/table/table!fieldList.htm?tableFieldQuery.tableName=${param.tableName}',
    	title: '表信息列表',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#toolbar',
        pagination: false,
        iconCls:'icon-list',
        pageSize: 20,
        rownumbers: true,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'name', title: '字段名'},
            { field: 'dataType', title: '字段类型'},
            { field: 'length', title: '字段长度'},
            { field: 'isPrimaryKey', title: '是否主键'},
            { field: 'description', title: '描述'},
            { field: 'sort', title: '顺序'},
            { field: 'title', title: '标题'},
            { field: 'isForm', title: '表单显示'},
            { field: 'isList', title: '列表显示'},
            { field: 'isBean', title: 'bean显示'},
            { field: 'validform', title: '验证规则'},
            { field: 'inputType', title: '输入类型'}
		]]
    });
});

function add(){
	W.$.dialog({
		content: 'url:${ctx}/core/table/filedadd.htm?tableName=${param.tableName}',
		id:'SLHG1976D',
		lock: true,
		title:'字段新增',
		width:'600px',
		height:'420px',
		parent:api,
	    ok: function(){
	    	iframe = this.iframe.contentWindow;
			$('#btn_sub', iframe.document).click();
			return false;
	    },
	    cancelVal: '关闭',
	    cancel: true
	});
}

function edit(){
	//content: 'url:${ctx}/table/infoIndex.htm',
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		 W.$.dialog({
				content: 'url:${ctx}/table/fieldIndex.htm?tableName=${param.tableName}&tableField.id='+row.id,
				id:'SLHG1976D',
				lock: true,
				title:'字段新增',
				width:'600px',
				height:'420px',
				parent:api,
			    ok: function(){
			    	iframe = this.iframe.contentWindow;
					$('#btn_sub', iframe.document).click();
					return false;
			    },
			    cancelVal: '关闭',
			    cancel: true
			});
	 }
	
}

function reloadDatagrid(){
	$('#centergrid').datagrid('reload');
}
</script>
</head>
<body class="easyui-layout">
<!-- 
<div data-options="region:'north',border:false" >
<div class="search_area search_normal" id="search_normal_div" style="display: block;">
	<div class="form-search">
		<div class="input-append">
			<input type="text" id="search_para" class="span4 search-query" placeholder="请输入要查询的流水号或工作名称/文号">
			<button type="button" id="normalSearchBtn" class="btn btn-primary">查询</button>
		</div>
	</div>
</div>
 -->
</div>
<div data-options="region:'center',border:false" style="padding:3px;">
<div class="easyui-layout" data-options="fit:true">
	<table id="centergrid"></table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add()">新增</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit()">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true" onclick="del()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true" onclick="del()">授权</a>
	</div>
</div>
</div>
</body>
</html>