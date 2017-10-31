<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${ctx}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>会议室信息列表</title>
<script type="text/javascript">
var listTable;
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/meetingroominfo/meetingroom-info!pageList.htm',
        title: '会议室信息列表',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: true,
        iconCls:'icon-list',
        pageSize: 20,
        rownumbers: true,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'id', title: 'ID'},
            { field: 'name', title: '名称' },
            { field: 'number', title: '可容纳人数' },
            { field: 'description', title: '描述' },
            { field: 'address', title: '地址' },
            { field: 'equipmentDictList', title: '设备' ,
            	formatter: function (value, rec, index) {
            		var equipment="";
            		(new Backbone.Collection(value)).each(function(model,index,list){
            			equipment = equipment + model.attributes.name + " ";
            		});
            		return equipment;
            	}
            }
		]]
    });
});

function del(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/meetingroominfo/meetingroom-info!delete.htm",
			data:{"meetingroomInfo.id":row.id},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				alert(data.msg);
				window.location.href="${ctx}/oa/meetingroom/info/list.htm";
			}
		});
	} else {
		$.messager.alert('提示','请选择要删除的数据！','warning');
	}
}

function edit(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		window.location.href="${ctx}/meetingroominfo/addIndex.htm?meetingroomInfo.id="+row.id;
	} else {
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}
}

function add(){
	window.location.href="${ctx}/oa/meetingroom/info/add.htm";
}
</script>
<style>
.search_area {
  padding: 8px 0px;
  margin: 0 auto;
  text-align: center;
  margin-top: 0px;
  background-color: #f5f5f5;
  border-bottom: 1px solid #dddddd;
}
.data-wrap {
  padding: 8px 10px 2px 10px;
}
</style>
</head>
<body class="easyui-layout">
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