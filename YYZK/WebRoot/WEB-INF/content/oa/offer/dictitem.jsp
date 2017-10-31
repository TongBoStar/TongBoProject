<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>字典维护</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	$("#westtree").tree({
		url: '${ctx}/offer/offer!dictTree.htm',
    	method: 'post',
    	animate: true,
     	onClick: function (node) {
     		$("#centerdatagrid").datagrid("reload",{"offerDictItemQuery.likeDictTreeCode":node.code});
     	}
  	});
	
	$('#centerdatagrid').datagrid({
    	url:'${ctx}/offer/offer!dictItemPage.htm',
        title: '字典数据列表',
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
		 	{field: 'name', title: '名称'},
		 	{field: 'dictTreeName', title: '分组'},
		 	{field: 'description', title: '描述'},
		 	{field: 'sort', title: '排序'}
		
		]
        ],
        onBeforeLoad:function(){
        	
        },
        onLoadSuccess:function(){}
    });
});

//分类管理
function treeadd(){
	$('#win').window({
		title:'分类维护',
		iconCls:'iconfont icon-tree',
	    width:600,
	    height:400,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/dicttreeedit.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {
            //var rtnValue = window.top.$(this).data("returnValue");
            //alert(rtnValue.text);
            //alert(JSON.stringify(rtnValue).text);
            //if (rtnValue) {
            //   graph.getModel().beginUpdate();
            //   var _cell = graph.getSelectionCell();
            //   _cell.setValue(rtnValue.text);
            //   graph.refresh(_cell);
               //graph.clearSelection();//取消选中的元素  
            // }
        }
	});
}

function add(){
	$('#win').window({
		title:'新增字典数据',
		iconCls:'iconfont icon-tree',
	    width:600,
	    height:400,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/dictitemedit.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {}
	});
	//window.location.href = "${ctx}/oa/offer/dictitemedit.htm";
}

function edit(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		$('#win').window({
			title:'新增字典数据',
			iconCls:'iconfont icon-tree',
		    width:600,
		    height:400,
		    modal:true, 
		    collapsible: false, 
		    minimizable: false, 
		    maximizable: true, 
		    closable: true,
		    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/offer/dictItemEditIndex.htm?dictItem.dictItemId='+row.dictItemId+'"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
		    onClose: function () {}
		});
		//window.location.href = "${ctx}/offer/dictItemEditIndex.htm?dictItem.dictItemId="+row.dictItemId;
	}
}



function del(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!dictItemDelete.htm?dictItem.dictItemId="+row.dictItemId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				
				$.messager.confirm('提示', '删除成功！', function(r){
					$('#centerdatagrid').datagrid('reload');
				});
			}
		});
	}
}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div id="roletree" data-options="region:'west',split:true,title: '分类',iconCls:'iconfont icon-tree'" style="width: 220px;">
			<ul id="westtree"></ul>
		</div>
		<div data-options="region:'center'">
			<table id="centerdatagrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="add()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontrename',plain:true" onclick="edit()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="del()">删除</a>
			</div>
		</div>
		<div id="win"></div>
	</div>
</div>
</body>
</html>