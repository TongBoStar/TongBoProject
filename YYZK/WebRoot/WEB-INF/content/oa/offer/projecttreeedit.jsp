<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>分类维护</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	if("${dictTree.parentId}"!=""){
		$('#parentId').combotree('setValue', "${dictTree.parentId}");
	}
});

function save(){
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url: "${ctx}/offer/offer!projectTreeEdit.htm",
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.type=="add"){
    						$.messager.confirm('提示', '新增成功！', function(r){
    							window.parent.$("#win").window('close');
    							window.parent.$('#centertreegrid').treegrid('reload');
    						});
    					}else{
    						$.messager.confirm('提示', "修改成功！", function(r){
    							window.parent.$("#win").window('close');
    							window.parent.$('#centertreegrid').treegrid('reload');
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
					</div>
				</div>
				<div data-options="region:'center',border:false">
					<form id="form" method="post">
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80">上级分类</th>
				      			<td>
				        			<input value="<s:property value='offerProjectTree.parentId'/>" name="offerProjectTree.parentId" id="parentId" 
				        				type="text" 
				        				class="easyui-combotree" style="width:200px;"
        								data-options="url:'${ctx}/offer/offer!projectTree.htm',required:true"
				        				></input>
									<s:hidden name="offerProjectTree.projectTreeId" id="projectTreeId"></s:hidden>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">分类名称</th>
				      			<td>
				        			<input value="<s:property value='offerProjectTree.name'/>" name="offerProjectTree.name" id="name" class="easyui-textbox" style="width:200px;" type="text" data-options="required:true"></input>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">分类排序</th>
				      			<td>
				        			<input value="<s:property value='offerProjectTree.sort'/>" name="offerProjectTree.sort" id="sort" class="easyui-numberbox" style="width:200px;" type="text" data-options="min:0"></input>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">描述</th>
				      			<td>
				        			<input value="<s:property value='offerProjectTree.description'/>" name="offerProjectTree.description" id="description" class="easyui-textbox" style="width:200px;" type="text"></input>
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