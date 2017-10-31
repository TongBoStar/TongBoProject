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
<!-- webupload -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<script src="${ctx}/resources/plugins/webuploader/webuploader.js" type="text/javascript"></script>

<script type="text/javascript">
var uploader;
$(function () {
	$('#centerdatagrid').datagrid({
    	//url:'${ctx}/offer/offer!baseInfoPage.htm',
        //title: '基础数据列表',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#toolbar',
        pagination: false,
        //pageSize: 20,
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
				}
		 	},
		 	{field: 'status', title: '状态',width:'80px'}
		]
        ],
        onBeforeLoad:function(){
        	
        },
        onLoadSuccess:function(){},
        onDblClickCell:onDblClickCell,
        onClickCell:onClickCell
    });
	
	uploader = WebUploader.create({
		swf: '${ctx}/resources/plugins/webuploader/Uploader.swf',// swf文件路径
	    server: '${ctx}/offer/offer!uploadjc.htm',// 文件接收服务端
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker',
	    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
	    resize: false
	});
	
	// 当有文件被添加进队列的时候
	uploader.on( 'fileQueued', function( file ) {
		$('#centerdatagrid').datagrid('appendRow',{id:file.id,name:file.name,status:'等待上传',lcZz:0});
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var rows = $("#centerdatagrid").datagrid('getData').rows;  
        var length = rows.length; 
        var rowindex;  
        for (var i = 0; i < length; i++) {  
            if (rows[i]['id'] == file.id) {  
                rowindex = i;  
                break;  
            }  
        }
        $("#centerdatagrid").datagrid("updateRow", { index: rowindex, row: { 
	    	status: "上传中" 
	    } }); 
	});
	//
	uploader.on( 'uploadSuccess', function(file, response) {
		var rows = $("#centerdatagrid").datagrid('getData').rows;  
        var length = rows.length; 
        var rowindex;  
        for (var i = 0; i < length; i++) {
            if (rows[i]['id'] == file.id) {
                rowindex = i;
                break;
            }
        }
        var lcJson = $.parseJSON(response._raw);
        $("#centerdatagrid").datagrid("updateRow", { index: rowindex, row: { 
	    	status: "已上传",
	    	zzId:lcJson.id
	    } });
	});
	uploader.on( 'uploadBeforeSend', function( block, data ) {
	    var file = block.file;
	    var rows = $("#centerdatagrid").datagrid('getData').rows;  
        var length = rows.length; 
        var rowindex;  
        for (var i = 0; i < length; i++) {
            if (rows[i]['id'] == file.id) {
                rowindex = i;
                break;
            }
        }
	    data.newName = rows[rowindex]['name'];
	});
});

function uploadlc(){
	 uploader.upload();
}

function onDblClickCell(index, field){
	if (editIndex != index){
        if (endEditing()){
            $('#centerdatagrid').datagrid('selectRow', index).datagrid('beginEdit', index);
            var ed = $('#centerdatagrid').datagrid('getEditor', {index:index,field:field});
            if (ed){
                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
            }
            editIndex = index;
        } else {
            $('#centerdatagrid').datagrid('selectRow', editIndex);
        }
    }
}

function onClickCell(index,field){
	if (endEditing()){
        $('#centerdatagrid').datagrid('acceptChanges');
    }
}

var editIndex = undefined;
function endEditing(){
    if (editIndex == undefined){return true}
    if ($('#centerdatagrid').datagrid('validateRow', editIndex)){
        $('#centerdatagrid').datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}

function del(){
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		if(row.lcId > 0){
			$.ajax({
				type: "post",
				url: "${ctx}/offer/offer!baseInfoJcDelete.htm?offerBaseInfoJc.jcId="+row.jcId,
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success){
						//$.messager.confirm('提示', '删除成功！', function(r){
							//window.location.href = "${ctx}/oa/offer/baseinfo.htm";
							//$('#centerdatagrid').datagrid('reload');
						//});
					}
				}
			});
		}
		var rows = $("#centerdatagrid").datagrid('getData').rows;  
        var length = rows.length; 
        var rowindex;  
        for (var i = 0; i < length; i++) {
            if (rows[i]['id'] == row.id) {
                rowindex = i;
                break;
            }
        }
        uploader.removeFile(row.id);
		$('#centerdatagrid').datagrid('deleteRow',rowindex);
		
	}
}

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<table id="centerdatagrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" id="picker">选择图片</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="uploadlc()">上传</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="del()">删除</a>
			</div>
		</div>
		<div id="w"></div>
	</div>
</div>
</body>
</html>