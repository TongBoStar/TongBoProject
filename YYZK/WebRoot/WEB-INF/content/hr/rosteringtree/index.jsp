<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<jsp:include page="/public/head.jsp" ></jsp:include>
<script type="text/javascript">
var selNode = null;
$(function () {
	$("#westtree").tree({
		url:'${ctx}/admin/hr/rosteringtree/hr-rostering-tree!tree.htm',
    	method: 'post',
    	animate: true,
     	onClick: function (node) {
     		$("#centerdatagrid").datagrid("reload",{"hrRosteringTreeQuery.likeCode":node.code});
     	},
     	onLoadSuccess :function(node, data){  
     		if(selNode!=null){
                var node = $("#westtree").tree("find", selNode.id);
                $("#westtree").tree("select", node.target);
            }  
     	}
  	});
	
	$('#centerdatagrid').datagrid({
    	url:'${ctx}/admin/hr/rosteringtree/hr-rostering-tree!pageList.htm',
        title: '排班分类列表',
        iconCls:'myicon-list',
        toolbar: '#centertoolbar',
        border: false,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [
			[
	            { field: 'ck', checkbox: true },
				{ field: 'id', title: '主键'},
				{ field: 'name', title: '名称'},
				{ field: 'sort', title: '排序'},
				
				{ field: 'annual', title: '年度'},
				{ field: 'morningStart', title: '上午上班开始时间'},
				{ field: 'morningEnd', title: '上午上班结束时间'},
				{ field: 'afternoonStart', title: '下午上班开始时间'},
				{ field: 'afternoonEnd', title: '下午上班结束时间'},
				{ field: 'remarks', title: '备注'}
			]
        ]
    });
});

function add(){
	var iframeId = window.frameElement && window.frameElement.id || "";
	openWin("新增部门","myicon-add",600,400,"${ctx}/hr/rosteringtree/add.htm",iframeId);
}

function edit(){
	var row = $("#centerdatagrid").datagrid("getSelected");
	if (row) {
		var iframeId = window.frameElement && window.frameElement.id || '';
		openWin("编辑部门","myicon-edit",600,400,"${ctx}/admin/hr/rosteringtree/editIndex.htm?hrRosteringTree.id="+row.id,iframeId);
	} else {
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}
}

function del(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/admin/hr/rosteringtree/hr-rostering-tree!del.htm",
			data:{"hrRosteringTree.id":row.id},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				$.messager.confirm('提示', '删除成功！', function(r){
					reload();
				});
			}
		});
	} else {
		$.messager.alert('提示','请选择要删除的数据！','warning');
	}
}

function reload(){
	selNode = $("#westtree").tree("getSelected");
	if(selNode==null){
		$("#westtree").tree("reload");
		$("#centerdatagrid").datagrid("reload");
	}else{
		$("#westtree").tree("reload");
		$("#centerdatagrid").datagrid("reload",{"hrRosteringTreeQuery.likeCode":selNode.code});
	}
}

</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false" style="padding: 3px;">
		<div class="easyui-layout" data-options="fit:true">
			<div id="roletree" data-options="region:'west',split:true,title: '分组',iconCls:'myicon-tree'" style="width: 220px;">
				<ul id="westtree"></ul>
			</div>
			<div data-options="region:'center'">
				<table id="centerdatagrid"></table>
				<div id="centertoolbar">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-add',plain:true" onclick="add()">新增</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-edit',plain:true" onclick="edit()">修改</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-delete',plain:true" onclick="del()">删除</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>