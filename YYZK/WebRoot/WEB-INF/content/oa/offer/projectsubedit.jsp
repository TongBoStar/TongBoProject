<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>项目维护</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	if("${dictItem.dictTreeId}"!=""){
		$('#dictTreeId').combotree('setValue', "${dictItem.dictTreeId}");
	}
});

function closewin(){
	window.parent.closeWin();
}

function save(){
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url: "${ctx}/offer/offer!projectEdit.htm",
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.type=="add"){
    						$.messager.confirm('提示', '新增成功！', function(r){
    							//window.parent.reloadGrid();
    							window.parent.closeWin();
    						});
    					}else{
    						$.messager.confirm('提示', "修改成功！", function(r){
    							//window.parent.reloadGrid();
    							window.parent.closeWin();
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
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconsave',plain:true" onclick="save()">保存</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconclose',plain:true" onclick="closewin()">关闭</a>
					</div>
				</div>
				<div data-options="region:'center',border:false">
					<form id="form" method="post">
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80">项目名称</th>
				      			<td>
				        			<input value="<s:property value='offerProject.name'/>" name="offerProject.name" id="name" class="easyui-textbox" style="width:200px;" type="text" data-options="required:true"></input>
									<s:hidden name="offerProject.projectId" id="projectId"></s:hidden>
									<s:hidden name="offerProject.parentId" id="parentId"></s:hidden>
									<s:hidden name="offerProject.projectTreeId" id="projectTreeId"></s:hidden>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">客户</th>
				      			<td>
				        			<input value="<s:property value='offerProject.customer'/>" name="offerProject.customer" id="customer" class="easyui-textbox" style="width:200px;" type="text" data-options="required:true"></input>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">销售员</th>
				      			<td>
				        			<input value="<s:property value='offerProject.salesperson'/>" name="offerProject.salesperson" id="salesperson" class="easyui-textbox" style="width:200px;" type="text" data-options="required:true"></input>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">报价人</th>
				      			<td>
				        			<input value="<s:property value='offerProject.bidder'/>" name="offerProject.bidder" id="bidder" class="easyui-textbox" style="width:200px;" type="text" data-options="required:true"></input>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">时间</th>
				      			<td>
				        			<input value="<s:property value='offerProject.offerTime'/>" name="offerProject.offerTime" id="offerTime" class="easyui-datebox" style="width:200px;" type="text" data-options="required:true"></input>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">备注</th>
				      			<td>
				        			<input value="<s:property value='offerProject.description'/>" name="offerProject.description" id="description" class="easyui-textbox" style="width:200px;" type="text" ></input>
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