<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<jsp:include page="/public/head.jsp"></jsp:include>
<script type="text/javascript">
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
    				url:'${ctx}/admin/hr/emp/hr-emp!edit.htm',
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
    				},
    				error: function(XMLHttpRequest, textStatus, errorThrown) {
    					var error = XMLHttpRequest.responseText.match("<li>(.*?)\</li>");
    					if(error.length==2){
    						$.messager.confirm('提示', error[1], function(r){
    						});
    					}
 					}
    			});
            }
        }
    });
}

</script>
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
						<s:hidden id="id" name="hrEmp.id"></s:hidden>
						<table class="my-table-form">
							<tr>
								<th class="my-w80">职员名称</th>
								<td>
									<s:textfield id="empName" name="hrEmp.empName" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
								</td>
							</tr>
							<tr>
								<th class="my-w80">工号</th>
								<td>
									<s:textfield id="jobNumber" name="hrEmp.jobNumber" theme="simple" cssClass="easyui-textbox" style="width:400px;" type="text" data-options="required:true"></s:textfield>
								</td>
							</tr>
							<tr>
								<th class="my-w80">上级</th>
								<td>
									<s:textfield id="superior" name="hrEmp.superior" theme="simple" cssClass="easyui-combobox" style="width:400px;" type="text" data-options="valueField:'id',textField:'empName',required:true,url:'${ctx}/admin/hr/emp/hr-emp!list.htm'"></s:textfield>
								</td>
							</tr>
							<tr>
								<th class="my-w80">职员类型</th>
								<td>
									<s:textfield id="empType" name="hrEmp.empType" theme="simple" cssClass="easyui-combobox" style="width:400px;" type="text" data-options="valueField:'id',textField:'name',required:true,url:'${ctx}/dict/dict!listJson.htm?dictQuery.pCode=000004000001'"></s:textfield>
								</td>
							</tr>
							<tr>
								<th class="my-w80">岗位</th>
								<td>
									<s:textfield id="stations" name="hrEmp.stations" theme="simple" cssClass="easyui-combobox" style="width:400px;" type="text" data-options="valueField:'id',textField:'name',required:true,url:'${ctx}/dict/dict!listJson.htm?dictQuery.pCode=000004000002'"></s:textfield>
								</td>
							</tr>
							<tr>
								<th class="my-w80">部门名称</th>
								<td>
									<s:textfield id="depts" name="hrEmp.depts" theme="simple" cssClass="easyui-combotree" style="width:400px;" type="text" data-options="required:true,url:'${ctx}/admin/hr/dept/hr-dept!tree.htm',multiple:true"></s:textfield>
								</td>
							</tr>
							<tr>
								<th class="my-w80">所属排班</th>
								<td>
									<s:textfield id="rosteringTreeId" name="hrEmp.rosteringTreeId" theme="simple" cssClass="easyui-combotree" style="width:400px;" type="text" data-options="required:true,url:'${ctx}/admin/hr/rosteringtree/hr-rostering-tree!tree.htm'"></s:textfield>
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