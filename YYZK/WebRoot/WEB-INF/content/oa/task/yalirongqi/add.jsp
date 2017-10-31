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
<title>用户管理</title>
<script type="text/javascript">
$(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btnSave", 
		btnReset:"#btnReset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/taskyalirongqi/task-ya-li-rong-qi!save.htm",
				data:$('#form').serialize(),
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
							window.location.href="${ctx}/oa/addressbook/list.htm";
						});
					}
				}
			});
			return false;
		}
	});
});

function selRecipient(){
	var demo = $.dialog({
		content: 'url:${ctx}/core/emp/selemp.htm',
		lock: true,
		title:'人员选择',
		width: 750,
	    height: 410,
	    ok: function(){
	    	var selids="",selnames="";
	    	if(demo.content.$("#selusers").find("option").length>1){
	    		$.messager.confirm('提示', '接收人只能选1个！', function(r){
				});
	    	}else{
	    		$.each(demo.content.$("#selusers").find("option"),function(i,value){
					selids = value.value;
					selnames =  value.text;
				});
		    	$("#recipientId").val(selids);
		    	$("#recipientUserName").val(selnames);
	    	}
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}
function selJiaoYan(){
	var demo = $.dialog({
		content: 'url:${ctx}/core/emp/selemp.htm',
		lock: true,
		title:'人员选择',
		width: 750,
	    height: 410,
	    ok: function(){
	    	var selids="",selnames="";
	    	if(demo.content.$("#selusers").find("option").length>1){
	    		$.messager.confirm('提示', '校验人只能选1个！', function(r){
				});
	    	}else{
	    		$.each(demo.content.$("#selusers").find("option"),function(i,value){
					selids = value.value;
					selnames =  value.text;
				});
		    	$("#jiaoYanId").val(selids);
		    	$("#jiaoYanUserName").val(selnames);
	    	}
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}
function selShenHe(){
	var demo = $.dialog({
		content: 'url:${ctx}/core/emp/selemp.htm',
		lock: true,
		title:'人员选择',
		width: 750,
	    height: 410,
	    ok: function(){
	    	var selids="",selnames="";
	    	if(demo.content.$("#selusers").find("option").length>1){
	    		$.messager.confirm('提示', '审核人只能选1个！', function(r){
				});
	    	}else{
	    		$.each(demo.content.$("#selusers").find("option"),function(i,value){
					selids = value.value;
					selnames =  value.text;
				});
		    	$("#shenHeId").val(selids);
		    	$("#shenHeUserName").val(selnames);
	    	}
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
		<div class="title-header">压力容器信息添加</div>
		<table class="my-table-form">
			<tr>
				<th class="my-w80"><span class="star">制令号</span></th>
      			<td>
        			<s:textfield name="taskYaLiRongQi.systemNumber" id="systemNumber" datatype="*" nullmsg="制令号不能为空！" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80"><span class="star">过滤器令号或型号</span></th>
      			<td>
        			<s:textfield name="taskYaLiRongQi.filterNumber" id="filterNumber" datatype="*" nullmsg="过滤器令号或型号不能为空！" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80"><span class="star">主指令号</span></th>
      			<td>
        			<s:textfield name="taskYaLiRongQi.directiveNumber" id="directiveNumber" datatype="*" nullmsg="主指令号不能为空！" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80"><span class="star">计划完成时间</span></th>
      			<td>
        			<input type="text" id="startTime" name="taskYaLiRongQi.plannedFinishDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<s:date name="taskYaLiRongQi.plannedFinishDate"  format="yyyy-MM-dd HH:mm:ss"/>" datatype="*" nullmsg="计划完成时间不能为空！" style="width: 300px;" />
				</td>
        	</tr>
			<tr>
				<th class="my-w80">备注</th>
      			<td>
					<s:textarea name="taskYaLiRongQi.remark" id="remark"  theme="simple" style="width:500px;height:60px;"></s:textarea>
        		</td>
        	</tr>
        	<tr>
				<th class="my-w80"><span class="star">设计人</span></th>
      			<td>
      				<input type="text" id="recipientUserName" name="recipientUserName" value='<s:property value="taskTiaoYaZhan.recipientEmp.userName" />' style="width: 300px;"/>
        			<s:hidden name="taskYaLiRongQi.recipientId" id="recipientId" datatype="*" nullmsg="请选择设计人！" ></s:hidden>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="selRecipient()">选择</a>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80"><span class="star">校验人</span></th>
      			<td>
      				<input type="text" id="jiaoYanUserName" name="jiaoYanUserName" value='<s:property value="taskTiaoYaZhan.jiaoYanEmp.userName" />' style="width: 300px;"/>
        			<s:hidden name="taskYaLiRongQi.jiaoYanId" id="jiaoYanId" datatype="*" nullmsg="请选择校验人！" ></s:hidden>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="selJiaoYan()">选择</a>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80"><span class="star">审核人</span></th>
      			<td>
        			<input type="text" id="shenHeUserName" name="shenHeUserName" value='<s:property value="taskTiaoYaZhan.shenHeEmp.userName" />' style="width: 300px;"/>
        			<s:hidden name="taskYaLiRongQi.shenHeId" id="shenHeId" datatype="*" nullmsg="请选择审核人！" ></s:hidden>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="selShenHe()">选择</a>
        		</td>
        	</tr>
        </table>
	</div>
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定">
	<input class="my-btn" id="btnReset" type="button" value="重置">
	<s:hidden name="taskYaLiRongQi.id" id="id"></s:hidden>
</form>
</body>
</html>