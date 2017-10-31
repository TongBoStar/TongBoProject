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
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/datagrid-detailview.js"></script>
<script type="text/javascript">
var ddv;


$(function () {
	$("#westtree").tree({
		url: '${ctx}/offer/offer!projectTree.htm',
    	method: 'post',
    	animate: true,
     	onClick: function (node) {
     		$("#centerdatagrid").datagrid("reload",{"offerProjectQuery.likeProjectTreeCode":node.code});
     	}
  	});
	
	$('#centerdatagrid').datagrid({
    	url:'${ctx}/offer/offer!projectPage.htm?offerProjectQuery.parentId=0',
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
        autoRowHeight:true,
        columns: [
		[	
		 	{field: 'name', title: '项目名称',width:'20%'},
		 	{field: 'projectTreeName', title: '项目分类',width:'6%'},
		 	{field: 'customer', title: '客户',width:'10%'},
		 	{field: 'salesperson', title: '销售员',width:'10%'},
		 	{field: 'bidder', title: '报价人',width:'10%'},
		 	{field: 'offerTime', title: '时间',width:'10%'},
		 	{field: 'description', title: '备注',width:'10%'},
		 	{field: 'operate', title: '操作',width:'19%',
		 		formatter: function(value,row,index){
		 			var html = '<a onclick="addchild('+row.projectId+','+row.projectTreeId+')" href="javascript:void(0);">【添加子项目】</a>';
		 			html = html + '<a onclick="toList('+row.projectId+')" href="javascript:void(0);">【查看报价清单】</a>';
		 			return html;
				}
		 	}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){},
        view: detailview,
        detailFormatter:function(index,row){
            return '<div style="padding:5px"><table class="ddv"></table></div>';
        },
        onExpandRow: function(index,row){
            ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
            ddv.treegrid({
            	url:'${ctx}/offer/offer!projectTreeList.htm?offerProjectQuery.likeParentCode='+row.code+'&offerProjectQuery.rootId='+row.projectId,
            	fitColumns:true,
                singleSelect:true,
                loadMsg:'',
                //height:'auto',
                autoRowHeight:true,
                idField:'projectId',
                treeField:'name',
                columns: [
        		[	
        		 	{field: 'name', title: '项目名称'},
        		 	{field: 'projectTreeName', title: '项目分类'},
        		 	{field: 'customer', title: '客户'},
        		 	{field: 'salesperson', title: '销售员'},
        		 	{field: 'bidder', title: '报价人'},
        		 	{field: 'offerTime', title: '时间'},
        		 	{field: 'description', title: '备注'},
        		 	{field: 'operate', title: '操作',
        		 		formatter: function(value,row,index){
        		 			var html = '<a onclick="addchild('+row.projectId+','+row.projectTreeId+')" href="javascript:void(0);">【添加子项目】</a>';
        		 			html = html + '<a onclick="editchild('+row.projectId+')" href="javascript:void(0);">【修改】</a>';
        		 			html = html + '<a onclick="delchild('+row.projectId+')" href="javascript:void(0);">【删除】</a>';
        		 			html = html + '<a onclick="toList('+row.projectId+')" href="javascript:void(0);">【查看报价清单】</a>';
        		 			return html;
        				}
        		 	}
        		]
                ],
                onResize:function(){                    
                    $('#centerdatagrid').datagrid('fixDetailRowHeight',index);                                      
	            },
	            onLoadSuccess:function(){
	                setTimeout(function(){
	                    $('#centerdatagrid').datagrid('fixDetailRowHeight',index);//在加载爷爷列表明细（即：父列表）成功时，获取此时整个列表的高度，使其适应变化后的高度，此时的索引
	                    $('#centerdatagrid').datagrid('fixRowHeight',index);//防止出现滑动条
	                },0);
	            }
            });
            $('#centerdatagrid').datagrid('fixDetailRowHeight',index);
        }
    });
});

function add(){
	$("#w").window({
		title: '新增项目'
		, width: 600
		, height: 420
		, iconCls: 'iconfont icon-fontrename iconfontwinfix'
		, modal: true
		, collapsible: false
		, minimizable: false
 		, maximizable: true
   		, closable: true
  		, content: "<iframe id='frm_win_project' src='${ctx}/oa/offer/projectedit.htm' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
   		, onClose: function () {
     		var rtnValue = window.top.$(this).data("returnValue");
   		}
	}).window('open');
}

function addchild(parentId,projectTreeId){
	$("#w").window({
		title: '新增子项目'
		, width: 600
		, height: 420
		, iconCls: 'iconfont icon-fontrename iconfontwinfix'
		, modal: true
		, collapsible: false
		, minimizable: false
 		, maximizable: true
   		, closable: true
  		, content: "<iframe id='frm_win_project' src='${ctx}/offer/projectSubEditIndex.htm?offerProject.parentId="+parentId+"&offerProject.projectTreeId="+projectTreeId+"' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
   		, onClose: function () {
   			if(ddv){
   				ddv.treegrid('reload');
   			}
   			
   		}
	}).window('open');
}

function edit(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		//window.location.href = "${ctx}/offer/baseInfoBathEditIndex.htm?baseInfo.baseInfoId="+row.baseInfoId;
		$("#w").window({
			title: '修改项目'
			, width: 600
			, height: 420
			, iconCls: 'iconfont icon-fontrename iconfontwinfix'
			, modal: true
			, collapsible: false
			, minimizable: false
	 		, maximizable: true
	   		, closable: true
	  		, content: "<iframe id='frm_win_project' src='${ctx}/offer/projectEditIndex.htm?offerProject.projectId="+row.projectId+"' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
	   		, onClose: function () {
	     		var rtnValue = window.top.$(this).data("returnValue");
	   		}
		}).window('open');
	}
}

function editchild(projectId){
	$("#w").window({
		title: '修改子项目'
		, width: 600
		, height: 420
		, iconCls: 'iconfont icon-fontrename iconfontwinfix'
		, modal: true
		, collapsible: false
		, minimizable: false
 		, maximizable: true
   		, closable: true
  		, content: "<iframe id='frm_win_project' src='${ctx}/offer/projectSubEditIndex.htm?offerProject.projectId="+projectId+"' border='0' frameborder='0' framespacing='0' marginheight='0' marginwidth='0' style='width:100%;height:99%;'></iframe>"
   		, onClose: function () {
   			//var ddv = $("#centerdatagrid").datagrid('getRowDetail',index).find('table.ddv');
   			ddv.treegrid('reload');
   		}
	}).window('open');
}

function del(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!projectDelete.htm?offerProject.projectId="+row.projectId,
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
	}
}

function delchild(projectId){
	$.ajax({
		type: "post",
		url: "${ctx}/offer/offer!projectDelete.htm?offerProject.projectId="+projectId,
		dataType: "json",
		async: false,
		beforeSend:function(){},
		success: function (data, textStatus) {
			if(data.success){
				$.messager.confirm('提示', '删除成功！', function(r){
					ddv.treegrid('reload');
				});
			}
		}
	});
}

function reloadGrid(){
	$('#centerdatagrid').datagrid('reload');
}

function closeWin(){
	$("#w").window('close');
}

function toList(projectId){
	window.location.href = "${ctx}/offer/projectItemIndex.htm?offerProject.projectId="+projectId;
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
		<div id="w"></div>
	</div>
</div>
</body>
</html>