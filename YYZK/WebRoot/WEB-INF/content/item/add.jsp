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
$(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btnSave", 
		btnReset:"#btnReset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/item/item!save.htm",
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
								window.location.href="${ctx}/item/list.htm";
							}
						});
					}else{
						$.messager.confirm('提示', "修改项目成功！", function(r){
							window.location.href="${ctx}/item/list.htm";
						});
					}
				}
			});
			return false;
		}
	});
});

function selTree(){
	var demo = $.dialog({
		content: 'url:${ctx}/k3/labelprint/weiwaiout/seltree.htm',
		lock: true,
		width: 260,
	    height: 410,
	    ok: function(){
	    	$("#showModuleName").val(demo.content.$("#hidTreeName").val());
	    	$("#moduleId").val(demo.content.$("#hidTreeId").val());
	    	$("#feeType").val(demo.content.$("#hidFeeType").val());
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80"><span class="star">项目名称</span></th>
      			<td>
        			<s:textfield name="entity.itemName"  id="itemName" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写项目名称！"></s:textfield>
        			<s:hidden name="id" id="id"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">所属类别</span></th>
      			<td>
      				<input type="text" style="width: 300px;" id="showModuleName" value="<s:property value='module.moduleName'/>">&nbsp;<a href="javascript:void(0);" onclick="selTree();">选择</a>
        			<s:hidden name="entity.moduleId" id="moduleId"  datatype="*" nullmsg="请选择类别！"></s:hidden>
        			<s:hidden name="entity.feeType" id="feeType"  datatype="*"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">价格</th>
      			<td>
        			<s:textfield name="entity.itemPricePlan"  id="itemPricePlan" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">单位</th>
      			<td>
        			<s:textfield name="entity.itemUnit"  id="itemUnit" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">服务类型</th>
      			<td>
        			<select name="entity.serviceType" id="serviceType">
        				<option value="1">上门</option>
        				<option value="2">到店</option>
        				<option value="3">上门+到店</option>
        			</select>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">项目耗时</th>
      			<td>
        			<s:textfield name="entity.consumTimes"  id="consumTimes" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">项目描述</th>
      			<td>
        			<s:textfield name="entity.itemDesc"  id="itemDesc" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定">
	<input class="my-btn" id="btnReset" type="button" value="重置">
</form>
</body>
</html>