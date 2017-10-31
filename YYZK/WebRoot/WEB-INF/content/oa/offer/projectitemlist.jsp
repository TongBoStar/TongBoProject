<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>基础数据列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<!-- webupload -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<script src="${ctx}/resources/plugins/webuploader/webuploader.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	$('#centerdatagrid').datagrid({
    	url:'${ctx}/offer/offer!projectItemPage.htm?offerProjectItemQuery.projectId=<s:property value="offerProject.projectId"/>',
        title: "【<s:property value='offerProject.name'/>】报价列表",
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        //singleSelect: true,
        striped : true,
        toolbar: '#toolbar',
        pagination: true,
        pageSize: 20,
        rownumbers: true,
        fitColumns: false,
        columns: [
		[	
		 	{field:'ck',checkbox:true},
		 	{field: 'projectName', title: '项目名称'},
		 	{field: 'entrancePressureValue', title: '进口压力'},
		 	{field: 'outletPressureValue', title: '出口压力'},
		 	{field: 'flowValue', title: '流量'},
		 	{field: 'structureValue', title: '结构形式'},
		 	{field: 'valveTypeValue', title: '阀门类型'}
		]
        ],
        onBeforeLoad:function(){
        	
        },
        onLoadSuccess:function(){},
        onDblClickCell: function(index,field,value){
        	//edit();
    	}
    });
	
	$("#filePickerlc").click(function(){
		$("#w").window({
			title: '选择流程图'
			, width: 1000
			, height: 500
			, iconCls: 'iconfont icon-fontrename iconfontwinfix'
			, modal: true
			, collapsible: false
			, minimizable: false
	 		, maximizable: true
	   		, closable: true
	  		, content: "<iframe id='frm_win_project' src='${ctx}/oa/offer/selbaseinfolc.htm?projectId=<s:property value='offerProject.projectId'/>' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
	   		, onClose: function () {
	     		var rtnValue = window.top.$(this).data("returnValue");
	   		}
		}).window('open');
		
	});
	
	$("#filePickerwx").click(function(){
		$("#w").window({
			title: '选择外形图'
			, width: 1000
			, height: 500
			, iconCls: 'iconfont icon-fontrename iconfontwinfix'
			, modal: true
			, collapsible: false
			, minimizable: false
	 		, maximizable: true
	   		, closable: true
	  		, content: "<iframe id='frm_win_project' src='${ctx}/oa/offer/selbaseinfowx.htm?projectId=<s:property value='offerProject.projectId'/>' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
	   		, onClose: function () {
	     		var rtnValue = window.top.$(this).data("returnValue");
	   		}
		}).window('open');
		
	});
	
	$("#filePickerjc").click(function(){
		$("#w").window({
			title: '选择基础图'
			, width: 1000
			, height: 500
			, iconCls: 'iconfont icon-fontrename iconfontwinfix'
			, modal: true
			, collapsible: false
			, minimizable: false
	 		, maximizable: true
	   		, closable: true
	  		, content: "<iframe id='frm_win_project' src='${ctx}/oa/offer/selbaseinfojc.htm?projectId=<s:property value='offerProject.projectId'/>' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
	   		, onClose: function () {
	     		var rtnValue = window.top.$(this).data("returnValue");
	   		}
		}).window('open');
		
	});
});

function add(){
	$("#w").window({
		title: '新增项目'
		, width: 1000
		, height: 500
		, iconCls: 'iconfont icon-fontrename iconfontwinfix'
		, modal: true
		, collapsible: false
		, minimizable: false
 		, maximizable: true
   		, closable: true
  		, content: "<iframe id='frm_win_project' src='${ctx}/offer/projectItemEditIndex.htm?offerProjectItem.projectId=<s:property value='offerProject.projectId'/>' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
   		, onClose: function () {
     		var rtnValue = window.top.$(this).data("returnValue");
   		}
	}).window('center').window('open');
}

function edit(){
	//var row = $('#centerdatagrid').datagrid('getSelected');
	//$("#centerdatagrid").datagrid('getSelections').length
	var rows = $("#centerdatagrid").datagrid('getSelections');
	if(rows.length==1){
		var row = $('#centerdatagrid').datagrid('getSelected');
		//window.location.href = "${ctx}/offer/baseInfoBathEditIndex.htm?baseInfo.baseInfoId="+row.baseInfoId;
		$("#w").window({
			title: '修改项目'
			, width: 1000
			, height: 500
			, iconCls: 'iconfont icon-fontrename iconfontwinfix'
			, modal: true
			, collapsible: false
			, minimizable: false
	 		, maximizable: true
	   		, closable: true
	   		, content: "<iframe id='frm_win_project' src='${ctx}/offer/projectItemEditIndex.htm?offerProjectItem.itemId="+row.itemId+"&offerProjectItem.projectId=<s:property value='offerProject.projectId'/>' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
	   	   	, onClose: function () {
	   		}
		}).window('center').window('open');
	}else{
		$.messager.confirm('提示', '一次只能编辑一条数据！', function(r){
		});
	}
}

function del(){
	//var row = $('#centerdatagrid').datagrid('getSelected');
	var rows = $("#centerdatagrid").datagrid('getSelections');
	
	if(rows.length==1){
		var row = $('#centerdatagrid').datagrid('getSelected');
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!projectItemDelete.htm?offerProjectItem.itemId="+row.itemId,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					
					$.messager.confirm('提示', '删除成功！', function(r){
						reloadGrid();
					});
				}
			}
		});
	}else{
		$.messager.confirm('提示', '一次只能删除一条数据！', function(r){
		});
	}
}

function reloadGrid(){
	$('#centerdatagrid').datagrid('reload');
}

function closeWin(){
	$("#w").window('close');
}

function toList(){
	window.location.href = "${ctx}/oa/offer/project.htm";
}

function toPrintPage(){
	$("#w").window({
		title: '打印排序'
		, width: 358
		, height: 330
		, iconCls: 'iconfont icon-fontrename iconfontwinfix'
		, modal: true
		, collapsible: false
		, minimizable: false
 		, maximizable: true
   		, closable: true
  		, content: "<iframe id='frm_win_project' src='${ctx}/oa/offer/bidingsort.htm' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
   		, onClose: function () {
     		var rtnValue = window.top.$(this).data("returnValue");
   		}
	}).window('center').window('open');
	/*
	var rows = $("#centerdatagrid").datagrid('getSelections');
	var printlist="";
	if(rows.length > 0){
		$.each(rows,function(i,val){
			if((i+1)==rows.length){
				printlist = printlist + val.itemId;
			}else{
				printlist = printlist + val.itemId+",";
			}
		});
		window.open("${ctx}/oa/offer/bidingprint.htm?printlist="+printlist);
	}
	*/
	
}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<table id="centerdatagrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="add()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontrename',plain:true" onclick="edit()">修改</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="del()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontprint',plain:true" onclick="toPrintPage()">打印</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontfanhui',plain:true" onclick="toList()">返回列表</a>
			</div>
		</div>
		<div data-options="region:'east',iconCls:'iconfont icon-fonttupian'" title="流程图&制造图" style="width:150px;">
			<div id="uploaderlc" class="wu-example">
				<div class="queueList">
					<div class="placeholder" id="dndArealc">
			            <div class="webuploader-container" style="padding-top:5px;padding-bottom:5px;">
			            	<img id='lcimg' src='${ctx}<s:property value="offerProject.lcImg"/>' width='110' height='160'>
			            	<div class="webuploader-pick" id="filePickerlc">选择流程图</div>
			         	</div>
			        </div>
				</div>
			</div>
			<div id="uploaderwx" class="wu-example">
				<div class="queueList">
					<div class="placeholder" id="dndAreawx">
			            <div class="webuploader-container" style="padding-top:5px;padding-bottom:5px;">
			            	<img id='wximg' src='${ctx}<s:property value="offerProject.wxImg"/>' width='110' height='160'>
			            	<div class="webuploader-pick" id="filePickerwx">选择外形图</div>
			         	</div>
			        </div>
				</div>
			</div>
			<div id="uploaderjc" class="wu-example">
				<div class="queueList">
					<div class="placeholder" id="dndAreajc">
			            <div class="webuploader-container" style="padding-top:5px;padding-bottom:5px;">
			            	<img id='jcimg' src='${ctx}<s:property value="offerProject.jcImg"/>' width='110' height='160'>
			            	<div class="webuploader-pick" id="filePickerjc">选择基础图</div>
			         	</div>
			        </div>
				</div>
			</div>
			<style>
			.wu-example {
			    position: relative;
			    padding: 5px;
			    background-color: #fafafa;
			    box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);
			    border-color: #e5e5e5 #eee #eee;
			    border-style: solid;
			    border-width: 1px 0;
			}
			.wu-example .queueList {
			    border: 3px dashed #e6e6e6;
			}
			.wu-example .placeholder {
			    text-align: center;
			    color: #cccccc;
			    position: relative;
			}
			</style>
		</div>
	</div>
	<div id="w"></div>
</div>
</body>
</html>