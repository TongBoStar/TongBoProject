<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目列表</title>
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	$('#centergrid').datagrid({
    	url:'${ctx}/itemStep/item-step!pageList.htm',
        title: '项目列表',
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
	            { field: 'stepNo', title: '步骤序号' },
	            { field: 'stepName', title: '步骤名称' },
	            { field: 'itemName', title: '项目名称' },
	            { field: 'stepContent', title: '步骤内容'},
	            { field: 'stepNeeds', title: '所需物品' },
	            { field: 'stepTimes', title: '步骤时长' },
	            { field: 'createTime', title: '创建时间' }
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
        $("#centergrid").datagrid("reload",{"itemStepQuery.stepName":$("#search_para").val()});
	});
});

function print(){
	$.dialog({
		content: 'url:${ctx}/itemStep/addIndex.htm',
		lock: true,
		width:'620px',
		height:'460px',
		title:'步骤添加',
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
			title:'项目添加',
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
	$("#centergrid").datagrid("reload",{"itemQuery.id":node.id});
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
			<div data-options="region:'center'">
				<table id="centergrid"></table>
				<div id="toolbar"></div>
			</div>
		</div>
	</div>
</body>
</html>