<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
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
<!-- slide -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ck_slide/css/slide.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/ck_slide/js/slide.js"></script>
<title>办理任务</title>
<style>
.my-tab{
	height: auto;
    margin-bottom: 10px;
    overflow: hidden;
    position: relative;
}
.my-tab ul.my-tab-menu {
    border-bottom: 2px solid #3071a9;
    height: 28px;
    overflow: hidden;
}
.my-tab ul.my-tab-menu li {
    background: none repeat scroll 0 0 #ffffff;
    border: 1px solid #f3f3f3;
    cursor: pointer;
    float: left;
    height: 28px;
    line-height: 1.8em;
    margin-right: 5px;
    padding: 0 10px;
}
.my-tab ul.my-tab-menu li.active {
    background: none repeat scroll 0 0 #3071a9;
}
.my-tab ul.my-tab-menu li a {
    color: #555;
    font-size: 12px;
    text-decoration: none;
}

.my-tab ul.my-tab-menu li.active a {
    color: #ffffff;
}

.data-wrap {
  padding: 8px 10px 2px 10px;
}
ul, ol {
    margin: 0 !important;
    padding: 0;
}

.my-tab-content {
    height: 100%;
    overflow: auto;
}

</style>
<script>
var carinfos;
var taskName;
var myform;
$(function () {
	$(".my-tab-menu li").click(function(){
		$(".my-tab-menu li").removeClass('active');
        $(this).addClass('active');
        $(".my-tab-area").hide();
        $(".my-tab-area").eq($(this).index()).show();
	});
	
	$(".my-tab-content").height($(window).height()-56);
	
	myform = $("#form").Validform({
		btnSubmit:".my-btn-primary",
		tiptype:3
	});
	
	if(taskName=='部门领导审核'){
		
	}else if(taskName=="人事审核" || taskName=="等待还车"){
		$("#carId").removeAttr("disabled");
		$("#driver").removeAttr("disabled");
		$("#startTime").removeAttr("disabled");
		$("#endTime").removeAttr("disabled");
		
		
	}else if(taskName=="重新调整"){
		$("table.my-table-form select").removeAttr("disabled");
		$("table.my-table-form input").removeAttr("disabled");
		$("table.my-table-form textarea").removeAttr("disabled");
	}
});

function doprocess(ispass){
	$.ajax({
		type: "post",
		url: "${ctx}/oaleave/doProcess.htm?isPass="+ispass,
		data:$('#form').serialize(),
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			$.messager.confirm('提示', data.msg, function(r){
				if(data.success=="true"){
					window.location.href="${ctx}/process/my/tasktodolist.htm";
				}
			});
		}
	});
}
</script>
</head>
<body>
<div class="data-wrap">
	<div class="my-tab">
		<ul class="my-tab-menu">
			<li class="active"><a href="#">表单详情</a></li>
	      	<li class=""><a href="#">审批步骤</a></li>
	      	<li class=""><a href="#">流程图</a></li>
	 	</ul>
	</div>
	<div class="my-tab-content">
		<div class="my-tab-area" style="display: block;">
			<form class="my-form" id="form" method="post">
				<s:hidden name="oaLeave.id" id="id"></s:hidden>
				<s:hidden name="taskId" id="taskId"></s:hidden>
				<div class="content-left">
					<div class="title-header">请假申请</div>
					<table class="my-table-form">
						<tr>
				   				<th class="my-w80" style="height:28px;" colspan="2">请假总时长：<span id="all" style="font-weight:bold;color:red;"><s:property value="oaLeave.totalHours"/>小时</span></th>
				        	</tr>
							<tr>
				   				<th class="my-w80">起始时间</th>
				      			<td>
				      				<input type="text" id="startTime" name="oaLeave.startTime" value="<s:date name="oaLeave.startTime" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;"/>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">结束时间</th>
				      			<td>
				        			<input type="text" id="endTime" name="oaLeave.endTime" value="<s:date name="oaLeave.endTime" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;"/>
				        		</td>
				        	</tr>
				        	<tr>
								<th class="my-w80">请假类型</th>
								<td>
									<s:textfield id="leaveType" name="oaLeave.leaveType" theme="simple" cssClass="easyui-combobox" style="width:300px;" type="text" data-options="valueField:'id',textField:'name',required:true,url:'${ctx}/dict/dict!listJson.htm?dictQuery.pCode=000004000003'"></s:textfield>
								</td>
							</tr>
				        	<tr>
				   				<th class="my-w80">备注</th>
				      			<td>
				      				<s:textarea id="reason" name="oaLeave.reason" theme="simple" style="width:300px;height:100%" data-options="multiline:true" cssClass="easyui-textbox"></s:textarea>
				        		</td>
				        	</tr>
			        		<tr>
			   				<th class="my-w80">批准<span class="star">*</span></th>
			      			<td>
			          			<s:textarea id="comment" name="comment"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
			        		</td>
			        	</tr>
					</table>
				</div>
				<s:property value="buttons" escape="false"/>
			</form>
		</div>
		<div class="my-tab-area" style="display: none;">
			<s:action name="historyDetailStepIndex" namespace="/process" executeResult="true"  ignoreContextParams="true"> 
				<s:param name="processInstanceId" value="oaLeave.processInstanceId"></s:param> 
			</s:action>
		</div>
		<div class="my-tab-area" style="display: none;">
			<s:action name="historyDetailFlowIndex" namespace="/process" executeResult="true"  ignoreContextParams="true"> 
				<s:param name="processInstanceId" value="oaLeave.processInstanceId"></s:param> 
			</s:action>
		</div>
	</div>
</div>
</body>
</html>