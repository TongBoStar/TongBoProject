<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<!-- ztree -->
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>通讯录管理</title>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
$(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/activityInfo/activity-info!save.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.type=="add"){
						$.messager.defaults = { ok: "继续添加", cancel: "返回列表" };
						$.messager.confirm('提示', '新增联系人成功！是否继续添加？', function(r){
							if(r){
								myform.resetForm();
							}else{
								api.close();
								W.reloadDatagrid();
							}
						});
					}else{
						$.messager.confirm('提示', "修改联系人成功！", function(r){
							api.close();
							W.reloadDatagrid();
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
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80"><span class="star">活动名称</span></th>
      			<td>
        			<s:textfield name="entity.activityName"  id="activityName" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写活动名称！"></s:textfield>
        			<s:hidden name="entity.id" id="id"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">活动类型</span></th>
      			<td>
      				<select name="entity.activityType"  id="activityType" style="width: 316px;">
      					<option value="1">下单立减</option>
      					<option value="2">下单立变</option>
      					<option value="3">打折促销</option>
      					<option value="4">新用户专享</option>
      				</select>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80"><span class="star">活动价格</span></th>
      			<td>
        			<s:textfield name="entity.activityPrice"  id="activityPrice" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写活动价格！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">活动开始时间</th>
      			<td>
      				<input type="text" id="startTime" name="entity.startTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" style="width: 300px;" datatype="*" nullmsg="请填写开始时间！"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">活动结束时间</th>
      			<td>
        			<input type="text" id="endTime" name="entity.endTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" style="width: 300px;" datatype="*" nullmsg="请填写结束时间！"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">订单限量</th>
      			<td>
        			<s:textfield name="entity.orderLimit"  id="orderLimit" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">人数限量</th>
      			<td>
        			<s:textfield name="entity.userLimit"  id="userLimit" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
</form>
</body>
</html>