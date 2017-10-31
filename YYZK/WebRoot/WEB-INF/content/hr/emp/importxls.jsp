<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<jsp:include page="/public/head.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/webuploader.js"></script>
<link rel="stylesheet" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<script type="text/javascript">
$(function(){
	var $ = jQuery,
		$list = $('#thelist'),
		$btn = $('#ctlBtn'),
		state = 'pending',
		uploader;

    uploader = WebUploader.create({
        resize: false,// 不压缩image
        swf: '${ctx}/resources/plugins/webuploader/Uploader.swf',// swf文件路径
        server:'${ctx}/admin/hr/emp/importXls.htm',// 文件接收服务端。
		accept:{
		    title: 'excel',
		    extensions: 'xls',
		    mimeTypes: 'application/vnd.ms-excel'
		},
        pick: '#picker'
    });

    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        $list.append( '<div id="' + file.id + '" class="item">' +
            '<h4 class="info">' + file.name + '</h4>' +
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

    uploader.on( 'uploadSuccess', function( file,response  ) {
    	if(response.success){
    		$( '#'+file.id ).find('p.state').text('导入成功');
    	}else{
    		$( '#'+file.id ).find('p.state').text(response.msg);
    	}
    });

    uploader.on( 'uploadError', function( file , reason) {
    	alert(reason);
        $( '#'+file.id ).find('p.state').text('上传出错');
    });

    uploader.on( 'uploadComplete', function( file ) {
    	
        $( '#'+file.id ).find('.progress').fadeOut();
    });

    uploader.on( 'all', function( type ) {
        if ( type === 'startUpload' ) {
            state = 'uploading';
        } else if ( type === 'stopUpload' ) {
            state = 'paused';
        } else if ( type === 'uploadFinished' ) {
            state = 'done';
        }

        if ( state === 'uploading' ) {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on( 'click', function() {
        if ( state === 'uploading' ) {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
});
</script>
<style>
.wu-example {position: relative;padding:15px;height:130px;margin: 0;background-color: #fafafa;box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);border-color: #e5e5e5 #eee #eee;border-style: solid;border-width: 1px 0;}
.wu-example:after {position: absolute;top: 15px;left: 15px;font-size: 12px;font-weight: bold;color: #bbb;text-transform: uppercase;letter-spacing: 1px;}
#picker {display: inline-block;line-height: 1.428571429;vertical-align: middle;margin: 0 12px 0 0;}
#picker .webuploader-pick {padding: 8px 16px;display: block;}
.btn {display: inline-block;padding: 6px 12px;margin-bottom: 0;font-size: 14px;font-weight: normal;line-height: 1.428571429;text-align: center;white-space: nowrap;vertical-align: middle;cursor: pointer;background-image: none;border: 1px solid transparent;border-radius: 4px;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;-o-user-select: none;user-select: none;}
.btn-default {text-shadow: 0 1px 0 #fff;background-image: -webkit-linear-gradient(top,#fff 0,#e0e0e0 100%);background-image: linear-gradient(to bottom,#fff 0,#e0e0e0 100%);background-repeat: repeat-x;border-color: #dbdbdb;border-color: #ccc;filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe0e0e0',GradientType=0);filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false" style="padding: 5px;">
		<div id="uploader" class="wu-example">
		    <!--用来存放文件信息-->
		    <div id="thelist" class="uploader-list"></div>
		    <div class="btns">
		        <div id="picker">选择文件</div>
		        <button id="ctlBtn" class="btn btn-default">开始上传</button>
		    </div>
		</div>
	</div>
</body>
</html>