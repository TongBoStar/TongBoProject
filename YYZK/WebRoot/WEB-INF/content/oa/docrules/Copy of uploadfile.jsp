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
	    server: '${ctx}/fileupload/uploadDocRulesFile.htm?code='+W.zTree.getSelectedNodes(true)[0].code,// 文件接收服务端
	    pick: {
	    	id:'#picker',
	    	multiple:false
	    },
	    resize: false,
	    accept:{
	    	title: '文件选择',
            extensions: 'pdf,doc,docx',
            mimeTypes: 'application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document'
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
    	//$.parseJSON(response._raw).name;
    	var docJson = $.parseJSON(response._raw);
        $( '#'+file.id ).find('p.state').text('已上传');
        //docJson.size
        $.ajax({
			type: "post",
			url: "${ctx}/docrules/doc-rules!saveFile.htm",
			data:{
				"docRules.userIds":$("#userIds").val(),
				"docRules.userNames":$("#userNames").val(),
				"docRules.effectiveDate":$("#effectiveDate").val(),
				"docRules.name":docJson.name,
				"docRules.parentCode":W.zTree.getSelectedNodes(true)[0].code,
				"docRules.parentId":W.zTree.getSelectedNodes(true)[0].id,
				"docRules.fileType":docJson.type,
				"docRules.isEffective":$("#isEffective").val(),
				"docRules.revision":$("#revision").val(),
				"docRules.number":$("#number").val(),
				"docRules.adoptStandard":$("#adoptStandard").val()
			},
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {}
		});
    });
    
    uploader.on('uploadFinished',function(file,response){
    	//关闭窗口
    	api.close();
    	W.reloadTree(W.zTree.getSelectedNodes(true)[0]);
    });
    
    $("#folderName").html(W.zTree.getSelectedNodes(true)[0].name);
    
    var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
			if($("#revision").val()==""){
	        	W.$.dialog.alert("请先填写版次！",function(){},api);
	        }else{
	        	//验证文件是否同名
	        	$.ajax({
	    			type: "post",
	    			url: "${ctx}/docrules/doc-rules!list.htm",
	    			data:{"docRulesQuery.parentId":W.zTree.getSelectedNodes(true)[0].id,"docRulesQuery.name":$("#fileName").val(),"docRulesQuery.revision":$("#revision").val()},
	    			dataType: "json",
	    			async: false,
	    			success:function(data,textStatus){
	    				if(data.rows<=0){
	    					uploader.options.formData.revision = $("#revision").val();
	        	        	uploader.upload();
	    				}else{
	    					W.$.dialog.alert("文件名+版次有重复名称",function(){},api);
	    				}
	    			}
	    		});
	        }
			return false;
		}
	});
});

function delUpload(id){
	$("#"+id).remove();
	uploader.removeFile(uploader.getFile(id));
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
	    	$("#userIds").val(delLastChar(selids,","));
	    	$("#userNames").val(delLastChar(selnames,","));
	        //return false;
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
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
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">所属文件夹</th>
      			<td colspan="3">
      				<div id="folderName"></div>
      				<s:hidden name="docRules.parentId" id="parentId"></s:hidden>
      				<s:hidden name="docRules.parentCode" id="parentCode"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80">发放范围</th>
      			<td colspan="3">
      				<s:textarea id="userNames" name="docRules.userNames"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
      				<s:hidden name="docRules.userIds" id="userIds"></s:hidden>
      				&nbsp;<a  href="javascript:void(0)" onclick="selUsers()">选择</a>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">文件</span></th>
      			<td colspan="3">
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
        	<tr>
   				<th class="my-w80"><span class="star">文件编号</span></th>
      			<td>
          			<s:textfield name="docRules.number"  id="number" theme="simple" style="width: 195px;" datatype="*" nullmsg="请填写文件编号！"></s:textfield>
        		</td>
        		<th class="my-w80"><span class="star">版次</span></th>
      			<td>
          			<s:textfield name="docRules.revision"  id="revision" theme="simple" style="width: 195px;" datatype="/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]+$/" nullmsg="请填写版次！" errormsg="不能包含特殊字符！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">生效日期</th>
      			<td>
          			<s:textfield name="docRules.effectiveDate"  id="effectiveDate" theme="simple" style="width: 195px;"></s:textfield>
        		</td>
        		<th class="my-w80">采用标准</th>
      			<td>
          			<s:textfield name="docRules.adoptStandard"  id="adoptStandard" theme="simple" style="width: 195px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">是否有效</th>
      			<td>
          			<s:select name="docRules.isEffective" id="isEffective" theme="simple"  list="#{'true':'有效','false':'无效'}" headerValue="请选择是否有效" value="%{docRules.isEffective}"></s:select>
        		</td>
        		<th class="my-w80">&nbsp;</th>
      			<td>
          			&nbsp;
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">备注</th>
      			<td colspan="3">
          			<s:textfield name="docRules.remark"  id="remark" theme="simple" style="width:500px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
</form>

</body>
</html>