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
	    server: '${ctx}/fileupload/uploadDocRulesFile.htm',// 文件接收服务端?code='+W.zTree.getSelectedNodes(true)[0].code
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
    	var docJson = $.parseJSON(response._raw);
        $( '#'+file.id ).find('p.state').text('已上传');
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
    });
    
    uploader.on('uploadFinished',function(file,response){
    	//关闭窗口
    	var node;
    	
    	if(${param.type}==1){
    		//选中企业分类
    		node = W.zTree.getNodeByParam("id", $("#parentId1").val(), null);
    	}else{
    		//2 选中标准体系分类
    		node = W.zTree.getNodeByParam("id", $("#parentId2").val(), null);
    		
    	}
    	//W.reloadTree(W.zTree.getSelectedNodes(true)[0]);
    	api.close();
    	W.reloadTree(node);
    });
    
   	if(${param.type}==1){
   		//填充内部分类
   		$("#parentName1").val(W.zTree.getSelectedNodes(true)[0].name);
   		$("#parentId1").val(W.zTree.getSelectedNodes(true)[0].id);
   		$("#parentCode1").val(W.zTree.getSelectedNodes(true)[0].code);
   		$("#type1").val(W.zTree.getSelectedNodes(true)[0].type);
   	}else if(${param.type}==2){
   		//填充企业标准
   		$("#parentName2").val(W.zTree.getSelectedNodes(true)[0].name);
   		$("#parentId2").val(W.zTree.getSelectedNodes(true)[0].id);
   		$("#parentCode2").val(W.zTree.getSelectedNodes(true)[0].code);
   		$("#type2").val(W.zTree.getSelectedNodes(true)[0].type);
   	}
    
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
	    			url: "${ctx}/docrules/doc-rules!checkSaveItem.htm",
	    			data:{ 
	    				"docRulesItem.parentId1":$("#parentId1").val(),
	    				"docRulesItem.parentId2":$("#parentId2").val(),
	    				"docRulesItem.oldName":$("#fileName").val(),
	    				"docRulesItem.revision":$("#revision").val()
	    			},
	    			dataType: "json",
	    			async: false,
	    			success:function(data,textStatus){
	    				if(data.success=="true"){
	    					uploader.options.formData.revision = $("#revision").val();
	        	        	uploader.upload();
	    				}else{
	    					W.$.dialog.alert(data.msg,function(){},api);
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

function selCategory(type){
	var category = W.$.dialog({
		content: 'url:${ctx}/oa/docrules/selcategory.htm?type='+type,
		lock: true,
		title:'分类选择',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	        $("#parentName"+type).val(category.content.$("#hidTreeName").val());
	        $("#parentId"+type).val(category.content.$("#hidTreeId").val());
	        $("#parentCode"+type).val(category.content.$("#hidTreeCode").val());
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
   				<th class="my-w80">标准体系</th>
      			<td colspan="3">
      				<s:textfield name="parentName2"  id="parentName2" theme="simple" style="width: 195px;" datatype="*" nullmsg="请选择标准体系！"></s:textfield>&nbsp;<a  href="javascript:void(0)" onclick="selCategory(2)">选择</a>
      				<s:hidden name="parentId2" id="parentId2"></s:hidden>
      				<s:hidden name="parentCode2" id="parentCode2"></s:hidden>
      				<s:hidden name="type2" id="type2"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">外部分类</th>
      			<td colspan="3">
      				<s:textfield name="parentName1"  id="parentName1" theme="simple" style="width: 195px;" datatype="*" nullmsg="请选择标准体系！"></s:textfield>&nbsp;<a  href="javascript:void(0)" onclick="selCategory(1)">选择</a>
      				<s:hidden name="parentId1" id="parentId1"></s:hidden>
      				<s:hidden name="parentCode1" id="parentCode1"></s:hidden>
      				<s:hidden name="type1" id="type1"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80">发放范围</th>
      			<td colspan="3">
      				<s:textarea id="userNames" name="docRulesItem.userNames"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
      				<s:hidden name="docRulesItem.userIds" id="userIds"></s:hidden>
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
          			<s:textfield name="docRulesItem.number"  id="number" theme="simple" style="width: 195px;" datatype="*" nullmsg="请填写文件编号！"></s:textfield>
        		</td>
        		<th class="my-w80"><span class="star">版次</span></th>
      			<td>
          			<s:textfield name="docRulesItem.revision"  id="revision" theme="simple" style="width: 195px;" datatype="/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]+$/" nullmsg="请填写版次！" errormsg="不能包含特殊字符！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">生效日期</th>
      			<td>
          			<s:textfield name="docRulesItem.effectiveDate"  id="effectiveDate" theme="simple" style="width: 195px;"></s:textfield>
        		</td>
        		<th class="my-w80">采用标准</th>
      			<td>
          			<s:textfield name="docRulesItem.adoptStandard"  id="adoptStandard" theme="simple" style="width: 195px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">是否有效</th>
      			<td>
          			<s:select name="docRulesItem.isEffective" id="isEffective" theme="simple"  list="#{'true':'有效','false':'无效'}" headerValue="请选择是否有效" value="%{docRulesItem.isEffective}"></s:select>
        		</td>
        		<th class="my-w80">&nbsp;</th>
      			<td>
          			&nbsp;
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">备注</th>
      			<td colspan="3">
          			<s:textfield name="docRulesItem.remark"  id="remark" theme="simple" style="width:500px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
	<s:hidden id="fileName"></s:hidden>
</form>

</body>
</html>