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
	$("#westtree").tree({
		url: '${ctx}/module/module!tree.htm',
    	method: 'post',
    	animate: true,
     	onClick: function (node) {
     		$("#centergrid").datagrid("reload",{"moduleQuery.moduleParentId":node.id});
     	},
     	onContextMenu: function(e,node){
			e.preventDefault();
			if(node.attributes.moduleLevel==3){
				return;
			}
			$(this).tree('select',node.target);
			$('#mm').menu('show',{
				left: e.pageX,
				top: e.pageY
			});
		}
  	});
	$('#centergrid').datagrid({
    	url:'${ctx}/item/item!pageList.htm',
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
	            { field: 'itemName', title: '项目名称' },
	            { field: 'itemUserName', title: '手艺人' },
	            { field: 'itemPriceAux', title: '现价' },
	            { field: 'itemPricePlan', title: '原价',align:'center'},
	            { field: 'itemUnit', title: '单位' },
	            { field: 'feeType', title: '付费类型',
	            	formatter: function(value, row, index){
		            	if(value==1){
		            		return "线上支付";
		            	}else{
		            		return "线下支付";
		            	}
	            	}
	            },
	            { field: 'serviceType', title: '服务类型',
	            	formatter: function(value, row, index){
		            	if(value==1){
		            		return "上门";
		            	}else if(value==2){
		            		return "到店";
		            	}else{
		            		return "上门+到店";
		            	}
	            	}
	            },
	            { field: 'consumTimes', title: '项目时长' },
	            { field: 'moduleName', title: '所属模块' },
	            { field: 'steps', title: '步骤' ,
	            	formatter: function(value, row, index){
		            	return "<a href='javascript:void(0);' onclick='viewsteps("+row.id+");'>查看</a>";
	            	}
	            },
	            { field: 'activityInfo', title: '活动信息' },
	            { field: 'imgs', title: '项目图片' ,
	            	formatter: function(value, row, index){
	            		if(value>0){
	            			return "<a href='javascript:void(0);' onclick='viewitemimgs("+row.id+");'>查看("+value+")</a>";
	            		}else{
	            			return "<a href='javascript:void(0);' onclick='viewitemimgs("+row.id+");'>上传</a>";
	            		}
	            	}
	            },
	            { field: 'createTime', title: '创建时间' },
	            { field: 'itemDesc', title: '项目描述' }
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
        $("#centergrid").datagrid("reload",{"itemQuery.itemName":$("#search_para").val()});
	});
});

function print(){
	window.location.href='${ctx}/item/addIndex.htm';
	/* $.dialog({
		content: 'url:${ctx}/item/addIndex.htm',
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
	}); */
}
function printA4(){
	$('#dlg11').dialog('open');
}
function viewsteps(id){
	$.dialog({
		content: 'url:${ctx}/itemStep/viewstepByItemId.htm?itemStepQuery.itemId='+id,
		lock: true,
		width:'620px',
		height:'460px',
		title:'项目步骤'/* ,
		okVal:'添加',
		ok: function(){
			iframe = this.iframe.contentWindow;
			$('#btn_sub', iframe.document).click();
			return false;
		},
		cancelVal: '关闭',
		cancel: true */
	});
}
function viewitemimgs(id){
	$.dialog({
		content: 'url:${ctx}/item/viewImgsByItemId.htm?entity.id='+id,
		lock: true,
		width:'1000px',
		height:'520px',
		title:'项目图片',
		okVal:'确定',
		ok: function(){
			iframe = this.iframe.contentWindow;
			$('#btnSave', iframe.document).click();
			$("#centergrid").datagrid("reload",{"itemQuery.itemName":$("#search_para").val()});
		},
		cancelVal: '关闭',
		cancel: true 
	});
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
			<div id="roletree" data-options="region:'west',split:true,title: '分组',iconCls:'icon-list'" style="width: 220px;">
				<div id="westtoolbar" class="datagrid-toolbar">
				</div>
				<div id="mm" class="easyui-menu" style="width:120px;">
					<div onclick="append()" data-options="iconCls:'icon-add'">添加项目</div>
					<div onclick="removeit()" data-options="iconCls:'icon-remove'">删除类别</div>
					<!-- <div class="menu-sep"></div>
					<div onclick="expand()">Expand</div>
					<div onclick="collapse()">Collapse</div> -->
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
<div id="dlg11" style="height:300px;width:300px;">sd</div>
</html>