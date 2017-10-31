<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<jsp:include page="/public/head.jsp" ></jsp:include>
<!-- webupload -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<script src="${ctx}/resources/plugins/webuploader/webuploader.js" type="text/javascript"></script>
<style type="text/css">
.wu-example {
    position: relative;
    padding: 45px 15px 15px;
    background-color: #fafafa;
    box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);
    border-color: #e5e5e5 #eee #eee;
    border-style: solid;
    border-width: 1px 0;
}
.wu-example:after {
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 12px;
    font-weight: bold;
    color: #bbb;
    text-transform: uppercase;
    letter-spacing: 1px;
}


#picker {
    display: inline-block;
    line-height: 1.428571429;
    vertical-align: middle;
    margin: 0 12px 0 0;
}
#picker .webuploader-pick {
    padding: 6px 12px;
    display: block;
}


#uploader-demo .thumbnail {
    width: 100px;
    height: 100px;
}
#uploader-demo .thumbnail img {
    width: 100%;
}
.uploader-list {
    width: 100%;
    overflow: hidden;
}
.file-item {
    float: left;
    position: relative;
    margin: 0 20px 20px 0;
    padding: 4px;
}
.file-item .error {
    position: absolute;
    top: 4px;
    left: 4px;
    right: 4px;
    background: red;
    color: white;
    text-align: center;
    height: 20px;
    font-size: 14px;
    line-height: 23px;
}
.file-item .info {
    position: absolute;
    left: 4px;
    bottom: 4px;
    right: 4px;
    height: 20px;
    line-height: 20px;
    text-indent: 5px;
    background: rgba(0, 0, 0, 0.6);
    color: white;
    overflow: hidden;
    white-space: nowrap;
    text-overflow : ellipsis;
    font-size: 12px;
    z-index: 10;
}
.upload-state-done:after {
    content:"\e62a";
    font-family: "iconfont" !important;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    font-size: 20px;
    position: absolute;
    bottom: 0;
    right: 4px;
    color: #4cae4c;
    z-index: 99;
}
.file-item .progress {
    position: absolute;
    right: 4px;
    bottom: 4px;
    height: 3px;
    left: 4px;
    height: 4px;
    overflow: hidden;
    z-index: 15;
    margin:0;
    padding: 0;
    border-radius: 0;
    background: transparent;
}
.file-item .progress span {
    display: block;
    overflow: hidden;
    width: 0;
    height: 100%;
    background: #d14 url(${ctx}/resources/plugins/webuploader/progress.png) repeat-x;
    -webit-transition: width 200ms linear;
    -moz-transition: width 200ms linear;
    -o-transition: width 200ms linear;
    -ms-transition: width 200ms linear;
    transition: width 200ms linear;
    -webkit-animation: progressmove 2s linear infinite;
    -moz-animation: progressmove 2s linear infinite;
    -o-animation: progressmove 2s linear infinite;
    -ms-animation: progressmove 2s linear infinite;
    animation: progressmove 2s linear infinite;
    -webkit-transform: translateZ(0);
}


.file-panel {
    position: absolute;
    height: 0;
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#80000000', endColorstr='#80000000')\0;
    background: rgba( 0, 0, 0, 0.5 );
    width: 100%;
    top: 0;
    left: 0;
    overflow: hidden;
    z-index: 300;
}

.file-panel span {
    width: 24px;
    height: 24px;
    display: inline;
    float: right;
    text-indent: -9999px;
    overflow: hidden;
    background: url(${ctx}/resources/plugins/webuploader/icons.png) no-repeat;
    margin: 5px 1px 1px;
    cursor: pointer;
}
.file-panel span.cancel {background-position: -48px -24px;}
.file-panel span.cancel:hover {background-position: -48px 0;}
</style>

<script type="text/javascript">
var uploader;
$(function () {
	var $ = jQuery,
    $list = $('#fileList'),
    // 优化retina, 在retina下这个值是2
    ratio = window.devicePixelRatio || 1,
    // 缩略图大小
    thumbnailWidth = 100 * ratio,
    thumbnailHeight = 100 * ratio,
 	// 所有文件的进度信息，key为file id
    percentages = {};
    // Web Uploader实例
    
	
	// 初始化Web Uploader
	uploader = WebUploader.create({
		swf: '${ctx}/resources/plugins/webuploader/Uploader.swf',// swf文件路径
	    server: '${ctx}/admin/oa/workorder/oa-work-order!uploadImg.htm',// 文件接收服务端
	    pick: '#filePicker',
	    // 只允许选择图片文件。
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/*'
	    }
	});
	
	// 当有文件添加进来的时候
	uploader.on( 'fileQueued', function( file ) {
		percentages[ file.id ] = [ file.size, 0 ];
		
	    var $li = $(
	            '<div id="' + file.id + '" class="file-item thumbnail">' +
	                '<img>' +
	                '<div class="info">' + file.name + '</div>' +
	            '</div>'
	            ),
	            $btns = $('<div class="file-panel">' +
	                    '<span class="cancel">删除</span>' +
	                    '</div>').appendTo( $li ),    
	            
	            
	        $img = $li.find('img');

	    $li.on( 'mouseenter', function() {
            $btns.stop().animate({height: 30});
        });

        $li.on( 'mouseleave', function() {
            $btns.stop().animate({height: 0});
        });
        
        $btns.on( 'click', 'span', function() {
            var index = $(this).index(),
                deg;
            switch ( index ) {
                case 0:
                    //uploader.removeFile( file );
                    var $li = $('#'+file.id);
        			delete percentages[ file.id ];
        			$li.off().find('.file-panel').off().end().remove();
                    return;
            }
        });
	    

	    // $list为容器jQuery实例
	    $list.append( $li );

	    // 创建缩略图
	    // 如果为非图片文件，可以不用调用此方法。
	    // thumbnailWidth x thumbnailHeight 为 100 x 100
	    uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }

	        $img.attr( 'src', src );
	    }, thumbnailWidth, thumbnailHeight );
	});
	
	
	
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress span');

	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<p class="progress"><span></span></p>')
	                .appendTo( $li )
	                .find('span');
	    }

	    $percent.css( 'width', percentage * 100 + '%' );
	});

	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
	    $( '#'+file.id ).addClass('upload-state-done');
	});

	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
	    var $li = $( '#'+file.id ),
	        $error = $li.find('div.error');

	    // 避免重复创建
	    if ( !$error.length ) {
	        $error = $('<div class="error"></div>').appendTo( $li );
	    }

	    $error.text('上传失败');
	});

	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').remove();
	});
	
	//所有文件上传完毕
	uploader.on("uploadFinished", function ()
	{
		//提交表单
		iframeId = GetQueryString("iframeId");
		$.messager.confirm('提示', '提交成功！', function(r){
			var frames=window.top.window.document.getElementById(iframeId);
			window.parent.closeWin();
			frames.contentWindow.reload();
		});
	});
});



function closewin(){
	window.parent.closeWin();
}

function save(){
	iframeId = GetQueryString("iframeId");
	
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url:'${ctx}/admin/oa/workorder/oa-work-order!edit.htm',
    				data:$('#form').serialize()+"&oaWorkOrder.workOrderType="+GetQueryString("workOrderType"),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.type=="add"){
    						//$.messager.confirm('提示', '新增成功！', function(r){
    							//var frames=window.top.window.document.getElementById(iframeId);
    							//window.parent.closeWin();
    							//frames.contentWindow.reload();
    						//});
    					}else{
    						//$.messager.confirm('提示', "修改成功！", function(r){
    							//var frames=window.top.window.document.getElementById(iframeId);
    							//window.parent.closeWin();
    							//frames.contentWindow.reload();
    						//});
    					}
    					//上传
    					//alert(data.id);
    					uploader.options.formData.workOrderId = data.id;
    					uploader.upload();
    				},
    				error: function(XMLHttpRequest, textStatus, errorThrown) {
    					var error = XMLHttpRequest.responseText.match("<li>(.*?)\</li>");
    					if(error.length==2){
    						$.messager.confirm('提示', error[1], function(r){
    						});
    					}
 					}
    			});
            }
        }
    });
}

function delimg(id){
	$.ajax({
		type: "post",
		url:'${ctx}/admin/oa/workorder/oa-work-order!delImg.htm?oaWorkOrderImgQuery.id='+id,
  		dataType: "json",
 		async: false,
  		beforeSend:function(){},
 		success: function (data, textStatus) {
    		if(data.success){
    			$("#thumbnail"+id).remove();
    		}
   		},
    	error: function(XMLHttpRequest, textStatus, errorThrown) {
   			var error = XMLHttpRequest.responseText.match("<li>(.*?)\</li>");
    		if(error.length==2){
    			$.messager.confirm('提示', error[1], function(r){
    			});
    		}
 		}
 	});
}

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="easyui-layout" data-options="fit:true,border:false">
				<div data-options="region:'north',border:false">
					<div id="toolbar" class="datagrid-toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-save',plain:true" onclick="save()">保存</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-close',plain:true" onclick="closewin()">关闭</a>
					</div>
				</div>
				<div data-options="region:'center',border:false" id="centerform">
					<form id="form" method="post">
						<s:hidden id="id" name="oaWorkOrder.id"></s:hidden>
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80">标题</th>
				      			<td>
									<s:textfield id="title" name="oaWorkOrder.title" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
				      				
				        		</td>
				        	</tr>
							<tr>
				   				<th class="my-w80">描述</th>
				      			<td>
									<s:textarea id="remarks" name="oaWorkOrder.remarks" theme="simple" style="width:400px;height:100%" data-options="multiline:true" cssClass="easyui-textbox"></s:textarea>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td colspan="2">
				        			<div id="uploader-demo" class="wu-example">
									    <!--用来存放item-->
									    <div id="fileList" class="uploader-list">
									    <c:forEach items="${oaWorkOrder.oaWorkOrderImgList}" var="info">
										<div class="file-item thumbnail" id="thumbnail${info.id}">
											<img src="${ctx}/upload/workorder/it/${info.name}">
											<div class="info">${info.name}</div>
											<div class="file-panel" style="height: 30px;">
												<span class="cancel"  onclick="delimg(${info.id})">删除</span>
											</div>
										</div>
										</c:forEach>
									    </div>
									    <div id="filePicker">选择图片</div>
									</div>
				        		</td>
				        	</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>