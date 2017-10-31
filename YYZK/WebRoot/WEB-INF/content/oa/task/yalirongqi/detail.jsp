<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
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
	
	taskName = '<s:property value="taskName" escape="false"/>';
	$("table.my-table-form select").not(":hidden").attr("disabled","disabled");
	$("table.my-table-form input").not(":hidden").attr("disabled","disabled");
	$("table.my-table-form textarea").not(":hidden").attr("disabled","disabled");
	$("#comment").removeAttr("disabled");
	
	myform = $("#form").Validform({
		btnSubmit:".my-btn-primary",
		tiptype:3
	});
	
	if(taskName=='等待完成'){
		$("#jiaoYanUserName").removeAttr("disabled");
		$("#shenHeUserName").removeAttr("disabled");
	}
});

function doprocess(ispass){
	myform.eq(0).config({callback:function(form){
		$.ajax({
			type: "post",
			url: "${ctx}/taskyalirongqi/doProcess.htm?isPass="+ispass,
			data:$('#form').serialize(),
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				if(data.success=="true"){
					alert(data.msg);
					window.location.href="${ctx}/process/my/tasktodolist.htm";
					return false;
				}else{
					alert(data.msg);
					return false;
				}
			}
		});
		return false;
	}});
}

function selJiaoYan(){
	if(taskName=='等待完成'){
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
}
function selShenHe(){
	if(taskName=='等待完成'){
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
				<div class="content-left">
					<div class="title-header">会议申请</div>
					<table class="my-table-form">
						<tr>
				<th class="my-w80">制令号</th>
      			<td>
        			<s:textfield name="taskYaLiRongQi.systemNumber" id="systemNumber" datatype="*" nullmsg="制令号！" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80">过滤器令号或型号</th>
      			<td>
        			<s:textfield name="taskYaLiRongQi.filterNumber" id="filterNumber" datatype="*" nullmsg="过滤器令号或型号！" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80">主指令号</th>
      			<td>
        			<s:textfield name="taskYaLiRongQi.directiveNumber" id="directiveNumber" datatype="*" nullmsg="主指令号！" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80">计划完成时间</th>
      			<td>
        			<input type="text" id="startTime" name="taskYaLiRongQi.plannedFinishDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<s:date name="taskYaLiRongQi.plannedFinishDate" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;" />
				</td>
        	</tr>
			<tr>
				<th class="my-w80">备注</th>
      			<td>
					<s:textarea name="taskYaLiRongQi.remark" id="remark"  theme="simple" style="width:500px;height:60px;"></s:textarea>
        		</td>
        	</tr>
        	<tr>
				<th class="my-w80">设计人</th>
      			<td>
      				<input type="text" id="recipientUserName" name="recipientUserName" value='<s:property value="taskYaLiRongQi.recipientEmp.userName" />' style="width: 300px;"/>
        			<s:hidden name="taskYaLiRongQi.recipientId" id="recipientId" datatype="*" nullmsg="请选择设计人！" ></s:hidden>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="selRecipient()">选择</a>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80">校验人</th>
      			<td>
      				<input type="text" id="jiaoYanUserName" name="jiaoYanUserName" value='<s:property value="taskYaLiRongQi.jiaoYanEmp.userName" />' style="width: 300px;"/>
        			<s:hidden name="taskYaLiRongQi.jiaoYanId" id="jiaoYanId" datatype="*" nullmsg="请选择校验人！" ></s:hidden>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="selJiaoYan()">选择</a>
        		</td>
        	</tr>
			<tr>
				<th class="my-w80">审核人</th>
      			<td>
        			<input type="text" id="shenHeUserName" name="shenHeUserName" value='<s:property value="taskYaLiRongQi.shenHeEmp.userName" />' style="width: 300px;"/>
        			<s:hidden name="taskYaLiRongQi.shenHeId" id="shenHeId" datatype="*" nullmsg="请选择审核人！" ></s:hidden>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="selShenHe()">选择</a>
        		</td>
					</table>
				</div>
				<s:hidden name="taskId" id="taskId"></s:hidden>
				<s:hidden name="taskYaLiRongQi.id" id="id"></s:hidden>
			</form>
		</div>
		<div class="my-tab-area" style="display: none;">
			<s:action name="historyDetailStepIndex" namespace="/process" executeResult="true"  ignoreContextParams="true"> 
				<s:param name="processInstanceId" value="taskYaLiRongQi.processInstanceId"></s:param> 
			</s:action>
		</div>
		<div class="my-tab-area" style="display: none;">
			<s:action name="historyDetailFlowIndex" namespace="/process" executeResult="true"  ignoreContextParams="true"> 
				<s:param name="processInstanceId" value="taskYaLiRongQi.processInstanceId"></s:param> 
			</s:action>
		</div>
	</div>
</div>
</body>
</html>