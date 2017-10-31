<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆信息添加</title>
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
	var equipmentDicts;
	$.ajax({
		type: "post",
		url: "${ctx}/dict/dict!noPageList.htm",
		data:{"dictQuery.pCode":"000003"},
		dataType: "json",
		async: false,
		success: function (listData, textStatus) {
			equipmentDicts = new Backbone.Collection(listData.rows);
			var output = [];
			$.each(listData.rows, function(index, obj)
			{
				output.push('<input type="checkbox" name="meetingroomInfo.equipmentValues" id="equipmentValues'+obj.value+'" value="'+obj.value+'"/><label for="equipmentValues'+obj.value+'">'+obj.name+'</label>&nbsp;');
			});
			$("#sequipment").html(output.join(''));
		}
	});
	
	$("input[type=checkbox]").change(function(){
		var selid = $(this).val();
		var equipmentDict = equipmentDicts.findWhere({value:selid});
		$("#equipmentPCode").val(equipmentDict.attributes.pCode);
	});
	
	if('<s:property value="meetingroomInfo.equipmentValues"/>'!=""){
		var vals = '<s:property value="meetingroomInfo.equipmentValues"/>'.split(",");
		for(var i=0;i<vals.length;i++){
			$("#equipmentValues"+$.trim(vals[i])).attr("checked", true);
		}
	}
	
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
				url: "${ctx}/meetingroominfo/meetingroom-info!save.htm",
				data:$('#form').serialize()+"&filesJson="+filesJson,
				dataType: "json",
				async: false,
				success: function (data, textStatus) {
					
					if(data.type=="add"){
						alert(data.msg);
						myform.resetForm();
					}else{
						alert(data.msg);
						window.location.href="${ctx}/oa/meetingroom/info/list.htm";
					}
				}
			});
			return false;
		}
	});
	
	myform.addRule([
	{
		ele:":checkbox:first",
		datatype:"*",
		nullmsg:"请选择会议室设备！"
	}]);
});
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<div class="content-left">
		<div class="title-header">会议信息添加</div>
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">会议室名称<span class="star">*</span></th>
      			<td>
        			<s:textfield name="meetingroomInfo.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写会议室名称！"></s:textfield>
        			<s:hidden name="meetingroomInfo.id" id="id"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">可容纳人数<span class="star">*</span></th>
      			<td>
          			<s:textfield name="meetingroomInfo.number"  id="number" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写会议室可容纳人数！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">会议室地址<span class="star">*</span></th>
      			<td>
      				<s:textfield name="meetingroomInfo.address"  id="address" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写会议室地址！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">会议室设备<span class="star">*</span></th>
      			<td>
      				<span id="sequipment"></span>
      				<s:hidden name="meetingroomInfo.equipmentPCode" id="equipmentPCode"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">会议室描述</th>
      			<td>
          			<s:textarea id="description" name="meetingroomInfo.description"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">会议室图片</th>
      			<td>
      				<div class="uploader">
      					<ul id="isupload" class="filelist">
      						<c:forEach var="meetingroomInfoRes" items="${meetingroomInfo.meetingroomInfoResList}">   
					        	<li class="state-complete">
									<p class="del" onclick="javascript:$(this).parent().remove();">删除</p>
									<p class="imgWrap"><img style="width:110px;height:110px;" data-oldname="${meetingroomInfoRes.oldName}" data-newname="${meetingroomInfoRes.newName}" data-respath="${meetingroomInfoRes.resPath}" src="../${meetingroomInfoRes.resPath}"></p>
								</li>
					    	</c:forEach>  
      					</ul>
      				</div>
        		</td>
        	</tr>
        	<tr>
        		<td colspan="2" style="background-color: #ffffff">
        			 <div id="uploader" class="uploader">
		                <div class="queueList">
		                    <div id="dndArea" class="placeholder">
		                        <div id="filePicker"></div>
		                        <p>或将照片拖到这里，单次最多可选300张</p>
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
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定">
	<input class="my-btn" id="btnReset" type="button" value="重置">
</form>
</body>
</html>