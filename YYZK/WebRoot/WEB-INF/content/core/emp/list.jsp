<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>用户管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- other -->
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/emp/emp!pageList.htm',
        title: '用户列表',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        singleSelect: false,
        striped : true,
        toolbar: '#toolbar',
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'userName', title: '用户名'},
            { field: 'loginName', title: '登录名' },
            { field: 'deptList', title: '所属部门' ,
            	formatter: function (value, rec, index) {
            		var depts="";
            		(new Backbone.Collection(value)).each(function(model,index,list){
            			depts = depts + "<span class=\"label label-success\">" +model.attributes.name + "</span> ";
            		});
            		return depts;
            	}
            },
            { field: 'roleList', title: '角色',
            	formatter: function (value, rec, index) {
            		var roles="";
            		(new Backbone.Collection(value)).each(function(model,index,list){
            			roles = roles + "<span class=\"label label-warning\">" + model.attributes.name + "</span> ";
            		});
            		return roles;
            	}	
            }
		]],
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
        }
    });
});

function add(){
	$.dialog({
		content: 'url:${ctx}/emp/addIndex.htm',
		lock: true,
		width:'620px',
		height:'230px',
		title:'用户新增',
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
	var rows = $('#centergrid').datagrid('getSelections');
	if(rows.length==0){
		$.messager.alert('提示','请选择要修改的数据！','warning');
	}else if(rows.length>1){
		$.messager.alert('提示','只能选择一条数据！','warning');
	}else{
		$.dialog({
			content: 'url:${ctx}/emp/addIndex.htm?emp.id='+rows[0].id,
			lock: true,
			width:'620px',
			height:'230px',
			title:'用户修改',
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

function del(){
	var rows = $('#centergrid').datagrid('getSelections');
	if(rows.length==0){
		$.messager.alert('提示','请选择要删除的数据！','warning');
	}else{
		var ids="";
		for(var i=0;i<rows.length;i++){
			ids = ids + rows[i].id +",";
		}
		ids = delLastChar(ids,",");
		$.ajax({
			type: "post",
			url: "${ctx}/emp/emp!delete.htm",
			data:{"emp.isDel":1,"emp.ids":ids},
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				$.messager.confirm('提示', '删除成功', function(r){
					reloadDatagrid()
				});
			}
		});
	}
}

function getIds(){
	var rows = $('#centergrid').datagrid('getSelections');
	var ids="";
	for(var i=0;i<rows.length;i++){
		ids = ids + rows[i].id +",";
	}
	ids = delLastChar(ids,",");
	return ids;
}

function updatedept(){
	var rows = $('#centergrid').datagrid('getSelections');
	if(rows.length==0){
		$.messager.alert('提示','请选择要批量修改部门的用户！','warning');
	}else{
		$.dialog({
			content: 'url:${ctx}/core/emp/updatedept.htm',
			lock: true,
			width:'620px',
			height:'230px',
			title:'批量更新部门',
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

function updaterole(){
	var rows = $('#centergrid').datagrid('getSelections');
	if(rows.length==0){
		$.messager.alert('提示','请选择要批量修改角色的用户！','warning');
	}else{
		$.dialog({
			content: 'url:${ctx}/core/emp/updaterole.htm',
			lock: true,
			width:'620px',
			height:'230px',
			title:'批量更新角色',
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
	$("#centergrid").datagrid("reload");
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
</div>
-->
<div data-options="region:'center',border:false" style="padding:3px;">
<div class="easyui-layout" data-options="fit:true">
	<table id="centergrid"></table>
	<div id="toolbar">
	</div>
</div>
</div>
</body>
</html>