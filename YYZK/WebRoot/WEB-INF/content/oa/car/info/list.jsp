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
<title>订单信息列表</title>
<script type="text/javascript">
var listTable;
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/order/order!pageList.htm',
        title: '车辆信息列表',
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
            { field: 'orderCode', title: '订单编号' },
            { field: 'itemName', title: '产品名称' },
            { field: 'itemUserName', title: '手艺人名称' },
            { field: 'orderUserName', title: '下单用户名称' },
            { field: 'serviceReceiver', title: '服务对象名称' },
            { field: 'orderPrice', title: '订单金额' },
            { field: 'consumTimes', title: '项目时长' },
            { field: 'fixTime', title: '预约时间' },
            { field: 'serviceAddress', title: '服务地点' },
            { field: 'orderStatus', title: '订单状态',
            	formatter: function (value, rec, index) {
            		if(value==1){
            			return "待支付";
            		}else if(value==2){
            			return "待服务";
            		}else if(value==3){
            			return "已完成";
            		}else if(value==5){
            			return "售后中";
            		}else{
            			return "未知";
            		}
            	} 
            },
            { field: 'serviceType', title: '服务形式',
            	formatter: function (value, rec, index) {
            		if(value==1){
            			return "上门";
            		}else if(value==2){
            			return "到店";
            		}else{
            			return "未知";
            		}
            	} 
            },
            { field: 'remark', title: '备注' }
		]]
    });
});

function del(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/carinfo/car-info!delete.htm",
			data:{"carInfo.id":row.id},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				$.messager.confirm('提示', data.msg, function(r){
					window.location.href="${ctx}/oa/car/info/list.htm";
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
		window.location.href="${ctx}/carinfo/addIndex.htm?carInfo.id="+row.id;
	} else {
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}
}

function add(){
	window.location.href="${ctx}/oa/car/info/add.htm";
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
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconadd',plain:true" onclick="add()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconedit',plain:true" onclick="edit()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icondel',plain:true" onclick="del()">删除</a>
			</div>
		</div>
	</div>
</body>
</html>