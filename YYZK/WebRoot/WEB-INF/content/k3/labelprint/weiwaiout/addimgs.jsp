<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目图片添加</title>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
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
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/upload.js?domain=${ctx}"></script>
<script>
$(function(){
	var filesJson='';
	var myform=$("#form").Validform({
		btnSubmit:"#btnSave", 
		btnReset:"#btnReset",
		tiptype:3,
		callback:function(){
			var allFile=[];
			$("ul#isupload li img").each(function(){
				var aFile={
					"resPath":$(this).attr("data-respath"),
					"newName":$(this).attr("data-newname"),
					"oldName":$(this).attr("data-oldname")	
				};
				allFile.push(aFile);
			});
			filesJson = JSON.stringify(allFile).replace(/%/g, "%25").replace(/\&/g, "%26").replace(/\+/g, "%2B");
			$.ajax({
				type: "post",
				url: "${ctx}/itemImgs/item-imgs!save.htm",
				data:$('#form').serialize()+"&filesJson="+filesJson,
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.type=="add"){
						$.messager.confirm('提示', data.msg, function(r){
							//myform.resetForm();
							//$("#centergrid").datagrid("reload",{"itemQuery.itemName":$("#search_para").val()});
						});
					}else{
						$.messager.confirm('提示', data.msg, function(r){
							window.location.href="${ctx}/k3/labelprint/weiwaiout/list.htm";
						});
					}
				}
			});
			return false;
		}
	});
});
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">项目名称<span class="star">*</span></th>
      			<td>
        			${entity.itemName }
        			<input type="hidden" name="entity.itemId" value="${entity.id }"/>
        		</td>
        		<th class="my-w80">手艺人名称<span class="star">*</span></th>
      			<td>${entity.admin.adminName }</td>
      			<th class="my-w80">价格<span class="star">*</span></th>
      			<td>${entity.itemPriceAux }</td>
        	</tr>
        	<tr>
   				<th class="my-w80">项目图片</th>
      			<td colspan="5">
      				<div class="uploader">
      					<ul id="isupload" class="filelist">
      						<c:forEach var="itemImgs" items="${entity.itemImgsList}">   
					        	<li class="state-complete">
									<p class="del" onclick="javascript:$(this).parent().remove();">删除</p>
									<p class="imgWrap"><img style="width:110px;height:110px;" data-respath="${itemImgs.imgPath}" src="../${itemImgs.imgPath}"></p>
								</li>
					    	</c:forEach>  
      					</ul>
      				</div>
        		</td>
        	</tr>
        	<tr>
        		<td colspan="6" style="background-color: #ffffff">
        			 <div id="uploader" class="uploader">
		                <div class="queueList">
		                    <div id="dndArea" class="placeholder">
		                        <div id="filePicker"></div>
		                        <p>或将照片拖到这里，最多可选6张</p>
		                    </div>
		                </div>
		                <div class="statusBar" style="display:none;">
		                    <div class="progress">
		                        <span class="text">0%</span>
		                        <span class="percentage"></span>
		                    </div><div class="info"></div>
		                    <div class="btns">
		                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
		                    </div>
		                </div>
		            </div>
        		</td>
        	</tr>
		</table>
	</div>
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定" style="display:none;">
	<input class="my-btn" id="btnReset" type="button" value="重置" style="display:none;">
</form>
</body>
</html>