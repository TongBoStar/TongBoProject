<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>分类维护</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	$('#centertreegrid').treegrid({
		url: '${ctx}/offer/offer!projectTreeGrid.htm',
		border:false,
	    toolbar: '#toolbar',
	    idField:'projectTreeId',
	    treeField:'name',
	    columns:[[
	        {field:'name',title:'名称',editor:'text'},
	        {field:'description',title:'说明',editor:'text'},
	        {field:'sort',title:'排序',editor:'numberbox'}
	    ]]
	});
});

function add(){
	$('#win').window({
		title:'新增项目分类',
		iconCls:'iconfont icon-tree',
	    width:600,
	    height:400,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/projecttreeedit.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {}
	});
}

function edit(){
	var node = $('#centertreegrid').treegrid('getSelected');
	if(node){
		//window.location.href = "${ctx}/offer/dictTreeEditIndex.htm?dictTree.dictTreeId="+node.dictTreeId;
		$('#win').window({
			title:'修改项目分类',
			iconCls:'iconfont icon-tree',
		    width:600,
		    height:400,
		    modal:true, 
		    collapsible: false, 
		    minimizable: false, 
		    maximizable: true, 
		    closable: true,
		    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/offer/projectTreeEditIndex.htm?offerProjectTree.projectTreeId='+node.projectTreeId+'"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
		    onClose: function () {}
		});
	}
}

function del(){
	var node = $('#centertreegrid').treegrid('getSelected');
	if(node){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!projectTreeDelete.htm?offerProjectTree.projectTreeId="+node.projectTreeId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					$.messager.confirm('提示', '删除成功！', function(r){
						//window.location.href = "${ctx}/oa/offer/dicttree.htm";
						$('#centertreegrid').treegrid('reload');
					});
				}
			}
		});
	}
}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<table id="centertreegrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="add()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontrename',plain:true" onclick="edit()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="del()">删除</a>
			</div>
			<div id="win"></div>
		</div>
	</div>
</div>
</body>
</html>