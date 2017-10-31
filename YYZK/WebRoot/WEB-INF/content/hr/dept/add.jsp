<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<jsp:include page="/public/head.jsp"></jsp:include>
<script type="text/javascript">
$(function() {
	$("#parentId").combotree({
	    loadFilter: function(data,parent){
	    	var loadData = data;
	    	loadData.unshift({"id":0,"text":"顶级部门"});
	    	return loadData;
	    }
	});
});

function save(){
	iframeId = GetQueryString("iframeId");
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url:'${ctx}/admin/hr/dept/hr-dept!edit.htm',
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
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

function closewin(){
	window.parent.closeWin();
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
							<s:hidden id="id" name="hrDept.id"></s:hidden>
							<table class="my-table-form">
								<tr>
									<th class="my-w80">父部门</th>
									<td>
										<s:textfield id="parentId" name="hrDept.parentId" theme="simple" cssClass="easyui-combotree" style="width:400px;" type="text" data-options="required:true,url:'${ctx}/admin/hr/dept/hr-dept!tree.htm'"></s:textfield>
									</td>
								</tr>
								<tr>
									<th class="my-w80">部门名称</th>
									<td>
										<s:textfield id="name" name="hrDept.name" theme="simple" style="width:400px;" cssClass="easyui-textbox" data-options="required:true"></s:textfield>
									</td>
								</tr>
								<tr>
									<th class="my-w80">排序</th>
									<td>
										<s:textfield id="sort" name="hrDept.sort" theme="simple" style="width:400px;" cssClass="easyui-textbox" data-options="required:true"></s:textfield>
									</td>
								</tr>
								<!--  
								<tr>
									<th class="my-w80">部门领导</th>
									<td>
										<s:textarea id="leaderIds" name="hrDept.leaderIds" theme="simple" style="width:400px;height:100%" data-options="multiline:true" cssClass="easyui-textbox"></s:textarea>
									</td>
								</tr>
								-->
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>