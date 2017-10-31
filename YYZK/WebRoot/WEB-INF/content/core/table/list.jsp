<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>表信息列表</title>
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
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/table/table!infoPageList.htm',
        title: '表信息列表',
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
            { field: 'name', title: '表名'},
            { field: 'packageName', title: '包名'},
            { field: 'lowerName', title: '首字母大写'},
            { field: 'upperName', title: '首字母小写'},
            { field: 'operate', title: '操作',
            	formatter: function (value, rec, index) {
            		return "<a href=\"javascript:void(0);\" onclick=\"filedSet('"+rec.name+"')\">字段配置</a>";
            	}	
            }
		]]
    });
});

function filedSet(tableName){
	$.dialog({
		id: 'CLHG1976D',
		content: 'url:${ctx}/core/table/filedlist.htm?tableName='+tableName,
		lock: true,
		title:'字段配置->'+tableName,
		width:'1000px',
		height:'500px',
	    ok: function(){},
	    cancelVal: '关闭',
	    cancel: true
	});
}

function add(){
	$.dialog({
		content: 'url:${ctx}/table/infoIndex.htm',
		lock: true,
		width:'560px',
		height:'160px',
		title:'表信息添加',
	    ok: function(){
	    	iframe = this.iframe.contentWindow;
			//saveObj();
			$('#btn_sub', iframe.document).click();
			return false;
	    },
	    cancelVal: '关闭',
	    cancel: true
	})
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