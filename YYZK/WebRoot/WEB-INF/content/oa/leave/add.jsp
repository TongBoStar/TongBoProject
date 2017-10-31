<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<jsp:include page="/public/head.jsp" ></jsp:include>
<!-- my97 -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/moment/moment.min.js"></script>
<script>
//返回一个随机的日期
function pickedFunc(){
	if($("#startTime").val()!='' && $("#endTime").val()!=''){
		$.ajax({
			type: "post",
			url:'${ctx}/oaleave/oa-leave!getHour.htm',
			data:"startDate="+$("#startTime").val()+"&endDate="+$("#endTime").val(),
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				$("#all").html(data.hours+"小时");
				$("#totalHours").val(data.hours);
			}
		});
	}
}

function closewin(){
	window.parent.closeWin();
}

function save(){
	iframeId = GetQueryString("iframeId");
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url:'${ctx}/oaleave/oa-leave!edit.htm',
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.type=="add"){
    						$.messager.confirm('提示', '新增成功！', function(r){
    							var frames=window.top.window.document.getElementById(iframeId);
    							window.parent.closeWin();
    							frames.contentWindow.reload();
    						});
    					}else{
    						$.messager.confirm('提示', "修改成功！", function(r){
    							var frames=window.top.window.document.getElementById(iframeId);
    							window.parent.closeWin();
    							frames.contentWindow.reload();
    						});
    					}
    				}
    			});
            }
        }
    });
}
</script>
<style type="text/css">
.easyui-validatebox{
	border: 1px solid #d0d6d9;
    box-shadow: 2px 2px 2px #f0f0f0 inset !important;
    color: #555;
    line-height: 1.6em;
    outline: medium none;
    padding: 2px;
    border: 0 none;
    border-radius: 5px;
    font-size: 12px;
    outline-style: none;
    resize: none;
    vertical-align: top;
    white-space: normal;
}
</style>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="easyui-layout" data-options="fit:true,border:false">
				<div data-options="region:'north',border:false">
					<div id="toolbar" class="datagrid-toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-save',plain:true" onclick="save()">保存</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-close',plain:true" onclick="closewin()">关闭</a>
					</div>
				</div>
				<div data-options="region:'center',border:false" id="centerform">
					<form id="form" method="post">
						<s:hidden id="id" name="oaLeave.id"></s:hidden>
						<s:hidden id="totalHours" name="oaLeave.totalHours"></s:hidden>
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80" style="height:28px;text-align:left;" colspan="2">请假总时长：<span id="all" style="font-weight:bold;color:red;">0小时</span></th>
				        	</tr>
							<tr>
				   				<th class="my-w80">起始时间</th>
				      			<td>
				      				<span class="textbox textbox-invalid">
				        			<s:textfield id="startTime" name="oaLeave.startTime" theme="simple" cssClass="easyui-validatebox" style="width:295px;" data-options="required:true" onfocus="WdatePicker({onpicked:pickedFunc,startDate:'%y-%M-%d %H:00:00',dateFmt:'yyyy-MM-dd HH:mm:00',hmsMenuCfg:{m: [30, 2]}});"></s:textfield>
				      				</span>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">结束时间</th>
				      			<td>
				      				<span class="textbox textbox-invalid">
				        			<s:textfield id="endTime" name="oaLeave.endTime" theme="simple" cssClass="easyui-validatebox" style="width:295px;" data-options="required:true" onfocus="WdatePicker({onpicked:pickedFunc,minDate:'#F{$dp.$D(\\'startTime\\')}',startDate:'%y-%M-%d %H:00:00',dateFmt:'yyyy-MM-dd HH:mm:00',hmsMenuCfg:{m: [30, 2]}});"></s:textfield>
				      				</span>
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
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>