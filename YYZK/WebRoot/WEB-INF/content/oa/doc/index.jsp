<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/doc/css/style.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- curdtools -->
<script type="text/javascript" src="${ctx}/resources/js/curdtools.js"></script>
<script type="text/javascript">
var zTree,files;
$(function(){
	loadZTree();
	//加载按钮
	
	$("#set_icon").click(function(){
		setListType("icon",files);
	});
	
	$("#set_list").click(function(){
		setListType("list",files);
	});
	
	$("#newfolder").click(function(){
		add('新建文件夹','${ctx}/doc/addfolderIndex.htm','userList',620,90);
	});
	
	$("#upload").click(function(){
		var uploaddg = $.dialog({
			content: 'url:${ctx}/oa/doc/uploadfile.htm',
			lock : true,
			width:'638px',
			height:'390px',
			title:'文件上传',
			opacity : 0.3,
			cache:false,
		    ok: function(){
				uploaddg.content.startUpload();
		    	return false;
		    },
		    cancelVal: '关闭',
		    cancel: true
		}).zindex();
	});
	
	//删除文件或文件夹
	$("#del").click(function(){
		var selDiv = $("div.fileContiner .folderBox.select");
		if(selDiv.length>0){
			$.ajax({
				type: "post",
				url: '${ctx}/doc/doc!delFolder.htm',
				data:{"doc.code":selDiv.attr("data-code"),"doc.id":selDiv.attr("data-id"),"doc.pCode":selDiv.attr("data-pcode")},
				dataType: "json",
				async: false,
				success:function(data,listTextStatus){
					if(data.success=="false"){
						$.dialog.alert(data.msg);
					}else{
						$.dialog.alert(data.msg,function(){
							$.ajax({
								type: "post",
								url: '${ctx}/doc/doc!list.htm?docQuery.pCode='+data.pcode,
								dataType: "json",
								async: false,
								success:function(listData,listTextStatus){
									reloadTree();
									files = new Backbone.Collection(listData.rows);
									setFiles(listData.rows);
									setListType('list',files);
								}
							});
						});
					}
				}
			});
		}else{
			$.dialog.alert('请选择需要删除的文件或文件夹！');
		}
	});
	
	$("#rename").click(function(){
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
	});
	
});

function dbshow(){
	$("div.fileContiner").delegate('.folderBox','dblclick',function(){
		if($(this).find(".ico").attr("filetype")!='folder'){
			window.open('${ctx}/doc/view.htm?doc.code='+$(this).attr("data-code"));
		}else{
			//双击展开文件夹
			var selNode = zTree.getNodeByParam("code", $(this).attr("data-code"), null);
			zTree.selectNode(selNode);
			//alert(node);
			//默认取值
			$.ajax({
				type: "post",
				url: '${ctx}/doc/doc!list.htm?docQuery.pCode='+$(this).attr("data-code"),
				dataType: "json",
				async: false,
				success:function(listData,listTextStatus){
					//默认列表形式展开
					files = new Backbone.Collection(listData.rows);
					if($(".fileContiner").hasClass("fileList_icon")){
						setListType('icon',files);
					}else{
						setListType('list',files);
					}
				}
			});
		}
	});
	
	$("div.fileContiner").delegate('.folderBox','mouseover',function(){
		$("div.fileContiner .folderBox").removeClass("hover");
		$(this).addClass("hover");
	}).delegate('.folderBox','mouseout',function(){
		$("div.fileContiner .folderBox").removeClass("hover");
	});
	
	$("div.fileContiner").delegate('.folderBox','click',function(){
		$("div.fileContiner .folderBox").removeClass("select");
		$(this).addClass("select");
	});
}

function setListType(e,f){
	$(".tools-right button").removeClass("active"),
    $("#set_" + e).addClass("active");
    if("list"==e){
    	var htm='';
    	htm = htm+'<div id="main_title">';
    	htm = htm+'<div field="name" class="filename this">名称</div>';
    	htm = htm+'<div field="ext" class="filetype this">类型</div>';
    	htm = htm+'<div field="size" class="filesize this">大小</div>';
    	htm = htm+'<div field="mtime" class="filetime this">修改时间</div>';
    	htm = htm+'<div style="clear:both"></div>';
    	htm = htm+'</div>';
    	var list='<div class="fileContiner fileList_list" style="display: block;">';
    	//f.each(function(model,index,list){
    	$.each(f.models,function(index,doc){
    		var css='';
    		if(index%2==1){
    			css='file2';
    		}
    		list = list+' <div title="" data-name="'+doc.attributes.name+'" data-ischildren="'+doc.attributes.isChildren+'" data-code="'+doc.attributes.code+'"  data-id="'+doc.attributes.id+'" data-pcode="'+doc.attributes.pCode+'" class="file folderBox menufolder '+css+'" number="1">';
    		list = list+'	<div filetype="'+doc.attributes.fileType+'" class="'+doc.attributes.fileType+' ico"></div>';
    		list = list+'    <div class="titleBox" id="'+doc.attributes.id+'"><span title="" class="title">'+doc.attributes.name+'</span></div>';
    		list = list+'    <div class="filetype">'+doc.attributes.fileType+'</div>';
    		list = list+'    <div class="filesize"></div>';
    		list = list+'    <div class="filetime">'+doc.attributes.modifyDate+'</div>';
    		list = list+'    <div style="clear:both"></div>';
    		list = list+'	</div>';
		});
    	list = list + '<div style="clear:both"></div>';
    	list = list +'</div>';
    	$("#list_type_list").html("");
    	$("#list_type_list").html(htm);
    	$(".bodymain").html("");
    	$(".bodymain").html(list);
    }else if("icon"==e){
    	$("#list_type_list").html("");
    	var list='<div class="fileContiner fileList_icon" style="display: block;">';
    	$.each(f.models,function(index,doc){
    		var css='';
    		if(index%2==1){
    			css='file2';
    		}
    		list = list+' <div title="" data-name="'+doc.attributes.name+'"  data-ischildren="'+doc.attributes.isChildren+'" data-code="'+doc.attributes.code+'" data-id="'+doc.attributes.id+'" data-pcode="'+doc.attributes.pCode+'" class="file folderBox menufolder '+css+'" number="1">';
    		list = list+'	<div filetype="'+doc.attributes.fileType+'" class="'+doc.attributes.fileType+' ico"></div>';
    		list = list+'    <div class="titleBox" id="'+doc.attributes.id+'"><span title="" class="title">'+doc.attributes.name+'</span></div>';
    		list = list+'	</div>';
		});
    	list = list + '<div style="clear:both"></div>';
    	list = list +'</div>';
    	$(".bodymain").html("");
    	$(".bodymain").html(list);
    }
    dbshow();
}
/*
function setListType(e){
	$(".tools-right button").removeClass("active"),
    $("#set_" + e).addClass("active"),
    "list" == e ? 
    		($('.fileContiner').removeClass("fileList_icon").addClass("fileList_list"), $("#list_type_list").html('<div id="main_title"><div field="name" class="filename this">名称</div><div field="ext" class="filetype this">类型</div><div field="size" class="filesize this">大小</div><div field="mtime" class="filetime this">修改时间</div><div style="clear:both"></div></div>')) 
    		: ($('.fileContiner').removeClass("fileList_list").addClass("fileList_icon"), $("#list_type_list").html("")),
    $(".menu_seticon").removeClass("selected"),
    $(".set_set_"+e).addClass("selected");
}
*/
function setFiles(data){
	files = new Backbone.Collection(data);
}

function reloadTree(){
	var nodes = zTree.getSelectedNodes();
	if (nodes.length>0) {
		loadZTree(nodes[0]);
	}
}

function loadZTree(selNode){
	$.ajax({
		type: "post",
		url: '${ctx}/doc/doc!treeGrid.htm?docQuery.isChildren=false',
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			//默认取值
			$.ajax({
				type: "post",
				url: '${ctx}/doc/doc!list.htm?docQuery.pCode=000001',
				dataType: "json",
				async: false,
				success:function(listData,listTextStatus){
					//默认列表形式展开
					files = new Backbone.Collection(listData.rows);
					setListType('list',files);
				}
			});
			
			var setting = {	
				callback:{
					onClick:function(event, treeId, treeNode){
						//alert(treeNode.id);
						$.ajax({
							type: "post",
							url: '${ctx}/doc/doc!list.htm?docQuery.pCode='+treeNode.code,
							dataType: "json",
							async: false,
							success:function(listData,listTextStatus){
								//默认列表形式展开
								files = new Backbone.Collection(listData.rows);
								if($(".fileContiner").hasClass("fileList_icon")){
									setListType('icon',files);
								}else{
									setListType('list',files);
								}
							}
						});
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
					    //var o = "";
					   // void 0 != t.menuType ? o = t.menuType: (("file" == t.type || "oexe" == t.ext) && (o = "menuTreeFile"), "folder" == t.type && (o = "menuTreeFolder"));
					    //var r = LNG.name + ":" + t.name + "\n" + LNG.size + ":" + t.size_friendly + "\n" + LNG.modify_time + ":" + t.mtime;
					    //"file" != t.type && (r = t.name),
					    //i.parent().addClass(o).attr("title", r)
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
<body>
<div class="frame-main">
	<div class="frame-left">
		<ul id="folderList" class="ztree"></ul>
	</div>
	<div class="frame-resize"></div>
	<div class="frame-right">
		<div class="frame-right-main">
			<div class="tools">
				<div class="tools-left">
					<div class="btn-group btn-group-sm kod_path_tool">
						<button type="button" class="btn btn-default" id="newfolder">
							<i class="iconfont font-icon icon-iconfolderclose"></i>新建文件夹
					    </button>
					    <button type="button" class="btn btn-default" id="del">
							<i class="iconfont font-icon icon-del"></i>删除
					    </button>
					    <button type="button" class="btn btn-default" id="rename">
							<i class="iconfont font-icon icon-rename"></i>重命名
					    </button>
						<button type="button" class="btn btn-default" id="upload">
					 		<i class="iconfont font-icon icon-iconcloudupload"></i>上传
						</button>
					</div>
				</div>
				<div class="tools-right">
					<div class="btn-group btn-group-sm">
						<button class="btn btn-default active" type="button" title="图标排列" id="set_icon">
							<i class="iconfont font-icon icon-iconth"></i>
						</button>
						<button class="btn btn-default" type="button" title="列表排列" id="set_list">
							<i class="iconfont font-icon icon-iconlist"></i>
						</button>
					</div>
				</div>
				<div style="clear:both"></div>
			</div>
			<div id="list_type_list">
			</div>
			<div class='bodymain html5_drag_upload_box menuBodyMain'>
			</div>
		</div>
	</div>
</div>
</body>
</html>