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
	var carTypeDicts;
	$.ajax({
		type: "post",
		url: "${ctx}/dict/dict!noPageList.htm",
		data:{"dictQuery.pCode":"000002000001"},
		dataType: "json",
		async: false,
		success: function (listData, textStatus) {
			carTypeDicts = new Backbone.Collection(listData.rows);  
			var output = [];
			output.push('<option value=""></option>');
			$.each(listData.rows, function(index, obj)
			{
				output.push('<option value="'+ obj.value +'">'+ obj.name +'</option>');
			});
			$('#carTypeValue').html(output.join(''));
		}
	});
	
	$("#carTypeValue").change(function(){
		var selid = $(this).find('option:selected').val();
		var carTypeDict = carTypeDicts.findWhere({value:selid});
		$("#carTypePCode").val(carTypeDict.attributes.pCode);
	});
	
	if('<s:property value="carInfo.carTypeValue"/>'!=""){
		$("#carTypeValue").val('<s:property value="carInfo.carTypeValue"/>');
		$("#carTypeValue").trigger("change");
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
				url: "${ctx}/carinfo/car-info!save.htm",
				data:$('#form').serialize()+"&filesJson="+filesJson,
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.type=="add"){
						$.messager.confirm('提示', data.msg, function(r){
							myform.resetForm();
						});
					}else{
						$.messager.confirm('提示', data.msg, function(r){
							window.location.href="${ctx}/oa/car/info/list.htm";
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
		<div class="title-header">车辆信息添加</div>
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">车牌号码<span class="star">*</span></th>
      			<td>
        			<s:textfield name="carInfo.number"  id="number" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写车牌号码！"></s:textfield>
        			<s:hidden name="carInfo.id" id="id"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">车辆名称<span class="star">*</span></th>
      			<td>
          			<s:textfield name="carInfo.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写车辆名称！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">驾驶员</th>
      			<td>
      				<s:textfield name="carInfo.driver"  id="driver" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">车辆类型<span class="star">*</span></th>
      			<td>
      				<select id="carTypeValue" name="carInfo.carTypeValue" datatype="*" nullmsg="请选择车辆类型！"></select>
      				<s:hidden name="carInfo.carTypePCode" id="carTypePCode"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">购买价格</th>
      			<td>
          			<s:textfield name="carInfo.buyPrice"  id="buyPrice" theme="simple"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">购买时间<span class="star">*</span></th>
      			<td>
          			<input type="text" id="buyTime" name="carInfo.buyTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<s:date name="carInfo.buyTime" format="yyyy-MM-dd"/>" style="width: 300px;" datatype="*" nullmsg="请填写购买时间！"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">车辆图片</th>
      			<td>
      				<div class="uploader">
      					<ul id="isupload" class="filelist">
      						<c:forEach var="carInfoRes" items="${carInfo.carInfoResList}">   
					        	<li class="state-complete">
									<p class="del" onclick="javascript:$(this).parent().remove();">删除</p>
									<p class="imgWrap"><img style="width:110px;height:110px;" data-oldname="${carInfoRes.oldName}" data-newname="${carInfoRes.newName}" data-respath="${carInfoRes.resPath}" src="../${carInfoRes.resPath}"></p>
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
        	<tr>
   				<th class="my-w80">备注</th>
      			<td>
          			<s:textarea id="remark" name="carInfo.remark"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
        		</td>
        	</tr>
		</table>
	</div>
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定">
	<input class="my-btn" id="btnReset" type="button" value="重置">
</form>
</body>
</html>