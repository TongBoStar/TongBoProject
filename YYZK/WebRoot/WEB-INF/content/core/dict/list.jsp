<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${ctx}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>字典管理</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').treegrid({
    	url: '${ctx}/dict/dict!treeGrid.htm',
        title: '字典管理',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        iconCls:'icon-list',
        idField:'id',
        treeField:'name',
        columns: [[
			{ field: 'id', title: 'ID' , align: 'center'},
            { field: 'name', title: '角色名称' },
            { field: 'code', title: '编码'},
            { field: 'value', title: '值'}
        ]]
    });
});
</script>
</head>
<body  class="easyui-layout">
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