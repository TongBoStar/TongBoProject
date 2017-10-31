<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>基础数据列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">


<script type="text/javascript">
$(function () {
	$('#tt').tabs({
		border: true
	});
	
	$('#centerdatagrid').datagrid({
    	url:'${ctx}/offer/offer!baseInfoPage.htm',
        title: '基础数据列表',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: true,
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
		 	{field: 'name', title: '零部件名称'},
		 	{field: 'entrancePressureValue', title: '进口压力'},
		 	{field: 'outletPressureValue', title: '出口压力'},
		 	{field: 'flowValue', title: '流量'},
		 	{field: 'typeAndSpecification', title: '型号及规格'},
		 	{field: 'unitValue', title: '单位'},
		 	{field: 'number', title: '数量'},
		 	{field: 'remarks', title: '备注'},
		 	{field: 'unitPrice', title: '列表单价'}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){}
    });
	
	$('#centerlcdatagrid').datagrid({
    	url:'${ctx}/offer/offer!LcPage.htm',
        title: '流程图列表',
        iconCls:'iconfont icon-iconlist',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#lctoolbar',
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [
		[	
		 	{field: 'name', title: '名称',width:'300px',
				editor:{
			 		type:'textbox',
			 		options:{
				 		required:true
			 		}
				}},
		 	{field: 'operate', title: '操作',
		 		formatter: function(value,row,index){
		 			var html = '<a href="javascript:void(0);">【查看图片】</a>';
		 			return html;
				}
		 	}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){},
        onDblClickCell:onLcDblClickCell,
        onClickCell:onLcClickCell
    });
	
	
	$('#centerwxdatagrid').datagrid({
    	url:'${ctx}/offer/offer!WxPage.htm',
        title: '外形图列表',
        iconCls:'iconfont icon-iconlist',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#wxtoolbar',
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [
		[	
		 	{field: 'name', title: '名称'},
		 	{field: 'operate', title: '操作',
		 		formatter: function(value,row,index){
		 			var html = '<a href="javascript:void(0);">【查看图片】</a>';
		 			return html;
				}
		 	}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){}
    });
	
	
	$('#centerjcdatagrid').datagrid({
    	url:'${ctx}/offer/offer!JcPage.htm',
        title: '基础图列表',
        iconCls:'iconfont icon-iconlist',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#jctoolbar',
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [
		[	
		 	{field: 'name', title: '名称'},
		 	{field: 'operate', title: '操作',
		 		formatter: function(value,row,index){
		 			var html = '<a href="javascript:void(0);">【查看图片】</a>';
		 			return html;
				}
		 	}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){}
    });
});


function add(){
	$('#win').window({
		title:'新增基础数据',
		iconCls:'iconfont icon-tree',
	    width:800,
	    height:600,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/baseinfoedit.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {
	    	$('#centerdatagrid').datagrid('reload');
	    }
	});
	//window.location.href = "${ctx}/oa/offer/baseinfoedit.htm";
}

function edit(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		//window.location.href = "${ctx}/offer/baseInfoBathEditIndex.htm?baseInfo.baseInfoId="+row.baseInfoId;
		$('#win').window({
			title:'修改基础数据',
			iconCls:'iconfont icon-tree',
			width:800,
		    height:600,
		    modal:true, 
		    collapsible: false, 
		    minimizable: false, 
		    maximizable: true, 
		    closable: true,
		    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/offer/baseInfoBathEditIndex.htm?baseInfo.baseInfoId='+row.baseInfoId+'"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
		    onClose: function () {
		    	$('#centerdatagrid').datagrid('reload');
		    }
		});
	}
}

function del(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!baseInfoDelete.htm?baseInfo.baseInfoId="+row.baseInfoId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					$.messager.confirm('提示', '删除成功！', function(r){
						//window.location.href = "${ctx}/oa/offer/baseinfo.htm";
						$('#centerdatagrid').datagrid('reload');
					});
				}
			}
		});
	}
}

function uploadlc(){
	$('#win').window({
		title:'上传图片',
		iconCls:'iconfont icon-tree',
	    width:800,
	    height:600,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/baseinfolc.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {
	    	$('#centerdatagrid').datagrid('reload');
	    }
	});
}

function dellc(){
	var row = $('#centerlcdatagrid').datagrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!baseInfoLcDelete.htm?offerBaseInfoLc.lcId="+row.lcId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					$.messager.confirm('提示', '删除成功！', function(r){
						$('#centerlcdatagrid').datagrid('reload');
					});
				}
			}
		});
	}
}

function onLcDblClickCell(index, field){
	if (editLcIndex != index){
        if (endLcEditing()){
            $('#centerlcdatagrid').datagrid('selectRow', index).datagrid('beginEdit', index);
            var ed = $('#centerlcdatagrid').datagrid('getEditor', {index:index,field:field});
            if (ed){
                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
            }
            editLcIndex = index;
        } else {
            $('#centerlcdatagrid').datagrid('selectRow', editLcIndex);
        }
    }
}

function onLcClickCell(index,field){
	if (editLcIndex != undefined){
		var rows = $("#centerlcdatagrid").datagrid('getData').rows;  
		console.log(rows[editLcIndex]["name"]);
	}
	if (endLcEditing()){
        $('#centerlcdatagrid').datagrid('acceptChanges');
    }
}

var editLcIndex = undefined;
function endLcEditing(){
    if (editLcIndex == undefined){return true}
    if ($('#centerlcdatagrid').datagrid('validateRow', editLcIndex)){
        $('#centerlcdatagrid').datagrid('endEdit', editLcIndex);
        editLcIndex = undefined;
        return true;
    } else {
        return false;
    }
}



function uploadwx(){
	$('#win').window({
		title:'上传图片',
		iconCls:'iconfont icon-tree',
	    width:800,
	    height:600,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/baseinfowx.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {
	    	//$('#centerdatagrid').datagrid('reload');
	    }
	});
}


function delwx(){
	var row = $('#centerwxdatagrid').datagrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!baseInfoWxDelete.htm?offerBaseInfoWx.wxId="+row.wxId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					$.messager.confirm('提示', '删除成功！', function(r){
						$('#centerwxdatagrid').datagrid('reload');
					});
				}
			}
		});
	}
}



function uploadjc(){
	$('#win').window({
		title:'上传图片',
		iconCls:'iconfont icon-tree',
	    width:800,
	    height:600,
	    modal:true, 
	    collapsible: false, 
	    minimizable: false, 
	    maximizable: true, 
	    closable: true,
	    content:'<iframe id="mainWorkArea" name="mainWorkArea" src="${ctx}/oa/offer/baseinfojc.htm"  broder="0" scrolling="atuo" align="middle" frameborder="0" width="100%" height="100%"></iframe>',
	    onClose: function () {
	    	//$('#centerdatagrid').datagrid('reload');
	    }
	});
}


function deljc(){
	var row = $('#centerjcdatagrid').datagrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!baseInfoJcDelete.htm?offerBaseInfoJc.jcId="+row.jcId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					$.messager.confirm('提示', '删除成功！', function(r){
						$('#centerjcdatagrid').datagrid('reload');
					});
				}
			}
		});
	}
}

</script>
 <style type="text/css">
        #imglist img{width:150px;height:120px;}
        #imgshow{
	        position:absolute;
	        border:1px solid #ccc;
	        background:#333;
	        padding:5px;
	        color:#fff;
	        display:none;
	    }
    </style>

</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div id="tt" class="easyui-tabs" data-options="fit:true" >
	        <div title="基础数据" style="padding: 3px;">
	        	<table id="centerdatagrid"></table>
				<div id="toolbar">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="add()">新增</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontrename',plain:true" onclick="edit()">修改</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="del()">删除</a>
				</div>
	        </div>
	        <div title="流程图" style="padding: 3px;">
	        	<table id="centerlcdatagrid"></table>
	        	<div id="lctoolbar">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="uploadlc()">上传</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="dellc()">删除</a>
				</div>
	        </div>
	        <div title="外形图" style="padding: 3px;">
	        	<table id="centerwxdatagrid"></table>
	        	<div id="wxtoolbar">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="uploadwx()">上传</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="delwx()">删除</a>
				</div>
	        </div>
	        <div title="基础图" style="padding: 3px;">
	        	<table id="centerjcdatagrid"></table>
	        	<div id="jctoolbar">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="uploadjc()">上传</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="deljc()">删除</a>
				</div>
	        </div>
    	</div>
	</div>
</div>
<div id="win"></div>
</body>
</html>