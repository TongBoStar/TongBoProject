<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>模块分类列表</title>
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	$("#westtree").tree({
		url: '${ctx}/module/module!tree.htm',
    	method: 'post',
    	animate: true,
     	onClick: function (node) {
     		$("#centergrid").datagrid("reload",{"moduleQuery.moduleParentId":node.id});
     	}
  	});
	
	
	$('#centergrid').datagrid({
    	url:'${ctx}/module/module!pageList.htm',
        title: '模块分类列表',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#toolbar',
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [
			[
	            { field: 'ck', checkbox: true},
	            { field: 'moduleName', title: '模块名称'},
	            { field: 'moduleParentName', title: '父级名称'},
	            { field: 'moduleLevel', title: '模块级别'},
	            { field: 'createTime', title: '创建时间'},
	            { field: 'moduleDesc', title: '模块描述'}
			]
        ],
        onBeforeLoad:function(){
        	//加载按钮权限
			$.ajax({
				type: "post",
				url: "${ctx}/menuoperate/menu-operate!showList.htm",
				data:{"menuOperateQuery.menuId":GetQueryString("menuId")},
				dataType: "json",
				async: false,
				success: function (data, status) {
					var html='';
					$.each(data.rows,function(index,obj){
						html=html+'<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="'+obj.iconCls+'" plain="true" onclick="'+obj.functionName+'">'+obj.name+'</a>';
					});
					$("#toolbar").html(html);
		        	$.parser.parse('#toolbar');
				}
			});
        	
        },
        onLoadSuccess:function(){}
    });
	
	$("#normalSearchBtn").click(function(){
        $("#centergrid").datagrid("reload",{"moduleQuery.moduleName":$("#search_para").val()});
	});
});

function add(){
	$.dialog({
		content: 'url:${ctx}/addressbook/addIndex.htm',
		lock: true,
		width:'620px',
		height:'460px',
		title:'通讯录添加',
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
	var row = $('#centergrid').datagrid('getSelected');
	 if (row) {
		$.dialog({
			content: 'url:${ctx}/addressbook/addIndex.htm?addressBookItem.id='+row.id,
			lock: true,
			width:'620px',
			height:'460px',
			title:'通讯录添加',
			ok: function(){
				iframe = this.iframe.contentWindow;
				$('#btn_sub', iframe.document).click();
				return false;
			},
			cancelVal: '关闭',
			cancel: true
		});
	 }else {
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}
}

function del(){
	var row = $('#centergrid').datagrid('getSelected');
	if (row) {
		$.ajax({
			type: "post",
			url: "${ctx}/addressbook/address-book!delete.htm",
			data:{"addressBookItem.id":row.id},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {alert("11");
				$.messager.confirm('提示', "删除通讯录成功！", function(r){
					$("#centergrid").datagrid("reload");
				});
			}
		});
	} else {
		$.messager.alert('提示','请选择要删除的数据！','warning');
	}
}

function reloadDatagrid(selId){
	var node = $('#westtree').tree('find', selId);
	$('#westtree').tree('select', node.target);
	$("#centergrid").datagrid("reload",{"addressBookItemQuery.treeId":node.id});
}

function exportxls(){
	window.location.href='${ctx}/addressbook/address-book!export.htm';
}
</script>
</head>
<body class="easyui-layout">
		<div data-options="region:'north',border:false" >
			<div class="search_area search_normal" id="search_normal_div" style="display: block;">
				<div class="form-search">
					<div class="input-append form-inline">
						<input type="text" class="form-control" id="search_para" placeholder="请输入要查询的姓名">
						<button type="button" id="normalSearchBtn" class="btn btn-primary">查询</button>
					</div>
				</div>
			</div>
		</div>
		<div data-options="region:'center',border:false" style="padding: 3px;">
			<div class="easyui-layout" data-options="fit:true">
				<div id="roletree" data-options="region:'west',split:true,title: '分组',iconCls:'icon-list'" style="width: 220px;">
					<div id="westtoolbar" class="datagrid-toolbar">
					</div>
					<ul id="westtree"></ul>
				</div>
				<div data-options="region:'center'">
					<table id="centergrid"></table>
					<div id="toolbar"></div>
				</div>
			</div>
		</div>
</body>
</html>