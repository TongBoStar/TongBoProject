<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/doc/css/style.css"/>
<script type="text/javascript" src="${ctx}/resources/js/curdtools.js"></script>
<script type="text/javascript">
var zTree,files;
$(function(){
	loadZTree();
	
	$('#centergrid').datagrid({
    	url:'${ctx}/docrules/doc-rules!list.htm',
    	queryParams: {
    		'docRulesQuery.parentCode': '000001'
    	},
        border: false,
        fit: true,
        singleSelect: false,
        striped : true,
        pagination: false,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'name', title: '文件名',
            	formatter: function(value,row,index){
					return '<span class="'+row.fileType+' ico"></span>'+value;
				}	
            },
            { field: 'number', title: '编号'},
            { field: 'adoptStandard', title: '采用标准'},
            { field: 'revision', title: '版次'},
            { field: 'isEffective', title: '是否有效'}
		]],
		onDblClickRow:function(index,row){
			if(row.fileType=="folder"){
				//双击展开文件夹
				var selNode = zTree.getNodeByParam("code", row.code, null);
				zTree.selectNode(selNode);
				//alert(node);
				//默认取值
				
				$("#centergrid").datagrid("reload",
		    		{
			    		"docRulesQuery.parentCode":row.code
					}
	    		);
			}else{
				window.open('${ctx}/docrules/view.htm?docRules.code='+row.code);
			}
		},
		onLoadSuccess:function(data){
			 $('#centergrid').datagrid('resize');
		}
    });
	
	$("#newfolder").click(function(){
		$.dialog({
			content: 'url:${ctx}/docrules/addFolderIndex.htm',
			lock : true,
			width:'620px',
			height:'90px',
			title:'新建文件夹',
			opacity : 0.3,
			cache:false,
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
		    	$('#btn_sub', iframe.document).click();
		    	return false;
		    },
		    cancelVal: '关闭',
		    cancel: true
		}).zindex();
	});
	
	$("#upload").click(function(){
		var uploaddg = $.dialog({
			content: 'url:${ctx}/oa/docrules/uploadfile.htm',
			lock : true,
			width:'658px',
			height:'418px',
			title:'文件上传',
			opacity : 0.3,
			cache:false,
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
		    	$('#btn_sub', iframe.document).click();
				//uploaddg.content.startUpload();
		    	return false;
		    },
		    cancelVal: '关闭',
		    cancel: true
		}).zindex();
	});
	
	//删除文件或文件夹
	$("#del").click(function(){
		var rows = $('#centergrid').datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert('提示','请选择要删除的数据！','warning');
		}else if(rows.length>1){
			$.messager.alert('提示','一次只能删除一条数据！','warning');
		}else{
			$.ajax({
				type: "post",
				url: '${ctx}/docrules/doc-rules!deleteDocRules.htm',
				data:{"docRules.id":rows[0].id},
				dataType: "json",
				async: false,
				success:function(data,listTextStatus){
					if(data.success=="false"){
						$.dialog.alert(data.msg);
					}else{
						loadZTree(zTree.getSelectedNodes(true)[0]);
						reloadTree(zTree.getSelectedNodes(true)[0]);
					}
				}
			});
		}
	});
	
	$("#rename").click(function(){
		var rows = $('#centergrid').datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert('提示','请选择要重命名的文件或文件夹！','warning');
		}else if(rows.length>1){
			$.messager.alert('提示','一次只能重命名一个文件或文件夹！','warning');
		}else{
			if(rows[0].isChildren){
				//文件
				//editIndex
				var uploaddg = $.dialog({
					content: 'url:${ctx}/docrules/editIndex.htm?docRules.id='+rows[0].id,
					lock : true,
					width:'658px',
					height:'318px',
					title:'文件上传',
					opacity : 0.3,
					cache:false,
				    ok: function(){
				    	iframe = this.iframe.contentWindow;
				    	$('#btn_sub', iframe.document).click();
						//uploaddg.content.startUpload();
				    	return false;
				    },
				    cancelVal: '关闭',
				    cancel: true
				}).zindex();
			}else{
				//文件夹
				$.dialog({
					content: 'url:${ctx}/docrules/addFolderIndex.htm?docRules.id='+rows[0].id,
					lock : true,
					width:'620px',
					height:'90px',
					title:'新建文件夹',
					opacity : 0.3,
					cache:false,
				    ok: function(){
				    	iframe = this.iframe.contentWindow;
				    	$('#btn_sub', iframe.document).click();
				    	return false;
				    },
				    cancelVal: '关闭',
				    cancel: true
				}).zindex();
			}
		}
		/*
		if($("div.fileContiner .folderBox.select").length>0){
			var selDiv = $("div.fileContiner .folderBox.select");
			if(selDiv.attr("data-ischildren")=="true"){
				//add('重命名文件','${ctx}/doc/editFileIndex.htm?doc.id='+selDiv.attr("data-id"),'userList',620,160);
				
				$.dialog({
					content: 'url:'+'${ctx}/doc/editFileIndex.htm?doc.id='+selDiv.attr("data-id"),
					lock : true,
					width:620,
					height:160,
					title:'重命名文件',
					opacity : 0.3,
					cache:false,
				    ok: function(){
				    	iframe = this.iframe.contentWindow;
						//saveObj();
						$('#btn_sub', iframe.document).click();
						return false;
				    },
				    cancelVal: '关闭',
				    cancel: true
				}).zindex();
				
			}else{
				add('重命名文件夹','${ctx}/doc/addfolderIndex.htm?doc.id='+selDiv.attr("data-id"),'userList',620,90);
			}
		}else{
			$.dialog.alert('请选择需要重命名的文件或文件夹！');
		}
		*/
	});
	
	//搜索
	$("#search").click(function(){
		$("#centergrid").datagrid("reload",
			{
				"docRulesQuery.likeName":$("#fileName").val(),
				"docRulesQuery.isChildren":"true"
			}
		);
	});
});

function reloadTree(selNode){
	if(selNode!=undefined){
		zTree.selectNode(selNode);
		$("#centergrid").datagrid("reload",
			{
				"docRulesQuery.parentCode":selNode.code
			}
		);
	}
}

function loadZTree(selNode){
	$.ajax({
		type: "post",
		url: '${ctx}/docrules/doc-rules!treeGrid.htm?docRulesQuery.isChildren=false',
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			var setting = {	
				callback:{
					onClick:function(event, treeId, treeNode){
						$("#centergrid").datagrid("reload",
							{
								"docRulesQuery.parentCode":treeNode.code
							}
						);
					}
				},
				view:{
					addDiyDom:function(e, t){
					    var a = 10,
					    i = $("#" + t.tId + "_switch"),
					    n = $("#" + t.tId + "_ico");
					    if (i.remove(), n.before(i), "file" == t.type && n.removeClass("button ico_docu").addClass("file " + t.ext), "oexe" == t.ext && n.removeClass("button ico_docu").addClass("file oexe").removeAttr("style"), t.level >= 1) {
					        var s = "<span class='space' style='display: inline-block;width:" + a * t.level + "px'></span>";
					        i.before(s)
					    }
					},
					dblClickExpand: false,
					selectedMulti: false,
					showLine: false
				}
			};
			zTree = $.fn.zTree.init($("#folderList"), setting, data);
			if(selNode == undefined){
				var nodes = zTree.getNodes();
				if (nodes.length>0) {
					zTree.selectNode(nodes[0]);//默认选中根节点
				}
			}else{
				zTree.selectNode(selNode);
			}
		}
	});
}
</script>
</head>
<body class="easyui-layout" data-options="fit:true">
			<div id="roletree" data-options="region:'west',split:true,border:false" class="frame-left" style="width: 366px;">
				<ul id="folderList" class="ztree"></ul>
			</div>
			<div data-options="region:'center',border:false">
				<div class="tools">
					<div class="tools-left">
						<div class="btn-group btn-group-sm kod_path_tool">
							<button type="button" class="btn btn-default" id="newfolder">
								<i class="iconfont font-icon icon-iconfolderclose"></i>新建文件夹
						    </button>
						    <button type="button" class="btn btn-default" id="del">
								<i class="iconfont font-icon icon-fontdel"></i>删除
						    </button>
						    <button type="button" class="btn btn-default" id="rename">
								<i class="iconfont font-icon icon-fontrename"></i>重命名
						    </button>
							<button type="button" class="btn btn-default" id="upload">
						 		<i class="iconfont font-icon icon-iconcloudupload"></i>上传
							</button>
						</div>
					</div>
					<div class="tools-right">
						<input type="text" name="seach" id="fileName">
						<button type="button" title="搜索" id="search" class="btn btn-default">
							<i class="iconfont font-icon icon-fontsearch"></i>
						</button>
					</div>
					<div style="clear:both"></div>
				</div>
				<table id=centergrid></table>
			</div>
</body>
</html>