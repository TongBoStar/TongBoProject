<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- date -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- upload -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/style.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/webuploader.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<script>
var api = frameElement.api, W = api.opener;
var uploader;
$(function(){
	$btn = $('#ctlBtn');
	uploader = WebUploader.create({
	    // swf文件路径
	    swf: '${ctx}/resources/plugins/webuploader/Uploader.swf',
	    // 文件接收服务端。
	    server: '${ctx}/fileupload/uploadDocFile.htm?code='+W.zTree.getSelectedNodes(true)[0].code,
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker',
	    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
	    resize: false,
	    accept:{
	    	title: '文件选择',
            extensions: 'doc,docx,ppt,pptx,xls,xlsx,pdf',
            mimeTypes: 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/pdf'
	    }
	    //pdf application/pdf
	});
	
	uploader.on( 'fileQueued', function( file ) {
		//判断同名文件
		//checkFile
		$.ajax({
			type: "post",
			url: '${ctx}/doc/doc!checkFile.htm',
			data:{"doc.pCode":W.zTree.getSelectedNodes(true)[0].code,"doc.name":file.name},
			dataType: "json",
			async: false,
			success: function (data, status) {
				if(data.success=="false"){
					delUpload(file.id);
					W.$.dialog.alert("无法上传名为["+file.name+"]的文件，该文件夹下有同名文件！",function(){
					},api);
				}else{
					$("#thelist").append( '<div id="' + file.id + '" class="item">' +
						'<h4 class="info">' + file.name + '<a href="javascript:void(0);" onclick="delUpload(\''+file.id+'\');">[删除]</a></h4>' +
						'<p class="state">等待上传...</p>' +
					'</div>' );
				}
			}
		});
	    
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
	
    uploader.on( 'uploadSuccess', function( file , response ) {
    	//$.parseJSON(response._raw).name;
    	var docJson = $.parseJSON(response._raw);
        $( '#'+file.id ).find('p.state').text('已上传');
        //docJson.size
        $.ajax({
			type: "post",
			url: "${ctx}/doc/doc!saveFile.htm",
			data:{
				"doc.userIds":$("#userIds").val(),
				"doc.userNames":$("#userNames").val(),
				"doc.name":docJson.name,
				"doc.pCode":W.zTree.getSelectedNodes(true)[0].code,
				"doc.pId":W.zTree.getSelectedNodes(true)[0].id,
				"doc.fileType":docJson.type},
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {}
		});
        
    });
	
    
    $btn.on( 'click', function() {
        //if ( state === 'uploading' ) {
         //   uploader.stop();
        //} else {
            uploader.upload();
        //}
    });
    
    uploader.on('uploadFinished',function(file,response){
    	//关闭窗口
    	//api.close();
    	W.$.dialog.alert("上传成功！",function(){
    		$.ajax({
    			type: "post",
    			url: '${ctx}/doc/doc!list.htm?docQuery.pCode='+W.zTree.getSelectedNodes(true)[0].code,
    			dataType: "json",
    			async: false,
    			success:function(listData,listTextStatus){
    				api.close();
    				W.reloadTree();
    				files = new Backbone.Collection(listData.rows);
    				W.setFiles(listData.rows);
    				W.setListType('list',files);
    			}
    		});
    	});
    });
    
    $("#folderName").html(W.zTree.getSelectedNodes(true)[0].name);
});

function delUpload(id){
	$("#"+id).remove();
	uploader.removeFile(uploader.getFile(id));
}

function startUpload(){
	uploader.upload();
}


function selUsers(){
	var demo = W.$.dialog({
		content: 'url:${ctx}/core/emp/selemp.htm',
		lock: true,
		title:'人员选择',
		width: 750,
	    height: 410,
	    parent:api,
	    ok: function(){
	    	var selids="",selnames="";
	    	$.each(demo.content.$("#selusers").find("option"),function(i,value){
				selids = selids + value.value+",";
				selnames = selnames + value.text+",";
			});
	    	//alert(selids+selnames);
	    	$("#userIds").val(delLastChar(selids,","));
	    	$("#userNames").val(delLastChar(selnames,","));
	        //return false;
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">所属文件夹</th>
      			<td>
      				<div id="folderName"></div>
      				<s:hidden name="doc.pId" id="pId"></s:hidden>
      				<s:hidden name="doc.pCode" id="pCode"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80">发放范围</th>
      			<td>
      				<s:textarea id="userNames" name="doc.userNames"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
      				<s:hidden name="doc.userIds" id="userIds"></s:hidden>
      				&nbsp;<a  href="javascript:void(0)" onclick="selUsers()">选择</a>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">文件</span></th>
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