<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<!-- upload -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/style.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/webuploader.js"></script>
<script>
var api = frameElement.api, W = api.opener;
var uploader;
$(function(){
	uploader = WebUploader.create({
	    swf: '${ctx}/resources/plugins/webuploader/Uploader.swf',// swf文件路径
	    server: '${ctx}/pos/pos!overtimeImport.htm',// 文件接收服务端
	    pick: {
	    	id:'#picker',
	    	multiple:false
	    },
	    resize: false,
	    accept:{
	    	title: '文件选择',
            extensions: 'xls,xlsx',
            mimeTypes: 'application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
	    }
	});
	
	uploader.on( 'fileQueued', function( file ) {
		$("#fileName").val(file.name);
		$("#thelist").append( '<div id="' + file.id + '" class="item">' +
				'<h4 class="info">' + file.name + '<a href="javascript:void(0);" onclick="delUpload(\''+file.id+'\');">[删除]</a></h4>' +
				'<p class="state">等待上传...</p>' +
		'</div>' );
	});
	
	// 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
              '<div class="progress-bar" role="progressbar" style="width: 0%">' +
              '</div>' +
            '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

        $percent.css( 'width', percentage * 100 + '%' );
    });
	
    uploader.on('uploadError',function(file,reason){
    	W.$.dialog.alert(reason,function(){},api);
	});
	
    uploader.on( 'uploadSuccess', function( file , response ) {
    	var docJson = $.parseJSON(response._raw);
        $("#upload_msg").val(docJson.msg);
    	//$( '#'+file.id ).find('p.state').text('已上传');
        //if(dosJson.success=="true"){
        	
        //}
        /*
        $.ajax({
			type: "post",
			url: "${ctx}/docrules/doc-rules!saveItem.htm",
			data:{
				"docRulesItem.userIds":$("#userIds").val(),
				"docRulesItem.userNames":$("#userNames").val(),
				"docRulesItem.effectiveDate":$("#effectiveDate").val(),
				"docRulesItem.oldName":docJson.oldName,
				"docRulesItem.newName":docJson.newName,
				"docRulesItem.fileType":docJson.type,
				"docRulesItem.isEffective":$("#isEffective").val(),
				"docRulesItem.revision":$("#revision").val(),
				"docRulesItem.number":$("#number").val(),
				"docRulesItem.adoptStandard":$("#adoptStandard").val(),
				"docRulesItem.parentName2":$("#parentName2").val(),
				"docRulesItem.parentCode2":$("#parentCode2").val(),
				"docRulesItem.parentId2":$("#parentId2").val(),
				"docRulesItem.type2":$("#type2").val(),
				"docRulesItem.parentName1":$("#parentName1").val(),
				"docRulesItem.parentCode1":$("#parentCode1").val(),
				"docRulesItem.parentId1":$("#parentId1").val(),
				"docRulesItem.type1":$("#type1").val(),
			},
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {}
		});
        */
    });
    
    uploader.on('uploadFinished',function(file,response){
    	//关闭窗口
    	//alert(response);
    	//var docJson = $.parseJSON(response._raw);
    	
    	
        //if(dosJson.success=="true"){
        //	$.messager.confirm('提示', dosJson.msg, function(r){
				//$("#centergrid").datagrid("loaded");
       // 		api.close();
		//	});
        //}
    	$.messager.confirm('提示', $("#upload_msg").val(), function(r){
			//$("#centergrid").datagrid("loaded");
    		api.close();
		});
    	
    });
    
    var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
			uploader.upload();
			return false;
		}
	});
});

function delUpload(id){
	$("#"+id).remove();
	uploader.removeFile(uploader.getFile(id));
}

</script>
<style type="text/css">
#thelist{
height: 65px !important;
}
</style>
</head>
<body>
<form class="my-form" id="form" method="post">
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<input type="hidden" id="upload_msg"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
      			<td>
      				<div id="uploader" class="file-upload">
					    <!--用来存放文件信息-->
					    <div id="thelist" class="uploader-list"></div>
					    <div class="btns">
					        <div id="picker">选择文件</div>
					        <button id="ctlBtn" class="btn btn-default" style="display:none">开始上传</button>
					    </div>
					</div>
        		</td>
        	</tr>
        </table>
	</div>
</form>
</body>
</html>