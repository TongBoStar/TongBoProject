<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.terrence.activiti.dol.core.ProcessEnumUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>会议室申请列表</title>
<jsp:include page="/public/head.jsp" ></jsp:include>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/oaleave/oa-leave!pageList.htm',
        title: '请假申请列表',
        toolbar: '#toolbar',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: true,
        iconCls:'myicon-list',
        pageSize: 20,
        rownumbers: true,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'startTime', title: '开始时间' },
            { field: 'endTime', title: '结束时间' },
            { field: 'leaveType', title: '请假类型' },
            { field: 'reason', title: '理由' },
            { field: 'applyState', title: '审批状态',
            	formatter: function(value,row,index){
					if (value==0){
						return "草稿";
					} else if((value==1)){
						return "办理中";
					} else{
						return "已结束";
					}
				}
            },
            { field: 'leaveState', title: '请假状态' ,
            	formatter: function(value,row,index){
					if (value==0){
						return "待通过";
					} else if((value==1)){
						return "通过";
					} else{
						return "退回";
					}
				}
            }
		]]
    });	
});

function add(){
	var iframeId = window.frameElement && window.frameElement.id || '';
	openWin('新增申请','myicon-add',600,400,'${ctx}/oa/leave/add.htm',iframeId);
}

function reload(){
	$('#centergrid').datagrid("reload");
}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false" style="padding:3px;">
		<div class="easyui-layout" data-options="fit:true">
			<table id="centergrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'myicon-add',plain:true" onclick="add()">新增</a>
			</div>
		</div>
	</div>
</body>
</html>